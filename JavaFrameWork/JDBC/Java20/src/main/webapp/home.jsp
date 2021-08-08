<%@page import="model.ModelChiTietSanPham"%>
<%@page import="dao.DaoChiTietSanPham"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>Hello JSP - Serverlet !!!!!</h1>
	<%
	out.print("<h1>HELLO , My name is ..... </h1>");
	DaoChiTietSanPham daoCTSP = new DaoChiTietSanPham();
	%>
	<div
		style="border: 1px solid gray; padding: 5px 10px; margin: 20px 5px;">
		<table border="1" style="border-collapse:collapse;">
			<caption>Danh sách sản phẩm</caption>
			<tr>
				<th>SP Code</th>
				<th>Tên SP</th>
				<th>Loại SP</th>
			</tr>

			<%
			try {
				for (ModelChiTietSanPham sp : daoCTSP.getAllSanPham()) {
			%>
					<tr>
						<th><%=sp.getSanPhamCode() %></th>
						<th><%=sp.getTenSP() %></th>
						<th><%=sp.getTenLoaiSP() %></th>
					</tr>
			<%
				}
			} catch (Exception ex) {
				ex.printStackTrace();
			}
			%>

		</table>
	</div>
</body>
</html>