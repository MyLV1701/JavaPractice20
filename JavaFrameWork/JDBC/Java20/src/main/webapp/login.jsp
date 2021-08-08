<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="./loginAction" method="post">
		<table>
			<caption>Login</caption>
			<tr>
				<td>Tên đăng nhập:</td>
				<td><input type="text" name="userName"></td>
			</tr>
			<tr>
				<td>Mật khẩu:</td>
				<td><input type="password" name="passWord"></td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="reset" value="Nhập lại"> 
					<input type="submit" value="Đăng nhập">
				</td>
			</tr>
		</table>
	</form>
</body>
</html>