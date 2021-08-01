<%@page import="model.ModelChiTietSanPham"%>
<%@page import="dao.DaoChiTietSanPham"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<h1>hello servlet</h1>

	<%
	//StringBuilder s = new StringBuilder();
	//s.append("MyLV say hi to all");

	//out.println("StringBuilder test :" + s.toString() + " results");
	//out.println("<h2>hi guys!</h2>");
	%>

	<%
	DaoChiTietSanPham daoCTSP = new DaoChiTietSanPham();
	%>
	<div
		style='border: 1px solid gray; padding: 5px 10px; margin: 20px 5px'>

		<table border: "I" style="border-collapse: collapse;">

			<caption>Danh Sách Sản Phẩm</caption>
			<tr>
				<th>San pham code</th>
				<th>Ten San pham</th>
				<th>Loai San Pham</th>

			</tr>


			<%
			try {
				for (ModelChiTietSanPham sp : daoCTSP.getAllSanPham()) {
			%>
			<tr>
				<td><%=sp.getSanPhamCode()%></td>
				<td><%=sp.getTenSP()%></td>
				<td><%=sp.getTenLoaiSP()%></td>
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