package servletAction;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.DaoGioHang;
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
		response.getWriter().append("Served at: ").append(request.getContextPath());

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int SPcode = 0, soLuong = 1;
		DaoGioHang upd = new DaoGioHang();
		String SPc = request.getParameter("productID");
		if (SPc != null) {
			SPcode = Integer.parseInt(SPc);
		} else
			SPcode = 0;

		String tenSP = request.getParameter("product's name");
		
		ModelKhachHang khachHang = (ModelKhachHang) request.getSession().getAttribute("currentUser");

		upd.update(SPcode, tenSP, soLuong, khachHang.getHoTen(), 
				khachHang.getPhone(), khachHang.getEmail(), khachHang.getDiaChi(), khachHang.getUserName());
		
		response.sendRedirect("./homePageAction");

	}
}
