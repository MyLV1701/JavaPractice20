package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import dbConnection.DBConnection;
import model.ModelGioHang;

public class DaoGioHang {

	public void createGioHang(String userName) {
		String sqlCMD = "CREATE table IF NOT EXISTS GioHang" + userName + "("
				+ "	gioHangID      int primary key auto_increment, " + "	KhachHangCode  int NOT NULL, "
				+ "	SanPhamCode	   int NOT NULL, "
				+ "	constraint `KhachHangCode` foreign key (`KhachHangCode`) references `khachHang` (`khachHangCode`), "
				+ "	constraint `SanPhamCode` foreign key (`SanPhamCode`) references `sanpham` (`sanPhamCode`) " + ");";

		Connection connection = DBConnection.GET_CONNECTION();

		try {
			Statement stmt = connection.createStatement();
			stmt.executeUpdate(sqlCMD);

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public List<ModelGioHang> getAllGioHang(String userName) throws SQLException {

		String sql = "select SP.tenSP, SP.giaBan , CTGH.SoLuong, KH.phone, KH.hoTen, KH.diaChi, SP.sanPhamCode " 
				+ "from GioHang" + userName + " GH, ChiTietGioHang" + userName + " CTGH, sanpham SP, khachhang KH "
				+ "where (GH.KhachHangCode = KH.khachHangCode) and " 
				+ " (GH.SanPhamCode = SP.sanPhamCode) and "
				+ " (CTGH.SanPhamCode = SP.SanPhamCode);";
		
//		System.out.println("List<ModelGioHang> getAllGioHang(String userName) : sql = " + sql);

		List<ModelGioHang> ghList = new ArrayList<ModelGioHang>();
		Connection connection = DBConnection.GET_CONNECTION();

		Statement sta = connection.createStatement();
		ResultSet rs = sta.executeQuery(sql);

		ModelGioHang gh = null;
		
		while (rs.next()) {
			gh = new ModelGioHang(rs.getString(1), rs.getInt(2), rs.getInt(3), rs.getString(4), rs.getString(5),
					rs.getString(6), rs.getInt(7));

			ghList.add(gh);
		}
		return ghList;

	}
	
	
	public List<ModelGioHang> getAllSelectedProducts(String userName, HashMap<String, Boolean> IsSelectedItems) throws SQLException {

		
		// filter HashMap -> removing un-ticked items  -> result: selectedItems
		// NEED TO USE DEEPCOPY to avoid affect to original HashMap
		
		HashMap<String, Boolean> DeepCopyhmImpl = new HashMap<String, Boolean>();
		DeepCopyhmImpl.putAll(IsSelectedItems);
		Iterator hmIterator = DeepCopyhmImpl.entrySet().iterator();

		while (hmIterator.hasNext()) {
			Map.Entry mapElement = (Map.Entry)hmIterator.next();
            Boolean isRemove = (Boolean)mapElement.getValue();
           if(isRemove == false) {
        	   hmIterator.remove();
           }
       }
		
		String sql = "select SP.tenSP, SP.giaBan , CTGH.SoLuong, KH.phone, KH.hoTen, KH.diaChi, SP.sanPhamCode " 
				+ "from GioHang" + userName + " GH, ChiTietGioHang" + userName + " CTGH, sanpham SP, khachhang KH "
				+ "where (GH.KhachHangCode = KH.khachHangCode) and " 
				+ " (GH.SanPhamCode = SP.sanPhamCode) and "
				+ " (CTGH.SanPhamCode = SP.SanPhamCode);";
		

		List<ModelGioHang> spList = new ArrayList<ModelGioHang>();
		Connection connection = DBConnection.GET_CONNECTION();

		Statement sta = connection.createStatement();
		ResultSet rs = sta.executeQuery(sql);

		ModelGioHang gh = null;
		
		while (rs.next()) {
			
			// if ( selectedItems contains ( rs.getInt(7) ) )
			String spCode = rs.getString(7);
			if(DeepCopyhmImpl.containsKey(spCode))
			{
				gh = new ModelGioHang(rs.getString(1), rs.getInt(2), rs.getInt(3), rs.getString(4), rs.getString(5),
						rs.getString(6), rs.getInt(7));
				spList.add(gh);
			}
		}
		return spList;
	}
	
	
	

	public void addNewItems(String userName, int spCode, int khachHangCode) throws SQLException {

		String sql = "insert into GioHang" + userName + "(KhachHangCode, SanPhamCode) values (?,?)";

		Connection connection = DBConnection.GET_CONNECTION();
		PreparedStatement stmt = connection.prepareStatement(sql);

		stmt.setInt(1, khachHangCode);
		stmt.setInt(2, spCode);
		stmt.executeUpdate();

	}
	
	public void removeItems(String userName, int spCode) throws SQLException {

		String sql = "delete from GioHang" + userName + "  where SanPhamCode = " + spCode;

		Connection connection = DBConnection.GET_CONNECTION();
		Statement stmt  = connection.createStatement();
		stmt.executeUpdate(sql);
	}
	
	

	public HashMap<String, Boolean> getAllSPcode(String userName) throws SQLException {
		
//		HashSet<String> spCodeList = new HashSet<String>();
		HashMap<String, Boolean> spCodeList = new HashMap<String, Boolean>();
		String sqlQuery = "select SanPhamCode from GioHang" + userName;
		
		Connection connection = DBConnection.GET_CONNECTION();
		Statement sta = connection.createStatement();
		ResultSet rs = sta.executeQuery(sqlQuery);

		while (rs.next()) {
			spCodeList.put(rs.getString(1),false);
		}

		return spCodeList;
	}

}
