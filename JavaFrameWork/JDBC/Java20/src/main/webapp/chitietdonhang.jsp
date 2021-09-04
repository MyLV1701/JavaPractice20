<%@page import="model.ModelDonHang"%>
<%@page import="model.ModelGioHang"%>
<%@page import="model.ModelKhachHang"%>
<%@page import="java.util.List"%>
<%@page import="java.util.HashMap"%>
<%@ page import="dao.DaoKhachHang"%>
<%@ page import="dao.DaoGioHang"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.util.Date"%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>don hang</title>
    <link rel="stylesheet" href="./bootstrap/bootstrap.min.css">
    <script src="./bootstrap/jquery.min.js"></script>
    <script src="./bootstrap/popper.min.js"></script>
    <script src="./bootstrap/bootstrap.min.js"></script>
</head>

<style>

html  body{
    font-family: Roboto,Helvetica,Arial,sans-serif;
    font-size: 14px;
    background-color: rgb(244, 244, 244);
}

.ctdhContainer {
    width: 1270px;
    padding-left: 15px;
    padding-right: 15px;
    margin-right: auto;
    margin-left: auto;
    margin-top: 30px
}

.ctdhWrapper {
    display: flex;
    width: 100%;
    margin: 0px auto 20px;
    flex-wrap: wrap;
}
.ctdhHeader {
    flex-basis: 100%;
    padding: 0px 6px;
    margin: 0px 0px 10px;
    height: 41px;
    border: none;
    position: relative;
}

.ctdhHeader .background {
    background: rgb(241, 241, 241);
    position: absolute;
    width: 100vw;
    left: calc(-50vw + 50%);
    height: 41px;
}

.ctdhHeader .item {
    padding: 13px 0px;
    font-size: 13px;
    display: inline-block;
    position: relative;
}

.ctdhHeader .item a {
	color: #0062cc;
	font-size: 15px;
    font-weight: bold;
    background-color: transparent;
    text-decoration: none;
    outline: none;
    cursor: pointer;
}


.ctdhHeader .item.active {
	color: #0062cc;
    font-weight: bold;
    padding-left: 45px;
}

.ctdhHeader .item {
    padding: 13px 0px;
    font-size: 13px;
    display: inline-block;
    position: relative;
}

