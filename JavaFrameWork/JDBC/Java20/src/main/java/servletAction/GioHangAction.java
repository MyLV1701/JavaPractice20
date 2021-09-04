package servletAction;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.DaoChiTietGioHang;
import dao.DaoGioHang;
import dao.DaoKhachHang;
import model.ModelKhachHang;

/**
 * Servlet implementation class UpdateAction
 */
@WebServlet("/gioHangAction")
public class GioHangAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action   = (request.getParameter("Action") != null) ? request.getParameter("Action") : "";
		String SpCode   = (request.getParameter("SpCode") != null) ? request.getParameter("SpCode") : "";
		String userName = ((ModelKhachHang) request.getSession().getAttribute("currentUser")).getUserName();
		
		
		DaoChiTietGioHang daoCTGH = new DaoChiTietGioHang();
		DaoGioHang        daoGH   = new DaoGioHang();

		try {
			switch (action) {

			case "increase":
				int currentAmount = Integer.parseInt(request.getParameter("currentAmount"));
				int soluong       = 1;
				
				// get soluong ton tai duoi DB 
				if(currentAmount > 1) {
					daoCTGH.updateQuantity(true, userName, Integer.parseInt(SpCode), soluong);
				}
				break;

			case "decrease":
				int SL        = 1;
				int curAmount = Integer.parseInt(request.getParameter("currentAmount"));
				if(curAmount > 1) {
					daoCTGH.updateQuantity(false, userName, Integer.parseInt(SpCode), SL);
				}
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
				RequestDispatcher rd = request.getRequestDispatcher("./userInformation.jsp");
				rd.forward(request, response);
				return;
				
			case "usrInforUpdated":
				
				PrintWriter pw = response.getWriter();
				String usrInfoHtml = updateUsrInformation(request,response);
				pw.append(usrInfoHtml);
				
				return;
				
				
			case "MuaHangAction":
				// get all thanh phần phù hợp với user selected
				HashMap<String, Boolean> hmSelecteValidate = (HashMap<String, Boolean>) request.getSession().getAttribute("selectedItems");
				
				if(hmSelecteValidate.containsValue(true)) {
					RequestDispatcher payMent = request.getRequestDispatcher("./payment.jsp");
					payMent.forward(request, response);
					// System.out.println(" ==============-- GioHangAction ================= :  click mau hang");
					return;
				}
				
				break;
				
				
			default:
				break;

			}

		} catch (SQLException e) {
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
	
	
	private String updateUsrInformation(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException {
		ModelKhachHang mdlKH = ((ModelKhachHang) request.getSession().getAttribute("currentUser"));
		String khName      = (String) request.getParameter("UsrFullName");
		String phoneNumber = (String) request.getParameter("UsrPhone");
		String email       = (String) request.getParameter("UsrEmail");
		String address     = (String) request.getParameter("UsrAddress");
		int    khCode      = mdlKH.getKhachHangCode();
		
		// invoke udpate thong tin Khach Hang 
		DaoKhachHang KH = new DaoKhachHang();
		KH.updateUsrInfo(khName, phoneNumber, address, email, khCode);
		
		// update session 
		mdlKH.setHoTen(khName);
		mdlKH.setPhone(phoneNumber);
		mdlKH.setEmail(email);
		mdlKH.setDiaChi(address);
		
		request.getSession().setAttribute("currentUser", mdlKH);

		String genHTML = "<p class=\"title\">"
						+ "<b class=\"name\">"  + khName  + "</b>"
						+ "<b class=\"phone\">" + phoneNumber + "</b>"
				        + "</p>"
				        + "<p class=\"address\">" + address + "</p>";
		
//		// System.out.println("updateUsrInformation fucntion send data : " + genHTML);
		
		return genHTML;
	}
	
	
}
