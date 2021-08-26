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
<link rel="stylesheet" href="css/payment_style.css">


<link rel="stylesheet" href="./bootstrap/bootstrap.min.css">
<script src="./bootstrap/jquery.min.js"></script>
<script src="./bootstrap/popper.min.js"></script>
<script src="./bootstrap/bootstrap.min.js"></script>

</head>
<body>


<main style="background: rgb(255, 255, 255); margin-top: 50px;">
    <div class="Container-sc-itwfbd-0 hfMLFx" style="display: flex; width: 1200px; flex-wrap: wrap;">
        <div class="styles__Left-sc-18qxeou-1 hxalIh">
            <div class="styles__Section-sc-18qxeou-0 kxnMeC">
                <h3 class="title">1. Chọn hình thức giao hàng</h3>
                <div class="styles__StyledShippingMethods-sc-xd7513-0 fFVJQZ">
                    <div class="styles__StyledMethod-sc-xd7513-1 gePNNV">
                        <div class="sponsor-normal-order">
                            <ul class="styles__StyledIntended-sc-1dwh2vk-1 bQOXDC" name="bQOXDC">
                            
                                <li style="list-style: none;" class="glclPp">
                                    <div class="row__">
                                        <div class="stt">
                                            <span style="color: rgb(7, 7, 7) ; font-weight: bold;">Index</span>
                                        </div>

                                        <div class="col-1-">
                                            <span style="color: rgb(7, 7, 7) ; font-weight: bold;">Product Name</span>
                                        </div>
                                        <div class="col-2-">
                                            <span class="intended__real-prices" style="color: rgb(7, 7, 7) ; font-weight: bold;">Price</span>
                                        </div>
                                        <div class="col-3-">
                                            <span class="intended__real-prices" style="color: rgb(7, 7, 7) ; font-weight: bold;">Ship Type</span>
                                        </div>
                                        <div class="col-4-">
                                            <span class="intended__final-prices" style="color: rgb(7, 7, 7) ; font-weight: bold;">ShipFee</span>
                                        </div>
                                    </div>
                                </li>
                                
                            	<%
								DaoGioHang daoGH = new DaoGioHang();
								try {
									String userName = ((ModelKhachHang) request.getSession().getAttribute("currentUser")).getUserName();
									HashMap<String, Boolean> isSelectedItems = (HashMap<String, Boolean>) request.getSession().getAttribute("selectedItems");
									System.out.println("***************************: enter p a y m e n t    p a g e ");
									int idx = 0;
									for (ModelGioHang gh : daoGH.getAllSelectedProducts(userName,isSelectedItems)) {
										 
								%>
                            
                                <li style="list-style: none;" class="glclPp">
                                    <div class="row__">
                                    	<div class="stt">
                                            <span><%=++idx %></span>
                                        </div>
                                        <div class="col-1-">
                                            <span>"<%=gh.getTenSP()%>"</span>
                                            <span>SL: x"<%=gh.getSoLuong()%>"</span>
                                        </div>
                                        <div class="col-2-">
                                            <span class="intended__real-prices"><%=gh.getGiaSP()%>đ</span>
                                        </div>
                                        <div class="col-3-">
                                            <span class="intended__real-prices">Giao Sieu Toc 2H</span>
                                        </div>
                                        <div class="col-4-">
                                            <span class="intended__final-prices">29.000đ</span>
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
            <div class="styles__Section-sc-18qxeou-0 kxnMeC">
                <h3 class="title">2. Chọn hình thức thanh toán</h3>
                <div class="styles__StyledPaymentMethods-sc-1u5r3pb-0 ilOLpb">
                    <ul class="list">
                        <li class="styles__StyledMethod-sc-1u5r3pb-2 cHcpqx">
                            <input type="radio" name="payment-methods" style="margin-right: 10px;" value="cod" checked="">
                            <img class="method-icon"  width="32" src="https://frontend.tikicdn.com/_desktop-next/static/img/icons/checkout/icon-payment-method-cod.svg" >
                            <span>Thanh toán tiền mặt khi nhận hàng</span>
                        </li>
                        <li class="styles__StyledMethod-sc-1u5r3pb-2 cHcpqx">
                            <input type="radio" name="payment-methods" style="margin-right: 10px;" value="cod" checked="">
                            <img class="method-icon"  width="32" src="https://frontend.tikicdn.com/_desktop-next/static/img/icons/checkout/icon-payment-method-mo-mo.svg" >
                            <span>Thanh toán bằng ví MoMo</span>
                        </li>
                        <li class="styles__StyledMethod-sc-1u5r3pb-2 cHcpqx">
                            <input type="radio" name="payment-methods" style="margin-right: 10px;" value="cod" checked="">
                            <img class="method-icon"  width="32" src="https://frontend.tikicdn.com/_desktop-next/static/img/icons/checkout/icon-payment-method-zalo-pay.svg" >
                            <span>Thanh toán bằng ZaloPay</span>
                        </li>
                        <li class="styles__StyledMethod-sc-1u5r3pb-2 cHcpqx">
                            <input type="radio" name="payment-methods" style="margin-right: 10px;" value="cod" checked="">
                            <img class="method-icon"  width="32" src="https://frontend.tikicdn.com/_desktop-next/static/img/icons/checkout/icon-payment-method-atm.svg" >
                            <span>Thẻ ATM nội địa/Internet Banking (Miễn phí thanh toán)</span>
                        </li>
                    </ul>
                </div>
            </div>
            <div class="order-button">
            	<button data-view-id="checkout.confirmation_navigation_proceed" class="">ĐẶT MUA</button>
                <p>(Xin vui lòng kiểm tra lại đơn hàng trước khi Đặt Mua)</p>
            </div>
        </div>
        <div class="styles__Right-sc-18qxeou-2 jNysKx">
            <div class="styles__StyledShippingAddress-sc-1v9yiuw-0 huqEVv">
                <div class="address">
					<%
					ModelKhachHang Cus = (ModelKhachHang)request.getSession().getAttribute("currentUser");
					%>
                	<span class="name">"<%=Cus.getHoTen()%>"</span>
                	<span class="street">"<%=Cus.getDiaChi() %>"</span>
                	<span class="phone">Điện thoại: "<%=Cus.getDiaChi() %>"</span>
                </div>
            </div>

            <div class="styles__StyledOrderSummary-sc-b0nwek-0 hDDZPk">
                <div class="cart">
                    <div class="price-summary">
                        <div class="styles__StyledPriceInfo-sc-b0nwek-2 ddOYgv">
                            <div class="inner">
                                <div class="name ">Tạm tính</div>
                                <div class="value ">57.000đ</div>
                            </div>
                        </div>
                        <div class="styles__StyledPriceInfo-sc-b0nwek-2 ddOYgv">
                            <div class="inner">
                                <div class="name ">Phí vận chuyển</div>
                                <div class="value ">29.000đ</div>
                            </div>
                        </div>
                        <div class="divie"></div>
                        <div class="total">
                            <div class="name">Thành tiền:</div>
                            <div class="value">86.000 ₫</div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</main>

</body>

</html>