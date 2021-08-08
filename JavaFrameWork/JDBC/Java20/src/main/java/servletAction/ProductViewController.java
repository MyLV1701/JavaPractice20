package servletAction;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

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
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		DaoChiTietSanPham daoCTSP = new DaoChiTietSanPham();
		List<ModelChiTietSanPham> productListShow = new ArrayList<ModelChiTietSanPham>();

		try {
			for (ModelChiTietSanPham sp : daoCTSP.getAllSanPham()) {

				int productCodeView = request.getParameter("productCode").isEmpty() ? 
						0  : Integer.parseInt(request.getParameter("productCode"));

				
				if ((0 == productCodeView) || (sp.getLoaiSPCode() == productCodeView)) {
					productListShow.add(sp);
				}
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		String jsonString = new Gson().toJson(productListShow);

		
		PrintWriter pw = response.getWriter();
		
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        
        pw.print(jsonString);
        pw.flush();

		
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
