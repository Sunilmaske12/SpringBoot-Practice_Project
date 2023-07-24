<!DOCTYPE html>
<html lang="zxx"  xmlns:th="http://www.thymeleaf.org">

<head>
<meta charset="UTF-8">
<meta name="description" content="Ogani Template">
<meta name="keywords" content="Ogani, unica, creative, html">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>ORDER DETAILS</title>

<!-- Google Font -->
<link
	href="https://fonts.googleapis.com/css2?family=Cairo:wght@200;300;400;600;900&display=swap"
	rel="stylesheet">




<!-- Css Styles -->
<link rel="stylesheet" href="css/bootstrap.min.css" type="text/css">
<link rel="stylesheet" href="css/font-awesome.min.css" type="text/css">
<link rel="stylesheet" href="css/elegant-icons.css" type="text/css">
<link rel="stylesheet" href="css/nice-select.css" type="text/css">
<link rel="stylesheet" href="css/jquery-ui.min.css" type="text/css">
<link rel="stylesheet" href="css/owl.carousel.min.css" type="text/css">
<link rel="stylesheet" href="css/slicknav.min.css" type="text/css">
<link rel="stylesheet" href="css/style.css" type="text/css">


</head>

<body id="tblCustomers">
	<!-- Page Preloder -->
	<div id="preloder">
		<div class="loader"></div>
	</div>
	<header th:replace="/UserHeaderFooter/header::userHeader"></header>
	<jsp:include page="CommonModal.jsp" />
	

	<!-- Breadcrumb Section Begin -->
	<section class="breadcrumb-section set-bg" data-setbg="img/Name-bg.jpg">
		<div class="container">
			<div class="row">
				<div class="col-lg-12 text-center">
					<div class="breadcrumb__text">
						<h2>ORDER DETAILS</h2>
						<div class="breadcrumb__option">
							<a th:href="@{/}">Home</a> <span>ORDER DETAILS</span>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Breadcrumb Section End -->

	<!-- Checkout Section Begin -->
	<section class="checkout spad">
		<div class="container">
			<div class="checkout__form">
				<h4>Order Details of Customer</h4>
					<div class="row">
						<div class=" col-md-6">

							

							<!-- Address Show Started -->

							<div class="card mb-3">
								<div class="card-body">
									<h4 >Shipping Address</h4>
									<div class="row checkout-address-row" th:object="${customerDetails}"	>
										<div class="col-md-11 col-10">
											<div th:text="'Mr/Mrs '+${customerDetails.C_name }+'('+${customerDetails.C_mobno}+')'">
											</div>
											<hr size="8" width="100%" color="red">
											<div th:text="${customerDetails.C_adderess }+' , '+ ${customerDetails.C_landmark }+' '+ ${customerDetails.C_city } +' '+  ${customerDetails.C_pincode }">
																				</div>

										</div>
									</div>
									
								</div>
							</div>
							
						</div>					
					</div>
				
					
					</div>
				
			</div>
	
		<div style="padding-top: 30px;"  class="container">
			<table style="text-align:center" class="table table-bordered">
				<thead>
					<tr>
						<th scope="col">No.</th>
						<th>ITEM</th>
						<th>PRICE</th>
						<th>QUANTIRY</th>
						<th>TOTAL PRICE</th>
												
					</tr>
				</thead>
				<tbody>
		
					<tr th:each = "OrderDetails:${OrderDetails}">
						<td scope="row"></td>
						<td th:text="${OrderDetails.Product_Name }"></td>
						<td th:text="${OrderDetails.Product_Price }"></td>
						<td th:text="${OrderDetails.Product_Quantity }"></td>
		
						<td th:text="${OrderDetails.Product_Price }*${OrderDetails.Product_Quantity }"></td>
						
					</tr>
						<tr>
							<td></td>
							<td style="font-weight:bold; color:red;" colspan=4 th:text="'TOTAL AMOUNT : '+${tPrice} +' + ' +${charges} + '(shipping charges) = Rs.' +${tPrice+charges}"> </td>
						</tr>				
				</tbody>
			</table>
			

		</div>
	</section>
	<!-- Checkout Section End -->

	<jsp:include page="footer.html" />

	<!-- Js Plugins -->
	<script src="js/jquery-3.3.1.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/jquery.nice-select.min.js"></script>
	<script src="js/jquery-ui.min.js"></script>
	<script src="js/jquery.slicknav.js"></script>
	<script src="js/mixitup.min.js"></script>
	<script src="js/owl.carousel.min.js"></script>
	<script src="js/main.js"></script>
  
    
</body>



</html>