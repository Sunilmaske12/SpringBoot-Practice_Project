
<!DOCTYPE html>
<html xmlns:th="http://www.thymeleaf.org">
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
<title>Basic DataTables - Apex responsive bootstrap 4 admin
	template</title>
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

		<aside th:replace="/UserHeaderFooter/Asidebar::Asidebar"></aside> 
	<nav th:replace="/UserHeaderFooter/Navbar::Navbar"></nav>
		

		<div class="main-panel">
			<div class="main-content">
				<div class="content-wrapper">

					<!-- Basic form layout section start -->

					<div class="mb-3">
						<a href="Adding_Category.jsp"
							class="btn btn-raised gradient-crystal-clear white"><i
							class="fa fa-plus " aria-hidden="true"></i> Add Category </a>

					</div>

					<section id="shopping-cart">
						<div class="row">
							<div class="col-sm-12">
								<div class="card">
									<div class="card-header">
										<h4 class="card-title">
											<b>Category List </b>
										</h4>
									</div>
									<div class="card-body">
										<div class="card-block">

											<table class="table table-responsive-md text-center ">
												<thead>
													<tr>
														<th>Sr <br> No
														</th>
														<th>Title</th>
														<th>Description</th>
														<th>Action</th>
													</tr>
												</thead>
												<tr th:each="allCategories,status:${allCategories }">
													<td th:text="${status.index+1 }"></td>
													<td th:text="${allCategories.Cat_title }"></td>
													<td th:text="${allCategories.cat_description }"></td>

													<td><a
														th:href="@{'/Admin/deleteCategory'+${allCategories.Id}}"><i
															class="ft-trash font-medium-3 red"></i>Delete</a> || <!--   <td> <a  href="EditCategory.jsp?id=<%=resultset.getString(1) %>"><i class="ft-edit orange"></i></a> </td> -->
														<a th:href="@{'/editCategory'+${allCategories.Id}} "><i
															class="ft-edit orange"></i>Edit</a></td>
												<tr>
												</tr>

											</table>
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
	<!-- BEGIN VENDOR JS-->
	<!-- BEGIN PAGE VENDOR JS-->
	<script src="app-assets/vendors/js/datatable/datatables.min.js"
		type="text/javascript"></script>
	<!-- END PAGE VENDOR JS-->
	<!-- BEGIN APEX JS-->
	<script src="app-assets/js/app-sidebar.js" type="text/javascript"></script>
	<script src="app-assets/js/notification-sidebar.js"
		type="text/javascript"></script>
	<script src="app-assets/js/customizer.js" type="text/javascript"></script>
	<!-- END APEX JS-->
	<!-- BEGIN PAGE LEVEL JS-->
	<script src="app-assets/js/data-tables/datatable-basic.js"
		type="text/javascript"></script>
	<!-- END PAGE LEVEL JS-->
</body>
</html>