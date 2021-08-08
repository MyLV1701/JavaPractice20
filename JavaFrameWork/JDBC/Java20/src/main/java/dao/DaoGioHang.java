package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import dbConnection.DBConnection;
import model.ModelGioHang;

public class DaoGioHang {
	int SPcode;
	String tenSP;
	int soLuong;
	private String hoTenKH;
	private String phone;
	private String email;
	private String address;
	private String userNameLogin;
	private String passwordLogin;
	Connection consp = null;
	Statement stmt = null;

	String sqlcart = ("select g.SPCode as maSanPham, sp.tenSP, l.moTa, g.soLuong, (c.giaBan * g.soLuong) as thanhtien "
			+ "from sanpham sp, chitietdonhang c, giohang g, loaisp l " + 
			"where  g.SPCode = sp.sanPhamCode and sp.sanPhamCode = c.sanPhamCode and "
			+ "sp.loaiSPCode = l.loaiSPCode");

	public List<ModelGioHang> getAllGioHang() throws SQLException {
		List<ModelGioHang> cartList = new ArrayList<ModelGioHang>();
		Connection connection = DBConnection.GET_CONNECTION();
		Statement sta = connection.createStatement();
		ResultSet rs = sta.executeQuery(sqlcart);
		ModelGioHang mcart = null;
		while (rs.next()) {
			mcart = new ModelGioHang(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getInt(4), rs.getInt(5));
			cartList.add(mcart);
		}
		connection.close();
		return cartList;

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
		try {

			consp = DBConnection.GET_CONNECTION();
			String upsql = "insert into giohang(SPcode,tenSP,soLuong, hotenKH, "
					+ "phone,address, email, userName) values (?,?,?,?,?,?,?,?)";
			// stmt = consp.createStatement();// what is this?
			PreparedStatement stmt = consp.prepareStatement(upsql);
			stmt.setInt(1, this.SPcode);
			stmt.setString(2, this.tenSP);
			stmt.setInt(3, this.soLuong);
			stmt.setString(4, this.hoTenKH);
			stmt.setString(5, this.phone);
			stmt.setString(6, this.address);
			stmt.setString(7, this.email);
			stmt.setString(8, this.userNameLogin);
			stmt.executeUpdate();
			consp.close();

			// DBConnection.CLOST_CONNECTION();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

}
