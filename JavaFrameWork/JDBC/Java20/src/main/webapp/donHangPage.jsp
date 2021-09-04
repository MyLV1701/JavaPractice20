<%@page import="model.ModelDonHang"%>
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
    <title>myOrderPage</title>
    <link rel="stylesheet" href="./bootstrap/bootstrap.min.css">
    <script src="./bootstrap/jquery.min.js"></script>
    <script src="./bootstrap/popper.min.js"></script>
    <script src="./bootstrap/bootstrap.min.js"></script>


<style>

body {
    font-family: Roboto,Helvetica,Arial,sans-serif;
    font-size: 14px;
    background-color: #efefef;
}

.donHangMain {
    width: 1270px;
    padding-left: 15px;
    padding-right: 15px;
    margin-right: auto;
    margin-left: auto;
    margin-top: 30px;
}

.donHangWrapper {
    display: flex;
    width: 100%;
    margin: 0px auto 20px;
    flex-wrap: wrap;
}

.donHangHeader {
    flex-basis: 100%;
    padding: 0px 6px;
    margin: 0px 0px 10px;
    height: 41px;
    border: none;
    position: relative;
}

.donHangHeader .background {
    background: rgb(241, 241, 241);
    position: absolute;
    width: 100vw;
    left: calc(-50vw + 50%);
    height: 41px;
}


.donHangHeader .item {
    padding: 13px 0px;
    font-size: 13px;
    display: inline-block;
    position: relative;
}


.donHangHeader .item a {
    color: #0062cc;
    background-color: transparent;
    text-decoration: none;
    font-weight: bold;
    font-size: 15px;
    outline: none;
    cursor: pointer;
}


.donHangHeader .item.active {
    color: #0062cc;
    font-weight: bold;
    padding-left: 45px;
}

.donHangHeader .item.active::before {
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

.donHangContent {
    flex: 1 1 0%;
}

.wrapper .heading {
    font-size: 19px;
    line-height: 21px;
    font-weight: bold;
    margin: 20px 0px 15px;
}

.wrapper .donhangList {
    background-color: rgb(255, 255, 255);
    border-radius: 4px;
    padding: 1px;
    min-height: 400px;
}

.wrapper table {
    border-collapse: collapse;
    width: 100%;
    word-break: break-word;
}

table {
    display: table;
    border-collapse: separate;
    box-sizing: border-box;
    text-indent: initial;
    border-spacing: 2px;
    border-color: grey;
}

thead {
    display: table-header-group;
    vertical-align: middle;
    border-color: inherit;
}

.wrapper tr {
    border-bottom: 1px solid rgb(244, 244, 244);
}

tr {
    display: table-row;
    vertical-align: inherit;
    border-color: inherit;
}

.wrapper th, .wrapper td {
    min-width: 130px;
    padding: 20px 15px;
    color: #1d2124;
    font-size: 15px;
    font-weight: bold;
    text-align: left;
}
.wrapper th:last-child, .wrapper td:last-child {
    text-align: right;
}

.wrapper td {
    font-size: 13px;
    line-height: 20px;
    color: rgb(51, 51, 51);
}

</style>


</head>

<body>
    <main>
        <div class="donHangMain">
            <div class="donHangWrapper">
                <div class="donHangHeader">
                    <div class="background"></div>
                    <!-- <div class="item"><a href="/Java20/homepage.jsp">Trang chủ</a></div>
                         <!-- ↑ se khong load duoc cac du lieu  -->
                         
                    <div class="item"><a href="./homePageAction">Trang chủ</a></div>
                    <div class="item active">Đơn hàng của tôi</div>
                </div>
                <div class="donHangContent">
                    <div class="wrapper">
                        <div class="heading">Đơn hàng của tôi</div>
                        <div class="donhangList">
                            <table>
								<thead>
									<tr>
										<th style="text-align: center;">Mã đơn hàng</th>
										<th>Ngày mua</th>
										<th>Sản phẩm</th>
										<th>Tổng tiền</th>
										<th>Trạng thái đơn hàng</th>
									</tr>
								</thead>

								<tbody>
									<%
									if (request.getAttribute("donhangList") == null) {
									%>
									<tr>
									<td style = "color: red; font-weight: bold; font-size: 20px">Hiện Tại bạn chưa có đơn hàng nào</td>
									</tr>
									<%
									} else {

									List<ModelDonHang> ls = (List) request.getAttribute("donhangList");
									for (ModelDonHang e : ls) {
										StringBuilder ListTenSP = new StringBuilder();
										for (ModelDonHang.sanPhamDS subObj : e.getDsSP()) {
											ListTenSP.append(subObj.getTenSP());
											ListTenSP.append(", ");
										}
										// Removing 2 last characters ", "
										ListTenSP.setLength(ListTenSP.length() - 2);
									%>

									<tr>
										<td
											style="text-align: center; font-weight: 900; color: blue; cursor: pointer;"
											class="goAheadCTDH"><%=e.getDonhangID()%></td>
										<td><%=e.getNgayDatHang()%></td>
										<td><%=ListTenSP.toString()%></td>
										<td><span class="tBodyTongTien"><%=e.getTongTien()%></span>
										</td>
										<td><%=e.getTrangThai()%></td>
									</tr>

									<%
									}
									}
									%>
								</tbody>

							</table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </main>

</body>

<script type="text/javascript">

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

function updateNumberPricesList(cbs){
    cbs.forEach((cb)=>{
        let val = cb.innerText;
        let intValue = parseStringToInt(val);
        cb.innerHTML = buildStringMoney(intValue);
    });
}

$(document).ready(()=>{
	const cbTongTienCol = document.querySelectorAll(".tBodyTongTien");
	updateNumberPricesList(cbTongTienCol);
});

$(".goAheadCTDH").bind("click", function(){
	
	var eventListen = "goChiTietDoHang";
	var dhCode      = $(this).text();
	var mydata      = { "action" : eventListen, "donHangCode":  dhCode };
	
	console.log(" go ahead chi tiet don hang : " + mydata);
	
	$.ajax({
		
		url: "/Java20/donHangAction",
		data: JSON.stringify(mydata),
		contentType : "application/json",
		type: "POST",
		dataType : "json",
		success: function(){
			
		},
		error: function(){
			window.location.href = "/Java20/chitietdonhang.jsp";
		}
		
	});
	
});

</script>



</html>