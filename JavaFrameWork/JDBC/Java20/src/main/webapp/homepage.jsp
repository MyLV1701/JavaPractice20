<%@page import="model.ModelGioHang"%>
<%@page import="model.ModelLoaiSanPham"%>
<%@ taglib uri="/WEB-INF/i18ntag.tld" prefix="i18n"%>
<%@page import="java.io.IOException"%>
<%@page import="java.util.List"%>
<%@page import="java.util.HashMap"%>
<%@page import="com.google.gson.Gson"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="model.ModelChiTietSanPham"%>
<%@ page import="dao.DaoChiTietSanPham"%>
<%@ page import="dao.DaoKhachHang"%>
<%@ page import="model.ModelKhachHang"%>
<%@ page import="dao.DaoDanhMucSanPham"%>
<%@ page import="model.ModelDanhMucSanPham"%>

<jsp:useBean id="spList" class="java.util.ArrayList" scope="request" />
<jsp:useBean id="spListdm" class="java.util.ArrayList" scope="request" />

<html>
<head>
<title>Bootstrap</title>

<link rel="stylesheet" href="./bootstrap/bootstrap.min.css">
<script src="./bootstrap/jquery.min.js"></script>
<script src="./bootstrap/popper.min.js"></script>
<script src="./bootstrap/bootstrap.min.js"></script>



<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<style>

body {
       font-family: Arial, Helvetica, sans-serif;
   }
   
.notification {
    background-color: auto;
    color: white;
    text-decoration: none;
    padding: 10px 10px;
    position: relative;
    display: table;
    border-radius: 2px;
}

.notification:hover {
    background: auto;
}

.notification .badge {
    position: absolute;
    top: -10px;
    right: -10px;
    padding: 5px 10px;
    border-radius: 50%;
    background-color: red;
    color: white;
}

h1 {
    color: blue;
    text-shadow: 2px 2px 5px lightblue;
}

p {
    border: 1px solid black;
    border-radius: 5px;
    padding-left: 10px;
}

.p1 {
    color: DodgerBlue;
    border-left: 3px solid blue;
    padding-left: 10px;
}

.p2 {
    color: MediumSeaGreen;
}

.p3 {
    color: RGB(255, 255, 255);
    background-color: lightblue;
    padding: 5px;
}

.div01 {
    background-image: url("../imgs/ICanNotUnderstandForYou.jpg");
    background-repeat: no-repeat;
    color: white;
    width: 100%;
    height: 500px;
    border: 1px double red;
}

.grid-container {
    display: grid;
    grid-template-areas:
        'lMenu lMenu header header header header header header header header header header'
        'lMenu lMenu content content content content content content content rMenu rMenu rMenu'
        'footer footer footer footer footer footer footer footer footer rMenu rMenu rMenu'
        'author author author author author author author author author author author author';
    grid-gap: 5px;
    padding: 5px 10px 5px 5px;
    margin: 5px 10px;
}

.grid-container>div {
    border: 1px solid blue;
    padding: 5px;
}

.header {
    grid-area: header;
    min-height: 100px;
    line-height: 100px;
    font-size: 28px;
    text-align: center;
    font-weight: bolder;
    text-decoration: underline;
    text-transform: uppercase;
}

.leftMenu {
    grid-area: lMenu;
}

.content {
    grid-area: content;
}

.rightMenu {
    grid-area: rMenu;
}

.footer {
    grid-area: footer;
}

.author {
    grid-area: author;
}

.addNew {
    float: right;
    margin-right: 30px;
}

.selectedRow {
    color: auto;
    font-weight: bold;
}

td {
/* 	padding-top: 2px; */
/* 	padding-left: 5px; */
/* 	padding-right: 2px; */
    text-align: top;
}

.table td, .table th
{
    vertical-align: middle;
    text-align: left;     
}

select, input {
    margin: 2px 5px;
}

#proName {
    background-color: yellow;
}

.tdHead {
    color: blue;
    text-align: right;
    font-size: bold;
    padding-right: 10px;
}

a {
    text-decoration: none;	
}


.iuPmMC {
    cursor: pointer;
    margin: 0px 0px 0px 16px;
    -webkit-box-align: center;
    align-items: center;
    display: flex;
    color: rgb(255, 255, 255);
    font-size: 12px;
    position: relative;
    letter-spacing: 0.7px;
}

