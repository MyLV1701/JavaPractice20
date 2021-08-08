package model;

public class ModelGioHang {
	int sanPhamCode;
	String tenSP;
	String moTa;
	int soLuong;
	int thanhtien;

	public ModelGioHang(int sanPhamCode, String tenSP, String moTa, int soLuong, int thanhtien) {
		super();
		this.sanPhamCode = sanPhamCode;
		this.tenSP = tenSP;
		this.moTa = moTa;
		this.soLuong = soLuong;
		this.thanhtien = thanhtien;
	}

	public String toString() {
		StringBuilder sb = new StringBuilder();
		sb.append("Sp-Code:").append(this.sanPhamCode).append("\n");
		sb.append("Sp-Name:").append(this.tenSP).append("\n");
		sb.append("Sp-mota:").append(this.moTa).append("\n");
		sb.append("Sp-soLuong:").append(this.soLuong).append("\n");
		sb.append("Sp-thanhtien:").append(this.thanhtien).append("\n");

		sb.append("------------------------------------------\n");
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

	public String getMoTa() {
		return moTa;
	}

	public void setMoTa(String moTa) {
		this.moTa = moTa;
	}

	public int getSoLuong() {
		return soLuong;
	}

	public void setSoLuong(int soLuong) {
		this.soLuong = soLuong;
	}

	public int getThanhtien() {
		return thanhtien;
	}

	public void setThanhtien(int thanhtien) {
		this.thanhtien = thanhtien;
	}

}