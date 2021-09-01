package model;

import java.util.Date;
import java.util.List;
import java.util.ArrayList;

public class ModelDonHang {
	private int 	donhangID;
	private Date	ngayDatHang;
	private String 	trangThai;
	private String	diaChiNhanHang;
	private String 	phoneNumb;
	private String 	tenNguoiNhan;
	private String 	hinhThucThanhToan;
	private String 	donViGiaoHang;
	private int 	phiVanChuyen;
	private int 	tongTien;
	
	private final List<sanPhamDS> dsSP; 
	
	public ModelDonHang() {
		super();
		dsSP = new ArrayList<sanPhamDS>();
	}
	
	public ModelDonHang( int donhangID,	Date ngayDatHang, String trangThai,	String diaChiNhanHang, String phoneNumb, 
						 String tenNguoiNhan, String hinhThucThanhToan, String donViGiaoHang,int phiVanChuyen,int tongTien) 
	{
		this.donhangID          = donhangID;
		this.ngayDatHang        = ngayDatHang;
		this.trangThai          = trangThai;
		this.diaChiNhanHang     = diaChiNhanHang;
		this.phoneNumb          = phoneNumb;
		this.tenNguoiNhan       = tenNguoiNhan;
		this.hinhThucThanhToan  = hinhThucThanhToan;
		this.donViGiaoHang      = donViGiaoHang;
		this.phiVanChuyen       = phiVanChuyen;
		this.tongTien           = tongTien;
		this.dsSP 				= new ArrayList<sanPhamDS>();
	}
	
	public class sanPhamDS{
		private String 	tenSP;
		private int 	giaSP;
		private int 	soLuong;
		
		public sanPhamDS() {
			super();
		}
				
		public sanPhamDS(String tenSP, int giaSP, int soLuong){
			this.tenSP = tenSP;
			this.giaSP = giaSP;
			this.soLuong = soLuong;
		}
		
		public String getTenSP() {
			return tenSP;
		}
		public void setTenSP(String tenSP) {
			this.tenSP = tenSP;
		}
		public int getGiaSP() {
			return giaSP;
		}
		public void setGiaSP(int giaSP) {
			this.giaSP = giaSP;
		}
		public int getSoLuong() {
			return soLuong;
		}
		public void setSoLuong(int soLuong) {
			this.soLuong = soLuong;
		}
	}
	
	
	public int getDonhangID() {
		return donhangID;
	}

	public void setDonhangID(int donhangID) {
		this.donhangID = donhangID;
	}

	public Date getNgayDatHang() {
		return ngayDatHang;
	}

	public void setNgayDatHang(Date ngayDatHang) {
		this.ngayDatHang = ngayDatHang;
	}

	public String getTrangThai() {
		return trangThai;
	}

	public void setTrangThai(String trangThai) {
		this.trangThai = trangThai;
	}

	public String getDiaChiNhanHang() {
		return diaChiNhanHang;
	}

	public void setDiaChiNhanHang(String diaChiNhanHang) {
		this.diaChiNhanHang = diaChiNhanHang;
	}

	public String getPhoneNumb() {
		return phoneNumb;
	}

	public void setPhoneNumb(String phoneNumb) {
		this.phoneNumb = phoneNumb;
	}

	public String getTenNguoiNhan() {
		return tenNguoiNhan;
	}

	public void setTenNguoiNhan(String tenNguoiNhan) {
		this.tenNguoiNhan = tenNguoiNhan;
	}

	public String getHinhThucThanhToan() {
		return hinhThucThanhToan;
	}

	public void setHinhThucThanhToan(String hinhThucThanhToan) {
		this.hinhThucThanhToan = hinhThucThanhToan;
	}

	public String getDonViGiaoHang() {
		return donViGiaoHang;
	}

	public void setDonViGiaoHang(String donViGiaoHang) {
		this.donViGiaoHang = donViGiaoHang;
	}

	public int getPhiVanChuyen() {
		return phiVanChuyen;
	}

	public void setPhiVanChuyen(int phiVanChuyen) {
		this.phiVanChuyen = phiVanChuyen;
	}

	public int getTongTien() {
		return tongTien;
	}

	public void setTongTien(int tongTien) {
		this.tongTien = tongTien;
	}

	public List<sanPhamDS> getDsSP() {
		return dsSP;
	}
	
	public void setDsSP(sanPhamDS obj) {
		dsSP.add(obj);
	}
	

}
