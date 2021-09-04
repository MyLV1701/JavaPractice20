package servletAction;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

import dao.DaoChiTietDonHang;
import dao.DaoChiTietSanPham;
import dao.DaoDonHang;
import dao.DaoGioHang;
import model.ModelDonHang;
import model.ModelGioHang;
import model.ModelKhachHang;

/**
 * Servlet implementation class DonHangAction
 */
@WebServlet("/donHangAction")
public class DonHangAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		try {
			
			DaoDonHang DH = new DaoDonHang();
			HashSet<String> dhCodeList = DH.getAllDonHangCodeExist();
			List<ModelDonHang> dhEntityList = new ArrayList<ModelDonHang>();
			for ( String e : dhCodeList) {
				dhEntityList.add(DH.getDonHangExist(e));
			}
			request.setAttribute("donhangList", dhEntityList);
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		RequestDispatcher rd = request.getRequestDispatcher("./donHangPage.jsp");
		rd.forward(request, response);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		StringBuffer jb = new StringBuffer();
		String line = null;
		try {
			BufferedReader reader = request.getReader();
			while ((line = reader.readLine()) != null)
				jb.append(line);
		} catch (Exception e) {
			// report an error
		}

		String yourJson = jb.toString();
		JsonParser jsonParser = new JsonParser();
		JsonObject jo = (JsonObject) jsonParser.parse(yourJson);

		String action = (String) jo.get("action").getAsString();
		switch (action) {
		case "thanhToan":
			try {
				// DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
				Date importDate = new Date();
				String trangThai = "Moi Dat Hang";
				String jsonData = jo.get("data").toString();
				Gson gson = new Gson();
				GetDonHangInfo donHangInfo = gson.fromJson(jsonData, GetDonHangInfo.class);
				int phiVanChuyen = Integer.parseInt(donHangInfo.phiShip);
				int tongChiPhi = Integer.parseInt(donHangInfo.tongChiPhi);
				ModelKhachHang KH = (ModelKhachHang) request.getSession().getAttribute("currentUser");
				new DaoDonHang().addNewItems(KH.getKhachHangCode(), importDate, trangThai, KH.getPhone(), KH.getHoTen(),
						                     KH.getDiaChi(), donHangInfo.loaiThanhToan, donHangInfo.dviGiaoHang, phiVanChuyen, tongChiPhi);
				HashMap<String, Boolean> isSelectedItems = (HashMap<String, Boolean>) request.getSession().getAttribute("selectedItems");
				DaoChiTietSanPham daoCTSP = new DaoChiTietSanPham();
				DaoChiTietDonHang daoCTGH = new DaoChiTietDonHang();

				for (ModelGioHang gh : new DaoGioHang().getAllSelectedProducts(KH.getUserName(), isSelectedItems)) {

					int soLuong = gh.getSoLuong();
					int giaSP = gh.getGiaSP();
					int giamGia;
					giamGia = daoCTSP.getParticularSanPhamByID(gh.getSpCode()).getGiamGia();
					int thanhTien = soLuong * (giaSP - giamGia);
					daoCTGH.addNewItems(gh.getSpCode(), soLuong, giaSP, giamGia, thanhTien);
				}

			} catch (NumberFormatException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			break;

		case "goChiTietDoHang":
			String dhCode = jo.get("donHangCode").getAsString();

			try {
				DaoDonHang dh = new DaoDonHang();
				ModelDonHang dhEntity = dh.getDonHangExist(dhCode);
				request.getSession().setAttribute("chiTietDonHang", dhEntity);
				return;

			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return;

		default:
			break;
		}

		response.sendRedirect(request.getContextPath() + "/homepage.jsp");
	}

	class GetDonHangInfo {
		protected String phiShip;
		protected String tongChiPhi;
		protected String loaiThanhToan;
		protected String dviGiaoHang;
	}

}
