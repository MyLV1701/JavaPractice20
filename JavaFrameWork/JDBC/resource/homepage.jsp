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


<jsp:useBean id="spList" class="java.util.ArrayList" scope="request" />
<jsp:useBean id="spListdm" class="java.util.ArrayList" scope="request" />
<!--jsp:useBean id="soLuong" class="java.lang.Object" scope="request" -->

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

	h1{
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
	
	.p3{
		color: RGB(255,255,255);
		background-color: lightblue;
		padding: 5px;
	}
	
	.div01{
		background-image: url("../imgs/ICanNotUnderstandForYou.jpg");
		background-repeat: no-repeat;
		color: white;
		width: 100%;
		height: 500px;
		border: 1px double red;
	}
	
	.grid-container{
		display: grid;
		grid-template-areas: 
			'lMenu lMenu header header header header header header header header header header'
			'lMenu lMenu content content content content content content content rMenu rMenu rMenu'
			'footer footer footer footer footer footer footer footer footer rMenu rMenu rMenu'
			'author author author author author author author author author author author author'
		;
		grid-gap: 5px;
		padding: 5px 10px 5px 5px;
		margin: 5px 10px;
	}
	
	.grid-container > div {
		border: 1px solid blue;
		padding: 5px;
	}
	
	.header{
		grid-area: header;
		min-height: 100px;
		line-height: 100px;
		font-size: 28px;
		text-align: center;
		font-weight: bolder;
		text-decoration: underline;
		text-transform: uppercase;
	}
	.leftMenu{grid-area: lMenu;}
	.content{grid-area: content;}
	.rightMenu{grid-area: rMenu;}
	.footer{grid-area: footer;}
	.author{grid-area: author;}
	
	.addNew {
		float: right;
		margin-right: 30px;
	}
	.selectedRow{
		color: white;
		font-weight: bold;
	}
	td {
		padding-top: 2px;
		padding-left: 5px;
		padding-right: 2px;
		text-align: top;
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
</style>

<script >

	function loadPage(){
		//alert("Load site");
	}

	var masID = "masLayer";
	$(document).ready(function() {
		$("#Cancel").click(function() {
			//$("#productForm").hide(500);
			//$("#productForm").slideUp();
			$("#productForm").fadeOut(500);
			var layer = document.getElementById(masID);
			document.body.removeChild(layer);
		});
		
		$(".addNew").click(function() {
			//$("#productForm").show(600);
			//$("#productForm").toggle(600);
			//$("#productForm").slideToggle();
			$("#productForm").animate({left: '550px', top: '100px'});
			$("#productForm").slideDown(500);
			$("#productForm").css("z-index", "1000");
			//$("#productForm").fadeToggle(800);
			
			var layer = document.createElement("div");
			layer.setAttribute("id", masID);
			$(layer).css("position", "absolute");
			$(layer).animate({left: '0px', top: '0px'});
			$(layer).css("width", "100%");
			$(layer).css("height", "100%");
			$(layer).css("background-color", "gray");
			$(layer).css("z-index", "500");
			$(layer).css("opacity", "0.25");
			document.body.append(layer);
		});
		/*
		$("tr").mouseenter(function() {
			$(this).css("background-color", "gray");
		});
		
		$("tr").mouseleave(function() {
			$(this).css("background-color", "white");
		});
		*/
		
		$(document).on("mouseenter", "tr", function(){
			$(this).css("background-color", "gray");
			$(this).addClass("selectedRow");
		});
		
		$(document).on("mouseleave", "tr", function(){
			$(this).css("background-color", "white");
			$(this).removeClass("selectedRow");
		});
		
	});
</script>
</head>

<body>
	
	<div id="productForm" style="display: none; border: 1px solid blue; padding: 5px; width: 40%; min-width:640px;position: absolute; background-color: white;">
		<form action="#" method="post">
			<input type="hidden" name="productCode" value="0"/>
			<table border=1 style="border-collapse: collapse">
				<caption>Product Form</caption>
				<tr>
					<td class="tdHead">Loại sản Phẩm:</td>
					<td>
						<select name="proType" id="proType">
							<option value="0">-------------</option>
						</select>
					</td>
				</tr>
				<tr>
					<td class="tdHead">Mã sản phẩm:</td>
					<td>
						<input type="text" onchange="changeProCode(this)" name="productCode" id="proCode" size="30"> (*)
					</td>
				</tr>
				<tr>
					<td class="tdHead">Tên sản phẩm:</td>
					<td>
						<input type="text" name="productName" id="proName" size="50"> (*)
					</td>
				</tr>
				<tr>
					<td class="tdHead">Màu:</td>
					<td>
						<input type="color" name="proColor" id="proColor" > (*)
					</td>
				</tr>
				<tr>
					<td class="tdHead">Ngày sản xuất :</td>
					<td>
						<input type="date" name="proDate" id="proDate" > (*)
					</td>
				</tr>
				<tr>
					<td class="tdHead">Ảnh sản phẩm:</td>
					<td>
						<input type="file" name="proImg"/>
					</td>
				</tr>
				<tr>
					<td class="tdHead">Giá nhập về:</td>
					<td>
						<input type="text" name="cost" id="proCost" style="width: 200px;" >
					</td>
				</tr>
				<tr>
					<td class="tdHead">Giá bán ra:</td>
					<td>
						<input type="text" name="price" id="proPri" style="width: 200px;" >
					</td>
				</tr>
				<tr>
					<td class="tdHead"><b>Giảm giá:</b></td>
					<td></td>
				</tr>
				<tr>
					<td class="tdHead">Tổng quan về sản phẩm:</td>
					<td>
						<textarea onmouseover="changeBackgroudYellow(this)" onmouseout="changeBackgroudWhite(this)" rows="10" cols="60" name="proSum">Mô tả sản phẩm </textarea>
					</td>
				</tr>
				
				<tr>
					<td class="tdHead">Giá nhãn sản phẩm:</td>
					<td onmouseover="changeBackgroudYellow(this)" onmouseout="changeBackgroudWhite(this)">
						<input type="checkbox" name="tagName1" value="Smart Phone"> Smart Phone
						<input type="checkbox" name="tagName2" value="iPhone">iPhone
					</td>
				</tr>
				<tr>
					<td class="tdHead">Có quà tặng:</td>
					<td>
						<input type="radio" name="gifRadio" value="Smart Phone"> Miếng dán màn hình
						<input type="radio" name="gifRadio" value="iPhone">Ốp lưng
						<input type="radio" name="gifRadio" value="iPhone" checked>Case
					</td>
				</tr>
				<tr>
					<td class="tdHead">Mô tả chi tiết:</td>
					<td></td>
				</tr>
				<tr>
					<td class="tdHead">Mật khẩu:</td>
					<td>
						<input type="password" style="width: 200px;">
					</td>
				</tr>
				<tr>
					<td colspan="2" style="padding: 5px;">
						<input type="reset" value="Nhập lại">
						<input type="button" onclick="saveProduct()" value = "Lưu">
						<input type="button" value = "Thoát" id="Cancel"/>
					</td>
				</tr>
			</table>
		</form>
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
					</div>
				</li>

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
					<li class="nav-item dropdown">
					<a class="nav-link dropdown-toggle " id="" data-toggle="dropdown">Languages</a>
						<div class="dropdown-menu">
							<a href="./changeLanguage?Language=vi" class="dropdown-item">Vietnamese</a>
							<a href="./changeLanguage?Language=en" class="dropdown-item">English</a>
						</div>
					</li>
				</ul>

				<div class="form-inline my-2 my-lg-0" style="margin-right: 80px;">




				<ul class="navbar-nav mr-auto">
					<li class="nav-item dropdown" id="" data-toggle="dropdown">
						<a  class="notification"> <span> gio hang
						</span> <span class="badge" color="red">5</span>
						</a>			
						<div class="dropdown-menu">
						<a href="./alarm?Alarm=abc" class="notification2">Gio hang</a>				
						</div>
					</li>
					</ul>
					<span class="badge2">5</span>
				</div>
			</div>
		</div>
	</nav>

	<div class="grid-container" style="border: 1px solid red; margin-top: 60px;">
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
							<th>#</th>
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
							<td>
								View Edit Delete
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
				style="margin-top: 30px;">
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
						<th>No</th>
						<th><i18n:i18ntag>index.proTable.name</i18n:i18ntag></th>
						<th><i18n:i18ntag>index.proTable.type</i18n:i18ntag></th>
						<th><i18n:i18ntag>index.proTable.provider</i18n:i18ntag></th>
						<th style="width: 70px;">#</th>
					</tr>
				</thead>
				<tbody>
					<%
					ModelChiTietSanPham sp;
					int i = 1;
					for (Object obj : spList) {
						sp = (ModelChiTietSanPham) obj;
					%>
					<tr>
						<td><%=i ++%></td>
						<td><%=sp.getTenSP()%></td>
						<td><%=sp.getTenLoaiSP()%></td>
						<td><%=sp.getTenNhaCungCap()%></td>
						<td>
							<form style="width: 30px; float: left;" action="./updateAction" method="post">
								<input type="hidden" name="productId"
									value="<%=sp.getSanPhamCode()%>">
								<button style="100%" type="submit" class="btn btn-success btn-sm">+</button>
							</form>
							<form style="width: 30px; float: left; margin-left: 5px;" action="./modifyProductAction">
								<input type="hidden" name="productID"
									value=<%=sp.getSanPhamCode()%>>
								<button style="width: 100%" type="submit" class="btn btn-success btn-sm">/</button>
							</form> 
						</td>

					</tr>
					<%
					}
					%>
				</tbody>
			</table>
		</div>
	
		<div class="rightMenu">Right Menu</div>
		<div class="footer">Footer</div>
		<div class="author">Tac Gia</div>
	</div>

		
	<script type="text/javascript">
	
	 var inputTexts = document.getElementsByTagName("input");
		for(i = 0; i < inputTexts.length; i ++){
			if(inputTexts[i].getAttribute("type") == "text" || inputTexts[i].getAttribute("type") == "password"){
				inputTexts[i].setAttribute("onfocus", "changeBackgroudYellow(this)");
				inputTexts[i].setAttribute("onblur", "changeBackgroudWhite(this)");
			}
		}
		
		function validateData(){
			// xac nhan cac truong not-null
			code = document.getElementById("proCode").value;
			name = document.getElementById("proName").value;
			if(code == null || code == "") {
				alert("Mã sản phẩm không được bỏ trống");
				return false;
			}
			
			if(name == null || name == "") {
				alert("Tên sản phẩm không được bỏ trống");
				return false;
			}
			
			// phai la kieu so
			try{
				cost = parseInt(document.getElementById("proCost").value);
				price = parseInt(document.getElementById("proPri").value);
				if(isNaN(cost) || isNaN(price)){
					alert("Giá trị nhập vào cho 'Giá nhập về' hoặc 'Giá bán ra' không hợp lệ");
					return false;
				}
			}catch(err){
				alert(err + "\t-> Giá trị nhập vào cho 'Giá nhập về' hoặc 'Giá bán ra' không hợp lệ");
				return false;
			}
			
			// rang buoc du lieu: GiaBanRa > GiaNhapVe
			if(cost > price) {
				alert("Giá bán ra phải lớn hơn giá nhập về");
				return false;
			}
			return true;
		}		
		
		function changeProCode(element){
			element.value = element.value.toUpperCase();
		}
	
		function changeBackgroudYellow(element){
			element.style.background="yellow";
		}
		
		function changeBackgroudWhite(element){
			element.style.background="white";
		}
		
		var proTypes = ["Smart Phone", "Tablet", "Laptop", "Máy bàn", "Máy in", "Test"];
		proTypes.sort();
		
		
		var proTypElement = document.getElementById("proType");
		
		for(i = 0; i < proTypes.length; i ++){
			optElement = document.createElement("option");
			textElement = document.createTextNode(proTypes[i]);
			
			optElement.setAttribute("value", (i + 1));
			optElement.appendChild(textElement);
			
			proTypElement.appendChild(optElement);
		}
		
		function deleteRow(rowId){
			var proTable = document.getElementById("proList");
			var trEle = document.getElementById(rowId);
			proTable.removeChild(trEle);
		}
		
		function saveProduct(){
			if(validateData()){
				var proTable = document.getElementById("proList");
				var trEle = document.createElement("tr");
				var trId = "tr_" + document.getElementById("proCode").value;
				trEle.setAttribute("id", trId);
				
				var tdProCode = document.createElement("td");
				var tdProName = document.createElement("td");
				var tdProCost = document.createElement("td");
				var tdProPri  = document.createElement("td");
				var tdAction  = document.createElement("td");
				
				var btEle = document.createElement("BUTTON");
				btEle.appendChild(document.createTextNode("Delete"));
				btEle.setAttribute("onclick", "deleteRow('"+trId+"')");
				
				tdProCode.appendChild(document.createTextNode(document.getElementById("proCode").value));
				tdProName.appendChild(document.createTextNode(document.getElementById("proName").value));
				tdProCost.appendChild(document.createTextNode(document.getElementById("proCost").value));
				tdProPri.appendChild(document.createTextNode(document.getElementById("proPri").value));
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