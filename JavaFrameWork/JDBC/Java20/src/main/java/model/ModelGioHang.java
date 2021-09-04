package model;

public class ModelGioHang {
	private String tenSP;
	private int giaSP;
	private int soLuong;
	private int giamGia;
	private double thanhTien;
	private int spCode;
	private String sdtKH;
	private String tenKH;
	private String diaChiKH;

	public ModelGioHang() {
		this.tenSP = "";
		this.giaSP = 0;
		this.soLuong = 0;
		this.sdtKH = "";
		this.tenKH = "";
		this.diaChiKH = "";
		this.spCode = 0;
	}

	public ModelGioHang(String tenSP, int giaSP, int giamGia, int soLuong, double thanhTien, int spCode, String sdtKH, String tenKH, String diaChiKH) {
		super();
		this.tenSP = tenSP;
		this.giaSP = giaSP;
		this.soLuong = soLuong;
		this.giamGia = giamGia;
		this.thanhTien = thanhTien;
		this.spCode = spCode;
		this.sdtKH = sdtKH;
		this.tenKH = tenKH;
		this.diaChiKH = diaChiKH;
	}

	public int getGiamGia() {
		return giamGia;
	}

	public void setGiamGia(int giamGia) {
		this.giamGia = giamGia;
	}

	public double getThanhTien() {
		return thanhTien;
	}

	public void setThanhTien(double thanhTien) {
		this.thanhTien = thanhTien;
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

	public String getSdtKH() {
		return sdtKH;
	}

	public void setSdtKH(String sdtKH) {
		this.sdtKH = sdtKH;
	}

	public String getTenKH() {
		return tenKH;
	}

	public void setTenKH(String tenKH) {
		this.tenKH = tenKH;
	}

	public String getDiaChiKH() {
		return diaChiKH;
	}

	public void setDiaChiKH(String diaChiKH) {
		this.diaChiKH = diaChiKH;
	}

	public int getSpCode() {
		return spCode;
	}

	public void setSpCode(int spCode) {
		this.spCode = spCode;
	}

}