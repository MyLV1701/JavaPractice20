<%@page import="java.util.List"%>
<%@page import="model.ModelLoaiSanPham"%>
<%@ page import="model.ModelChiTietSanPham"%>
<%@ page import="java.util.Date"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>


<html>
<head>

<link rel="stylesheet" href="./bootstrap/bootstrap.min.css">
<script src="./bootstrap/jquery.min.js"></script>
<script src="./bootstrap/popper.min.js"></script>
<script src="./bootstrap/bootstrap.min.js"></script>


<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Thông Tin Sản Phẩm</title>
</head>
<body>


	<%
	ModelChiTietSanPham obj = (ModelChiTietSanPham) request.getAttribute("editItemInfo");
	if (obj == null) {
		obj = new ModelChiTietSanPham();
	}
	SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
	String importDate = formatter.format(obj.getNgayNhap());
	%>

	<h2>THÔNG TIN SẢN PHẨM:</h2>

	<form action="./modifyProductAction" method="post">
		<table style="background-color: yellow;">
			<tbody>
				<tr>
					<td>Loại sản phẩm</td>
					<td>
						<select name="productType" style = "width: 100%;padding: 1px 2px;">
							<%
							List loaiSanPhamList = (List) request.getAttribute("loaiSanPhamList");
							try {
								ModelLoaiSanPham lsp;
								for (Object objLsp : loaiSanPhamList) {
										lsp = (ModelLoaiSanPham)objLsp;
							%>
									<option <%=((lsp.getLoaiSPCode() == obj.getLoaiSPCode())?
													"selected=\"selected\"":"")%>
											value="<%=lsp.getLoaiSPCode()%>"><%=lsp.getTenLoaiSP()%>
									</option>

							<%
								}
							} catch (Exception ex) {
								ex.printStackTrace();
							}
							%>
							
						</select>
					</td>
				</tr>

				<tr>
					<td>Tên Sản Phẩm</td>
					<td><input type="text" name="productName"
						value="<%=obj.getTenSP()%>"></td>
				</tr>
				<tr>
					<td>Ngày Nhập</td>
					<td><input type="date" style ="width: 100%; padding: 1px 2px;" 
							   name="importDate" value=<%=importDate%>></td>
				</tr>
				<tr>
					<td>Giá Nhập</td>
					<td><input type="number" name="importPrice"
						value=<%=obj.getGiaNhap()%>></td>
				</tr>
				<tr>
					<td>Giá Bán</td>
					<td><input type="number" name="exportPrice"
						value=<%=obj.getGiaBan()%>></td>
				</tr>

				<tr>
					<td>Số Lượng</td>
					<td><input type="number" name="aMount"
						value=<%=obj.getSoLuong()%>></td>
				</tr>
				<tr>
					<td>Giảm Giá</td>
					<td><input type="number" name="Discount"
						value=<%=obj.getGiamGia()%>></td>
				</tr>

				<tr>
					<td>Mã Nhà Cung Cấp</td>
					<td><input type="number" name="supplierCode"
						value=<%=obj.getNhaCungCapCode()%>></td>
				</tr>

				<tr>
					<td><input type="hidden" name="updateItemId" value=<%=obj.getSanPhamCode()%>></td>
				</tr>
			</tbody>
		</table>


		<button type="submit">Hoàn Thành</button>
	</form>
</body>

</body>
</html>