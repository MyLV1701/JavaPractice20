package model;

public class ModelGioHang {
	private String tenSP;
	private int giaSP;
	private int soLuong;
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
	}

	public ModelGioHang(String tenSP, int giaSP, int soLuong, String sdtKH, String tenKH, String diaChiKH) {
		super();
		this.tenSP = tenSP;
		this.giaSP = giaSP;
		this.soLuong = soLuong;
		this.sdtKH = sdtKH;
		this.tenKH = tenKH;
		this.diaChiKH = diaChiKH;
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

}