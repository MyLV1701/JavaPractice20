package dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServlet;

import dbConnection.DBConnection;
import model.ModelLoaiSanPham;

public class DaoDanhMucSanPham extends HttpServlet {
	private static final long serialVersionUID = 1L;
    String dmsql=("select * from loaiSP"); 
    
    public List<ModelLoaiSanPham>getAllDanhMucSP() throws SQLException{
    	List<ModelLoaiSanPham> danhMucSPList= new ArrayList<ModelLoaiSanPham>();
    	Connection connectionsp= DBConnection.GET_CONNECTION();
    	Statement stasp = connectionsp.createStatement();
    	ResultSet rssp = stasp.executeQuery(dmsql);
    	ModelLoaiSanPham mdmsp=null;
    	while (rssp.next())
    	{
    			mdmsp= new ModelLoaiSanPham(rssp.getInt(1), rssp.getString(2), rssp.getString(3));
    			danhMucSPList.add(mdmsp);
    }
    	connectionsp.close();
    	return danhMucSPList;
    	
    }
}
