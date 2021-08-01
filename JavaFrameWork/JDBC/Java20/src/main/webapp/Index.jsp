<%@taglib uri="/WEB-INF/i18ntag.tld" prefix="i18n" %>

<%@page import="model.ModelKhachHang"%>
<%@page import="model.ModelChiTietSanPham"%>
<%@page import="java.util.List"%>
<%@ page language="java" 
		contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<jsp:useBean id="spList" class="java.util.ArrayList" scope="request" />
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div
		style="border: 1px solid gray; padding: 5px 10px; margin: 20px 5px;">
		<table border="1" style="border-collapse: collapse;">
			<caption>
				
				<i18n:i18ntag>index.proTable.caption</i18n:i18ntag>
				<%=((ModelKhachHang)session.getAttribute("currentUser")).getHoTen()%>
			</caption>
			<tr>
				<th>
					<i18n:i18ntag>index.proTable.copde</i18n:i18ntag>
				</th>
				<th>
					<i18n:i18ntag>index.proTable.name</i18n:i18ntag>
				</th>
				<th>
					<i18n:i18ntag>index.proTable.type</i18n:i18ntag>
				</th>
			</tr>
			<%
			ModelChiTietSanPham sp;
			for (Object obj : spList) {
				sp = (ModelChiTietSanPham) obj;
			%>
			<tr>
				<td><%=sp.getSanPhamCode()%></td>
				<td><%=sp.getTenSP()%></td>
				<td><%=sp.getTenLoaiSP()%></td>
			</tr>
			<%
			}
			%>

		</table>
	</div>

</body>
</html>