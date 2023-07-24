<!DOCTYPE html>
<html lang="zxx">

<%@page import="com.codeo.shop.Dao.CustomerDao"%>
<%@page import="java.util.List"%>
<%@page import="com.codeo.shop.entity.Customer"%>


<%
HttpSession session4 = request.getSession();
String user = (String) session4.getAttribute("usertype");
if (user == null) {

	session4.setAttribute("message", "You are not logged in, Logged in first");
	response.sendRedirect("loginfrom.jsp");
	return;
}
int userId = (int) session4.getAttribute("userid");
String incompleteinfo = (String) session4.getAttribute("incompleteinfo");

//int userId=Integer.parseInt(uId);
%>


<head>
<meta charset="UTF-8">
<meta name="description" content="Ogani Template">
<meta name="keywords" content="Ogani, unica, creative, html">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>Checkout</title>

<!-- Google Font -->
<link
	href="https://fonts.googleapis.com/css2?family=Cairo:wght@200;300;400;600;900&display=swap"
	rel="stylesheet">



<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css"
	rel="stylesheet">

<script
	src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"
	integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.min.js"
	integrity="sha384-mQ93GR66B00ZXjt0YO5KlohRA5SY2XofN4zfuZxLkoj1gXtW8ANNCe9d5Y3eG5eD"
	crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.6.3.min.js"
	integrity="sha256-pvPw+upLPUjgMXY0G+8O0xUf+/Im1MZjXxxgOcBQBXU="
	crossorigin="anonymous"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
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
<body
	<%if (incompleteinfo != null) {
	if (incompleteinfo.equals("No address")) {%>
	onload="addressrErrorPopUp()"
	<%session4.removeAttribute("incompleteinfo");
	} else {%>
	onload="msgErrorPopUp()"
	<%session4.removeAttribute("incompleteinfo");
	}
}%>>

	<!-- Page Preloder -->
	<div id="preloder">
		<div class="loader"></div>
	</div>
	<jsp:include page="header.jsp" />
	<jsp:include page="CommonModal.jsp" />




	<!-- Breadcrumb Section Begin -->
	<section class="breadcrumb-section set-bg" data-setbg="img/Name-bg.jpg">
		<div class="container">
			<div class="row">
				<div class="col-lg-12 text-center">
					<div class="breadcrumb__text">
						<h2>Checkout</h2>
						<div class="breadcrumb__option">
							<a href="./index.jsp">Home</a> <span>Checkout</span>
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
			<div class="row">
				<div class="col-lg-12">
					<h6>
						<span class="icon_tag_alt"></span> Have a coupon? <a href="#">Click
							here</a> to enter your code
					</h6>
				</div>
			</div>
			<div class="checkout__form">
				<h4>Billing Details</h4>
				<form method="post" action="OnlinePayment" id="orderPlaceAlert">
					<div class="row">
						<div class=" col-md-6">

							<%
							CustomerDao cd = new CustomerDao();
							HttpSession hs = request.getSession();
							int u_id = (int) hs.getAttribute("userid");
							List<Customer> address = cd.getAddress(u_id);
							%>

							<!-- Address Show Started -->

							<div class="card mb-3">
								<div class="card-body">
									<h4 class="text-dark">Select Your Address</h4>
									<%
									if (address.size() != 0) {

										for (Customer a : address) {
									%>
									<div class="row checkout-address-row">
										<div class="col-2 col-md-1">
											<div class="radio radio-success">
												<input type="radio" name="address_id"
													value="<%=a.getC_id()%>" id="addressId"
													aria-invalid="false" />
											</div>
											<span class="badge badge-primary"></span>
										</div>
										<div class="col-md-11 col-10">

											<div>
												Mr
												<%=a.getC_name()%>
												(<%=a.getC_mobno()%>)
											</div>
											<hr class="mt-1 mb-1">
											<%=a.getC_adderess()%>
											, <br>

											<%=a.getC_landmark() + " " + a.getC_city() + " " + a.getC_pincode()%>
											<a href="EditAddress?id=1994"
												class="badge bg-danger pull-right">Edit</a>

										</div>
									</div>
									<hr size="8" width="100%" color="red">
									<%
									}

									} else {
									%>
									<h2 style="color: red;">PLEASE PUT YOUR ADDRESS!</h2>
									<%
									}
									%>


									<div class="row">
										<div class="col-md-12">
											<div class="text-center mt-5">
												<button type="button" class="btn btn-primary"
													data-bs-toggle="modal" data-bs-target="#AddNewAddress">
													<i class="fa fa-plus-circle"></i> Add New Address
												</button>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>


						<!-- Address Show Ended -->

						<!-- -Order Form Started -->
						<div style="margin-left: 100px;" class="col-lg-4 col-md-6">
							<div class="checkout__order">
								<h4>Your Order</h4>
								<div class="check">
									<!-- data comming from js file -->

								</div>


								<div class="checkout__order__subtotal  ">
									Subtotal <span class="totalOrder"></span>
								</div>
								<div class="checkout__order__total ">
									Delivery Charges <span style="color: black;" class="charges"></span>
								</div>
								<div class="checkout__order__total">
									Total <span class="totalPrice"></span>
								</div>
								<button type="submit" class="site-btn"
									style="border-radius: 10px;">MAKE ORDER</button>

							</div>

						</div>
					</div>
				</form>
			</div>
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
	<script type="text/javascript"
		src="https://checkout.razorpay.com/v1/checkout.js"></script>
	<script type="text/javascript" src="js/Payment.js"></script>
	<script type="text/javascript" src="js/CommonScript.js"></script>
	<script type="text/javascript" src="js/Payment.js"></script>
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
</body>

</html>