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

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public DonHangAction() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		// response.getWriter().append("Served at: ").append(request.getContextPath());
		
		
		/*
		 * get all donhangCode
		 * 
		 * invoke to getDonHangExist(donHangCode)
		 * 
		 * add to LIST (object) JavaBean or JSON to send to JSP file
		 */
		
		try {
			DaoDonHang DH = new DaoDonHang();
			HashSet<String> dhCodeList = DH.getAllDonHangCodeExist();

			// invoke to getDonHangExist(donHangCode)
			List<ModelDonHang> dhEntityList = new ArrayList<ModelDonHang>();
			for ( String e : dhCodeList) {
				dhEntityList.add(DH.getDonHangExist(e));
			}
			
			/* ======================================================================================*/
			/* ====================== cach 1 su dung reques.setAttribute("pattern "): =============  */
			/* ======================================================================================*/
			
			request.setAttribute("donhangList", dhEntityList);

//			/* ======================================================================================*/
//			/* ====================== cach 2 su dung JSON =============  */  ==> Khong the vi phai su dung js
			/*    https://www.javatpoint.com/sendRedirect()-method       */
//			/* ======================================================================================*/
//			String jsonDHEntityList = new Gson().toJson(dhEntityList);
//			
//			PrintWriter pw = response.getWriter();
//			
//			response.setContentType("application/json");
//			response.setCharacterEncoding("UTF-8");
//			pw.write(jsonDHEntityList);
//			response.sendRedirect("./donHangPage.jsp");
//			pw.close();
			
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

          // System.out.println(jb.toString()); 
		  // question : ton tai cach nao read tu ajax nua khong?
		  
		  String yourJson = jb.toString(); 
		  
		  JsonParser jsonParser = new JsonParser();
		  JsonObject jo = (JsonObject)jsonParser.parse(yourJson);
		  
		  String action = (String)jo.get("action").getAsString(); 
//		  String jsonData = jo.get("data").getAsString();  			// --> generate exception due to more than 
		  
		  /***
		   * convenience method to get this element as a string value.
		   *
		   * @return get this element as a string value.
		   * @throws ClassCastException if the element is of not a {@link JsonPrimitive} and is not a valid
		   * string value.
		   * @throws IllegalStateException if the element is of the type {@link JsonArray} but contains
		   * more than a single element.
		   *
		   *  public String getAsString() {
		   *    throw new UnsupportedOperationException(getClass().getSimpleName());
		   *  }
		   *	Link: https://github.com/google/gson/blob/master/gson/src/main/java/com/google/gson/JsonElement.java
		   *
		   **/
		  
		  
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
					new DaoDonHang().addNewItems(KH.getKhachHangCode(), importDate, trangThai, KH.getPhone(),
							KH.getHoTen(), KH.getDiaChi(), donHangInfo.loaiThanhToan, donHangInfo.dviGiaoHang,
							phiVanChuyen, tongChiPhi);
					HashMap<String, Boolean> isSelectedItems = (HashMap<String, Boolean>) request.getSession().getAttribute("selectedItems");
					DaoChiTietSanPham daoCTSP = new DaoChiTietSanPham();
					DaoChiTietDonHang daoCTGH = new DaoChiTietDonHang();

					for (ModelGioHang gh : new DaoGioHang().getAllSelectedProducts(KH.getUserName(), isSelectedItems)) {

						// addNewItems(int sanPhamCode, int soLuong, int giaBan, int giamGia, int
						// thanhTien )
						int soLuong = gh.getSoLuong();
						int giaSP = gh.getGiaSP();
						int giamGia;
						giamGia = daoCTSP.getParticularSanPhamByID(gh.getSpCode()).getGiamGia();
						int thanhTien = soLuong * giaSP - giamGia;
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
					DaoDonHang dh  = new DaoDonHang();
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
	

	public static void main(String... strings) throws ServletException, IOException {
		HttpServletRequest request = null;
		HttpServletResponse response = null;
		new DonHangAction().doGet(request, response);
	}

}
