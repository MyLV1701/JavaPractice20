
<%@page import="model.ModelKhachHang"%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>


<html>
<head>

<title>Chỉnh Sửa Thông Tin Khách Hàng</title>

<!-- <link rel="stylesheet" href="./bootstrap/bootstrap.min.css"> -->
<!-- <script src="./bootstrap/jquery.min.js"></script> -->
<!-- <script src="./bootstrap/popper.min.js"></script> -->
<!-- <script src="./bootstrap/bootstrap.min.js"></script> -->

<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

</head>
<body>

<%
ModelKhachHang khachHang = (ModelKhachHang) request.getSession().getAttribute("currentUser");
// System.out.println(" *********************** Chỉnh Sửa Thông Tin Khách Hàng *********************** ");
%>

<div style="width: 500px; height: auto; margin: 5px 10px">
    <div class="modal-content usrInforChange">
        <div class="modal-body">
            <form>
                <div class="form-group">
                    <label for="recipient-name" class="form-control-label">Full Name</label>
                    <input type="text" class="form-control name" value="<%=khachHang.getHoTen()%>">
                </div>
                <div class="form-group">
                    <label for="recipient-name" class="form-control-label">Phone Number</label>
                    <input type="text" class="form-control phone" value=<%=khachHang.getPhone() %>>
                </div>
                <div class="form-group">
                    <label for="recipient-name" class="form-control-label">Email</label>
                    <input type="text" class="form-control email" value=<%=khachHang.getEmail() %>>
                </div>
                <div class="form-group">
                    <label for="message-text" class="form-control-label">Address</label>
                    <textarea class="form-control message-text"
                        style="margin-top: 0px; margin-bottom: 0px; height: 50px;"><%=khachHang.getDiaChi() %></textarea>
                </div>
            </form>
        </div>
        <div class="modal-footer">
            <button type="button" class="Cancel btn btn-secondary" data-dismiss="modal">Cancel</button>
            <button type="button" class="changeInfo btn btn-primary">Update</button>
        </div>
    </div>
</div>

</body>    

</html>