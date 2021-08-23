package servletAction;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

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
		
		String action = (request.getParameter("Action") != null) ? request.getParameter("Action") : "";
		String SpCode = (request.getParameter("SpCode") != null) ? request.getParameter("SpCode") : "";
		String userName = ((ModelKhachHang) request.getSession().getAttribute("currentUser")).getUserName();
		int soluong = 1;
		
		DaoChiTietGioHang daoCTGH = new DaoChiTietGioHang();
		DaoGioHang daoGH = new DaoGioHang();

		try {
			switch (action) {

			case "increase":
				daoCTGH.updateQuantity(true, userName, Integer.parseInt(SpCode), soluong);
				break;

			case "decrease":
				daoCTGH.updateQuantity(false, userName, Integer.parseInt(SpCode), soluong);
				break;
				
			case "UserInputQuantity":
				String quantity = request.getParameter("soLuong");
				daoCTGH.updateQuantityOnChange(userName, Integer.parseInt(SpCode), Integer.parseInt(quantity));
				break;

			case "remove":
				daoGH.removeItems(userName, Integer.parseInt(SpCode));
				daoCTGH.removeItems(userName, Integer.parseInt(SpCode));
				
				HashMap<String, Boolean> remove = (HashMap<String, Boolean>) request.getSession().getAttribute("selectedItems");
				remove.remove(SpCode);
				request.getSession().setAttribute("selectedItems", remove);
				
				break;
				
			case "removeAll":
				HashMap<String, Boolean> removeAll = (HashMap<String, Boolean>) request.getSession().getAttribute("selectedItems");
				Iterator hmIterator = removeAll.entrySet().iterator();
				 
				 while (hmIterator.hasNext()) {
					Map.Entry mapElement = (Map.Entry)hmIterator.next();
		            Boolean isRemove = (Boolean)mapElement.getValue();
		            		            
		            if(isRemove) {
		            	String hmSpCode = (String)mapElement.getKey();
		            	daoGH.removeItems(userName, Integer.parseInt(hmSpCode));
						daoCTGH.removeItems(userName, Integer.parseInt(hmSpCode));
						
						hmIterator.remove();
						
						//removeAll.remove(hmSpCode);   //--> throws a ConcurrentModificationException caused by 
		            }
		        }
				
				request.getSession().setAttribute("selectedItems", removeAll);
								
				break;
				
			case "itemSelected":
				HashMap<String, Boolean> selectedItems = (HashMap<String, Boolean>) request.getSession().getAttribute("selectedItems");
				selectedItems.put(SpCode, true);
				request.getSession().setAttribute("selectedItems", selectedItems);
				break;
				
			case "itemDeselected":
				HashMap<String, Boolean> deselectedItems = (HashMap<String, Boolean>) request.getSession().getAttribute("selectedItems");
				deselectedItems.put(SpCode, false);
				request.getSession().setAttribute("selectedItems", deselectedItems);
				break;
			
			case "SelectedAll":
				HashMap<String, Boolean> SelectedAll = (HashMap<String, Boolean>) request.getSession().getAttribute("selectedItems");
				SelectedAll.replaceAll((key, oldValue) -> true);
				request.getSession().setAttribute("selectedItems", SelectedAll);
				break;
			
			case "DeselectedAll":
				HashMap<String, Boolean> DeselectedAll = (HashMap<String, Boolean>) request.getSession().getAttribute("selectedItems");
				DeselectedAll.replaceAll((key, oldValue) -> false);
				request.getSession().setAttribute("selectedItems", DeselectedAll);
				break;
				
			case "editUserInfor":
				// update DB thru DAO
				String khName      = (String) request.getParameter("UsrName");
				String phoneNumber = (String) request.getParameter("UsrPhone");
				String address     = (String) request.getParameter("UsrAddress");
				
				System.out.println("test ajax data passing khName : " + khName + " phoneNumber : " + phoneNumber + " address : " + address );
				
				// update session
				break;
				
			default:
				break;

			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		RequestDispatcher rd = request.getRequestDispatcher("./shoppingCart.jsp");
		rd.forward(request, response);

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

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
				selectedItems.put(spCode, true);
				request.getSession().setAttribute("selectedItems", selectedItems);
				daoGH.addNewItems(userName, Integer.parseInt(spCode), KHCode);
				daoCTGH.addNewItems(userName, Integer.parseInt(spCode), KHCode, soLuong);
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		response.sendRedirect("./homePageAction");
	}
}
