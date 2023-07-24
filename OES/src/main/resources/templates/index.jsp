<html lang="zxx" xmlns:th="http://www.thymeleaf.org">
<head>
<meta charset="UTF-8">
<meta name="description" content="Ogani Template">
<meta name="keywords" content="Ogani, unica, creative, html">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>Online Electrical Shopee</title>



<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css"
	rel="stylesheet">

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>


<link
	href="https://fonts.googleapis.com/css2?family=Cairo:wght@200;300;400;600;900&display=swap"
	rel="stylesheet">
	
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

<body>



		


	<!-- Page Preloder -->
	<div id="preloder">
		<div class="loader"></div>
	</div>
	<header th:replace="/UserHeaderFooter/header::userHeader"></header>
	
	<jsp:include page="CommonModal.jsp" />
	<!--  for product and category  -->
	
	<!-- Toast msg -->
	<div id="toast">Error in cart</div>
	<!-- Toast msg end -->
	
	
		<!-- Hero Section Begin -->
	<section class="hero">
		<div class="container">
			<div class="row">
				<div class="col-lg-3">
					<div class="hero__categories">
						<div class="hero__categories__all">
							<span><a style="color: white">AVAILABLE CATEGORIES </a> </span><br>
						</div>
						<ul>
							<li
							th:each="category:${allCategories}"
							><a th:href="@{'/allProduct'+${category.Id}}"
								onMouseOver="this.style.color='red'"
								onMouseOut="this.style.color='black'"
								th:text="${category.Cat_title}"
								> 
							</a></li>
						</ul>
					</div>
				</div>
				<div class="col-lg-9">
					<div class="hero__search">
						<div class="hero__search__form" >
						 <form action="Search.jsp" method="post"> 
								<input type="text" id="search-box" class="form-control" name="ch" placeholder="What do yo u need?" onkeyup="getSuggestions(this.value)">
								<button type="submit" class="site-btn">SEARCH</button>
							 </form>  
						</div>
						
						
						<div class="hero__search__phone">
							<div class="hero__search__phone__icon">
								<button data-bs-toggle="modal" data-bs-target="#UserProfile"><img
									alt="icon" src="img/hero/icon.png"> </button>>
									
							</div>
							
							
											
							<div class="hero__search__phone__text" th:object="${user}">
								<h5>WELCOME</h5>
								<h4 class=" font-weight-bold" style="color: green;" >
									<a th:if="${user!=null }"  th:text="${user.name}"></a>
									<a th:unless="${user!=null }" >User</a>									
								</h4>

							</div>
						</div>


					</div>



					<!-- -Banner working started -->
				<div id="carouselExampleIndicators" class="carousel slide"
						data-bs-ride="carousel">
						<div class="carousel-indicators">
							<button type="button" data-bs-target="#carouselExampleIndicators"
								data-bs-slide-to="0" class="active" aria-current="true"
								aria-label="Slide 1"></button>
						<!-- 	<div th:each="banner,status :${allBanner}"
							></div>
						 -->	<button th:each="banner,status :${allBanner}"
							type="button" data-bs-target="#carouselExampleIndicators"
								th:data-bs-slide-to="${status.index}" th:aria-label="' Slide'+ ${status.index+1}"></button>
								
						</div>
						<div class="carousel-inner">
							<div class="carousel-item active">
								<div class="hero__item set-bg" data-setbg="img/hero/banner.jpg">
									<div class="hero__text">
										<span>Electrical Appliances</span>
										<h2>
											Online <br />Electrical Shopee
										</h2>
										<p>FREE PICKUP and DELIVERY AVAILABLE</p>
										<a th:href="@{/allProduct}" class="primary-btn">SHOP NOW</a>
									</div>
								</div>

							</div>
						<div class="carousel-item"
							th:each="banner:${allBanner}"
							 th:if="${banner.Action == 'Active' }"
							>
								<img th:src="@{'img/banner/'+${banner.Banner_image}}"
									class="d-block w-100" alt="...">
							</div>
							
						</div>
						<button class="carousel-control-prev" type="button"
							data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
							<span class="carousel-control-prev-icon" aria-hidden="true"></span>
							<span class="visually-hidden">Previous</span>
						</button>
						<button class="carousel-control-next" type="button"
							data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
							<span class="carousel-control-next-icon" aria-hidden="true"></span>
							<span class="visually-hidden">Next</span>
						</button>
					</div>


				</div>

