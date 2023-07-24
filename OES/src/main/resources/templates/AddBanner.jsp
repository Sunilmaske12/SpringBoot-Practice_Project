<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="com.codeo.shop.Dao.CategoryDao"%>
<%@page import="java.util.List"%>
<%@page import="com.codeo.shop.entity.Category"%>
<!--  <%@ taglib uri="http://java.sun.com/jstl/core" prefix="c" %>   -->

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, user-scalable=0, minimal-ui">
<meta name="description"
	content="Apex admin is super flexible, powerful, clean &amp; modern responsive bootstrap 4 admin template with unlimited possibilities.">
<meta name="keywords"
	content="admin template, Apex admin template, dashboard template, flat admin template, responsive admin template, web app">
<meta name="author" content="PIXINVENT">
<title>OES Banner</title>
<link rel="apple-touch-icon" sizes="60x60"
	href="app-assets/img/ico/apple-icon-60.html">
<link rel="apple-touch-icon" sizes="76x76"
	href="app-assets/img/ico/apple-icon-76.html">
<link rel="apple-touch-icon" sizes="120x120"
	href="app-assets/img/ico/apple-icon-120.html">
<link rel="apple-touch-icon" sizes="152x152"
	href="app-assets/img/ico/apple-icon-152.html">
<link rel="shortcut icon" type="image/x-icon"
	href="app-assets/img/ico/favicon.ico">
<link rel="shortcut icon" type="image/png"
	href="app-assets/img/ico/favicon-32.png">
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="apple-touch-fullscreen" content="yes">
<meta name="apple-mobile-web-app-status-bar-style" content="default">
<link
	href="https://fonts.googleapis.com/css?family=Rubik:300,400,500,700,900|Montserrat:300,400,500,600,700,800,900"
	rel="stylesheet">
<!-- BEGIN VENDOR CSS-->
<!-- font icons-->
<link rel="stylesheet" type="text/css"
	href="app-assets/fonts/feather/style.min.css">
<link rel="stylesheet" type="text/css"
	href="app-assets/fonts/simple-line-icons/style.css">
<link rel="stylesheet" type="text/css"
	href="app-assets/fonts/font-awesome/css/font-awesome.min.css">
<link rel="stylesheet" type="text/css"
	href="app-assets/vendors/css/perfect-scrollbar.min.css">
<link rel="stylesheet" type="text/css"
	href="app-assets/vendors/css/prism.min.css">
<link rel="stylesheet" type="text/css"
	href="app-assets/vendors/css/tables/datatable/datatables.min.css">
<!-- END VENDOR CSS-->
<!-- BEGIN APEX CSS-->
<link rel="stylesheet" type="text/css" href="app-assets/css/app.css">

</head>

<body data-col="2-columns" class=" 2-columns ">

	<div class="wrapper nav-collapsed menu-collapsed">

		<%@include file="Asidebar.jsp"%>

		<%@include file="Navbar.jsp"%>

		<div class="main-panel">
			<div class="main-content">
				<div class="content-wrapper">

					<div class="mb-3">
						<a href="Banner.jsp"
							class="btn btn-raised gradient-crystal-clear white"><i
							class="fa fa-plus " aria-hidden="true"></i> View Banner list </a>
					</div>

					<section id="basic-form-layouts">
						<div class="row justify-content-md-center">
							<div class="col-md-6">
								<div class="card">
									<div style="border: 2px solid black; max-height: 70px;"
										class="card-header">
										<h4 class="card-title" id="basic-layout-card-center">Create
											Banner</h4>
									</div>
									<div class="card-body m-4">
										<div class="px-3">
											<!-- form start -->
											<form class="form" action="BannerOperation" method="post"
												enctype="multipart/form-data">
												<div class="form-body">
													<div class="form-group">
														<label for="eventRegInput1">Banner Name </label> <input
															type="text" id="eventRegInput1" class="form-control"
															name="b_name"
															value="<c:out value="${banner.banner_name}"></c:out>" />
													</div>
													<div class="form-group">
													<label>Action </label>
													 <select class="form-control"
														name="Action">

														<option value="Active">Active</option>
														<option value="In-Active">In-Active</option>

													</select>
												</div>
													<div class="form-group">
														<label>Select Banner Image </label> <input type="file"
															class="form-control" name="b_image"
															value='<c:out value="${banner.Banner_image}"></c:out>' />
													</div>
													
												</div>


												


												<div class="form-actions center">

													<button type="submit" class="btn btn-raised btn-primary">
														Upload</button>
												</div>

												<div>
													<h6>1. Upload File Size Not More than 2 MB.</h6>

													<h6>2. File Upload Before Getting Smaller Size From
														Tinypng.com</h6>

													<h6 style="color: red;">3. For Responsive slider
														upload image size in 2560*1436 pixels</h6>
												</div>
											</form>
										</div>
									</div>
								</div>
							</div>
						</div>

					</section>

				</div>
			</div>
		</div>
	</div>
	<!-- BEGIN VENDOR JS-->
	<script src="app-assets/vendors/js/core/jquery-3.2.1.min.js"
		type="text/javascript"></script>
	<script src="app-assets/vendors/js/core/popper.min.js"
		type="text/javascript"></script>
	<script src="app-assets/vendors/js/core/bootstrap.min.js"
		type="text/javascript"></script>
	<script src="app-assets/vendors/js/perfect-scrollbar.jquery.min.js"
		type="text/javascript"></script>
	<script src="app-assets/vendors/js/prism.min.js" type="text/javascript"></script>
	<script src="app-assets/vendors/js/jquery.matchHeight-min.js"
		type="text/javascript"></script>
	<script src="app-assets/vendors/js/screenfull.min.js"
		type="text/javascript"></script>
	<script src="app-assets/vendors/js/pace/pace.min.js"
		type="text/javascript"></script>
	<script src="app-assets/vendors/js/datatable/datatables.min.js"
		type="text/javascript"></script>
	<script src="app-assets/js/app-sidebar.js" type="text/javascript"></script>
	<script src="app-assets/js/notification-sidebar.js"
		type="text/javascript"></script>
	<script src="app-assets/js/customizer.js" type="text/javascript"></script>
	<script src="app-assets/js/data-tables/datatable-basic.js"
		type="text/javascript"></script>

</body>
</html>