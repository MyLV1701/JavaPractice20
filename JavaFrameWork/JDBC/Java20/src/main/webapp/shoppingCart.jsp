<%@page import="model.ModelGioHang"%>
<%@page import="model.ModelKhachHang"%>
<%@page import="java.util.List"%>
<%@page import="java.util.HashMap"%>
<%@ page import="dao.DaoKhachHang"%>
<%@ page import="dao.DaoGioHang"%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>Shopping cart</title>
<link rel="stylesheet" href="css/shoppingCard_style.css">


<link rel="stylesheet" href="./bootstrap/bootstrap.min.css">
<script src="./bootstrap/jquery.min.js"></script>
<script src="./bootstrap/popper.min.js"></script>
<script src="./bootstrap/bootstrap.min.js"></script>

</head>
<style>

.__header_ {
    flex-basis: 100%;
    padding: 0px 6px;
    margin: 0px 0px 10px;
    height: 41px;
    border: none;
    position: relative;
}

.__header_ .background {
    background: rgb(241, 241, 241);
    position: absolute;
    width: 100vw;
    left: calc(-50vw + 50%);
    height: 41px;
}


.__header_ .item {
    padding: 13px 0px;
    font-size: 13px;
    display: inline-block;
    position: relative;
}


.__header_ .item a {
    color: #0062cc;
    background-color: transparent;
    text-decoration: none;
    font-weight: bold;
    font-size: 15px;
    outline: none;
    cursor: pointer;
}


.__header_ .item.active {
    color: #0062cc;
    font-weight: bold;
    padding-left: 45px;
}

