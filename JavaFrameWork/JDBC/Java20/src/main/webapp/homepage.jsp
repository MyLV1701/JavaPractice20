<%@page import="model.ModelLoaiSanPham"%>
<%@ taglib uri="/WEB-INF/i18ntag.tld" prefix="i18n"%>
<%@page import="java.io.IOException"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="model.ModelChiTietSanPham"%>
<%@ page import="dao.DaoChiTietSanPham"%>
<%@ page import="dao.DaoKhachHang"%>
<%@ page import="model.ModelKhachHang"%>
<%@ page import="dao.DaoDanhMucSanPham"%>
<%@ page import="model.ModelDanhMucSanPham"%>


<%-- <jsp:useBean id="spList" class="java.util.ArrayList" scope="request" /> --%>
<jsp:useBean id="spListdm" class="java.util.ArrayList" scope="request" />
<!--jsp:useBean id="soLuong" class="java.lang.Object" scope="request" -->

<html>
<head>
<title>Bootstrap</title>
<link rel="stylesheet" href="./bootstrap/bootstrap.min.css">
<script src="./bootstrap/jquery.min.js" type="text/javascript"></script>
<script src="./bootstrap/popper.min.js" type="text/javascript"></script>
<script src="./bootstrap/bootstrap.min.js" type="text/javascript"></script>



<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<style type="text/css">

body {
	font-family: Arial, Helvetica, sans-serif;
}

.notification {
	background-color: auto;
	color: auto;
	text-decoration: none;
	padding: 10px 10px;
	position: relative;
	display: table;
	border-radius: 2px;
}

