<!DOCTYPE html>
<html lang="zxx">
<%@page import="java.util.*"%>
<%@page import="com.codeo.shop.entity.Product"%>
<%@page import="com.codeo.shop.entity.Banner"%>
<%@page import="com.codeo.shop.entity.Category"%>
<%@page import="com.codeo.shop.Dao.CategoryDao"%>
<%@page import="com.codeo.shop.Dao.ProductDaoImp"%>
<%@page import="com.codeo.shop.Dao.ProductDao"%>
<%@page import="com.codeo.shop.Dao.BannerDao"%>
<head>
<meta charset="UTF-8">
<meta name="description" content="Ogani Template">
<meta name="keywords" content="Ogani, unica, creative, html">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>Online Electrical Shopee</title>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN"
	crossorigin="anonymous"></script>


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
<link rel="stylesheet" href="css/style.css?" type="text/css">
</head>

<body>


	<!-- Page Preloder -->
	<div id="preloder">
		<div class="loader"></div>
	</div>
	<jsp:include page="header.jsp" />
	<jsp:include page="CommonModal.jsp" />
	<!--  for product and category  -->

	<!-- Toast msg -->
	<div id="toast">Error in cart</div>
	<!-- Toast msg end -->

	<div style="margin-left: 30%" class="hero__search">
						<div class="hero__search__form" >
						 <form action="Search.jsp" method="post"> 
								<input type="text" id="search-box" class="form-control" name="ch" placeholder="What do yo u need?" onkeyup="getSuggestions(this.value)">
								<button type="submit" class="site-btn">SEARCH</button>
							 </form>  
						</div>
				</div>
	<!-- Breadcrumb Section Begin -->
	<section class="breadcrumb-section set-bg" data-setbg="img/Name-bg.jpg">
		<div class="container">
			<div class="row">
				<div class="col-lg-12 text-center">
					<div class="breadcrumb__text">
						<h2>Online Electrical Shopee</h2>
						<div class="breadcrumb__option">
							<a href="./index.jsp">Home</a> <span>Shop</span>
						</div>
					</div>
				</div>
			</div>
			
		</div>
		
	</section>
	<!-- Breadcrumb Section End -->
	

	<%
	String ch =request.getParameter("ch");
	CategoryDao categorydao = new CategoryDao();
	List<Category> clist = categorydao.getCategoryList();
	ProductDao productdao = new ProductDaoImp();
	
	//String cat = request.getParameter("category");
	List<Product> prodlist = productdao.getProductBySearch(ch);
	
	%>



	<!--   Featured Section Begin -->
	<section>
		<div class="container">
			<div style="padding-top: 70px;" class="row featured__filter">
				<div class="col-lg-3">
					<div class="hero__categories">
						<div class="hero__categories__all">
							<span><a style="color: white">AVAILABLE CATEGORIES </a> </span><br>
						</div>
						<ul><li><a href="shop-grid.jsp"
								onMouseOver="this.style.color='red'"
								onMouseOut="this.style.color='black'"> ALL CATEGORIES
							</a></li>
							<%
							for (Category c : clist) {
							%>
							<li><a href="shop-grid.jsp?category=<%=c.getId()%>"
								onMouseOver="this.style.color='red'"
								onMouseOut="this.style.color='black'"> <%=c.getCat_title().toUpperCase()%>
							</a></li>
							<%
							}
							%>
						</ul>
					</div>
				</div>
				
				<%
				// List<Product> list = productdao.getAllProducts();
				for (Product product : prodlist) {
				%>
				<div class="col-lg-3 col-md-4 col-sm-6 mix oranges fresh-meat ">
					<div style="border: 1px solid grey;" class="mt-5">
						<div class="featured__item m-4 ">



							<div class="featured__item__pic set-bg "
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

								<button class="primary-btn "
									onMouseOver="this.style.backgroundColor='#808080'"
									onMouseOut="this.style.backgroundColor='red'"
									onclick="add_to_cart(<%=product.getId()%>, '<%=product.getProd_name()%>', <%=product.getPriceAfterDiscount()%>, '<%=product.getProd_imageName()%>')">
									<i class="fa fa-shopping-cart"></i>ADD TO CARD
								</button>
								<div>
									<a href="shoping-cart.jsp" class="btn btn-warning btn-sm mt-1">
										View CART </a>
								</div>



							</div>
						</div>
					</div>
				</div>

				<%
				}
				%>

			</div>

		</div>
	</section>
	<!-- Featured Section End -->


	<br>
	<br>
	<br>

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
	<script type="text/javascript" src="js/CommonScript.js"></script>

</body>

</html>