package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashSet;

import dbConnection.DBConnection;
import model.ModelDonHang;

public class DaoDonHang {

	public DaoDonHang() {
		// TODO Auto-generated constructor stub
	}

	public void createDonHang() {
		String sqlCMD = " CREATE table IF NOT EXISTS donhang (  "
				+ " donHangCode			int primary key auto_increment,  "
				+ " khachHangCode		int,  "
				+ " ngayDatHang			varchar(45), "
				+ " trangThai			varchar(45),  "
				+ " phone				varchar(45) NOT NULL,  "
				+ " tenNguoiNhan		varchar(45) NOT NULL,  "
				+ " diaChiNhanhang		varchar(500) DEFAULT NULL,  "
				+ " hinhThucThanhToan	varchar(100) NOT NULL,  "
				+ " loaiGiaoHang		varchar(100) NOT NULL,  "
				+ " phiVanChuyen		int,  "
				+ " tongChiPhi			int,    "
				+ " constraint `DH_khachHangCode` foreign key (`khachHangCode`) references `khachhang` (`khachHangCode`)  "
				+ " );  ";

		Connection connection = DBConnection.GET_CONNECTION();

		try {
			Statement stmt = connection.createStatement();
			stmt.executeUpdate(sqlCMD);

		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public void addNewItems(int khachHangCode, Date ngayDatHang, String trangThai, String phone, String tenNguoiNhan, 
							String diaChiNhanhang, String hinhThucThanhToan, String loaiGiaoHang, int phiVanChuyen, int tongChiPhi ) 
							throws SQLException {

		String sql = "insert into donhang (khachHangCode, ngayDatHang, trangThai, phone, tenNguoiNhan, "
				   +                       "diaChiNhanhang, hinhThucThanhToan, loaiGiaoHang, phiVanChuyen, tongChiPhi) "
				   +  "values (?,?,?,?,?,?,?,?,?,?)";

		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
		String importDate = formatter.format(ngayDatHang);
		
		Connection connection  = DBConnection.GET_CONNECTION();
		PreparedStatement stmt = connection.prepareStatement(sql);
		
		stmt.setInt(   1,  khachHangCode );
		stmt.setString(2,  importDate );
		stmt.setString(3,  trangThai );
		stmt.setString(4,  phone );
		stmt.setString(5,  tenNguoiNhan );
		stmt.setString(6,  diaChiNhanhang );
		stmt.setString(7,  hinhThucThanhToan );
		stmt.setString(8,  loaiGiaoHang );
		stmt.setInt(   9,  phiVanChuyen );
		stmt.setInt(   10, tongChiPhi );
		
		stmt.executeUpdate();
	}

	public ModelDonHang getDonHangExist(String donHangCode) throws SQLException {
				
		String sql = " select DH.donHangCode, DH.ngayDatHang, DH.trangThai, DH.diaChiNhanhang, DH.phone, DH.tenNguoiNhan, DH.hinhThucThanhToan, "
				   + " DH.loaiGiaoHang, DH.phiVanChuyen, DH.tongChiPhi, SP.tenSP, CTDH.giaBan, CTDH.soLuong, CTDH.giamGia, CTDH.thanhTien "
				   + " from donhang as DH, chitietdonhang as CTDH, sanpham as SP "
				   + " where (CTDH.sanPhamCode = SP.sanPhamCode) and (DH.donHangCode = CTDH.donHangCode) and (DH.donHangCode = " + donHangCode + "); ";

		Connection connection = DBConnection.GET_CONNECTION();
		Statement sta = connection.createStatement();
		ResultSet rs = sta.executeQuery(sql);

		ModelDonHang gh = new ModelDonHang();
		Boolean isUpdateDH = true;

		while (rs.next()) {

			if(isUpdateDH){
				gh.setDonhangID(rs.getInt(1));
				gh.setNgayDatHang(rs.getDate(2));
				gh.setTrangThai(rs.getString(3));
				gh.setDiaChiNhanHang(rs.getString(4));
				gh.setPhoneNumb(rs.getString(5));
				gh.setTenNguoiNhan(rs.getString(6));
				gh.setHinhThucThanhToan(rs.getString(7));
				gh.setDonViGiaoHang(rs.getString(8));
				gh.setPhiVanChuyen(rs.getInt(9));
				gh.setTongTien(rs.getInt(10));
			};

			ModelDonHang.sanPhamDS spObj = gh.new sanPhamDS(rs.getString(11), rs.getInt(12), rs.getInt(13), rs.getInt(14), rs.getInt(15));
			
			gh.setDsSP(spObj);
			isUpdateDH = false;
		}
		
		return gh;
	}
	
	public HashSet<String> getAllDonHangCodeExist() throws SQLException{
		
		String sql = "select donHangCode from donhang ";

		HashSet<String> dhCode = new HashSet<String>();
		Connection connection = DBConnection.GET_CONNECTION();
		Statement sta = connection.createStatement();
		ResultSet rs = sta.executeQuery(sql);
		
		while(rs.next()) dhCode.add(rs.getString(1));
		
		return dhCode;
	}
	
}
