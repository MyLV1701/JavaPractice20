<%@page import="model.ModelGioHang"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@ page import="model.ModelChiTietSanPham"%>
<%@ page import="dao.DaoGioHang"%>



<jsp:useBean id="cartList1" class="java.util.ArrayList" scope="request" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CART</title>
</head>
<body>
	<p style="font-size: 18px; color: #538b01; font-weight: bold;">
		<caption>CÁC SẢN PHẨM ĐÃ CHỌN:</caption>
	</p>
	<table
		style="background-color: yellow; text-align: center; margin: 10px 30px 10px 30px"
		border="3px";>
		<tr>
			<style>
th, td {
	padding: 10px;
}
</style>
			<th style="width: 80px">#</th>
			<th>Mã sản phẩm</th>
			<th>Tên sản phẩm</th>
			<th>Mô tả</th>
			<th>Số lượng</th>
			<th>Thành tiền<br>(vnđ)
			</th>
			<th></th>
		</tr>
		<%
		ModelGioHang cart1;
		int i = 0;
		int amount = 0;

		for (Object obj : cartList1) {
			cart1 = (ModelGioHang) obj;
			i = i + 1;
			amount = amount + cart1.getThanhtien();
		%>

		<tr>
			<td><%=i%></td>
			<td><div id="productId">
					<%=cart1.getSanPhamCode()%></div></td>

			<td><div id="productName">
					<%=cart1.getTenSP()%></div></td>

			<td><div id="productDescrible">
					<%=cart1.getMoTa()%></div></td>

			<td><div id="productQuantity">
					<%=cart1.getSoLuong()%></div></td>

			<td><div id="productAmount">
					<%=cart1.getThanhtien()%></div></td>
			<td>
				<form action="./gioHangAction" method="Post">
					<input type="hidden" name="productId2"
						value="<%=cart1.getSanPhamCode()%>">
					<button type="submit"
						style="background: #04f81b; width: 100%; border-radius: 25px">
						 Tự nhiên <br>không thích
					</button>
				</form>
			</td>
		</tr>
		<%
		}
		%>
		<tr>
			<th colspan="5">Tổng thiệt hại của quý khách là:<br>(vnđ)
			</th>
			<th colspan="2"><%=amount%></th>
		</tr>

	</table>

</body>
</html>