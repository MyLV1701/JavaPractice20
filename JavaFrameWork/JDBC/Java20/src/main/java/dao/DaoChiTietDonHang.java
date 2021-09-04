package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Statement;

import dbConnection.DBConnection;

public class DaoChiTietDonHang {

	public DaoChiTietDonHang() {
		// TODO Auto-generated constructor stub
	}

	public void createChiTietGioHang() {
		String sqlCMD = " CREATE table IF NOT EXISTS chitietdonhang (  "
						+ " 	donHangCode		int not null,  "
						+ "     sanPhamCode		int not null,  "
						+ "     soLuong			int,  "
						+ "     giaBan			int,  "
						+ "     giamGia			int,  "
						+ "     thanhTien		int,  "
						+ "     constraint `CTDH_donHangCode` foreign key (`donHangCode`) references `donhang` (`donHangCode`),  "
						+ "     constraint `CTDH_sanPhamCode` foreign key (`sanPhamCode`) references `sanpham` (`sanPhamCode`)  "
						+ " );  ";

		Connection connect = DBConnection.GET_CONNECTION();

		try {
			Statement stmt = connect.createStatement();
			stmt.executeUpdate(sqlCMD);

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public void addNewItems(int sanPhamCode, int soLuong, int giaBan, int giamGia, int thanhTien ) throws SQLException {

		String updateForeinKeyFail = "SET FOREIGN_KEY_CHECKS=0; ";
		String getLastIndex        = "(SELECT donHangCode FROM donhang  ORDER BY donHangCode DESC LIMIT 1)";
		String sql                 =  " insert into chitietdonhang (donHangCode, sanPhamCode, soLuong, giaBan, giamGia, thanhTien)"
				     			   +  " values (" + getLastIndex + ", "
				     			   + sanPhamCode + ", " 
				     			   + soLuong + ", " 
				     			   + giaBan + ", " 
				     			   + giamGia + ", " 
				     			   + thanhTien + " ); ";

		
		Connection connection = DBConnection.GET_CONNECTION();
		
		Statement stmt = connection.createStatement();
		stmt.execute(updateForeinKeyFail);
		stmt.executeUpdate(sql);
		
	}
	
	
	public static void main(String ...strings) {
		
		try {
			new DaoChiTietDonHang().addNewItems(3,1,1200,10,1190);
			//https://stackoverflow.com/questions/4120482/foreign-key-problem-in-jdbc
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

}
