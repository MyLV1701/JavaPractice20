package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Statement;

import dbConnection.DBConnection;

public class DaoGioHang {
	int SPcode;
	String tenSP;
	int soLuong;
	private String hoTenKH;
	private String phone;
	private String email;
	private String address;
	private String userNameLogin;

	public String toString() {
		StringBuilder sb = new StringBuilder();
		sb.append("SP-Code:").append(this.SPcode).append("\n");
		sb.append("SP-Name:").append(this.hoTenKH).append("\n");
		sb.append("SP-SoLuong:").append(this.soLuong).append("\n");
		sb.append("--------------------------------------------\n");

		return sb.toString();
	}

		
	public void update(int SPcode, String tenSP, int soLuong, String hoTenKH, String phone, String address,
			String email, String userNameLogin) {
		this.SPcode = SPcode;
		this.tenSP = tenSP;
		this.soLuong = soLuong;
		this.hoTenKH = hoTenKH;
		this.phone = phone;
		this.email = email;
		this.address = address;
		this.userNameLogin = userNameLogin;

		System.out.print(this.toString());

		try {

			Connection connection = DBConnection.GET_CONNECTION();
			String upsql = "insert into giohang(sanPhamCode,tenSP,soLuong, hoTenKH, phone,address, email, userName)"
					+ " values (?,?,?,?,?,?,?,?)";
			// stmt = consp.createStatement();// what is this?
			PreparedStatement stmt = connection.prepareStatement(upsql);
			
			System.out.print(upsql);
			
			stmt.setInt(1, this.SPcode);
			stmt.setString(2, this.tenSP);
			stmt.setInt(3, this.soLuong);
			stmt.setString(4, this.hoTenKH);
			stmt.setString(5, this.phone);
			stmt.setString(6, this.address);
			stmt.setString(7, this.email);
			stmt.setString(8, this.userNameLogin);
			stmt.executeUpdate();
			
			
			connection.close();

			// DBConnection.CLOST_CONNECTION();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

}
