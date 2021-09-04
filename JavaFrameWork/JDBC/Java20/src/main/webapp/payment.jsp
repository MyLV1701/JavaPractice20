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

<style>

.__header_ {
    flex-basis: 100%;
    padding: 0px 6px;
    margin: 0px 0px 10px;
    /* height: 41px; */
    border: none;
    position: relative;
}

.__header_ .background {
    background: rgb(241, 241, 241);
    position: absolute;
    width: 100vw;
    left: calc(-50vw + 50%);
    /*  height: 41px; */
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

<main style="background: rgb(255, 255, 255); margin-top: 30px;">
	
	
	
    <div class="Container-sc-itwfbd-0 hfMLFx" >
    	<div class="__header_" style=" font-weight: bold; ">
		    <div class="background"></div>
		    <div class="item" ><a href="./homePageAction">Trang chủ</a></div>
		    <div class="item active">Shopping Card</div>
		    <div style=" margin-right: 20px;float: right;position: relative;display: inline-block; padding: 13px 0px;">
		    	<a class="view-list-order" href="./gioHangAction">  Quay lại Giỏ Hàng </a>
		    </div>
		</div>
    
    	<div style="display: flex; width: 1200px; flex-wrap: wrap;">
			<% 
				double tamtinh = 0;
			%>
    	
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
	                                            <span class="PriceColumnHeader" style="color: rgb(7, 7, 7) ; font-weight: bold;">Price</span>
	                                        </div>
	                                        <div class="col-3-">
	                                            <span class="shipType" style="color: rgb(7, 7, 7) ; font-weight: bold;">Ship Type</span>
	                                        </div>
	                                        <div class="col-4-">
	                                            <span class="shipFee" style="color: rgb(7, 7, 7) ; font-weight: bold;">ShipFee</span>
	                                        </div>
	                                    </div>
	                                </li>
	                                
	                            	<%
									DaoGioHang daoGH = new DaoGioHang();
									try {
										String userName = ((ModelKhachHang) request.getSession().getAttribute("currentUser")).getUserName();
										HashMap<String, Boolean> isSelectedItems = (HashMap<String, Boolean>) request.getSession().getAttribute("selectedItems");
										// System.out.println("***************************: enter p a y m e n t    p a g e ");
										// System.out.println(isSelectedItems);
										int idx = 0;
										for (ModelGioHang gh : daoGH.getAllSelectedProducts(userName,isSelectedItems)) {
											tamtinh += gh.getThanhTien();
									%>
	                            
	                                <li style="list-style: none;" class="glclPp">
	                                    <div class="row__">
	                                    	<div class="stt">
	                                            <span><%=++idx %></span>
	                                        </div>
	                                        <div class="col-1-">
	                                            <span><%=gh.getTenSP()%></span>
	                                            <span class="intended__amount" >SL: x<%=gh.getSoLuong()%></span>
	                                        </div>
	                                        <div class="col-2-">
	                                            <span class="intended__real-prices" style=" font-size: 15px;"><%=gh.getGiaSP() %>đ</span>
												<del class="intended__discount-prices" style=" font-size: 11px;"><%=gh.getGiamGia() %>đ</del>
	                                        </div>
	                                        <div class="col-3-">
	                                            <span class="DonViGiaohang">Giao Sieu Toc 2H</span>
	                                        </div>
	                                        <div class="col-4-">
	                                            <span class="intended_ShipFee">29.000đ</span>
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
	        <div class="jNysKx">
	            <div class="huqEVv">
	                <div class="address">
						<%
						ModelKhachHang Cus = (ModelKhachHang)request.getSession().getAttribute("currentUser");
						%>
	                	<span class="name"><%=Cus.getHoTen()%></span>
	                	<span class="street"><%=Cus.getDiaChi() %></span>
	                	<span class="phone">Điện thoại: <%=Cus.getDiaChi() %></span>
	                </div>
	            </div>
	
	            <div class="hDDZPk">
	                <div class="cart">
	                    <div class="price-summary">
	                        <div class="ddOYgv">
	                            <div class="inner">
	                                <div class="name ">Tạm tính</div>
	                                <div class="tamTinhVal "><%=String.format("%.0f",tamtinh) %>đ</div>
	                            </div>
	                        </div>
	                        <div class="ddOYgv">
	                            <div class="inner">
	                                <div class="name ">Phí vận chuyển</div>
	                                <div class="shipFeeVal ">29.000đ</div>
	                            </div>
	                        </div>
	                        <div class="divie"></div>
	                        <div class="total">
	                            <div class="name">Thành tiền:</div>
	                            <div class="totalValue">86.000 ₫</div>
	                        </div>
	                    </div>
	                </div>
	            </div>
	        </div>
	    </div>
	    
	    
    </div>
</main>

</body>


<script>


function updateNumberPricesList(cbs){
    cbs.forEach((cb)=>{
        let val = cb.innerText;
        let intValue = parseStringToInt(val);
        cb.innerHTML = buildStringMoney(intValue);
    });
}

function buildStringMoney( moneyValue ){
    if(moneyValue <= 0)
    {
        return "0đ";
    }

    let stringMoney = moneyValue.toString();
    let strReturn = "đ";
    for(let i = stringMoney.length; i > 0; i-=3 )
    {   if(i - 3 > 0)
        {
            strReturn = stringMoney.slice(i - 3,i) + "." + strReturn;
        }
        else
        {
            strReturn = stringMoney.slice(0,i) + "." + strReturn;
        }

    } 
    strReturn = strReturn.replace(".đ","đ");
    return strReturn;
}


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


$(document).ready(function() {

	// convert update string discount 
	const cbdiscount = document.querySelectorAll('.intended__discount-prices');
    updateNumberPricesList(cbdiscount);

	// convert update string gia san pham 
	const cbrealPrices = document.querySelectorAll('.intended__real-prices');
    updateNumberPricesList(cbrealPrices);

	// set value phi van chuyen
	const cbShipFee = document.querySelectorAll('.intended_ShipFee');
	let shipFeeTotal = 0;
	cbShipFee.forEach((cb)=>{
		shipFeeTotal += parseStringToInt(cb.innerText);
	});
	
	document.querySelector(".shipFeeVal").innerHTML = buildStringMoney(shipFeeTotal);


	// set value tong chi phi
	let tamTinhVal = document.querySelector(".tamTinhVal").innerText;
	let tongChiPhiVal = shipFeeTotal + parseStringToInt(tamTinhVal);
	document.querySelector(".totalValue").innerHTML =  buildStringMoney(tongChiPhiVal);
	
	
	// set lai gia tri cho giam gia, gia ban ra
	let idx = 0;
	let tempDiscount = 0;
	let tempRealPrice = 0;
	const cbRealPrices = document.querySelectorAll('.intended__real-prices');
	cbdiscount.forEach(cb=> {
		tempDiscount = parseStringToInt(cb.innerText);
		tempRealPrice = parseStringToInt(cbRealPrices[idx].innerText);
		cb.innerText               = cbRealPrices[idx].innerText;
		cbRealPrices[idx].innerText = buildStringMoney((tempRealPrice - tempDiscount));
		idx++;
	});
	

});

    
$(".HoanThanhDatMua").bind("click", function(){

    // phi ship
    var phiship = document.querySelector(".shipFeeVal").innerText;
    var shipfee = parseStringToInt(phiship);
    //console.log("phi ship : " + parseStringToInt(phiship));

    // tong tien
    var tongtien  = document.querySelector(".totalValue").innerText;
    var total     = parseStringToInt(tongtien);
    //console.log("tong chi phi tra : " + total);

    // get hinh thuc thanh toan
    const listThanhToan = document.querySelectorAll('input[type="radio"]');
    var loaithanhtaon = "";
    listThanhToan.forEach((cb)=>{
        if(cb.checked === true){
            loaithanhtaon = cb.nextElementSibling.nextElementSibling.innerText;
            return;
        }
    });

    //console.log("loai thanh toan : " + loaithanhtaon);


    // loai van chuyen
    var loaivanchuyen = document.querySelector(".DonViGiaohang").innerText;
    //console.log("don vi giao hang : " + loaivanchuyen);

    

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