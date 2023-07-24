<!-- 
<%
HttpSession session2 = request.getSession();
String user_name1 = (String) session2.getAttribute("UserName");
String user_email1 = (String) session2.getAttribute("UserEmail");
%> -->
<!DOCTYPE html >
<html xmlns:th="http://www.thymeleaf.org">
<head>
<meta charset="ISO-8859-1">
<title>Header </title>
<script src="https://code.jquery.com/jquery-3.6.3.min.js" ></script>
<script type="text/javascript" src="js/CommonScript.js"></script>
</head>
<body >

	<!-- Header Section Begin -->
	<header class="header" th:fragment="userHeader">
		<div class="header__top">
			<div class="container">
				<div class="row">
					<div class="col-lg-6 col-md-6">
						<div class="header__top__left">
							<ul>
								<li><i class="fa fa-envelope"></i> sanjaybangre@gmail.com</li>
								<li>Free Shipping for all Order of Rs 999.00+</li>
							</ul>
						</div>
					</div>
					<div class="col-lg-6 col-md-6">
						<div class="header__top__right">
							<div class="header__top__right__social">
								<a href="#"><i class="fa fa-facebook"></i></a> <a href="#"><i
									class="fa fa-linkedin"></i></a> <a href="#"><i
									class="fa fa-instagram"></i></a>
							</div>

						<!-- 	<%
							if (user_name1 == null) {
							%> -->
							<div class="header__top__right_register">
								<a th:href="@{/loginForm}"><i class="fa fa-user"></i> Login</a>
								 <a th:href="@{/registrationForm}"><i class="fa fa-user"></i>
									Register</a>
							</div>
							<!-- <%
							} else {
							%>
 -->
							<a onclick="logoutWarning()" th:href="@{/logout}"><i class="fa fa-user"></i> LogOut</a>

						<!-- 	<%
							}
							%> -->



						</div>
					</div>
				</div>
			</div>
		</div>

		<div class="container">
			<div class="row">
				<div class="col-lg-3">
					<div class="header__logo">
						<a href="./index.jsp"><img src="img/N_logo.jpg"
							style="height: 50px; width: 200px;" alt=""></a>
					</div>
				</div>
				<div class="col-lg-6">
					<nav class="header__menu">
						<ul>

							<li><a th:href="@{/}">Home</a></li>
							<li><a th:href="@{/allProduct}">Shop</a></li>
							<li><a th:href="@{/blog}">Blog</a></li>
							<li><a th:href="@{/User/contact}">Contact</a></li>
							<li><a th:href="@{/User/MyOrders}">My Order</a></li>
							
								
						</ul>
					</nav>
					
					
				</div>
				
				<div class="col-lg-3">
					<div class="header__cart">
						<ul>
							<li><a th:href="@{/likeProduct}"><i class=" fa fa-heart"></i> <span class="likeproduct">0</span></a></li>

							<!-- here i get dynamic cart number when i add class="badge badge-danger" -->
							<li><a th:href="@{/shoppingCart}"> <i
									class="fa fa-cart-plus " style="font-size:33px;"></i> <span
									 class="cartItem" >0</span></a></li>

							

						</ul>
						<div class="header__cart__price">
							item: <span class="totalOrder"></span>
						</div>
					</div>
				</div>
					</div>
			<div class="humberger__open">
				<i class="fa fa-bars"></i>
			</div>
		</div>
	</header>
	<!-- Header Section End -->



</body>
</html>