.notification:hover {
	background: red;
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

.notification2 {
	background-color: white;
	color: black;
	text-decoration: none;
	padding: 10px 10px;
	position: relative;
	display: inline;
	border-radius: 100px;
}

.notification2:hover {
	background: auto;
}

.notification2 .badge2 {
	position: absolute;
	top: -10px;
	right: 0px;
	padding: 1px 1px;
	border-radius: 100%;
	background-color: red;
	color: white;
}

.buttonnotification {
	position: absolute;
	top: 10px;
	right: 20px;
	padding: 2px 2px;
	border-radius: 50%;
	background-color: auto;
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

.Content {
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
	color: white;
	font-weight: bold;
}

.td {
	padding-left: 1px;
	padding-right: 1px;
	vertical-align: center;
}

.productCodeAction {
  display: flex;
  flex-direction: row;
  flex-wrap: wrap;
  justify-content: space-between;
  border-collapse: collapse;
}

.productCodeAction > button{
	padding: 1px;
	margin: 1px;
	border: none;
	background-color: seagreen;
}


select, input {
	margin: 2px 5px;
}

#proName {
	background-color: yellow;
}


</style>

<script type="text/javascript">

	function showProduct(productCodeView){
		
		console.log("=============== show product() func ================ ");
		var xmlhttp = new XMLHttpRequest();
		xmlhttp.open("GET", "./productViewController?productCode=" + productCodeView, true);
		xmlhttp.send();
		
		xmlhttp.onreadystatechange = function(){
			if((xmlhttp.readyState == 4) || (xmlhttp.status == 200)){
				var productView = xmlhttp.responseText;
				var tbodyView = document.getElementById("productViewBody");
				tbodyView.innerHTML = productView;
			}
		}
	}


	function getProductForm() {
		var xmlhttp = new XMLHttpRequest();
		xmlhttp.open("GET", "./modifyProductAction", true);
		xmlhttp.send();

		xmlhttp.onreadystatechange = function() {
			if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
				var productPage = xmlhttp.responseText;
				var formBody = document.getElementById("formBody");
				formBody.innerHTML = productPage;

			}
		}
	}
	
	
	function editProductForm(productID) {
	
		console.log(" ********************** get parameter value : " + productID);
		var xmlhttp = new XMLHttpRequest();
		xmlhttp.open("GET", "./modifyProductAction?productID=" + productID, true);  /* true meant enable async */		
		xmlhttp.send(productID);

		xmlhttp.onreadystatechange = function() {
			if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
				var productPage = xmlhttp.responseText;
				var formBody = document.getElementById("formBody");
				formBody.innerHTML = productPage;

			}
		}
	}
	
	
	var masID = "masLayer";
	$(document).ready(function() {
		
		showProduct("");
		
		$("#Cancel").click(function() {
			$("#productForm").fadeOut(200);
			var layer = document.getElementById(masID);
			document.body.removeChild(layer);
		});

		$(".addNew").click(function() {
			$("#productForm").animate({
				left : '750px',
				top : '200px'
			});
			$("#productForm").slideDown(150);
			$("#productForm").css("z-index", "1000");

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
			
			getProductForm();
		
		});
			
		$(".viewAct").click(function() {
			var productCodeVal = $(this).closest('td').prev().prev().text();
			
			console.log("============== viewAct ==============>> value :" + productCodeVal);
			
			showProduct(productCodeVal);
			$("#disableFilter").slideDown(1);
			
		});
		
		$("#disableFilter").click(function(){
			
			console.log("++++++++++++++++++++++++ disable filter ++++++++++++++++++++++++");
			showProduct("");
			$("#disableFilter").css("display", "none");
		});
			

	
		$(document).on("click", '.editItem', function(event) { 
			var productID = $(this).prev().val();
			console.log(" ********************** click button edit items ********************** " + productID);
			
			$("#productForm").animate({
				left : '750px',
				top : '200px'
			});
			$("#productForm").slideDown(150);
			$("#productForm").css("z-index", "1000");		
	
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
			
			editProductForm(productID);
			
		});

// 		$(document).on("mouseenter", "tr", function() {
// 			$(this).css("background-color", "gray");
// 			$(this).addClass("selectedRow");
// 		});

// 		$(document).on("mouseleave", "tr", function() {
// 			$(this).css("background-color", "white");
// 			$(this).removeClass("selectedRow");
// 		});

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
						<a href="./daoDanhMucAction?DanhMucSP=dm" class="dropdown-item">Danh
							muc SP</a>
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

			<div class="form-inline my-2 my-lg-0" style="margin-right: 60px;">

				<ul class="navbar-nav mr-auto">
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle " id="" data-toggle="dropdown">Languages</a>
						<div class="dropdown-menu">
							<a href="./changeLanguage?Language=vi" class="dropdown-item">Vietnamese</a>
							<a href="./changeLanguage?Language=en" class="dropdown-item">English</a>
						</div></li>
				</ul>

				<div class="form-inline my-2 my-lg-0" style="margin-right: 80px;">




					<ul class="navbar-nav mr-auto">
						<li class="nav-item dropdown" id="" data-toggle="dropdown"><a
							class="notification"> <span> gio hang </span> <span
								class="badge" color="red">5</span>
						</a>
							<div class="dropdown-menu">
								<a href="./alarm?Alarm=abc" class="notification2">Gio hang</a>
							</div></li>
					</ul>
					<span class="badge2">5</span>
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
							<th>#
								<span id = "disableFilter" style="float: right; color: red; cursor: pointer; display: none"> X</span>
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
							<td class = "productCodeAction">
		    					<button style="width: 50px; height: auto;" type="submit"  class="viewAct btn btn-success btn-sm">View</button>
								<button style="width: 50px; height: auto;" type="button"  class="btn btn-success btn-sm">Edit</button>
								<button style="width: 50px; height: auto;" type="button"  class="btn btn-success btn-sm">Delete</button>
							</td>

						</tr>
						<%
						}
						%>

					</tbody>

				</table>

			</div>
		</div>
		<div class="Content">
			<table
				class="table table-striped table-bordered table-hover table-sm"
				style="margin-top: 30px;">
				<caption class="text-uppercase">
					<i18n:i18ntag>index.proTable.caption</i18n:i18ntag>
					<button type="button" class="addNew btn btn-success btn-sm">
						<i18n:i18ntag>form.action.add</i18n:i18ntag>
					</button>					
				</caption>
				<thead>
					<tr>
						<th>No</th>
						<th><i18n:i18ntag>index.proTable.name</i18n:i18ntag></th>
						<th><i18n:i18ntag>index.proTable.type</i18n:i18ntag></th>
						<th><i18n:i18ntag>index.proTable.provider</i18n:i18ntag></th>
						<th style="width: 70px;">#</th>
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


	<script type="text/javascript">
		var inputTexts = document.getElementsByTagName("input");
		for (i = 0; i < inputTexts.length; i++) {
			if (inputTexts[i].getAttribute("type") == "text"
					|| inputTexts[i].getAttribute("type") == "password") {
				inputTexts[i].setAttribute("onfocus",
						"changeBackgroudYellow(this)");
				inputTexts[i].setAttribute("onblur",
						"changeBackgroudWhite(this)");
			}
		}

		function validateData() {
			// xac nhan cac truong not-null
			code = document.getElementById("proCode").value;
			name = document.getElementById("proName").value;
			if (code == null || code == "") {
				alert("Mã sản phẩm không được bỏ trống");
				return false;
			}

			if (name == null || name == "") {
				alert("Tên sản phẩm không được bỏ trống");
				return false;
			}

			// phai la kieu so
			try {
				cost = parseInt(document.getElementById("proCost").value);
				price = parseInt(document.getElementById("proPri").value);
				if (isNaN(cost) || isNaN(price)) {
					alert("Giá trị nhập vào cho 'Giá nhập về' hoặc 'Giá bán ra' không hợp lệ");
					return false;
				}
			} catch (err) {
				alert(err
						+ "\t-> Giá trị nhập vào cho 'Giá nhập về' hoặc 'Giá bán ra' không hợp lệ");
				return false;
			}

			// rang buoc du lieu: GiaBanRa > GiaNhapVe
			if (cost > price) {
				alert("Giá bán ra phải lớn hơn giá nhập về");
				return false;
			}
			return true;
		}

		function changeProCode(element) {
			element.value = element.value.toUpperCase();
		}

		function changeBackgroudYellow(element) {
			element.style.background = "yellow";
		}

		function changeBackgroudWhite(element) {
			element.style.background = "white";
		}

// 		var proTypes = [ "Smart Phone", "Tablet", "Laptop", "Máy bàn",
// 				"Máy in", "Test" ];
// 		proTypes.sort();

// 		var proTypElement = document.getElementById("proType");

// 		for (i = 0; i < proTypes.length; i++) {
// 			optElement = document.createElement("option");
// 			textElement = document.createTextNode(proTypes[i]);

// 			optElement.setAttribute("value", (i + 1));
// 			optElement.appendChild(textElement);

// 			proTypElement.appendChild(optElement);
// 		}

		function deleteRow(rowId) {
			var proTable = document.getElementById("proList");
			var trEle = document.getElementById(rowId);
			proTable.removeChild(trEle);
		}

		function saveProduct() {
			if (validateData()) {
				var proTable = document.getElementById("proList");
				var trEle = document.createElement("tr");
				var trId = "tr_" + document.getElementById("proCode").value;
				trEle.setAttribute("id", trId);

				var tdProCode = document.createElement("td");
				var tdProName = document.createElement("td");
				var tdProCost = document.createElement("td");
				var tdProPri = document.createElement("td");
				var tdAction = document.createElement("td");

				var btEle = document.createElement("BUTTON");
				btEle.appendChild(document.createTextNode("Delete"));
				btEle.setAttribute("onclick", "deleteRow('" + trId + "')");

				tdProCode.appendChild(document.createTextNode(document
						.getElementById("proCode").value));
				tdProName.appendChild(document.createTextNode(document
						.getElementById("proName").value));
				tdProCost.appendChild(document.createTextNode(document
						.getElementById("proCost").value));
				tdProPri.appendChild(document.createTextNode(document
						.getElementById("proPri").value));
				tdAction.appendChild(btEle);

				trEle.appendChild(tdProCode);
				trEle.appendChild(tdProName);
				trEle.appendChild(tdProCost);
				trEle.appendChild(tdProPri);
				trEle.appendChild(tdAction);

				proTable.appendChild(trEle);

				var layer = document.getElementById(masID);
				document.body.removeChild(layer);
				var productForm = document.getElementById("productForm");
				productForm.style.display = "none";
			}
		}
	</script>
</body>

</html>