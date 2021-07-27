package model;

import java.util.Date;

public class ModelChiTietSanPham {
	private int sanPhamCode;
	private String tenSP;
	private int giaNhap;
	private int giaBan;
	private int soLuong;
	private int giamGia;
	private int loaiSPCode;
	private String tenLoaiSP;
	private int nhaCungCapCode;
	private String tenNhaCungCap;
	private Date ngayNhap;

	public ModelChiTietSanPham(int sanPhamCode, String tenSP, int giaNhap, int giaBan, int soLuong, int giamGia,
			int loaiSPCode, String tenLoaiSP, int nhaCungCapCode, String tenNhaCungCap, Date ngayNhap) {
		super();
		this.sanPhamCode = sanPhamCode;
		this.tenSP = tenSP;
		this.giaNhap = giaNhap;
		this.giaBan = giaBan;
		this.soLuong = soLuong;
		this.giamGia = giamGia;
		this.loaiSPCode = loaiSPCode;
		this.tenLoaiSP = tenLoaiSP;
		this.nhaCungCapCode = nhaCungCapCode;
		this.tenNhaCungCap = tenNhaCungCap;
		this.ngayNhap = ngayNhap;
	}

	public String toString() {
		StringBuilder sb = new StringBuilder();
		sb.append("SP-Code:").append(this.sanPhamCode).append("\n");
		sb.append("SP-Name:").append(this.tenSP).append("\n");
		sb.append("SP-Loai:").append(this.tenLoaiSP).append("\n");
		sb.append("--------------------------------------------\n");

		return sb.toString();
	}

	public int getSanPhamCode() {
		return sanPhamCode;
	}

	public void setSanPhamCode(int sanPhamCode) {
		this.sanPhamCode = sanPhamCode;
	}

	public String getTenSP() {
		return tenSP;
	}

	public void setTenSP(String tenSP) {
		this.tenSP = tenSP;
	}

	public int getGiaNhap() {
		return giaNhap;
	}

	public void setGiaNhap(int giaNhap) {
		this.giaNhap = giaNhap;
	}

	public int getGiaBan() {
		return giaBan;
	}

	public void setGiaBan(int giaBan) {
		this.giaBan = giaBan;
	}

	public int getSoLuong() {
		return soLuong;
	}

	public void setSoLuong(int soLuong) {
		this.soLuong = soLuong;
	}

	public int getGiamGia() {
		return giamGia;
	}

	public void setGiamGia(int giamGia) {
		this.giamGia = giamGia;
	}

	public int getLoaiSPCode() {
		return loaiSPCode;
	}

	public void setLoaiSPCode(int loaiSPCode) {
		this.loaiSPCode = loaiSPCode;
	}

	public String getTenLoaiSP() {
		return tenLoaiSP;
	}

	public void setTenLoaiSP(String tenLoaiSP) {
		this.tenLoaiSP = tenLoaiSP;
	}

	public int getNhaCungCapCode() {
		return nhaCungCapCode;
	}

	public void setNhaCungCapCode(int nhaCungCapCode) {
		this.nhaCungCapCode = nhaCungCapCode;
	}

	public String getTenNhaCungCap() {
		return tenNhaCungCap;
	}

	public void setTenNhaCungCap(String tenNhaCungCap) {
		this.tenNhaCungCap = tenNhaCungCap;
	}

	public Date getNgayNhap() {
		return ngayNhap;
	}

	public void setNgayNhap(Date ngayNhap) {
		this.ngayNhap = ngayNhap;
	}

}
