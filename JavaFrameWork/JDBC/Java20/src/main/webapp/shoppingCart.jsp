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
<link rel="stylesheet" href="css/style.css">

<link rel="stylesheet" href="./bootstrap/bootstrap.min.css">
<script src="./bootstrap/jquery.min.js"></script>
<script src="./bootstrap/popper.min.js"></script>
<script src="./bootstrap/bootstrap.min.js"></script>

</head>
<body>

    <main>
        <div class="Container-sc-itwfbd-0 hfMLFx" style="border: 1px solid red;">
            <div class="styles__StyledCartPage-sc-1e4yxbp-0 ljbDGD">
                <div class="wrap-intended-cart">
                    <div class="cart">
                        <div class="cart-inner">
                            <div class="styles__StyledProductsV2-sc-rkft9e-0 dioUnE">
                                <h4 class="productsV2__title">Giỏ hàng</h4>
                                <div class="productsV2-heading">
                                    <div class="row">
                                        <div class="col-1-">
                                            <label class="styles__StyledCheckbox-sc-kvz5pc-0 hNjxWW selectAll">
                                                <input onclick="SelectedAllClick()" type="checkbox" id="btn" >
                                                <span class="checkbox-fake">  </span>
                                                <span class="label">Tất cả (2 sản phẩm)</span>
                                            </label>
                                        </div>
                                        <div class="col-2-">Đơn giá</div>
                                        <div class="col-3-">Số lượng</div>
                                        <div class="col-4-">Thành tiền</div>
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
																			    
// 																			    System.out.println("styles__StyledCheckbox-sc-kvz5pc-0 spCode : " + isSelected);
																			    
																			    %>
																			    
																				<input onclick="isSelectedAll()" type="checkbox" name="color"
																					   <%=selectedStatus.get(Integer.toString(gh.getSpCode())) ? "checked='checked'" : "" %>>
																				<span class="checkbox-fake"></span> 
																				<span><%=gh.getTenSP()%></span>
																			</label>
																		</div>
																	</div>
																</div>
																<div class="col-2-">
																	<span class="intended__real-prices"><%=gh.getGiaSP()%>đ</span>
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
																	<span class="intended__final-prices"><%=gh.getGiaSP()%>đ</span>
																	
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
                                    
                                    <%
                                    ModelKhachHang KH = (ModelKhachHang)request.getSession().getAttribute("currentUser");
                                    %>
                                    <p class="title"><b class="name"><%=KH.getHoTen() %></b><b class="phone"><%=KH.getPhone() %></b></p>
                                    <p class="address"><%=KH.getDiaChi() %></p>
                                </div>
                                
                                <div class="styles__StyledCartPrices-sc-1op1gws-0 cdzcxd">
                                    <div class="prices">
                                        <ul class="prices__items">
                                            <li class="prices__item">
                                                <span class="acture_prices__text">Tạm tính</span>
                                                <span class="acture_prices__value">0đ</span>
                                            </li>
                                            <li class="prices__item">
                                                <span class="fake_prices__text">Giảm giá</span>
                                                <span class="fake_prices__value">50.000đ</span>
                                            </li>
                                        </ul>
                                        <p class="prices__total">
                                            <span class="prices__text">Tổng cộng</span>
                                            <span class="prices__value prices__value--final">0đ
                                                <!--i>(Đã bao gồm VAT nếu có)</i-->
                                            </span></p>
                                    </div>
                                </div><button type="button" class="cart__submit">Mua Hàng</button>
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
	var xhr = new XMLHttpRequest();
	var spcode = tar.find(".maSanPham").val();
	 
    xhr.open('GET', './gioHangAction?Action=' + eventListen + "&SpCode=" + spcode, true);
    xhr.send();
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
	var xhr = new XMLHttpRequest();
    xhr.open('GET', './gioHangAction?Action=' + eventListen + "&SpCode=" + spcode + "&soLuong=" + soLuong, true);
    xhr.send();
});


$(".link").bind('click', function () {
	
	var eventListen = "editUserInfor";
	var parent   = $(this).closest(".juqUnC");
	var userName = parent.find(".name").text();
	var phoneNum = parent.find(".phone").text();
	var address  = parent.find(".address").text();
	
    $.ajax({
		
		url: "/Java20/gioHangAction",
		type: "get", //send it through get method
		data :{
			Action : eventListen ,
			UsrName : userName ,
			UsrPhone : phoneNum ,
			UsrAddress : address
		},
		success: function(data) {
		//Do Something

		},
		error: function(xhr) {
		//Do Something to handle error
		}
	});
});

</script>

<script src="js/checkoutImpl.js"></script>


</html>