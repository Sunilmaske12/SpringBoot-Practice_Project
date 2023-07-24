<!DOCTYPE html>
<html lang="zxx" xmlns:th="http://www.thymeleaf.org">
<head>
<meta charset="UTF-8">
<meta name="description" content="Ogani Template">
<meta name="keywords" content="Ogani, unica, creative, html">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>OES blogs</title>

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
<link rel="stylesheet" href="css/style.css?v=1" type="text/css">
</head>

<body>
	<!-- Page Preloder -->
	<div id="preloder">
		<div class="loader"></div>
	</div>


	<header th:replace="/UserHeaderFooter/header::userHeader"></header>
	
	
	

	<!-- Blog Details Hero Begin -->
	<section class="blog-details-hero set-bg"
		data-setbg="img/banner/banner_blog.jpg">
		<div class="container">
			<div class="row">
				<div  class="col-lg-12">
					<div class="blog__details__hero__text">
						<h2>Welcome To OES Blogs</h2>
						
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Blog Details Hero End -->

	<!-- Blog Details Section Begin -->
	<section class="blog-details spad">
		<div class="container">
			<div class="row">
				
				<!-- 
						String blog_id=request.getParameter("blog");
			      	int blogid =Integer.parseInt(blog_id.trim());
						ProductDaoImp productdao = new ProductDaoImp();

						List<Blog> bloglist1 = productdao.getBlogsDetails(blogid);
						List<Blog> bloglist2 = productdao.getAllBlogs();
						for (Blog blog : bloglist1) {
							
							
						
						 -->
						
						
				<div class="col-lg-8 col-md-7 order-md-1 order-1" th:object="${blogDetails}">
					<div class="blog__details__text">
						<img th:src="@{'/img/blog/'+${blogDetails.Blog_name}}" alt="">
						<p th:text="${blogDetails.Blog_description}"></p>
					</div>
					<div class="blog__details__content">
						<div class="row">
							<div class="col-lg-6">
								<div class="blog__details__author">
									<div class="blog__details__author__pic">
										<img src="img/blog/details/details-author.jpg" alt="">
									</div>
									<div class="blog__details__author__text">
										<h6>Sanjay </h6>
										<span>Admin</span>
									</div>
								</div>
							</div>
							<div class="col-lg-6">
								<div class="blog__details__widget">
									<ul>
										<li><span>Categories:</span> Electrical Appliances</li>
										
									</ul>
									<div class="blog__details__social">
										<a href="#"><i class="fa fa-facebook"></i></a> <a href="#"><i
											class="fa fa-twitter"></i></a> <a href="#"><i
											class="fa fa-google-plus"></i></a> <a href="#"><i
											class="fa fa-linkedin"></i></a> <a href="#"><i
											class="fa fa-envelope"></i></a>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Blog Details Section End -->

	<!-- Related Blog Section Begin -->
	<section class="related-blog spad">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="section-title related-blog-title">
						<h2>Post You May Like</h2>
					</div>
				</div>
			</div>
			<div class="row">
	<!-- 
			for (Blog blog : bloglist2) {
				
				String blod_detail = blog.getBlog_description();
				String[] str = blod_detail.split(" ");
				String res = "";
				for (int i = 1; i <= 20; i++) {
					res = res + str[i] + " ";
				}
							
							
 -->
				<div class="col-lg-4 col-md-4 col-sm-6" 
				th:each="allBlog:${blogProduct }"
				>
					<div class="blog__item">
						<div class="blog__item__pic">
					<a th:href="@{'/blogDetails'+${allBlog.B_id}}">
							<img th:src="@{'/img/blog/'+${allBlog.Blog_name}}" alt="">
						</a></div>
						<div class="blog__item__text">
							<ul>
								<li><i class="fa fa-calendar-o"></i> dec 4,2022</li>
								<li><i class="fa fa-comment-o"></i> 5</li>
							</ul>
							<p th:text="${blogDetails.Blog_description }"></p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Related Blog Section End -->

	
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



</body>

</html>