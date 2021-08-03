package model;

public class ModelLoaiSanPham {
	private int loaiSPCode;
	private String tenLoaiSP;
	private String moTa;

	public ModelLoaiSanPham(int loaiSPCode, String tenLoaiSP, String moTa) {
		this.loaiSPCode = loaiSPCode;
		this.tenLoaiSP = tenLoaiSP;
		this.moTa = moTa;
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

	public String getMoTa() {
		return moTa;
	}

	public void setMoTa(String moTa) {
		this.moTa = moTa;
	}
	
	
	public String toString() {
		
		StringBuilder sb = new StringBuilder();
		sb.append("\t Ma Loai San Pham : ");
		sb.append(this.loaiSPCode);
		sb.append("\t Ten Loai San Pham : ");
		sb.append(this.tenLoaiSP);
		sb.append("\t Mo Ta : ");
		sb.append(this.moTa);
		
		return sb.toString();
	}
}
