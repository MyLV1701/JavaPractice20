package servletAction;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class DaoDanhMucAction
 */
@WebServlet("/daoDanhMucAction")
public class DaoDanhMucAction extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String DanhMucSanPham = request.getParameter("DanhMucSP");
			
		if( DanhMucSanPham !=null) {
			System.out.println(DanhMucSanPham);
			response.sendRedirect("./daoDanhMucAction2");
		}else {
			
		response.sendRedirect("./Homepage.jsp");
		
		}
	
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