.ctdhHeader .item.active::before {
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

.ctdhContentWrapper {
    font-size: 13px;
    color: #212529;
    line-height: 1.5;
}

.ctdhContentWrapper .heading {
    font-size: 19px;
    font-weight: 300;
    margin: 20px 0px 20px;
    display: flex;
    -webkit-box-align: center;
    align-items: center;
}

.ctdhContentWrapper .heading .split {
    margin: 0px 5px;
}


.ctdhContentWrapper .heading .status {
    font-weight: bolder;
}


.ctdhContentWrapper .created-date {
    display: flex;
    align-items: flex-end;
    flex-direction: column;
}

.ctdhCusInfo {
    display: flex;
    margin: 20px 0px 60px;
}

.ctdhCusInfo > div:first-child {
    margin-left: 0px;
}
.ctdhCusInfo > div {
    width: 33.3333%;
    margin: 0px 5px;
}
.ctdhUsrInfo .title {
    font-size: 13px;
    text-transform: uppercase;
    margin: 0px 0px 15px;
    color: #212529;
}

.ctdhUsrInfo .content {
    display: flex;
    flex-direction: column;
    background-color: rgb(255, 255, 255);
    padding: 10px;
    border-radius: 4px;
    height: 100%;
}

.ctdhUsrInfo .name {
    text-transform: uppercase;
}
.ctdhCusInfo p {
    margin: 5px 0px 0px;
}

p {
    display: block;
    margin-block-start: 1em;
    margin-block-end: 1em;
    margin-inline-start: 0px;
    margin-inline-end: 0px;
}

.ctdhUsrInfo .address span, .ctdhUsrInfo .phone span {
    color: #212529;
    font-weight: 300;
}

.ctdhProductInfo {
    width: 100%;
    color: #212529;
    display: table;
    font-size: 13px;
    background: rgb(255, 255, 255);
    border-radius: 4px;
    border-collapse: collapse;
    border-spacing: 0px;
    line-height: 1.5;
    word-break: break-word;
    margin-bottom: 20px;
}

.ctdhProductInfo thead {
    display: table-header-group;
}

.ctdhProductInfo tr {
    display: table-row;
    padding: 10px;
}

.ctdhProductInfo thead tr th {
    display: table-cell;
    padding: 20px 15px;
    border-top: none;
    min-width: 100px;
    position: relative;
    background: 0px 0px;
    color: #212529;
    font-size: 15px;
    font-weight: 400;
    border-bottom: 1px solid rgb(244, 244, 244);
    text-align: left;
}

.ctdhProductInfo thead tr th:first-child {
    border-left: none;
}

.ctdhProductInfo tbody {
    display: table-row-group;
}

.ctdhProductInfo tbody tr {
    border-bottom: 1px solid rgb(244, 244, 244);
}

.ctdhProductInfo tr {
    display: table-row;
    padding: 10px;
}


tr {
    display: table-row;
    vertical-align: inherit;
    border-color: inherit;
}


.ctdhProductInfo tbody tr td {
    border: none;
    position: relative;
    display: table-cell;
    padding: 20px 15px;
    color: #212529;
    vertical-align: top;
    min-width: 180px;
}

.ctdhProductInfo tbody tr td:first-child {
    border-top: none;
    border-left: none;
}

.ctdhProductInfo tfoot {
    display: table-row-group;
}


.ctdhProductInfo tfoot tr {
    border-top: none;
}

.ctdhProductInfo tfoot tr td:first-child {
    border-top: none;
}

.ctdhProductInfo tfoot tr:first-child td {
    padding-top: 30px;
}

.ctdhProductInfo tfoot tr td {
    text-align: right;
    display: table-cell;
    padding: 5px 20px;
    max-width: 550px;
    min-width: 125px;
    color: #212529;
}


.ctdhProductInfo tfoot tr td span {
    color: #212529;
    font-size: 14px;
}



</style>


<body>

<main>
    <div class="ctdhContainer">
        <div class="ctdhWrapper">
            <div class="ctdhHeader" style=" font-weight: bold; ">
                <div class="background"></div>
                <div class="item" ><a href="./homePageAction">Trang chủ</a></div>
                <div class="item active">Chi Tiết Đơn hàng</div>
                <div style=" margin-right: 10px;float: right;position: relative;display: inline-block; padding: 13px 0px;">
			    	<a class="view-list-order" href="./donHangAction">  Quay lại Đơn Hàng </a>
			    </div>
			    
            </div>
            <div class="ctdhMainContent">
                <div class="ctdhContentWrapper">
                
                	<%
                	// get session user, donhang
                	
                	//ModelKhachHang KH = (ModelKhachHang)request.getSession().getAttribute("currentUser");
                	ModelDonHang   DH = (ModelDonHang)request.getSession().getAttribute("chiTietDonHang");
                	
                	// System.out.println("  get import date : " + DH.getNgayDatHang().toString());
                	
            		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
					String importDate = formatter.format(DH.getNgayDatHang()); 
					
					// System.out.println("  get import date : " + importDate);
					
                	%>
                
                    <div class="heading" style=" font-size: 20px; font-weight: lighter;">
                        <span>Chi tiết đơn hàng #<%=DH.getDonhangID() %></span>
                        <span class="split">-</span>
                        <span class="status"><%=DH.getTrangThai() %></span>
                    </div>
                    <div class="created-date">Ngày đặt hàng: <%=importDate %></div>
                    <div class="ctdhCusInfo">
                        <div class="ctdhUsrInfo">
                            <div class="title">Địa chỉ người nhận</div>
                            <div class="content">
                                <p class="name"><%=DH.getTenNguoiNhan() %></p>
                                <p class="address"><span>Địa chỉ: </span><%=DH.getDiaChiNhanHang() %></p>
                                <p class="phone"><span>Điện thoại: </span><%=DH.getPhoneNumb() %></p>
                            </div>
                        </div>
                        <div class="ctdhUsrInfo">
                            <div class="title">Hình thức giao hàng</div>
                            <div class="content">
                                <p><%=DH.getDonViGiaoHang() %></p>
                            </div>
                        </div>
                        <div class="ctdhUsrInfo">
                            <div class="title">Hình thức thanh toán</div>
                            <div class="content">
                                <p class=""><%=DH.getHinhThucThanhToan() %></p>
                            </div>
                        </div>
                    </div>
                    <table class="ctdhProductInfo">
                    	<% int tamtinh = 0 ;%>
                        <thead>
                            <tr>
                                <th>Sản phẩm</th>
                                <th>Giá</th>
                                <th>Số lượng</th>
                                <th>Giảm giá</th>
                                <th>Tạm tính</th>
                            </tr>
                        </thead>
                        <tbody>
                       		<%
							for(ModelDonHang.sanPhamDS e : DH.getDsSP()){
								tamtinh += e.getThanhTien() ;
                            %>
                            <tr>
                                <td class="product-item" style="min-width: 500px;" ><%=e.getTenSP() %> </td>
                                <td class="price"><%=e.getGiaSP() %></td>
                                <td class="quantity"><%=e.getSoLuong() %></td>
                                <td class="discount-amount"><%=e.getGiamGia() %></td>
                                <td class="raw-total" style="min-width: 200px;"><%=e.getThanhTien() %></td>
                            </tr>
                            
                            <%
                            }
                            %>
                        </tbody>
                        
                        <tfoot>
                            <tr>
                                <td colspan="4"><span>Tạm tính</span></td>
                                <td><span class="footRawTotal"><%=tamtinh %></span> </td>
                            </tr>
                            <tr>
                                <td colspan="4"><span>Phí vận chuyển</span></td>
                                <td><span class="footShipFeeTotal"><%=DH.getPhiVanChuyen() %></span> </td>
                            </tr>
                            <tr>
                                <td colspan="4"><span>Tổng cộng</span></td>
                                <td><span class="footsum"><%=DH.getTongTien() %></span></td>
                            </tr>
                        </tfoot>
                    </table>
                </div>
            </div>
        </div>
    </div>
</main>

</body>


<script>

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

$(document).ready(function(){
    // set price
    const cbPriceCol = document.querySelectorAll(".price");
    updateNumberPricesList(cbPriceCol);

    // set quality
    const cbDiscountCol = document.querySelectorAll(".discount-amount");
    updateNumberPricesList(cbDiscountCol);

    // set raw total
    const cbRawTotal = document.querySelectorAll(".raw-total");
    updateNumberPricesList(cbRawTotal);


// footsecsion hanling:
    let footRawTotal     = parseStringToInt(document.querySelector(".footRawTotal").innerText);
    document.querySelector(".footRawTotal").innerHTML = buildStringMoney(footRawTotal);

    let footShipFeeTotal = parseStringToInt(document.querySelector(".footShipFeeTotal").innerText);
    document.querySelector(".footShipFeeTotal").innerHTML = buildStringMoney(footShipFeeTotal);

    
    let footsum          = parseStringToInt(document.querySelector(".footsum").innerText);
    document.querySelector(".footsum").innerHTML = buildStringMoney(footsum);


});

</script>

</html>