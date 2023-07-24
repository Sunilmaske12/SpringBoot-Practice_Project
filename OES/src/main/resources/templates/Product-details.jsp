<!DOCTYPE html>
<html lang="zxx"  xmlns:th="http://www.thymeleaf.org">
<head>
<meta charset="UTF-8">
<meta name="description" content="Ogani Template">
<meta name="keywords" content="Ogani, unica, creative, html">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>Online Electrical Shopee</title>

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


	<jsp:include page="header.jsp" />
<!-- Toast msg -->
	<div id="toast">Error in cart</div>
	<!-- Toast msg end -->


	<!-- Breadcrumb Section Begin -->
	<section class="breadcrumb-section set-bg" data-setbg="img/Name-bg.jpg">
		<div class="container">
			<div class="row">
				<div class="col-lg-12 text-center">
					<div class="breadcrumb__text">
					<div class="breadcrumb__option">
							<a th:href="@{/}">Home</a> <a href="#">Product Details</a> 
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Breadcrumb Section End -->

	       

	<!-- Product Details Section Begin -->
	<section class="product-details spad">
	<div class="container"
		th:each="product:${product }"
		>
			<div class="row">
				<div class="col-lg-6 col-md-6">
					<div class="product__details__pic">
						<div class="product__details__pic__item">
							<!-- <img class="product__details__pic__item--large"
                                src="img/product/details/product-details-1.jpg" alt="">  -->

							<img class="product__details__pic__item--large"
								th:src="'img/latest-product/'+${product.Prod_imageName}"
								alt="">
						</div>
					</div>
				</div>
				<!--   complete here  -->
				<div class="col-lg-6 col-md-6">
					<div class="product__details__text">
						<h3 th:text="${product.Prod_name }"></h3>
						<div class="product__details__rating">
							<i class="fa fa-star"></i> <i class="fa fa-star"></i> <i
								class="fa fa-star"></i> <i class="fa fa-star"></i> <i
								class="fa fa-star-half-o"></i> <span>(18 reviews)</span>
						</div>
						<div class="product__details__price" th:text="'Rs. '+${product.PriceAfterDiscount+'/-' }">
							<span
								style="font-size: 15px; font-style: italic; text-decoration: line-through; color: red">
								<%=product.getProd_price() %> , <%=product.getProd_discount() %>
								off
							</span>
						</div>
						<p th:text="${product.Prod_description }">
						<div class="product__details__quantity">
						</div>
						<a style="color:white; cursor:pointer" onclick="add_to_cart(<%=product.getId()%>, '<%=product.getProd_name()%>', <%=product.getPriceAfterDiscount()%>, '<%=product.getProd_imageName() %>')"
						  class="primary-btn">ADD TO CARD</a>	  <a href="shoping-cart.jsp" style="height:50px; width:70px;" class="btn btn-warning btn-sm mt-1">  View CART </a>
								 <a onclick="likeProducts(<%=product.getId()%>, '<%=product.getProd_name()%>', <%=product.getPriceAfterDiscount()%>, '<%=product.getProd_imageName() %>')"
							style="cursor:pointer" class="heart-icon"><span class="icon_heart_alt"></span></a>
						<ul>
							<li><b>Availability</b> <span>In Stock</span></li>
							<li><b>Shipping</b> <span>01 day shipping. <samp>Free
										pickup today</samp></span></li>

							<li><b>Share on</b>
								<div class="share">
									<a href="#"><i class="fa fa-facebook"></i></a> <a href="#"><i
										class="fa fa-twitter"></i></a> <a href="#"><i
										class="fa fa-instagram"></i></a> <a href="#"><i
										class="fa fa-pinterest"></i></a>
								</div></li>
						</ul>
					</div>
				</div>
				<div class="col-lg-12">
					<div class="product__details__tab">
						<ul class="nav nav-tabs" role="tablist">
							<li class="nav-item"><a class="nav-link active"
								data-toggle="tab" href="#tabs-1" role="tab" aria-selected="true">Description</a>
							</li>
							<li class="nav-item"><a class="nav-link" data-toggle="tab"
								href="#tabs-2" role="tab" aria-selected="false">Information</a>
							</li>
							<li class="nav-item"><a class="nav-link" data-toggle="tab"
								href="#tabs-3" role="tab" aria-selected="false">Reviews <span>(1)</span></a>
							</li>
						</ul>
						<div class="tab-content">
							<div style="background:white;" class="tab-pane active" id="tabs-1" role="tabpanel">
								<div class="product__details__tab__desc">
									<h6>Products Infomation</h6>
									<p th:text="${product.Prod_description }">
									</p>
								</div>
							</div>
							
						</div>
					</div>
		</div>
			</div>
		</div>
	</section>
	<!-- Product Details Section End -->

	<!-- Related Product Section Begin  -->
		
		
	<section class="featured spad">
	<div
			style="display: flex; align-items: center; justify-content: center; background: red; height: 50px;">
			<div
				style="text-align: center; width: 230px; height: 49px; background: black;">
				<h4 style="color: white; padding: 12px;">Related Products</h4>
			</div>
		</div>
		<div class="container">
			
			<div class="row featured__filter">
				
				<div class="col-lg-3 col-md-4 col-sm-6 mix oranges fresh-meat"
				th:each="relatedProduct:${allProduct}"
				>
				<div style="border: 1px solid grey; " class="mt-5">
					<div class="featured__item m-4">
						<div  class="featured__item__pic set-bg"
							 style="background-image: url(&quot;img/latest-product/<%=catproduct.getProd_imageName() %>&quot;);">
								<a th:href="@{'/productDetails'+${relatedProduct.Id }+','+${relatedProduct.cid}}">
								<img style="max-height: 200px; height:auto; " class="center" th:src="'img/latest-product/'+${relatedProduct.Prod_imageName}">>
							    </a>
							<ul class="featured__item__pic__hover">
									<li><a onclick="likeProducts(<%=product.getId()%>, '<%=product.getProd_name()%>', <%=product.getPriceAfterDiscount()%>, '<%=product.getProd_imageName() %>')" ><i class="fa fa-heart"></i></a></li>
									<li><a><i class="fa fa-retweet"></i></a></li>
								</ul>
						</div>

						<div class="featured__item__text">
							<h5>
								<a th:href="@{'/productDetails'+${relatedProduct.Id }+','+${relatedProduct.cid}}"
									style="color: black" 
									th:text="${relatedProduct.Prod_name }"
									></a>
							</h5>
							<!--   <h6  th:text="${product.Prod_description }"></h6> -->
							<!--  <h5> <span>&#8377; </span><%=catproduct.getProd_price() %> </h5> <br> -->
							<button type="button" class="btn btn-light">
								<h5 th:text="${relatedProduct.PriceAfterDiscount }+' /-'">
									&#8377; <span
										style="font-size: 15px; font-style: italic; text-decoration: line-through; color: red">
										<%=product.getProd_price() %> ,<%=catproduct.getProd_discount() %>
										off
									</span>
								</h5>
							</button>
							
							<a  class="primary-btn" style="background-color: red; color:white;"  onMouseOver="this.style.backgroundColor='#808080'"
								onMouseOut="this.style.backgroundColor='red'"
									onclick="add_to_cart(<%=product.getId()%>, '<%=product.getProd_name()%>', <%=product.getPriceAfterDiscount()%>, '<%=product.getProd_imageName() %>')">
								 <i  class="fa fa-shopping-cart"></i>ADD TO CARD </a>
								 	 <div > <a href="shoping-cart.jsp" class="btn btn-warning btn-sm mt-1">  View CART </a></div>
								
						</div>
					</div>
					</div>
				</div>

			
			</div>

		</div>
	</section>
	 <!--  </section>  -->
	<!-- Related Product Section End -->

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