.__header_ .item.active::before {
    background: url(https://frontend.tikicdn.com/_desktop-next/static/img/icons/breadcrumb.svg);
    width: 20px;
    height: 41px;
    content: "";
    display: inline-block;
    position: absolute;
    left: 10px;
    top: 0px;
    color: rgb(204, 204, 204);
}

</style>

<body>
	<div id="productForm"
		style="display: none; border: 1px solid blue; padding: 5px; width: auto; min-width: 150px; position: absolute; background-color: white;">
		<div
			style="width: 100%; height: 32px; line-height: 25px; background-color: lightgray; padding-right: 5px;">
			<div id="Cancel"
				style="cursor: pointer; border: 1px solid black; padding: 2px; width: 30px; float: right; text-align: center;">X</div>
		</div>
		<div
			style="margin-top: 5px; padding: 5px; min-height: 100px; border: 1px solid gray;"
			id="formBody">
			
		</div>

	</div>

    <main>
        <div class="Container-sc-itwfbd-0 hfMLFx">
            <div class="styles__StyledCartPage-sc-1e4yxbp-0 ljbDGD">
            
	            <div class="__header_" style=" font-weight: bold; ">
	                <div class="background"></div>
	                <div class="item" ><a href="./homePageAction">Trang chủ</a></div>
	                <div class="item active">Shopping Card</div>
	            </div>
            
                <div class="wrap-intended-cart">
                    <div class="cart">
						<% 
						double tamTinhVal = 0; 
						double giamGiaVal = 0; 
						%>            
                        <div class="cart-inner">
                            <div class="styles__StyledProductsV2-sc-rkft9e-0 dioUnE">
                                <h4 class="productsV2__title">Giỏ hàng</h4>
                                <div class="productsV2-heading">
                                    <div class="row">
										<div class="col-1-">
											<label class="styles__StyledCheckbox-sc-kvz5pc-0 hNjxWW selectAll">
												<input onclick="SelectedAllClick()" type="checkbox" id="btn">
												<span class="checkbox-fake">  </span>
												<span class="label">Tất Cả (2 sản phẩm)</span>
											</label>
										</div>
										<div class="col-2-">Đơn Giá</div>
										<div class="col-6-">Giảm Giá</div>
										<div class="col-3-">Số Lượng</div>
										<div class="col-4-">Thành Tiền</div>
                                        <div class="col-5-">
                                            <span class="productsV2__remove-all">
                                                <img onclick="onDeleteAllItemSelected()" id="btnDelAll" src="https://frontend.tikicdn.com/_desktop-next/static/img/icons/trash.svg" alt="deleted">
                                            </span>
                                        </div>
                                    </div>
                                </div>
                                <div class="productsV2-content">
                                    <div>
                                        <div class="infinite-scroll-component " style="height: auto; overflow: auto;">
                                            <div class="styles__StyledIntendedSeller-sc-1dwh2vk-0 kTsjPS">
                                                <div class="sellers"> 
                                                    <ul class="styles__StyledIntended-sc-1dwh2vk-1 bQOXDC" name="bQOXDC">

														<%
														DaoGioHang daoGH = new DaoGioHang();
														try {
															String userName = ((ModelKhachHang) request.getSession().getAttribute("currentUser")).getUserName();
															for (ModelGioHang gh : daoGH.getAllGioHang(userName)) {
																
																
														%>
														<li
															class="styles__StyledIntendedProduct-sc-1idi3y3-0 glclPp">
															<div class="row">
																<div class="col-1-">
																	<div class="intended__images false">
																		<div class="intended__checkbox">
																			<label class="styles__StyledCheckbox-sc-kvz5pc-0 hNjxWW">
																			    
																			    <%
																			    HashMap<String, Boolean> selectedStatus = (HashMap<String, Boolean>)request.getSession().getAttribute("selectedItems");
																			    Boolean isSelected = selectedStatus.get(Integer.toString(gh.getSpCode()));
																			    
																			     
																			    if(isSelected){
																			    	tamTinhVal += (double)(gh.getGiaSP()   * gh.getSoLuong()); 
																				   	giamGiaVal += (double)(gh.getGiamGia() * gh.getSoLuong());
																				   	 
																				   	// System.out.println(tamTinhVal);
																				   	// System.out.println(giamGiaVal);
																			    }
																			    
// 																			    // System.out.println("styles__StyledCheckbox-sc-kvz5pc-0 spCode : " + isSelected);
																			    
																			    %>
																			    
																				<input onclick="isSelectedAll()" type="checkbox" name="color"
																					   <%=(isSelected) ? "checked='checked'" : "" %>>
																				<span class="checkbox-fake"></span> 
																				<span><%=gh.getTenSP()%></span>
																			</label>
																		</div>
																	</div>
																</div>
																<div class="col-2-">
																	<span class="intended__real-prices"><%=gh.getGiaSP()%>đ</span>
																</div>
																<div class="col-6-">
																	<span class="intended__discount"><%=gh.getGiamGia()%>đ</span>
																</div>
																<div class="col-3-">

																	<div class="SoLuong"
																		style="display: inline-flex; flex-wrap: nowrap; border: 1px solid rgb(200, 200, 200); border-radius: 3px;">
																		<button class="qty-decrease" type="button" 
																			style="width: 25px; background-color: rgb(244, 244, 244); border-color: #efefef;">-</button>
																		<input
																			style="width: 30px; border: none; text-align: center;"
																			type="text" class="qty-input" value=<%=gh.getSoLuong() %> />
																		<button class="qty-increase" type="button" 
																			style="width: 25px; background-color: rgb(244, 244, 244); border-color: #efefef;">+</button>
																		<input type="hidden" class="maSanPham" value=<%=gh.getSpCode() %> />
																		
																	</div>
																</div>
																<div class="col-4-">
																	<span class="intended__final-prices"><%=String.format("%.0f", gh.getThanhTien())%>đ</span>
																	
																</div>
																<div class="col-5-">
																	<span class="intended__delete"
																		data-view-id="cart_main_remove.product"
																		data-view-index="8ed89b76-f98c-11eb-9027-1e34e53b2b31">
																		<img onclick="onDeleteItem(this)"
																		src="https://frontend.tikicdn.com/_desktop-next/static/img/icons/trash.svg"
																		alt="deleted">
																	</span>
																</div>
															</div>
														</li>
														<%
														}
														} catch (Exception ex) {
															ex.printStackTrace();
														}
														%>
													</ul>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="cart-total-prices">
                            <div class="cart-total-prices__inner">
                                <div class="styles__StyledShippingAddress-sc-1sjj51k-0 juqUnC">
                                    <p class="heading">
	                                    <span class="text">Giao tới</span>
	                                    <span data-view-id="cart_shipping_location.change" class="link">Thay đổi</span>
                                    </p>
                                    <div id = "usrInforDetails">
                                    	<%
									 	 ModelKhachHang Cus = (ModelKhachHang)request.getSession().getAttribute("currentUser");
// 										 // System.out.println("  user informaton handling MODIFIED  : DiaChi  " + Cus.getDiaChi());
									  	%>
										<p class="title">
											<b class="name"><%=Cus.getHoTen()%></b>
											<b class="phone"><%=Cus.getPhone()%></b>
										</p>
										<p class="address"><%=Cus.getDiaChi() %> </p>
										
                                    </div>
                                </div>
                                
                                <div class="styles__StyledCartPrices-sc-1op1gws-0 cdzcxd">
                                    <div class="prices">
                                        <ul class="prices__items">
                                            <li class="prices__item">
                                                <span class="acture_prices__text">Tạm tính</span>
                                                <span class="acture_prices__value"><%=String.format("%.0f", tamTinhVal)  %></span>
                                            </li>
                                            <li class="prices__item">
                                                <span class="fake_prices__text">Giảm giá</span>
                                                <span class="fake_prices__value"><%=String.format("%.0f",giamGiaVal)%></span>
                                            </li>
                                        </ul>
                                        <p class="prices__total">
                                            <span class="prices__text">Tổng cộng</span>
                                            <span class="prices__value prices__value--final"><%=String.format("%.0f",(tamTinhVal - giamGiaVal))%>
                                                <!--i>(Đã bao gồm VAT nếu có)</i-->
                                            </span></p>
                                    </div>
                                </div>
                                	<form action="./gioHangAction" method="get">
                                		<input type="hidden" name="Action" value = "MuaHangAction">
		                                <button type="submit" class="cart__submit">Mua Hàng </button>
	                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </main>


</body>
<script>


function quantityChange(eventListen, tar){
// 	var xhr           = new XMLHttpRequest();
	var spcode        = tar.find(".maSanPham").val();
	var currentAmount = tar.find(".qty-input").val();
//     xhr.open('GET', './gioHangAction?Action=' + eventListen + "&SpCode=" + spcode, true);
//     xhr.send();

	$.ajax({
		url: "/Java20/gioHangAction",
		type: "get", //send it through get method
		data :{
			"Action" : eventListen ,
			"SpCode" : spcode ,
			"currentAmount" : currentAmount
		},
		success: function(responseData) {
		},
		error: function(xhr) {
		}
	});
    
    
}

$(".qty-increase").bind( "click", function() {
 let isIncrease = "increase";
 var spcode = $(this).closest(".glclPp");
 quantityChange(isIncrease, spcode);
 
});


$(".qty-decrease").bind( "click", function() {
	 let isIncrease = "decrease";
	 var spcode = $(this).closest(".glclPp");
	 quantityChange(isIncrease, spcode);
	 
});

$(".intended__delete").bind( "click", function() {
	 let eventListen = "remove";
	 var spcode = $(this).closest(".glclPp");
	 quantityChange(eventListen, spcode);
	 
});

$(".intended__checkbox").bind( "click", function() {
	
	var isChecked = $(this).find("input").prop("checked");
	
	let eventListen = (isChecked) ?  "itemSelected" : "itemDeselected";
	
	var spcode = $(this).closest(".glclPp");
	quantityChange(eventListen, spcode);
});

$(".selectAll").bind( "click", function() {
	
	var isChecked = $(this).find("input").prop("checked");
	
	let eventListen = (isChecked) ?  "SelectedAll" : "DeselectedAll";
	
	var spcode = $(this).closest(".glclPp");
	quantityChange(eventListen, spcode);
});


$(".productsV2__remove-all").bind( "click", function() {
	
	let eventListen = "removeAll";

	var spcode = $(this).closest(".glclPp");
	quantityChange(eventListen, spcode);
});


$(".qty-input").bind('change', function () {
	var eventListen = "UserInputQuantity";
	var	soLuong = $(this).val();
	var spcode = $(this).next().next().val();
	
	var par = $(this).closest('.row');
    updatePiceItem(par, soLuong);
    updateTotalMoney();
    
	var xhr = new XMLHttpRequest();
    xhr.open('GET', './gioHangAction?Action=' + eventListen + "&SpCode=" + spcode + "&soLuong=" + soLuong, true);
    xhr.send();
});


var masID = "masLayer";
function popUpHandler() {
	$("#productForm").animate({
			left : '750px',
			top : '200px'
		});
	
		$("#productForm").slideDown(100);
		$("#productForm").css("z-index", "1000");
		//$("#productForm").fadeToggle(800);

		var layer = document.createElement("div");
		layer.setAttribute("id", masID);
		$(layer).css("position", "absolute");
		$(layer).animate({
			left : '0px',
			top : '0px'
		});
		$(layer).css("width", "100%");
		$(layer).css("height", "100%");
		$(layer).css("background-color", "gray");
		$(layer).css("z-index", "500");
		$(layer).css("opacity", "0.25");
		document.body.append(layer);
}

function removePopupIpl() {
	$("#productForm").fadeOut(150);
	var layer = document.getElementById(masID);
	document.body.removeChild(layer);
}

$("#Cancel").click(function() {
	removePopupIpl()
});


$(document).on("click", '.Cancel', function() {
	removePopupIpl();
});


$(".link").bind('click', function () {
	popUpHandler();

	var eventListen = "editUserInfor";
	var xmlhttp     = new XMLHttpRequest();
	xmlhttp.open("GET", "./gioHangAction?Action=" + eventListen, true);
	xmlhttp.send();
	xmlhttp.onreadystatechange = function() {
		if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
			var productPage = xmlhttp.responseText;
			var formBody = document.getElementById("formBody");
			formBody.innerHTML = productPage;
		}
	}
});


