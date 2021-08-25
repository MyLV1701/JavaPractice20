<%@page import="java.util.List"%>
<%@page import="model.ModelLoaiSanPham"%>
<%@ page import="model.ModelChiTietSanPham"%>
<%@ page import="java.util.Date"%>
<%@ page import="java.text.SimpleDateFormat"%>

<%@page import="model.ModelKhachHang"%>

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

<div style="width: 500px; height: auto; margin: 5px 10px">
    <div class="modal-content usrInforChange">
        <div class="modal-body">
            <form>
                <div class="form-group">
                    <label for="recipient-name" class="form-control-label">Full Name</label>
                    <input type="text" class="form-control name" value="le van my">
                </div>
                <div class="form-group">
                    <label for="recipient-name" class="form-control-label">Phone Number</label>
                    <input type="text" class="form-control phone" value="0977 539 566">
                </div>
                <div class="form-group">
                    <label for="recipient-name" class="form-control-label">Email</label>
                    <input type="text" class="form-control email" value="mydonghung@gmail.com">
                </div>
                <div class="form-group">
                    <label for="message-text" class="form-control-label">Address</label>
                    <textarea class="form-control message-text"
                        style="margin-top: 0px; margin-bottom: 0px; height: 50px;"> chung toi la chien sy</textarea>
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

<script >
$(".changeInfo").bind('click', function () {
	var parent   = $(this).closest(".usrInforChange");
	
	var userName = parent.find(".name").val();
	var phoneNum = parent.find(".phone").val();
	var email    = parent.find(".email").val();
	var address  = parent.find(".message-text").val();
	
	console.log("changeinfo action result :" +  "userName = " + userName + "phoneNum = " + phoneNum + "email = " + email + "address = " + address );
});

</script>


</html>