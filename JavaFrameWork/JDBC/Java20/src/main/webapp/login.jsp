<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<form action="./loginAction" method="post">
		<table>
			<caption>
				Login
				<caption>
					<tr>
						<td>Tên Đăng Nhập</td>
						<td><input type="text" name="userName"></td>
					</tr>

					<tr>
						<td>Mật Khẩu</td>
						<td><input type="password" name="passWord"></td>
					</tr>

			<tr>
				<td colspan="2"><input type="reset" value="Nhap Lai"></input> <input
					type="submit" vlaue="Dang Nhap"></input></td>>
			</tr>
		</table>

	</form>

</body>
</html>