</div>
		</div>

	</section>
	<!-- Hero Section End -->

	<!-- Categories Section Begin -->
	<section class="categories">
		<div class="container">
			<div class="row">
				<div class="categories__slider owl-carousel">
					<div >
						<div class="categories__item set-bg"
							data-setbg="img/categories/cat.1.jpg">
							<h5>
								<a th:href="@{'/allProduct'+15}">Mixer Grinder</a>
							</h5>
						</div>
					</div>
					<div class="col-lg-3">
						<div class="categories__item set-bg"
							data-setbg="img/categories/cat.2.jpg">
							<h5>
								<a th:href="@{'/allProduct'+14}">Switches</a>
							</h5>
						</div>
					</div>
					<div class="col-lg-3">
						<div class="categories__item set-bg"
							data-setbg="img/categories/cat.3.jpg">
							<h5>
								<a th:href="@{'/allProduct'+10}">Fan</a>
							</h5>
						</div>
					</div>
					<div class="col-lg-3">
						<div class="categories__item set-bg"
							data-setbg="img/categories/cat.4.jpg">
							<h5>
								<a th:href="@{'/allProduct'+11}">Light</a>
							</h5>
						</div>
					</div>
					<div class="col-lg-3">
						<div class="categories__item set-bg"
							data-setbg="img/categories/cat.5.jpg">
							<h5>
								<a th:href="@{'/allProduct'+12}">Press</a>
							</h5>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Categories Section End -->


	<section style="padding-bottom: 50px; padding-top: 80px;"
		class="banner">
		<div class="row text-center">
			<div style="border-radius: 25px; background: red;"
				class="col-md-6 offset-md-3 offset-lg-3">
				<a
					style="font-family: Arial; font-weight: 700; color: white; font-size: 24px;"
					th:href="@{/allProduct}" class="btn btn-solid d-block font-medium-1">ALL
					PRODUCTS</a>
			</div>
		</div>
	</section>

	<!-- -----service section------- -->
	<section class="">
		<div class="row ">
			<div class="col-lg-3 col-sm-6 service-block1 ">
				<div>
					<img src="img/service/truck.png" alt="">
					<h5>Shipping</h5>
					<p>Happiness to your home.</p>
				</div>
			</div>
			<div class="col-lg-3 col-sm-6 service-block1">
				<div>
					<img src="img/service/24-hours.png" alt="">
					<h5>24 X 7 service</h5>
					<p>Because it is our passion.</p>
				</div>
			</div>
			<div class="col-lg-3 col-sm-6 service-block1">
				<div>
					<img src="img/service/iwallet.png" alt="">
					<h5>Online Payment</h5>
					<p>Ease to own what you like.</p>
				</div>
			</div>
			<div class="col-lg-3 col-sm-6 service-block1">
				<div>
					<img src="img/service/megaphone.png" alt="">
					<h5>Always Listening</h5>
					<p>Always learning</p>
				</div>
			</div>
		</div>
	</section>
	<!-- -----service section end------- -->


	<!--   Featured Section Begin -->
	<section class="featured spad">
		<div
			style="display: flex; align-items: center; justify-content: center; background: red; height: 50px;">
			<div
				style="text-align: center; width: 230px; height: 49px; background: black;">
				<h4 style="color: white; padding: 12px;">Latest Products</h4>
			</div>
		</div>
		<div class="container">


			<div class="row featured__filter">
				<%-- <%
				// List<Product> list = productdao.getAllProducts();
				int c=0;
				for (Product product : prodlist) {
					 c=c+1; if(c>(prodlist.size()-4)){
					
				%>
			 --%>	<div class="col-lg-3 col-md-4 col-sm-6 mix oranges fresh-meat ">
					<div style="border: 1px solid grey;" class="mt-5">
						<div class="featured__item m-4 ">
						
						
						
						<%-- 	<div class="featured__item__pic set-bg "
								style="background-image: url(&quot;img/latest-product/<%=product.getProd_imageName()%>&quot;);">
								<a href="Product-details.jsp?product=<%=product.getId()%>">
									<img style="max-height: 200px; height: auto;" class="center"
									src="img/latest-product/<%=product.getProd_imageName()%>">
								</a>
								<ul class="featured__item__pic__hover">
									<li><a onclick="likeProducts(<%=product.getId()%>, '<%=product.getProd_name()%>', <%=product.getPriceAfterDiscount()%>, '<%=product.getProd_imageName() %>')" ><i class="fa fa-heart"></i></a></li>
									<li><a><i class="fa fa-retweet"></i></a></li>
								</ul>
							</div>

							<div class="featured__item__text">
								<h6>
									<a href="Product-details.jsp?product=<%=product.getId()%>"
										style="color: black"><%=product.getProd_name()%></a>
								</h6>
								
								<button type="button" class="btn btn-light">
									<h5>
										Rs.<%=product.getPriceAfterDiscount()%>/- <span
											style="font-size: 15px; font-style: italic; text-decoration: line-through; color: red">
											<%=product.getProd_price()%> ,<%=product.getProd_discount()%>
											%off
										</span>
									</h5>
								</button>
								
                                       <button  class="primary-btn "
											onMouseOver="this.style.backgroundColor='#808080'"
											onMouseOut="this.style.backgroundColor='red'" 
											onclick="add_to_cart(<%=product.getId()%>, '<%=product.getProd_name()%>', <%=product.getPriceAfterDiscount()%>, '<%=product.getProd_imageName() %>')">
											 <i	class="fa fa-shopping-cart"></i>ADD TO CARD</button>
								<div>
									<a href="shoping-cart.jsp" class="btn btn-warning btn-sm mt-1">
										View CART </a>
								</div>



							</div> --%>
						</div>
					</div>
				</div>

				
			</div>

		</div>
	</section>
	<!-- Featured Section End -->


	<br>
	<br>
	<br>

	

	<footer  th:replace="/UserHeaderFooter/footer::userFooter"></footer>

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
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

</body>

</html>