package servletAction;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.DaoChiTietSanPham;

/**
 * Servlet implementation class HomePageAction
 */
@WebServlet("/HomePageAction")
public class HomePageAction2 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public HomePageAction2() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    
    // khi không gọi funtion nào thì doGet nay mặc định sẽ được gọi
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		DaoChiTietSanPham daoCTSP = new DaoChiTietSanPham();
		
		try {
			request.setAttribute("spList", daoCTSP.getAllSanPham());
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		// send redirect page index.jsp
		// cho nay phai dung dispatcher vi phai gui ca data
		
		//RequestDispatcher rd = request.getRequestDispatcher("./Index.jsp");
		RequestDispatcher rd = request.getRequestDispatcher("./homepage.jsp");
		rd.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
