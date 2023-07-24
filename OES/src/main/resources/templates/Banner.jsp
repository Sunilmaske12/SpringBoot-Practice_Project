
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
<title>Admin | Banner</title>
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="apple-touch-fullscreen" content="yes">
<meta name="apple-mobile-web-app-status-bar-style" content="default">
<!-- all  CSS-->
<%@include file="component/AllCssFIles.jsp" %>
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

					<div class="mb-3">
						<a th:href="@{/addBanner}"
							class="btn btn-raised gradient-crystal-clear white"><i
							class="fa fa-plus " aria-hidden="true"></i> Create New </a>
					</div>
                    <section id="shopping-cart">
						<div class="row">
							<div class="col-sm-12">
								<div class="card">
									<div class="card-header">
										<h4 class="card-title">Banners</h4>
									</div>
									<div class="card-body">
										<div class="card-block">
											<table class="table table-responsive-md text-center ">
												<thead>
													<tr>
														<th>Banner<br>No
														</th>
														<th> Name</th>
														<th>Created At</th>
														<th>Status</th>
														<th>Image</th>
														<th>Action</th>
                                                   </tr>
												</thead>
											
                        	        <tr th:each="banner,status :${Banner }" >
											<td th:text="${status.index}"></td>
													<td th:text="${banner.Banner_name }"></td>
													<td  th:text="${banner.Date }"></td>
													<td  >
													<div th:if="${banner.Action == 'Active'}">>
															<button  type="button" class="btn btn-success">Active</button>
															<button  type="button"
																class="btn btn-success dropdown-toggle dropdown-toggle-split"
																data-toggle="dropdown"></button>
															<div class="dropdown-menu">
																<a  class="dropdown-item" th:href="@{'/statusServlet'+','+inactive+','+${banner.Banner_no }}">In-Active</a>
															</div>
														</div>
													
													
													
													<div th:unless="${banner.Action == 'Active'}">>
															<button  type="button" class="btn btn-danger">In-Active</button>
															<button  type="button"
																class="btn btn-danger dropdown-toggle dropdown-toggle-split"
																data-toggle="dropdown"></button>
															<div class="dropdown-menu">
																<a  class="dropdown-item" th:href="@{'/statusServlet'+','+Active+','+${banner.Banner_no }}">Active</a>
															</div>
														</div>
													
													
													
													
													<td><a th:href="@{'/img/banner/'+${banner.Banner_image}}"><button type="button" class="btn btn-primary">View Image</button></a></td>
                                                   
												 <td><a	th:href="@{'/deleteBanner'+${banner.Banner_no}}"><button type="button" class="btn btn-danger">Delete</button> </a></td>
													
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
   <script src="app-assets/vendors/js/datatable/datatables.min.js"
		type="text/javascript"></script>
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