$(document).on("click", '.changeInfo', function() { 
// $(".changeInfo").bind('click', function () {  ==> KHONG THE BAT SU KIEN
	
	var eventListen = "usrInforUpdated";
	var parent      = $(this).closest(".usrInforChange");
	var userName    = parent.find(".name").val();
	var phoneNum    = parent.find(".phone").val();
	var email       = parent.find(".email").val();
	var address     = parent.find(".message-text").val();
	
	//console.log("changeinfo action result :" +  "userName = " + userName + "phoneNum = " + phoneNum + "email = " + email + "address = " + address );
	
    $.ajax({
		url: "/Java20/gioHangAction",
		type: "get", //send it through get method
		data :{
			Action : eventListen ,
			UsrFullName : userName ,
			UsrPhone : phoneNum ,
			UsrEmail : email ,
			UsrAddress : address
		},
		success: function(responseData) {
			var usrInforView = document.getElementById("usrInforDetails");
			usrInforView.innerHTML = responseData;
			
		},
		error: function(xhr) {
		//Do Something to handle error
		}
	});
    
    removePopupIpl();
	
});


$(".cart__submit").bind('click', function () {
	
	const cbs = document.querySelectorAll('input[name="color"]');
	let selectedCnt = 0;
	cbs.forEach((cb) => {
       if(cb.checked === true){
    	   selectedCnt++;
       }
       
	 });
	
	if(selectedCnt === 0){
		alert("【Warning】 NO ITEMS SELECTED!!!");
	}
		
});



// $(".cart__submit").bind('click', function () {
// 	// load tat ca thang gio hang ma isSelectedItems === true
// 	// nguoc lai voi thang removeAll
// 	var eventListen = "MuaHangAction";
	
// 	console.log("==================== CLICK MUA HANG ====================");
	
// 	var xhr = new XMLHttpRequest();
//     xhr.open('GET', './gioHangAction?Action=' + eventListen, true);
//     xhr.send();
	
	
// });


</script>

<script src="js/checkoutImpl.js"></script>


</html>