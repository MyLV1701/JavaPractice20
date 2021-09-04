package servletAction;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

/**
 * Servlet implementation class DonHangAction
 */
@WebServlet("/donHangAction")
public class DonHangAction extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DonHangAction() {
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

//	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		// TODO Auto-generated method stub
//		//doGet(request, response);
//		
////		 StringBuffer jb = new StringBuffer();
////		  String line = null;
////
////		  BufferedReader reader = request.getReader();
////		  RequestMaker.requestProcess();
////		  while ((line = reader.readLine()) != null)
////		      jb.append(line);
////
////		  String jsonstring = jb.toString(); 
////		  
//		  String jsonData =  request.getParameter("jsondata");
//		  Gson gson = new Gson();
//		  
//	}
	
	
//	// handle for just only one element ==> ok but in case of LIST -> NG
//	
//	protected void doPost(HttpServletRequest request, HttpServletResponse response)
//	        throws ServletException, IOException {
//	    Gson gson = new Gson();
//	    Enumeration en = request.getParameterNames();
//	    GameStart start = null;
//	    while (en.hasMoreElements()) {
//	        start = gson.fromJson((String) en.nextElement(), GameStart.class);
//	    }
//	    // System.out.println(start.gameID);
//	    // System.out.println(start.playerUIDs[0] +" "+ start.playerUIDs[1]);
//	}
//	
	
	
//	protected void doPost(HttpServletRequest request, HttpServletResponse response)
//			throws ServletException, IOException {
//
//
//		StringBuffer jb = new StringBuffer();
//		String line = null;
//		
//		try {
//			BufferedReader reader = request.getReader();
//			while ((line = reader.readLine()) != null)
//				jb.append(line);
//		} catch (Exception e) {
//			/* report an error */ }
//
//		// System.out.println(jb.toString());
//
//		// question : ton tai cach nao read tu ajax nua khong?
//
//		String yourJson = jb.toString();
//
//		Gson gson = new Gson();
////		GameStart[] startArray = gson.fromJson(yourJson, GameStart[].class);
////		List<GameStart> startList = Arrays.asList(startArray);
//
//		List<GameStart> startList = gson.fromJson(yourJson, new TypeToken<List<GameStart>>(){}.getType());
//		for (GameStart e : startList) {
//			
//			// System.out.println("============================= GAME START =============================");
//			// System.out.println(e.gameID);
//			// System.out.println(e.playerUIDs[0] + " " + e.playerUIDs[1]);
//			
//		}
//		
//	}
//
//	class GameStart {
//	    protected String gameID;
//	    protected int nrOfPlayers;
//	    protected int[] playerUIDs;
//	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {


		StringBuffer jb = new StringBuffer();
		String line = null;
		
		try {
			BufferedReader reader = request.getReader();
			while ((line = reader.readLine()) != null)
				jb.append(line);
		} catch (Exception e) {
			/* report an error */ }

		// System.out.println(jb.toString());

		// question : ton tai cach nao read tu ajax nua khong?

		String yourJson = jb.toString();
		
		
		JsonParser jsonParser = new JsonParser();
		JsonObject jo = (JsonObject)jsonParser.parse(yourJson);
		
		
		
		String action 	= jo.get("action").toString();
		String jsonData = jo.get("data").toString();
		
//		String acction = action.toString();

		Gson gson = new Gson();
		
//		ArrayList jsonObjList = gson.fromJson(jo, ArrayList.class);
//		GameStart[] startArray = gson.fromJson(yourJson, GameStart[].class);
//		List<GameStart> startList = Arrays.asList(startArray);

//		String data = jsonObjList.toString();
		GetDonHangInfo donHangInfo = gson.fromJson(jsonData, GetDonHangInfo.class);
//		GetDonHangInfo donHangInfo = gson.fromJson(yourJson, GetDonHangInfo.class);
			
		// System.out.println("============================= GAME START =============================");
		// System.out.println("  phiShip : " + donHangInfo.phiShip);
		// System.out.println("  tongChiPhi : " + donHangInfo.tongChiPhi + "  loaiThanhToan : " + donHangInfo.loaiThanhToan 
						 + " donHangInfo : " + donHangInfo.dviGiaoHang);
		
		
		
//		RequestDispatcher rd = request.getRequestDispatcher("./homepage.jsp");
		response.sendRedirect(request.getContextPath() + "/homepage.jsp");
//		PrintWriter pw = response.getWriter();
//		pw.append("OK");
		
	}
	
	class GetDonHangInfo{
		protected String phiShip;
		protected String tongChiPhi;
		protected String loaiThanhToan;
		protected String dviGiaoHang;		
	}
	
	/*
	 * public void parseJSON() { String yourJson =
	 * "{ \"phiShip\":29000, \"tongChiPhi\":86000, \"loaiThanhToan\":\"thanh toan bang tien mat\", \"dviGiaoHang\":\"Giao Sieu Toc 2H\" }"
	 * ; Gson gson = new Gson(); GetDonHangInfo donHangInfo =
	 * gson.fromJson(yourJson, GetDonHangInfo.class);
	 * 
	 * // System.out.println(donHangInfo.toString()); System.out.
	 * println("============================= GAME START ============================="
	 * ); // System.out.println("  phiShip : " + donHangInfo.phiShip);
	 * // System.out.println("  tongChiPhi : " + donHangInfo.tongChiPhi +
	 * "  loaiThanhToan : " + donHangInfo.loaiThanhToan + " donHangInfo : " +
	 * donHangInfo.dviGiaoHang); }
	 * 
	 * 
	 * public static void main(String ...strings) {
	 * 
	 * DonHangAction test = new DonHangAction();
	 * 
	 * test.parseJSON();
	 * 
	 * }
	 */

}
