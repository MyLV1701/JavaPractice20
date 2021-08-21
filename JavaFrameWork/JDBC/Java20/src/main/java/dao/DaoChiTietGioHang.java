package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Statement;

import dbConnection.DBConnection;

public class DaoChiTietGioHang {

	public void createChiTietGioHang(String userName) {
		String sqlCMD = "CREATE table IF NOT EXISTS ChiTietGioHang" + userName + "("
				+ "	ChiTietGioHangID	int primary key auto_increment, " + " KhachHangCode int NOT NULL, "
				+ " SanPhamCode int NOT NULL, " + " SoLuong	int, "
				+ " constraint `CTGH_KhachHangCode` foreign key (`KhachHangCode`) references `khachHang` (`khachHangCode`), "
				+ " constraint `CTGH_SanPhamCode` foreign key (`SanPhamCode`) references `sanpham` (`sanPhamCode`) "
				+ "); ";

		Connection connect = DBConnection.GET_CONNECTION();

		try {
			Statement stmt = connect.createStatement();
			stmt.executeUpdate(sqlCMD);

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public void addNewItems(String userName, int spCode, int khachHangCode, int soLuong) throws SQLException {

		String sql = "insert into ChiTietGioHang" + userName + "(KhachHangCode, SanPhamCode, SoLuong) values (?,?,?)";

		Connection connection = DBConnection.GET_CONNECTION();
		PreparedStatement stmt = connection.prepareStatement(sql);
		
		stmt.setInt(1, khachHangCode);
		stmt.setInt(2, spCode);
		stmt.setInt(3, soLuong);
		stmt.executeUpdate();
	}

	public void updateQuantity(Boolean isPlus, String userName, int spCode, int soLuong) throws SQLException {

		String operator = (isPlus) ? "+" : "-";
		String sql = "update ChiTietGioHang" + userName + "  set SoLuong = SoLuong " + operator + " ? where SanPhamCode = ?";

		Connection connection = DBConnection.GET_CONNECTION();
		PreparedStatement stmt = connection.prepareStatement(sql);

		stmt.setInt(1, soLuong);
		stmt.setInt(2, spCode);
		stmt.executeUpdate();
	}

}
