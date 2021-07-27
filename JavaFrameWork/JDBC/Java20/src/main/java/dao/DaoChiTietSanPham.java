package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import dbConnection.DBConnection;
import model.ModelChiTietSanPham;

public class DaoChiTietSanPham {
	
	String sql = "select \n"
			+ "	sp.sanPhamCode, sp.tenSP, sp.giaNhap, sp.giaBan, sp.soLuong, sp.giamGia,\n"
			+ "    sp.loaiSPCode, l.tenLoaiSP,\n"
			+ "    sp.nhaCungCapCode, n.tenNhaCungCap,\n"
			+ "    sp.ngayNhap\n"
			+ "from \n"
			+ "	sanPham sp, loaiSP l, nhaCungCap n\n"
			+ "where \n"
			+ "	sp.loaiSPCode = l.loaiSPCode and\n"
			+ "    sp.nhaCungCapCode = n.nhaCungCapCode";
	
	public List<ModelChiTietSanPham> getAllSanPham() throws SQLException{
		List<ModelChiTietSanPham> sanPhamList = new ArrayList<ModelChiTietSanPham>();
		Connection connection =  DBConnection.GET_CONNECTION();

		Statement sta = connection.createStatement();
		ResultSet rs = sta.executeQuery(sql);
		
		ModelChiTietSanPham nSP = null;
		
		while(rs.next()){
			nSP = new ModelChiTietSanPham(
			rs.getInt(1),rs.getString(2),rs.getInt(3),rs.getInt(4),
			rs.getInt(5),rs.getInt(6),rs.getInt(7),rs.getString(8),
			rs.getInt(9),rs.getString(10),null);

			sanPhamList.add(nSP);
		}
		return sanPhamList;
	}
	
	public void addSanPham(String tenSP, String ngayNhap, int giaNhap, int giaBan, int soLuong, int giamGia, int loaiSPCode, int nhaCungCapCode) throws SQLException {
		
		String upsql = "insert into sanPham (tenSP, ngayNhap, giaNhap, giaBan, soLuong, giamGia, loaiSPCode, nhaCungCapCode)"
				+ " values (?,?,?,?,?,?,?,?)";
		
		Connection connection = DBConnection.GET_CONNECTION();
		PreparedStatement stmt = connection.prepareStatement(upsql);		
		
		stmt.setString(1, tenSP);
		stmt.setString(2, ngayNhap);
		stmt.setInt(3, giaNhap);
		stmt.setInt(4, giaBan);
		stmt.setInt(5, soLuong);
		stmt.setInt(6, giamGia);
		stmt.setInt(7, loaiSPCode);
		stmt.setInt(8, nhaCungCapCode);
		stmt.executeUpdate();
	}
	
	

	public static void main(String ... args) throws SQLException{
		DaoChiTietSanPham daoSanPham = new DaoChiTietSanPham();
		List<ModelChiTietSanPham> spList = daoSanPham.getAllSanPham();
		
		System.out.println(spList);
		
	}
}
