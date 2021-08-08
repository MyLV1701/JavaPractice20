package servletAction;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.DaoGioHang;
import dao.gioHang;
import model.ModelKhachHang;

/**
 * Servlet implementation class UpdateAction
 */
@WebServlet("/gioHangAction")
public class GioHangAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		String cartclick = request.getParameter("click");

		DaoGioHang daoCart1 = new DaoGioHang();
		try {
//			request.setAttribute("cartList1", daoCart1.getAllGioHang());
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		RequestDispatcher rdc = request.getRequestDispatcher("./giohang.jsp");
		rdc.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int sanPhamCode = 0, soLuong = 1;
		int productId2 = 0;

		ModelKhachHang khachHang = (ModelKhachHang) request.getSession().getAttribute("currentUser");

		gioHang cart1 = new gioHang();
		gioHang cart2 = new gioHang();

		String prId = request.getParameter("productId2");

		String SPc = request.getParameter("productId");
		if (SPc != null) {

			sanPhamCode = Integer.parseInt(SPc);
			cart1.giohang(sanPhamCode, soLuong, khachHang.getHoTen(), khachHang.getPhone(), khachHang.getEmail(),
					khachHang.getDiaChi(), khachHang.getUserName());

		} else {
			sanPhamCode = 0;
		}
		if (prId != null) {
			productId2 = Integer.parseInt(prId);
			try {
				cart2.deleteCartElement(productId2);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

		} else {
			productId2 = 0;
		}

		response.sendRedirect("./homePageAction");

	}

	/*
	 * protected void doGet(HttpServletRequest request, HttpServletResponse
	 * response) throws ServletException, IOException { // TODO Auto-generated
	 * method stub
	 * response.getWriter().append("Served at: ").append(request.getContextPath());
	 * 
	 * }
	 * 
	 * protected void doPost(HttpServletRequest request, HttpServletResponse
	 * response) throws ServletException, IOException { int SPcode = 0, soLuong = 1;
	 * DaoGioHang upd = new DaoGioHang(); String SPc =
	 * request.getParameter("productId"); if (SPc != null) { SPcode =
	 * Integer.parseInt(SPc); } else { SPcode = 0; }
	 * 
	 * String tenSP = request.getParameter("product's name");
	 * 
	 * ModelKhachHang khachHang = (ModelKhachHang)
	 * request.getSession().getAttribute("currentUser");
	 * 
	 * upd.update(SPcode, tenSP, soLuong, khachHang.getHoTen(),
	 * khachHang.getPhone(), khachHang.getEmail(), khachHang.getDiaChi(),
	 * khachHang.getUserName()); response.sendRedirect("./homePageAction");
	 * 
	 * }
	 */

}
