<!DOCTYPE html>

<html lang="zxx" xmlns:th="http://www.thymeleaf.org">

<head>

<meta charset="UTF-8">
<meta name="description" content="Ogani Template">
<meta name="keywords" content="Ogani, unica, creative, html">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>Contact us</title>

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



<body>
	<!-- Page Preloder -->
	<div id="preloder">
		<div class="loader"></div>
	</div>


		<header th:replace="/UserHeaderFooter/header::userHeader"></header>

	<!-- Breadcrumb Section Begin -->
	<section class="breadcrumb-section set-bg" data-setbg="img/Name-bg.jpg">
		<div class="container">
			<div class="row">
				<div class="col-lg-12 text-center">
					<div class="breadcrumb__text">
						<h2>Contact Us</h2>
						<div class="breadcrumb__option">
							<a th:href="@{/}">Home</a> <span>Contact Us</span>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Breadcrumb Section End -->

	<!-- Contact Section Begin -->
	<section class="contact spad">
		<div class="container">
			<div class="row">
				<div class="col-lg-3 col-md-3 col-sm-6 text-center">
					<div class="contact__widget">
						<span class="icon_phone"></span>
						<h4>Phone</h4>
						<p>+91-28888-66868</p>
					</div>
				</div>
				<div class="col-lg-3 col-md-3 col-sm-6 text-center">
					<div class="contact__widget">
						<span class="icon_pin_alt"></span>
						<h4>Address</h4>
						<p>AGRESEN SQUARE, GANDHIBAGH, NAGPUR, MAHARASHTRA</p>
					</div>
				</div>
				<div class="col-lg-3 col-md-3 col-sm-6 text-center">
					<div class="contact__widget">
						<span class="icon_clock_alt"></span>
						<h4>Open time</h4>
						<p>10:00 am to 8:00 pm</p>
					</div>
				</div>
				<div class="col-lg-3 col-md-3 col-sm-6 text-center">
					<div class="contact__widget">
						<span class="icon_mail_alt"></span>
						<h4>Email</h4>
						<p>sanjaybangre@colorlib.com</p>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Contact Section End -->

	<!-- Map Begin -->
	<div class="map">
		<iframe
			src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3721.0345711981!2d79.10155404996937!3d21.151022438901247!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3bd4c0c9597151bb%3A0x8d2707eb85172ba1!2sAgresan%20Chowk%2C%20Gandhibagh%2C%20Nagpur%2C%20Maharashtra!5e0!3m2!1sen!2sin!4v1667230512548!5m2!1sen!2sin"
			width="600" height="450" style="border: 0;" allowfullscreen=""
			loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>


		<div class="map-inside">
			<i class="icon_pin"></i>
			<div class="inside-widget">
				<h4>Maharashtra</h4>
				<ul>
					<li>Phone: +12-345-6789</li>
					<li>Add: Agresan Chowk Nagpur</li>
				</ul>
			</div>
		</div>
	</div>
	<!-- Map End -->

	

	<section class="checkout spad">
		<div class="container">
			<table style="text-align: center" class="table table-bordered">
				<thead>
					<tr>
						<th scope="col">No.</th>
						<th scope="col">DATE</th>
						<th scope="col">TICKET ID</th>
						<th scope="col">ADMIN MANAGER</th>
						<th scope="col">MESSAGE</th>
						<th scope="col">STATUS</th>

					</tr>
				</thead>
				<tbody>
				<tr th:each="tickets,status:${tickets }">
						<td scope="row"></td>
						<td th:text="${tickets.Date }"></td>
						<td th:text="${tickets.ticketId }"></td>
						<td th:text="${tickets.Admin_Manager }"></td>
						<td><a th:href="@{'/User/allMyChats'+','+${tickets.ticketId }+','+${tickets.Status }}"
							type="button" style="color: white;"
							class="btn btn-primary btn-sm">CHATS</a></td>

					
						<td>
						 <div th:if="${tickets.Status == 'Open' }" class="btn-group">
								<a style="background: #00FF00;" class="btn btn-primary">OPEN</a>
							</div>
					    <div th:If="${tickets.Status == 'Close' }" class="btn-group">
								<a style="background: red; color: white;" type="button"
									class="btn btn-primary">CLOSED</a>

							</div>
							
							 <div th:If="${tickets.Status == 'Waiting' }" class="btn-group">
								<a style="background: orange; color: white;" type="button"
									class="btn btn-primary">WAITING</a></div>
							
							
							</td>
						</tr>
					</tbody>
			</table>

		</div>
	</section>
	<!-- Contact Form Begin -->
	<div class="contact-form spad">
		<div class="container">
			
			<form action="chat?uid=<%=userId %>&uname=<%=user_name %>"
				method="post">
				<div class="row">
	
					<div style="margin-left: 30%;" class="col-lg-6 text-center"><h2>CREATE NEW TICKET</h2>
						<textarea placeholder="Your message" name="message" required></textarea>
						<button type="submit" class="site-btn">SEND MESSAGE</button>
					</div>
				</div>
				<input type="hidden" name="Action" value="createTicket">
			</form>
		</div>
	</div>
	<!-- Contact Form End -->

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
	



</body>

</html>