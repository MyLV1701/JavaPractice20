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
	
	<button onclick="myFunction()">Click me</button>

	<div
		style='border: 1px solid gray; padding: 5px 10px; margin: 20px 5px'>

		<table id="table_data" border: "I" style="border-collapse: collapse;">

			<caption>Danh Sách Sản Phẩm</caption>
			<tr>
				<th>San pham code</th>
				<th>Ten San pham</th>
				<th>Loai San Pham</th>

			</tr>

		</table>
	</div>

	<script src="./bootstrap/jquery.min.js"></script>
	<script>
	
		function myFunction(){
		
			var amountProductCurrent = document.getElementsByClassName("productIndex").length;
			
			$.ajax({
				
				url: "/Java20/homeAjaxControler",
				type: "get", //send it through get method
				data :{
					exist : amountProductCurrent
				},
				success: function(data) {
				//Do Something

				var row = document.getElementById("table_data");
				row.innerHTML += data;

				},
				error: function(xhr) {
				//Do Something to handle error
				}
			});
		
		}

</script>

</body>
</html>