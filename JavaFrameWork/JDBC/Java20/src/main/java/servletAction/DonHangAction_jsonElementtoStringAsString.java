package servletAction;

import java.io.BufferedReader;
import java.io.IOException;
import java.sql.SQLException;
import java.text.ParseException;
import java.util.Date;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

import dao.DaoChiTietDonHang;
import dao.DaoChiTietSanPham;
import dao.DaoDonHang;
import dao.DaoGioHang;
import model.ModelGioHang;
import model.ModelKhachHang;

/**
 * Servlet implementation class DonHangAction
 */
@WebServlet("/donHangAction")
public class DonHangAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public DonHangAction() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		
//		  StringBuffer jb = new StringBuffer(); String line = null;
//		  
//			try {
//				BufferedReader reader = request.getReader();
//				while ((line = reader.readLine()) != null)
//					jb.append(line);
//			} catch (Exception e) {
//				// report an error
//			}
//
//		  // System.out.println(jb.toString()); 
//		  // question : ton tai cach nao read tu ajax nua khong?
//		  
//		  String yourJson = jb.toString(); 
		  
		  String test = "{\"action\":\"thanhToan\",\"data\":{\"phiShip\":29000,\"tongChiPhi\":86000,\"loaiThanhToan\":\"Thanh toÃ¡n báº±ng vÃ­ MoMo\",\"dviGiaoHang\":\"Giao Sieu Toc 2H\"}}";
		  
		  
		  
		  JsonParser jsonParser = new JsonParser();
//		  JsonObject jo = (JsonObject)jsonParser.parse(yourJson);
		  JsonObject jo = (JsonObject)jsonParser.parse(test);
		  
		  String action = (String)jo.get("action").toString(); 
		  String action2 = (jo.get("action")).toString(); 
		  
		  String action3 = jo.get("action").getAsString();
		  
		  
		  String conditon = "thanhToan";
		  
		  
		  // System.out.println(action3.equals(conditon));
		  // System.out.println(action2.equals(conditon));
		  if(action.equals(conditon)) {
			  
			  // System.out.println("ok");
		  }
		  
		  String jsonData = jo.get("data").toString();
		  
		  Gson gson = new Gson();
		  
		  GetDonHangInfo donHangInfo = gson.fromJson(jsonData, GetDonHangInfo.class);
		  
		  // System.out.println("============================= GAME START =============================" ); 
		  // System.out.println("  phiShip : " + donHangInfo.phiShip);
		  // System.out.println("  tongChiPhi : " + donHangInfo.tongChiPhi 
				           + "  loaiThanhToan : " + donHangInfo.loaiThanhToan + " donHangInfo : " + donHangInfo.dviGiaoHang);
		 
/*
		String test = "{\"action\":\"thanhToan\",\"data\":{\"phiShip\":29000,\"tongChiPhi\":86000,\"loaiThanhToan\":\"thah toan bang vi momo\",\"dviGiaoHang\":\"Giao Sieu Toc 2H\"}}";
		JsonParser k = new JsonParser();
		JsonObject b = (JsonObject)k.parse(test);


		 
		String conditon = (String) b.get("action").toString();*/

		switch (action) {
		case "thanhToan":

			try {
/*				 Gson gson = new Gson();
				  
				 GetDonHangInfo donHangInfo = gson.fromJson(test, GetDonHangInfo.class);*/
				 
				 
//			        DateFormat  dateFormat = new SimpleDateFormat("yyyy-MM-dd");
				Date importDate = new Date();
				String trangThai = "Moi Dat Hang";
				int phiVanChuyen = Integer.parseInt(donHangInfo.phiShip);
				int tongChiPhi = Integer.parseInt(donHangInfo.tongChiPhi);

				ModelKhachHang KH = (ModelKhachHang) request.getSession().getAttribute("currentUser");

				new DaoDonHang().addNewItems(KH.getKhachHangCode(), importDate, trangThai, KH.getPhone(), KH.getHoTen(),
						KH.getDiaChi(), donHangInfo.loaiThanhToan, donHangInfo.dviGiaoHang, phiVanChuyen, tongChiPhi);

				HashMap<String, Boolean> isSelectedItems = (HashMap<String, Boolean>) request.getSession()
						.getAttribute("selectedItems");

				DaoChiTietSanPham daoCTSP = new DaoChiTietSanPham();
				DaoChiTietDonHang daoCTGH = new DaoChiTietDonHang();

				for (ModelGioHang gh : new DaoGioHang().getAllSelectedProducts(KH.getUserName(), isSelectedItems)) {

					// addNewItems(int sanPhamCode, int soLuong, int giaBan, int giamGia, int
					// thanhTien )
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

	public static void main(String... strings) throws ServletException, IOException {
		HttpServletRequest request = null;
		HttpServletResponse response = null;
		new DonHangAction().doPost(request, response);
	}

}
