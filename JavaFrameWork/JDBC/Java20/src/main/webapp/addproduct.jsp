<%@page import="dao.DaoLoaiSanPham"%>>
<%@page import="model.ModelLoaiSanPham"%>>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Thêm Sản Phẩm</title>
</head>
<body>

	<h2>MỜI QUÝ KHÁCH CHỌN SẢN PHẨM:</h2>
	
	<form action="./addProductAction" method="post">
		<table style="background-color: yellow;">
			<tr>
				<td>Loại sản phẩm</td>
				
				<td>
			
					<select name="productType">
					
					<%
					DaoLoaiSanPham daoLSP = new DaoLoaiSanPham();
		
					try {
						for (ModelLoaiSanPham lsp : daoLSP.getAllLoaiSanPham()) {
					%>
						<option value=<%=lsp.getLoaiSPCode()%>><%=lsp.getTenLoaiSP()%><option>
					
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
				<td><input type="text" name="productName"></td>
			</tr>
			<tr>
				<td>Ngày Nhập</td>
				<td><input type="date" name="importDate" value="2021-07-28"
					min="2018-01-01" max="2030-12-31"></td>
			</tr>
			<tr>
				<td>Giá Nhập</td>
				<td><input type="number" name="importPrice"></td>
			</tr>
			<tr>
				<td>Giá Bán</td>
				<td><input type="number" name="exportPrice"></td>
			</tr>
	
			<tr>
				<td>Số Lượng</td>
				<td><input type="number" name="aMount"></td>
			</tr>
			<tr>
				<td>Giảm Giá</td>
				<td><input type="number" name="Discount"></td>
			</tr>
	
			<tr>
				<td>Mã Nhà Cung Cấp</td>
				<td><input type="number" name="supplierCode"></td>
			</tr>
	
	
		</table>
	
	
		<button type="submit">Add Sản Phẩm</button>
	</form>
</body>
</body>
</html>