.profile-icon {
        width: 32px;
        height: 32px;
        margin-right: 8px;
        border-radius: 2px;
    }

.hWbsMd {
    color: rgb(255, 255, 255);
    font-weight: 400;
    white-space: nowrap;
    display: flex;
    flex-direction: column;
}
.jYzpxy {
    white-space: nowrap;
    text-overflow: ellipsis;
    display: inline-block;
    overflow: hidden;
    text-transform: capitalize;
    font-size: 12px;
    /* line-height: 16px; */
}
.iuPmMC .account-label {
    display: flex;
    -webkit-box-align: center;
    align-items: center;
    font-size: 13px;
    line-height: 20px;
    min-width: 100px;
}

.iuPmMC .account-label > span {
    max-width: 104px;
    white-space: nowrap;
    text-overflow: ellipsis;
    overflow: hidden;
}

.arrowIcon {
    width: 16px;
    height: 16px;
}

li {
    list-style-type: none;
}

.navbar-dark .navbar-nav .nav-link {
    color: rgba(255,255,255);
}

@media all and (min-width: 992px) {
    .navbar .nav-item .dropdown-menu{ display: none; }
    .navbar .nav-item:hover .dropdown-menu{ display: block; }
    .navbar .nav-item .dropdown-menu{ margin-top:0px; }
}

.fPLoMu {
    flex: 1 1 0%;
}

.dPyAZH {
    width: 100%;
    display: flex;
    position: relative;
    box-shadow: rgb(98 98 98 / 50%) 0px 1px 2px 0px;
}

.gBxvSE {
    border: 0px;
    padding: 0px 12px;
    font-size: 13px;
    border-radius: 2px 0px 0px 2px;
    flex: 1 1 0%;
    outline: none;
}

button, input, optgroup, select, textarea {
    font-family: inherit;
    font-size: 100%;
    line-height: 1.15;
    margin: 0px;
}

.bUpWwh {
    cursor: pointer;
    border: 0px;
    width: 120px;
    background: #28a745;
    height: 40px;
    border-radius: 0px 2px 2px 0px;
    color: white;
    font-size: 13px;
    font-weight: 500;
    outline: none;
    display: flex;
    -webkit-box-align: center;
    align-items: center;
    -webkit-box-pack: center;
    justify-content: center;
}

.bUpWwh .icon-search {
    width: 20px;
    height: 20px;
    margin: 0px 8px 0px 0px;
}

img {
    max-width: 100%;
}

img {
    border-style: none;
}



.shoppingCart {
    cursor: pointer;
    margin: 0px 16px 0px 0px;
    -webkit-box-align: center;
    display: flex;
    color: rgb(255, 255, 255);
    font-size: 12px;
    position: relative;
    letter-spacing: 0.7px;
    align-items: flex-end;
}

.cart-wrapper {
    position: relative;
    margin-right: 8px;
    display: flex;
}

.cart-wrapper .cart-icon {
    width: 32px;
    height: 32px;
}

.amountItems {
    color: rgb(36, 36, 36);
    background: rgb(253, 216, 53);
    height: 20px;
    left: 20px;
    top: -2px;
    border-radius: 40px;
    display: inline-block;
    text-align: center;
    line-height: 20px;
    font-size: 13px;
    font-weight: 500;
    position: absolute;
    padding: 0px 7px;
}

</style>

