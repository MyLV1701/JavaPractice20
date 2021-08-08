package servletAction;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.DaoChiTietSanPham;
import model.ModelChiTietSanPham;

/**
 * Servlet implementation class CustomerListServlet
 */
@WebServlet("/customerListServlet")
public class CustomerListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * Default constructor.
	 */
	public CustomerListServlet() {
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		PrintWriter pw = response.getWriter();

		StringBuilder sb = new StringBuilder();
		sb.append("<!DOCTYPE html>");
		sb.append("<html>");
		sb.append("<head>");
		sb.append("<meta charset=\"UTF-8\">");
		sb.append("<title>Insert title here</title>");
		sb.append("</head>");
		sb.append("<body>");

		sb.append("<h1>Hello Wolrd</h1>");
		sb.append("<h2>My First Servlet Page</h2>");
		sb.append("<table border=\"1\" style=\"border-collapse: collapse;\">");
		sb.append("<tr>");
		sb.append("	<th>Mã SP</th>");
		sb.append("	<th>Tên SP</th>");
		sb.append("	<th>Loại SP</th>");
		sb.append("	<th>Nhà cung cấp</th>");
		sb.append("</tr>");
		DaoChiTietSanPham daoCTSP = new DaoChiTietSanPham();
		try {
			for (ModelChiTietSanPham msp : daoCTSP.getAllSanPham()) {
				sb.append("<tr>");
				sb.append("	<td>").append(msp.getSanPhamCode()).append("</td>");
				sb.append("	<td>").append(msp.getTenSP()).append("</td>");
				sb.append("	<td>").append(msp.getTenLoaiSP()).append("</td>");
				sb.append("	<td>").append(msp.getTenNhaCungCap()).append("</td>");
				sb.append("</tr>");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		sb.append("</table>");
		sb.append("</body>");
		sb.append("</html>");

		pw.append(sb.toString());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
