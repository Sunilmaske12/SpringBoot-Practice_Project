<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Invoice</title>

<%@page import="com.codeo.shop.Dao.MyOrderDao"%>
<%@page import="com.codeo.shop.entity.Order"%>
<%@page import="com.codeo.shop.entity.Customer"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.Date"%>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css"
	rel="stylesheet">

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN"
	crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.6.3.min.js"
	integrity="sha256-pvPw+upLPUjgMXY0G+8O0xUf+/Im1MZjXxxgOcBQBXU="
	crossorigin="anonymous"></script>

<link
	href="https://fonts.googleapis.com/css2?family=Cairo:wght@200;300;400;600;900&display=swap"
	rel="stylesheet">
</head>
<body id="invoiceDownload">


<%
	String orderId=request.getParameter("orderId");
	String addressId=request.getParameter("addressId");
	
	MyOrderDao mod = new MyOrderDao();
	List<Customer> addressDetail = mod.getAddressDetailByID(addressId);
	List<Order> orderDetail = mod.getOrderDetails(orderId);
	%>
	<div  style="margin-left: 15%; margin-right:15%; top:20px;" class="card">
		<div  class="card-body">
			<div class="container mb-5 mt-3">
				<div class="row d-flex align-items-baseline">
					<div class="col-xl-9">
						<p style="color: #7e8d9f; font-size: 20px;">
							Invoice >> <strong>ID: #123-123</strong>
						</p>
					</div>
					<div class="col-xl-2">
				<button onclick="downloadInvoice()">Download</button></div>
					<hr>
				</div>

				<div class="container">
					<div class="col-md-12">
						<div class="text-center">
							<i class="fab fa-mdb fa-4x ms-0" style="color: #5d9fc5;"></i>
							<p class="pt-0">OnlineElectricalShopee.com</p>
						</div>

					</div>


					<div class="row">
						<div class="col-xl-8">
						<%for (Customer c : addressDetail) {%>
							<ul class="list-unstyled">
								<li class="text-muted">To: <span style="color: #5d9fc5;"> <%=c.getC_name() %></span></li>
								<li class="text-muted"><%=c.getC_landmark() %></li>
								<li class="text-muted"><%=c.getC_city() %>, Maharashtra</li>
								<li class="text-muted"><i class="fas fa-phone"></i><%=c.getC_mobno() %></li>
								<li class="text-muted"><i class="fas fa-phone"></i><%=c.getC_email() %></li>
							</ul><%} %>
						</div>
						
						<div class="col-xl-4">
							<p class="text-muted">Invoice</p>
							<ul class="list-unstyled">
								<li class="text-muted"><i class="fas fa-circle"
									style="color: #84B0CA;"></i> <span class="fw-bold">ID:</span>#123-123</li>
								<li class="text-muted"><i class="fas fa-circle"
									style="color: #84B0CA;"></i> <span class="fw-bold">Order
										Date: </span></li>
								<li class="text-muted"><i class="fas fa-circle"
									style="color: #84B0CA;"></i> <span class="me-1 fw-bold">Status:</span><span
									class="badge bg-warning text-black fw-bold"> Paid</span></li>
							</ul>
						</div>
					</div>

					<div class="row my-2 mx-1 justify-content-center">
						<table class="table table-striped table-borderless">
							<thead style="background-color: #84B0CA;" class="text-white">
								<tr>
									<th scope="col">#</th>
									<th scope="col">Description</th>
									<th scope="col">Qty</th>
									<th scope="col">Unit Price</th>
									<th scope="col">Amount</th>
								</tr>
							</thead>
							<tbody>
							<%
					int T_Price=0;
					int charges=0;
					for(Order order:orderDetail){%>
								<tr>
						<td scope="row"></td>
						<td><%=order.getProductName() %></td>
						<td><%= order.getProductPrice()%></td>
						<td><%= order.getProductQuantity() %></td>
						<%int price=order.getProductPrice()*order.getProductQuantity();
						 T_Price=T_Price+price;%>
						<td><%= price%></td>
						
					</tr>
					<%}if(T_Price<999){
						charges=100;
					}
					%>
							</tbody>

						</table>
					</div>
					<div class="row">
						<div class="col-xl-8">
							

						</div>
						<div class="col-xl-3">
							<ul class="list-unstyled">
								<li class="text-muted ms-3"><span class="text-black me-4">SubTotal</span>Rs. <%= T_Price %></li>
								<li class="text-muted ms-3 mt-2"><span
									class="text-black me-4">Charges </span>Rs. <%=charges %></li>
							</ul>
							<p class="text-black float-start">
								<span class="text-black me-3"> Total Amount</span><span
									style="font-size: 25px;">Rs. <%= T_Price+charges %></span>
							</p>
						</div>
					</div>
					<hr>
					<div class="row">
						<div class="col-xl-10">
							<p>Thank you for your purchase</p>
							<h2>Signature</h2>
						</div>
						<div class="col-xl-2">
							<button type="button" class="btn btn-primary text-capitalize"
								style="background-color: #60bdf3;">PAID</button>
								
						</div>
					</div>

				</div>
			</div>
		</div>
	</div>
		<script type="text/javascript" src="js/CommonScript.js"></script>
	<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.22/pdfmake.min.js"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/html2canvas/0.4.1/html2canvas.min.js"></script>
</body>
</html>