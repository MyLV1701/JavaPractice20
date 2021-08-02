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
@WebServlet("/homeAjaxControler")
public class HomeAjaxControler extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		PrintWriter pw = response.getWriter();

		StringBuilder sb = new StringBuilder();
		int currentProductExist = Integer.parseInt(request.getParameter("exist"));

		DaoChiTietSanPham daoCTSP = new DaoChiTietSanPham();
		
		
		List<DaoChiTietSanPham> list = daoCTSP.getNext3SanPham(currentProductExist);
		
		for (ModelChiTietSanPham msp : list)
		{
			sb.append("<tr class = ").append("productIndex").append(">");
			sb.append("	<td>").append(msp.getSanPhamCode()).append("</td>");
			sb.append("	<td>").append(msp.getTenSP()).append("</td>");
			sb.append("	<td>").append(msp.getTenLoaiSP()).append("</td>");
			sb.append("	<td>").append(msp.getTenNhaCungCap()).append("</td>");
			sb.append("</tr>");
		}
		
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
