package servletAction;

import java.io.IOException;
import java.sql.SQLException;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.DaoChiTietGioHang;
import dao.DaoGioHang;
import dao.DaoKhachHang;
import model.ModelKhachHang;

/**
 * Servlet implementation class LoginAction
 */
@WebServlet("/loginAction")
public class LoginAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public LoginAction() {
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

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String userName = request.getParameter("userName");
		String passWord = request.getParameter("passWord");

		System.out.println("\n\n\n\n>>>>>> userName: " + 
						userName + "\tpassWord: " + passWord);

		DaoKhachHang daoKH = new DaoKhachHang();
		DaoChiTietGioHang daoCTGH = new DaoChiTietGioHang();
		DaoGioHang daoGH = new DaoGioHang();
		ModelKhachHang khachHang = null;
//		HashSet<String> selectedGoods = new HashSet<String>();
		HashMap<String, Boolean> selectedGoods = new HashMap<String, Boolean>();
		
		try {
			khachHang = daoKH.login(userName, passWord);
			daoGH.createGioHang(khachHang.getUserName());
			daoCTGH.createChiTietGioHang(khachHang.getUserName());
			selectedGoods = daoGH.getAllSPcode(khachHang.getUserName());
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		if (khachHang != null) {
			HttpSession session = request.getSession();
			session.setAttribute("currentUser", khachHang);
			session.setAttribute("selectedItems", selectedGoods);			
			response.sendRedirect("./homePageAction");
		} else {
			response.sendRedirect("./login.jsp");
		}
	}
}
