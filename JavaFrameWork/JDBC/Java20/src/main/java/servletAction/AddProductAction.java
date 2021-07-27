package servletAction;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.DaoChiTietSanPham;

/**
 * Servlet implementation class AddProductAction
 */
@WebServlet("/addProductAction")
public class AddProductAction extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddProductAction() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		
		DaoChiTietSanPham addSP = new DaoChiTietSanPham();
		
		
		int productTypeCode = Integer.parseInt(request.getParameter("productType"));
		String productName 	= request.getParameter("productName");
		String importDate 	= request.getParameter("importDate");
		int importPrice 	= Integer.parseInt(request.getParameter("importPrice"));
		int exportPrice 	= Integer.parseInt(request.getParameter("exportPrice"));
		int aMount 			= Integer.parseInt(request.getParameter("aMount"));
		int disCount 		= Integer.parseInt(request.getParameter("Discount"));
		int supplierCode 	= Integer.parseInt(request.getParameter("supplierCode"));
		
		try {
			addSP.addSanPham( productName, importDate, importPrice, exportPrice, aMount, disCount, productTypeCode, supplierCode);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		response.sendRedirect("./homePageAction");
		
	}

}
