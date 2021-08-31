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
                            
                                <li style="list-style: none;" class="header_selected_Items">
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
									System.out.println(isSelectedItems);
									int idx = 0;
									for (ModelGioHang gh : daoGH.getAllSelectedProducts(userName,isSelectedItems)) {
										 
								%>
                            
                                <li style="list-style: none;" class="glclPp">
                                    <div class="row__">
                                    	<div class="stt">
                                            <span><%=++idx %></span>
                                        </div>
                                        <div class="col-1-">
                                            <span><%=gh.getTenSP()%></span>
                                            <span>SL: x<%=gh.getSoLuong()%></span>
                                        </div>
                                        <div class="col-2-">
                                            <span class="intended__real-prices"><%=gh.getGiaSP()%>đ</span>
                                        </div>
                                        <div class="col-3-">
                                            <span class="DonViGiaohang">Giao Sieu Toc 2H</span>
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
            	<button data-view-id="checkout.confirmation_navigation_proceed" class="HoanThanhDatMua">ĐẶT MUA</button>
                <p>(Xin vui lòng kiểm tra lại đơn hàng trước khi Đặt Mua)</p>
            </div>
        </div>
        <div class="styles__Right-sc-18qxeou-2 jNysKx">
            <div class="styles__StyledShippingAddress-sc-1v9yiuw-0 huqEVv">
                <div class="address">
					<%
					ModelKhachHang Cus = (ModelKhachHang)request.getSession().getAttribute("currentUser");
					%>
                	<span class="name"><%=Cus.getHoTen()%></span>
                	<span class="street"><%=Cus.getDiaChi() %></span>
                	<span class="phone">Điện thoại: <%=Cus.getDiaChi() %></span>
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


<script>
    function parseStringToInt(strinValue)
    {
        const strSplits = strinValue.split(".");
        let money = 0;
        strSplits.forEach( strSplit=> {
            if(money === 0)
            {
                money = parseInt(strSplit);
            }
            else
            {
                money = money*1000 +  parseInt(strSplit);
            }
        });

        return money;
    }

    
$(".HoanThanhDatMua").bind("click", function(){

    // phi ship
    var phiship = document.querySelectorAll(".inner")[1].firstElementChild.nextElementSibling.innerText;
    var shipfee = parseStringToInt(phiship);
    console.log("phi tien da xu ly : " + parseStringToInt(phiship));

    // tong tien
    var tongtien  = document.querySelector(".total").firstElementChild.nextElementSibling.innerText;
    var total     = parseStringToInt(tongtien);
    console.log("tong chi phi tra : " + total);

    // get hinh thuc thanh toan
    const listThanhToan = document.querySelectorAll('input[type="radio"]');
    var loaithanhtaon = "";
    listThanhToan.forEach((cb)=>{
        if(cb.checked === true){
            loaithanhtaon = cb.nextElementSibling.nextElementSibling.innerText;
            return;
        }
    });

    console.log("loai thanh toan : " + loaithanhtaon);


    // loai van chuyen
    var loaivanchuyen = document.querySelector(".DonViGiaohang").innerText;
    console.log("don vi giao hang : " + loaivanchuyen);

    

    // pass to servlet
    
//     var jsonObj  =[
//         {"Effect":"Deny","RuleID":"Rule1"},
//         {"Effect":"Deny","RuleID":"Rule2"},
//         {"Effect":"Deny","RuleID":"Rule3"}
//        ];

//     $.ajax({
//     	url: "/Java20/donHangAction",
//     	target: "post",
//     	dataType: "json",
//     	data : JSON.stringify(jsonObj),
//     	contentType : 'application/json',
//     	success : function(){
//     		// do nothing
//     	},
//     	error: function(err){
//     		// do nothing
//     	}
    	
//     });

// $(".HoanThanhDatMua").bind("click", function(){

		var action = "thanhToan";
		
		
		/* luu y: key cua object JSON phai khop voi inner class */
		var data = 	{
						"phiShip" : shipfee,
			            "tongChiPhi" : total,
			            "loaiThanhToan": loaithanhtaon,
			            "dviGiaoHang" : loaivanchuyen
		          	};
		
	    var myData = {"action" : action,
	    			  "data"   : data
	    			 };
    
	    $.ajax({
            url: "/Java20/donHangAction",
            data: JSON.stringify(myData),
            contentType : 'application/json',
            type : 'POST',
            dataType: "json",
//             success: function(response) {
//             	alert(response.status);
//             }
	    
		    success: function(responseData) {
				
				alert("hi guys!");
			},
			
			error: function(xhr) {
				//Do Something to handle error
				
				//alert("hi guys!");
				
				//window.location.href = xhr.redirect;
				
				window.location.href = "/Java20/homepage.jsp";
			}

        });

});

jQuery( document ).ajaxSuccess(function( event, xhr, settings ) {
	  window.location.href = 'http://google.com';
});


// // thử choi theo kiểu list json object
 
// $(".HoanThanhDatMua").bind("click", function(){

// 	    var myData = [{"gameID": 30,
// 			            "nrOfPlayers": 2,
// 			            "playerUIDs": [123, 124]
// 			        }, 
// 			        {"gameID": 100,
// 			            "nrOfPlayers": 2,
// 			            "playerUIDs": [400, 1000]
// 			        }];     
    
//         jQuery.ajax({
//             url: "/Java20/donHangAction",
//             data: JSON.stringify(myData),
//             contentType : 'application/json',
//             type : 'POST',
//             dataType: "json",
//             success: function(){
//                 //console.log(JSON.stringify(myData));
//             },
//             error: function(data) {
//                 console.log("Error: ", data);
//             }
//             //timeout: 30000
//         });

// });

</script>




</html>