<script>

	function showProduct(productCodeView) {
		var xmlhttp = new XMLHttpRequest();
		xmlhttp.open("GET", "./productViewController?productCode=" + productCodeView, true);
		xmlhttp.send();

		xmlhttp.onreadystatechange = function() {
			if ((xmlhttp.readyState == 4) || (xmlhttp.status == 200)) {
				
				var ptList = JSON.parse(xmlhttp.responseText);
				var tbodyView = document.getElementById("productViewBody");
				tbodyView.innerHTML = "";
				
				
				for(var i = 0; i < ptList.length; i ++) {
					
					var genHTML = '<tr class="" style="height: 40px;">'
								+ '	<td>'+ i +'</td>'
								+ '	<td>'+ ptList[i].tenSP +'</td>'
								+ '	<td>'+ ptList[i].tenLoaiSP +'</td>'
								+ '	<td>'+ ptList[i].tenNhaCungCap +'</td>'
								+ '	<td>'
								+ '		<form action="./gioHangAction" method="post" style="width: 30px; float: left;">'
								+ '			<input type="hidden" name="productId" value="' + ptList[i].sanPhamCode +'">'
								+ '			<button type="submit" class="selectedItem btn btn-success btn-sm">+</button>'
								+ '		</form>'
								+ '		<form style="width: 30px; float: left; margin-left: 5px;">'
								+ '			<input type="hidden" name="productId" value="' + ptList[i].sanPhamCode +'">'
								+ '			<button type="button" class="editItem btn btn-success btn-sm" style="width: 100%;">/</button>'
								+ '		</form>'
								+ '	</td>'
								+ '</tr>'; 
						
					tbodyView.innerHTML += genHTML;
					
					
					/* 
					trDom = document.createElement("tr");
					trDom.style="height: 40px;"
					
						tdIDDom = document.createElement("td");
						IDDom = document.createTextNode(i);
						tdIDDom.appendChild(IDDom);
						
						tdProductNameDom = document.createElement("td");
						ProductNameDom = document.createTextNode(ptList[i].tenSP);
						tdProductNameDom.appendChild(ProductNameDom);
						
						tdCatalogNameDom = document.createElement("td");
						catalogNameDom = document.createTextNode(ptList[i].tenLoaiSP);
						tdCatalogNameDom.appendChild(catalogNameDom);
							
						tdSupplierNameDom = document.createElement("td");
						SupplierNameDom = document.createTextNode(ptList[i].tenNhaCungCap);
						tdSupplierNameDom.appendChild(SupplierNameDom);
							
							
						tdButtonsDom = document.createElement("td");
						
							formPlusDom = document.createElement("form");
							formPlusDom.style = "width: 30px; float: left;";
							formPlusDom.action = "./gioHangAction";
							formPlusDom.method = "post";
							
								inputPlusDom = document.createElement("input")
								inputPlusDom.type = "hidden";
								inputPlusDom.name = "productId";
								inputPlusDom.value = ptList[i].sanPhamCode;
								
								buttonPlusDom = document.createElement("button");
								buttonPlusDom.type = "submit";
								buttonPlusDom.setAttribute("class", "btn btn-success btn-sm");
								plusTextnode = document.createTextNode("+");
								buttonPlusDom.appendChild(plusTextnode);
							
							formPlusDom.appendChild(inputPlusDom);
							formPlusDom.appendChild(buttonPlusDom);
							
							
							formEditDom = document.createElement("form");
							formEditDom.style = "width: 30px; float: left; margin-left: 5px;";
							
								inputEditDom = document.createElement("input")
								inputEditDom.type = "hidden";
								inputEditDom.name = "productId";
								inputEditDom.value = ptList[i].sanPhamCode;
								
								buttonEditDom = document.createElement("button");
								buttonEditDom.type = "button";
								buttonEditDom.style = "width: 100%";
								buttonEditDom.setAttribute("class", "editItem btn btn-success btn-sm");
								editTextnode = document.createTextNode("/");
								buttonEditDom.appendChild(editTextnode);
							
							formEditDom.appendChild(inputEditDom);
							formEditDom.appendChild(buttonEditDom);
	
						tdButtonsDom.appendChild(formPlusDom);
						tdButtonsDom.appendChild(formEditDom);
					
					
					trDom.appendChild(tdIDDom);
					trDom.appendChild(tdProductNameDom);
					trDom.appendChild(tdCatalogNameDom);
					trDom.appendChild(tdSupplierNameDom);
					trDom.appendChild(tdButtonsDom);
					
					tbodyView.appendChild(trDom); 
					*/
				}
			}
		}

	}

	function getProductForm(productID) {
		
		var xmlhttp = new XMLHttpRequest();
		
		xmlhttp.open("GET", "./modifyProductAction?productID=" + productID, true);
		xmlhttp.send();

		xmlhttp.onreadystatechange = function() {
			if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
				var productPage = xmlhttp.responseText;
				var formBody = document.getElementById("formBody");
				formBody.innerHTML = productPage;

			}
		}

	}


	function popUpHandler() {
		$("#productForm").animate({
				left : '750px',
				top : '200px'
			});
			$("#productForm").slideDown(150);
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
	
	
	$(document).on("click", '.editItem', function(event) { 
		popUpHandler();
		var productID = $(this).prev().val();
		getProductForm(productID);		
	});
	
	var masID = "masLayer";
	$(document).ready(function() {

		showProduct("");
				
		$("#Cancel").click(function() {
			$("#productForm").fadeOut(150);
			var layer = document.getElementById(masID);
			document.body.removeChild(layer);
		});

		$(".addNew").click(function() {
			popUpHandler();
			getProductForm(0);
		});
		
		$(".viewAct").click(function() {
			var productCodeVal = $(this).closest('td').prev().prev().text();
			showProduct(productCodeVal);
			$("#disableFilter").slideDown(1);
			
		});
		
		$("#disableFilter").click(function(){
			showProduct("");
			$("#disableFilter").css("display", "none");
		});

	});
</script>
</head>

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

     <nav class="nav_edit  navbar navbar-expand-lg bg-dark navbar-dark fixed-top">
         
         <div class="logoImg" style=" flex-basis: 200px; flex-grow: 5; padding-left: 80px; ">
                 <a class="navbar-brand" href="#" style=" margin-right: 0; ">Logo</a>
         </div>

         <div class="nav_container" id="navbMenu" style=" display: flex; flex-grow: 90; ">
             <div class="part1" style="  display: flex; align-items: center; flex-grow: 1; ">
                 <ul class="navbar-nav mr-auto" style=" flex-grow: 0.1; ">
                     <li class="nav-item"><a href="#" class="nav-link">Trang chủ</a></li>
     
                     <li class="nav-item dropdown">
                     	<a style = "color: rgba(255,255,255);" class="nav-link dropdown-toggle " id="" data-toggle="dropdown">Sản phẩm</a>
                         <div class="dropdown-menu">
                             <a style = "color: rgba(255,255,255);" href="./daoDanhMucAction?DanhMucSP=dm" class="dropdown-item">Danhmuc SP</a>
                         </div></li>
     
                     <li class="nav-item"><a style = "color: rgba(255,255,255);" href="#" class="nav-link">Đơn hàng</a></li>
                     <li class="nav-item dropdown">
                     	<a style = "color: rgba(255,255,255);" href="#" class="nav-link dropdown-toggle" id="" data-toggle="dropdown" aria-expanded="false">Quản trị</a>
                         <div class="dropdown-menu">
                             <a href="#" class="dropdown-item">Người dùng</a>
                             <a href="#" class="dropdown-item">Loại sản phẩm</a>
                             <a href="#" class="dropdown-item">Nhà cung cấp</a>
                         </div></li>
                 </ul>

                 <div class=" fPLoMu">
                     <div class=" dPyAZH">
                             <input type="text" style="margin: 0px;" data-view-id="main_search_form_input" value="" placeholder="Tìm sản phẩm ..." class=" gBxvSE">
                             <button data-view-id="main_search_form_button" class=" bUpWwh">
                                 <img class="icon-search" src="https://salt.tikicdn.com/ts/upload/ed/5e/b8/8538366274240326978318348ea8af7c.png">
                                 Tìm Kiếm
                             </button>
                     </div>
                 </div>
             </div>

             <div class="part2" style=" flex-grow: 0.05; display: flex; ">
                     <!-- <div data-view-id="header_header_account_container" class=" iuPmMC"> -->
                     <div data-view-id="header_header_account_container" style="margin-left: 20px;">
                     <li class="nav-item dropdown">
                         <div class="iuPmMC" style="cursor: pointer">
                             <img class="profile-icon" src="https://salt.tikicdn.com/ts/upload/67/de/1e/90e54b0a7a59948dd910ba50954c702e.png">
                             <span class="Userstyle__ItemText-sc-6e6am-2 hWbsMd">
                                 <span class="Userstyle__NoWrap-sc-6e6am-11 jYzpxy">Tài Khoản</span>
                                 <span class="account-label">
                                     <span>Việt Nam</span>
                                     <img class="arrowIcon" src="https://salt.tikicdn.com/ts/upload/d7/d4/a8/34939af2da1ceeeae9f95b7485784233.png">
                                 </span>
                             </span>
                         </div>
                         <!-- <div class="dropdown-menu fQQQgg toggler"> -->
                         <div class="dropdown-menu ">
                             <a href="./donHangAction" class="dropdown-item">Đơn hàng của tôi </a>
                             <a href="#" class="dropdown-item">Tài khoản của tôi </a>
                             <a href="#" class="dropdown-item">Nhận xét sản phẩm đã mua </a>
                             <a href="#" class="dropdown-item">Thoát tài khoản </a>
                         </div>
                     </li>
                 </div>

     
                 <div class="form-inline my-2 my-lg-0" style="/* margin-right: 30px; *//* flex-grow: 1; */">
                 		
                 	    <div>
                 	    	<a style="text-decoration: none; color: #FFFFFF;" class="shoppingCart" href="./gioHangAction">
                 	    		<% 
								HashMap<String, Boolean> amount = (HashMap<String, Boolean>) request.getSession().getAttribute("selectedItems");
								int selectedItems = (amount != null)? amount.size() : 0 ;
								
                                  // System.out.println("So Luong san pham duoc lua chon : " + selectedItems);
						        %> 
								        
	                            <div class="cart-wrapper">
	                                <img class="cart-icon" src="https://salt.tikicdn.com/ts/upload/40/44/6c/b80ad73e5e84aeb71c08e5d8d438eaa1.png">
	                                <span class="amountItems"><%=selectedItems%></span>
	                            </div>
	                            <span class="cart-text">Giỏ Hàng</span>
                         	</a>
                        </div>
                       
     
                     <ul class="navbar-nav mr-auto">
                         <li class="nav-item dropdown">
                             <!-- <a class="nav-link dropdown-toggle " id="" data-toggle="dropdown" style="cursor: pointer">Languages</a> -->
                             <a class="nav-link dropdown-toggle " id="" style = "cursor: pointer; color: rgba(255,255,255);">Languages</a>
                             <div class="dropdown-menu">
                                 <a href="./changeLanguage?Language=vi" class="dropdown-item">Vietnamese</a>
                                 <a href="./changeLanguage?Language=en" class="dropdown-item">English</a>
                             </div>
                         </li>
                     </ul>
                 </div>
             </div>
         </div>
     </nav>

	<div class="grid-container"
		style="border: 1px solid red; margin-top: 70px;">
		<div class="header">
			<h1 class="text-uppercase">
				<i18n:i18ntag>index.menu.admin.admin</i18n:i18ntag>
				>>
				<i18n:i18ntag>index.menu.products</i18n:i18ntag>
			</h1>
		</div>
		<div class="leftMenu">
			<i18n:i18ntag>index.menu.admin.category</i18n:i18ntag>
			<div>
				<table border="1" style="border-collapse: collapse;">
					<thead>
						<tr>
							<th>Code</th>
							<th>Loai SP</th>
							<th># <span id="disableFilter"
								style="float: right; color: red; cursor: pointer; display: none">X</span>
							</th>
						</tr>
					</thead>
					<tbody>
						<%
						ModelLoaiSanPham dmsp;
						for (Object objdm : spListdm) {
							dmsp = (ModelLoaiSanPham) objdm;
						%>
						<tr>
							<td><%=dmsp.getLoaiSPCode()%></td>
							<td><%=dmsp.getTenLoaiSP()%></td>
							<td class="productCodeAction">
								<button style="width: 50px; height: auto; margin: 5px 0px;" type="submit"
									class="viewAct btn btn-success btn-sm">View</button>
								<button style="width: 50px; height: auto; margin: 5px 0px;" type="button"
									class="btn btn-success btn-sm">Edit</button>
								<button style="width: 50px; height: auto; margin: 5px 0px;" type="button"
									class="btn btn-success btn-sm">Delete</button>
							</td>

						</tr>
						<%
						}
						%>

					</tbody>

				</table>

			</div>
		</div>
		<div class="content">
			<table
				class="table table-striped table-bordered table-hover table-sm"
				style="margin-top: 30px; text-align: center;">
				<caption class="text-uppercase">
					<i18n:i18ntag>index.proTable.caption</i18n:i18ntag>
					<div style="float: right">
						<button type="button" class="addNew btn btn-success btn-sm">
							<i18n:i18ntag>form.action.add</i18n:i18ntag>
						</button>
					</div>
				</caption>
				<thead>
					<tr>
						<th style="width: 50px;">No</th>
						<th><i18n:i18ntag>index.proTable.name</i18n:i18ntag></th>
						<th><i18n:i18ntag>index.proTable.type</i18n:i18ntag></th>
						<th><i18n:i18ntag>index.proTable.provider</i18n:i18ntag></th>
						<th style="width: 100px;">#</th>
					</tr>
				</thead>
				<tbody id="productViewBody">

				</tbody>

			</table>
		</div>

		<div class="rightMenu">Right Menu</div>
		<div class="footer">Footer</div>
		<div class="author">Tac Gia</div>
	</div>

</body>

</html>