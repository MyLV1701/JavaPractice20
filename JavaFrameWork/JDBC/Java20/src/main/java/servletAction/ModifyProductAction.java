package servletAction;

import java.io.IOException;
import java.sql.SQLException;
import java.text.ParseException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.DaoChiTietSanPham;
import dao.DaoLoaiSanPham;

/**
 * Servlet implementation class ModifyProductAction
 */
@WebServlet("/modifyProductAction")
public class ModifyProductAction extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ModifyProductAction() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		
		DaoChiTietSanPham daoProduct = new DaoChiTietSanPham();
		DaoLoaiSanPham daoLSP = new DaoLoaiSanPham();
		
		int productID = (request.getParameter("productID") == null) ? 0 : Integer.parseInt(request.getParameter("productID"));
		
		
		try {
			request.setAttribute("editItemInfo", daoProduct.getParticularSanPhamByID(productID));
			request.setAttribute("loatSanPhamList", daoLSP.getAllLoaiSanPham());
		} 
		catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		RequestDispatcher rd = request.getRequestDispatcher("./addproduct.jsp");
		
		rd.forward(request, response);
		
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
		
		int editItemID = Integer.parseInt(request.getParameter("updateItemId"));
		
		try {
			if(editItemID == 0) {
				addSP.addSanPham( productName, importDate, importPrice, exportPrice, aMount, disCount, productTypeCode, supplierCode);
			}
			else {
				addSP.modifySanPham(productName,importDate, importPrice, exportPrice, aMount, disCount, productTypeCode, supplierCode, editItemID);
			}
				
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		response.sendRedirect("./homePageAction");
		
	}

}
