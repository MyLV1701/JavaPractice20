package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Statement;

import dbConnection.DBConnection;

public class gioHang {
	int sanPhamCode;
	int soLuong, sum;
	private String hoTenKH;
	private String phone;
	private String email;
	private String address;
	private String userNameLogin;
	Connection consp = null;
	Statement stmt = null;

	public void giohang(int sanPhamCode, int soLuong, String hoTenKH, String phone, String address, String email,
			String userNameLogin) {
		this.sanPhamCode = sanPhamCode;
		this.soLuong = soLuong;
		this.hoTenKH = hoTenKH;
		this.phone = phone;
		this.email = email;
		this.address = address;
		this.userNameLogin = userNameLogin;

		System.out.println(this.sanPhamCode);// test giá trị gửi về
		System.out.println(this.soLuong);
		System.out.println(this.hoTenKH);
		System.out.println(this.email);
		System.out.println(this.address);
		System.out.println(this.userNameLogin);

		try {

			consp = DBConnection.GET_CONNECTION();
			String upsql = "insert into giohang(SPCode,soLuong, hotenKH, "
					+ "phone, address, email, userName) values (?,?,?,?,?,?,?)";
			
			PreparedStatement stmt = consp.prepareStatement(upsql);
			
			stmt.setInt(1, this.sanPhamCode);
			stmt.setInt(2, this.soLuong);
			stmt.setString(3, this.hoTenKH);
			stmt.setString(4, this.phone);
			stmt.setString(5, this.address);
			stmt.setString(6, this.email);
			stmt.setString(7, this.userNameLogin);

			stmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}

	}

	public void deleteCartElement(int productID) throws Exception {
		String deleteSP = " delete from giohang where SPCode=?";

		Connection connectiondeleteSP = DBConnection.GET_CONNECTION();
		PreparedStatement stmtDeleteSP = connectiondeleteSP.prepareStatement(deleteSP);
		stmtDeleteSP.setInt(1, productID);
		stmtDeleteSP.executeUpdate();

	}
}
