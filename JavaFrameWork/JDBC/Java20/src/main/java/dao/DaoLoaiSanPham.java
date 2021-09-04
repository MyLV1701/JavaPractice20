package dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import dbConnection.DBConnection;
import model.ModelLoaiSanPham;

public class DaoLoaiSanPham {

	String sql_cmd = "select * from loaisp;";

	public DaoLoaiSanPham() {
		// TODO Auto-generated constructor stub
	}

	public List<ModelLoaiSanPham> getAllLoaiSanPham() throws SQLException {

		List<ModelLoaiSanPham> loaiSPList = new ArrayList<ModelLoaiSanPham>();

		Connection connection = DBConnection.GET_CONNECTION();
		Statement sta = connection.createStatement();
		ResultSet rs = sta.executeQuery(sql_cmd);

		ModelLoaiSanPham loaiSP = null;

		while (rs.next()) {
			loaiSP = new ModelLoaiSanPham(rs.getInt(1), rs.getString(2), rs.getString(3));
			loaiSPList.add(loaiSP);
		}

		return loaiSPList;
	}
	
	
	public static void main(String ... args) throws SQLException {
		
		DaoLoaiSanPham test = new DaoLoaiSanPham();
		
		List<ModelLoaiSanPham> LSP = test.getAllLoaiSanPham();
		
		for (ModelLoaiSanPham l : LSP) {
			// System.out.println(l.toString());
		}
		
	}

}
