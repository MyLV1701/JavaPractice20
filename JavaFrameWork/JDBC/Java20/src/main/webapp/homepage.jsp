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

	<nav class="navbar navbar-expand-lg bg-dark navbar-dark fixed-top">
		<a class="navbar-brand" href="#">Logo</a>
		<button class="navbar-toggler navbar-toggler-right" type="button"
			data-toggle="collapse" data-target="#navbMenu" aria-expanded="true">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbMenu">
			<ul class="navbar-nav mr-auto">
				<li class="nav-item"><a href="#" class="nav-link"><i18n:i18ntag>index.menu.homepage</i18n:i18ntag></a></li>

				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle " id="" data-toggle="dropdown"><i18n:i18ntag>index.menu.products</i18n:i18ntag></a>
					<div class="dropdown-menu">
						<a href="./daoDanhMucAction?DanhMucSP=dm" class="dropdown-item">Danhmuc SP</a>
					</div></li>

				<li class="nav-item"><a href="#" class="nav-link"><i18n:i18ntag>index.menu.order</i18n:i18ntag></a></li>
				<li class="nav-item dropdown"><a href="#"
					class="nav-link dropdown-toggle" id="" data-toggle="dropdown"><i18n:i18ntag>index.menu.admin.admin</i18n:i18ntag></a>
					<div class="dropdown-menu">
						<a href="#" class="dropdown-item"><i18n:i18ntag>index.menu.admin.user</i18n:i18ntag></a>
						<a href="#" class="dropdown-item"><i18n:i18ntag>index.menu.admin.category</i18n:i18ntag></a>
						<a href="#" class="dropdown-item"><i18n:i18ntag>index.proTable.provider</i18n:i18ntag></a>
					</div></li>
			</ul>

			<form class="form-inline my-2 my-lg-0" action="#"
				style="margin-right: 15px;">
				<input class="form-control mr-sm-2" type="text" placeholder="Search">
				<button class="btn btn-success my-2 my-sm-0" type="submit">Search</button>
			</form>

			<div class="form-inline my-2 my-lg-0" style="margin-right: 40px;">

				<ul class="navbar-nav mr-auto">
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle " id="" data-toggle="dropdown"
						style="cursor: pointer">Languages</a>
						<div class="dropdown-menu">
							<a href="./changeLanguage?Language=vi" class="dropdown-item">Vietnamese</a>
							<a href="./changeLanguage?Language=en" class="dropdown-item">English</a>
						</div></li>
				</ul>

				<div class="form-inline my-2 my-lg-0" style="margin-right: 20px;">
					<ul class="navbar-nav mr-auto">
						<li class=" nav-item dropdown" id="">
							<div style="cursor: pointer" class=" gioHangclick notification">

								<a href="./gioHangAction">
									<% 
									HashMap<String, Boolean> amount = (HashMap<String, Boolean>) request.getSession().getAttribute("selectedItems");
									int selectedItems = (amount != null)? amount.size() : 0 ;
									
									System.out.println("So Luong san pham duoc lua chon : " + selectedItems);
							        %> 
									<span> Cart </span> <span class="badge" color= red ><%=selectedItems%></span>
								</a>
							</div>
						</li>
					</ul>

				</div>

			</div>
		</div>
	</nav>

	<div class="grid-container"
		style="border: 1px solid red; margin-top: 60px;">
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