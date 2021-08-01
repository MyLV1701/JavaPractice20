<%-- <%@ page language="java" contentType="text/html; charset=ISO-8859-1" --%>
<%--     pageEncoding="ISO-8859-1"%> --%>
    
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	

<html>
<head>
	<title>Bài 02</title>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="./bootstrap/bootstrap.min.css">
	<!-- <script src="./jquery.min.js"></script>  -->
	<script src="./bootstrap/jquery.min.js"></script>
	<script>
		function loadPage(){
			//alert("Load site");
		}
	</script>
	<script>
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
				$("#productForm").animate({left: '110px', top: '100px'});
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
			
			// $(document).on("mouseenter", "tr", function(){
				// $(this).css("background-color", "gray");
				// $(this).addClass("selectedRow");
			// });
			
			// $(document).on("mouseleave", "tr", function(){
				// $(this).css("background-color", "white");
				// $(this).removeClass("selectedRow");
			// });
			
		});
	</script>
	<style>
		.addNew {
			float: right;
			margin-right: 30px;
		}
		.selectedRow{
			color: white;
			font-weight: bold;
		}
	</style>
	<style>
		td {
			padding-top: 2px;
			padding-left: 5px;
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

	<style>
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
				'lMenu lMenu lMenu lMenu header header header header header header header header'
				'lMenu lMenu lMenu lMenu content content content content content rMenu rMenu rMenu'
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
	</style>

</head>



<body onload="loadPage()">
	<div class="grid-container">
		<div class="header">Site Header</div>
		<div class="leftMenu">Left Menu</div>
		
		<div class="content">
			<div id="productForm" style="display: none; border: 1px solid blue; padding: 5px; width: 40%; min-width:640px;position: absolute; background-color: white;">
			
			<jsp:include page="home.jsp" />  

		 	<button id="Cancel">Close</button>	
				
				
			</div>
			
			<div style="width: 100%; float: right;">
				<table border="1" style="width: 100%;border-collapse: collapse; " id="proList">
					<caption>
						Danh sách sản phẩm <button class="addNew">Thêm mới sản phẩm</button>
					</caption>
					<tr>
						<th>Mã sản phẩm</th>
						<th>Tên sản phẩm</th>
						<th>Giá nhập về</th>
						<th>Giá bán ra</th>
						<th>#</th>
					</tr>
				</table>
			</div>
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
					alert("Giá trị nhập vào cho 'Giá nhập về' hoặc 'Giá bán ra' không hợp lệ");
					return false;
				}
			}catch(err){
				alert(err + "\t-> Giá trị nhập vào cho 'Giá nhập về' hoặc 'Giá bán ra' không hợp lệ");
				return false;
			}
			
			// rang buoc du lieu: GiaBanRa > GiaNhapVe
			if(cost > price) {
				alert("Giá bán ra phải lớn hơn giá nhập về");
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