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
 * Servlet implementation class ProductViewController
 */
@WebServlet("/productViewController")
public class ProductViewController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProductViewController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
//	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		// TODO Auto-generated method stub
//		response.getWriter().append("Served at: ").append(request.getContextPath());
//	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		
//		get condition
		
		PrintWriter pw = response.getWriter();
		StringBuilder sb = new StringBuilder();

		
		DaoChiTietSanPham daoCTSP = new DaoChiTietSanPham();
//		
		
		try {
			int i = 1;
			for (ModelChiTietSanPham sp : daoCTSP.getAllSanPham()) {
				
				int productCodeView = request.getParameter("productCode").isEmpty() ? 0 : Integer.parseInt(request.getParameter("productCode"));
				
				// checking enable filter and loaiSPCode condition
				// if disable filter then always true, otherwise print out condition met items only. 
				
				if((0 == productCodeView) || (sp.getLoaiSPCode() == productCodeView)) {
				
					sb.append("<tr>");
					
					sb.append("	<td>").append(i++).append("</td>");
					sb.append("	<td>").append(sp.getTenSP()).append("</td>");
					sb.append("	<td>").append(sp.getTenLoaiSP()).append("</td>");
					sb.append("	<td>").append(sp.getTenNhaCungCap()).append("</td>");
					sb.append("	<td>");
					
					sb.append("		<form style=\"max-width: 100%; height: auto; float: left;\" action=\"./gioHangAction\" method=\"post\">");
					sb.append("		   <input type=\"hidden\" name=\"productId\" value=").append(sp.getSanPhamCode()).append(">");
					sb.append("		   <button type=\"submit\" class=\"btn btn-success btn-sm\">+</button>");
					sb.append("     </form>");
					sb.append("		<form style=\"max-width: 100%; height: auto; float: right;\">");
					sb.append("		   <input ID=\"productCode\"type=\"hidden\" name=\"productID\" value=").append(sp.getSanPhamCode()).append(">");
					sb.append("		   <button type=\"button\"  class=\"editItem btn btn-success btn-sm\">/</button>");
					sb.append("     </form>");
	
					sb.append("  </td>");
				
				}
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		pw.append(sb.toString());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
