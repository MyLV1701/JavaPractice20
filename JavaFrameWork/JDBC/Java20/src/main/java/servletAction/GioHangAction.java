package servletAction;

import java.io.IOException;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.HashSet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.DaoChiTietGioHang;
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

		RequestDispatcher rd = request.getRequestDispatcher("./shoppingCart.jsp");
		rd.forward(request, response);

		System.out.println("public class GioHangAction extends HttpServlet ===> enterd");

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// get productID ( san pham code)

		// get session selectedItems --> validate EXIST
		// if(exist)
		// get soluong from session invoke updateSoLuong(boolean increase, int soluong)
		// inside daoChiTietGioHang
		// else
		// invoke addNewItems() -> daoGioHang, daoChiTietGioHang
		// get session -> add hashset into session

		String spCode = request.getParameter("productId");
		HashMap<String, Boolean> selectedItems = (HashMap<String, Boolean>) request.getSession().getAttribute("selectedItems");
		DaoGioHang daoGH = new DaoGioHang();
		DaoChiTietGioHang daoCTGH = new DaoChiTietGioHang();
		String userName = ((ModelKhachHang) request.getSession().getAttribute("currentUser")).getUserName();

		try {
			if ((spCode != null) && (selectedItems.containsKey(spCode))) {

				daoCTGH.updateQuantity(true, userName, Integer.parseInt(spCode), 1);

			} else {

				int KHCode = ((ModelKhachHang) request.getSession().getAttribute("currentUser")).getKhachHangCode();
				int soLuong = 1;
				selectedItems.put(spCode,true);
				request.getSession().setAttribute("selectedItems", selectedItems);
				daoGH.addNewItems(userName, Integer.parseInt(spCode), KHCode);
				daoCTGH.addNewItems(userName, Integer.parseInt(spCode), KHCode, soLuong);
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		response.sendRedirect("./homePageAction");
//		request.getRequestDispatcher("./homePageAction").include(request, response);

	}

}
