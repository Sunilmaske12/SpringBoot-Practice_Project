<!DOCTYPE html>
<html lang="zxx" xmlns:th="http://www.thymeleaf.org">
<head>
<meta charset="UTF-8">
<meta name="description" content="Ogani Template">
<meta name="keywords" content="Ogani, unica, creative, html">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>My orders</title>

<!-- Google Font -->
<link
	href="https://fonts.googleapis.com/css2?family=Cairo:wght@200;300;400;600;900&display=swap"
	rel="stylesheet">



<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css"
	rel="stylesheet">

<script	src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.min.js" ></script>
<script src="https://code.jquery.com/jquery-3.6.3.min.js"></script>
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


<!-- 
<%
HttpSession session4 = request.getSession();
int userId = (int) session4.getAttribute("userid");
MyOrderDao mod = new MyOrderDao();
List<Order> orderlist = mod.getAllOrderListByUID(userId);
String orderSuccess = (String) session4.getAttribute("orderSuccess");

%> -->




<body> <!-- <%if(orderSuccess!=null){%>
  onload="orderPlacePopUp()"
<%session4.removeAttribute("orderSuccess"); } %> --> 
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
						<h2>MY ORDERS</h2>
						<div class="breadcrumb__option">
							<a th:href="@{/}">HOME</a> <span>MY ORDERS</span>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Breadcrumb Section End -->

	<!-- Checkout Section Begin -->
	<section class="checkout spad">
		<div  class="container">
			<table style="text-align:center" class="table table-bordered">
				<thead>
					<tr>
						<th scope="col">No.</th>
						<th scope="col">ORDER DATE</th>
						<th scope="col">CUSTOMER</th>
						<th scope="col">STATUS</th>
						<th scope="col">DETAILS</th>
						<th scope="col">INVOICE</th>
						
					</tr>
				</thead>
				<tbody>
					<tr  th:each="allOrders,status:${allOrders}">
						<td scope="row"></td>
						<td th:text="${allOrders.date}"></td>
					
						<td th:text="${customerName[status.index] }"> </td>
						
					 	
											   <td th:if="${allOrders.status == 'Approved' }" >
					 										<div  class="btn-group">
															<a style="background: #00FF00; "  class="btn btn-primary">Approved</a>
															</div>
													</td>
											 <td th:if="${allOrders.status == 'Rejected' }" 
										 		><div  class="btn-group">
															<a style="background: red; color:white;" type="button" class="btn btn-primary">Rejected</a>
															
														</div>
											   <td
										 	th:if="${allOrders.status == 'Waiting' }" 
										 ><div  class="btn-group">
															<button style="background: orange;" type="button" class="btn btn-primary">WAITING</button>
															
														</div>
													</td>
													   
										<!-- 		   <% } %>
						 -->
						
						
						<td><a th:href="@{'/User/OrderDetails'+ ${allOrders.order_Id} +','+${allOrders.address_Id } }" type="button" style="color:white;" class="btn btn-primary btn-sm">DEATAILS</a></td>
						<td><a href="Invoice.jsp?orderId=<%=order.getOrderId()%>&addressId=<%=order.getAddressId() %>" type="button"  class="btn btn-danger btn-sm">DOWNLOAD</a></td>
				<!-- 	<%} %>
				 -->	
					</tr>
					
				</tbody>
			</table>

		</div>
	</section>
	<!-- Checkout Section End -->

		<footer th:replace="/UserHeaderFooter/footer::userFooter"></footer>

	<!-- Js Plugins -->
	<script src="js/jquery-3.3.1.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/jquery.nice-select.min.js"></script>
	<script src="js/jquery-ui.min.js"></script>
	<script src="js/jquery.slicknav.js"></script>
	<script src="js/mixitup.min.js"></script>
	<script src="js/owl.carousel.min.js"></script>
	<script src="js/main.js"></script>
	<script type="text/javascript" src="js/CommonScript.js"></script>

</body>

</html>