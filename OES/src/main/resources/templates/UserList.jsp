
<!DOCTYPE html>
<html  xmlns:th="http://www.thymeleaf.org">

<head>
<title>All Users</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, user-scalable=0, minimal-ui">
<meta name="description"
	content="Apex admin is super flexible, powerful, clean &amp; modern responsive bootstrap 4 admin template with unlimited possibilities.">
<meta name="keywords"
	content="admin template, Apex admin template, dashboard template, flat admin template, responsive admin template, web app">
<meta name="author" content="PIXINVENT">
<link rel="apple-touch-icon" sizes="60x60"	href="app-assets/img/ico/apple-icon-60.html">
<link rel="apple-touch-icon" sizes="76x76"	href="app-assets/img/ico/apple-icon-76.html">
<link rel="apple-touch-icon" sizes="120x120" href="app-assets/img/ico/apple-icon-120.html">
<link rel="apple-touch-icon" sizes="152x152"  href="app-assets/img/ico/apple-icon-152.html">
<link rel="shortcut icon" type="image/x-icon"  href="app-assets/img/ico/favicon.ico">
<link rel="shortcut icon" type="image/png"	href="app-assets/img/ico/favicon-32.png">
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="apple-touch-fullscreen" content="yes">
<meta name="apple-mobile-web-app-status-bar-style" content="default">
<link
	href="https://fonts.googleapis.com/css?family=Rubik:300,400,500,700,900|Montserrat:300,400,500,600,700,800,900" rel="stylesheet">
<!-- BEGIN VENDOR CSS-->
<!-- font icons-->
<link rel="stylesheet" type="text/css"	href="app-assets/fonts/feather/style.min.css">
<link rel="stylesheet" type="text/css"	href="app-assets/fonts/simple-line-icons/style.css">
<link rel="stylesheet" type="text/css"  href="app-assets/fonts/font-awesome/css/font-awesome.min.css">
<link rel="stylesheet" type="text/css"	href="app-assets/vendors/css/perfect-scrollbar.min.css">
<link rel="stylesheet" type="text/css"	href="app-assets/vendors/css/prism.min.css">
<link rel="stylesheet" type="text/css"	href="app-assets/vendors/css/tables/datatable/datatables.min.css">
<!-- END VENDOR CSS-->
<!-- BEGIN APEX CSS-->
<link rel="stylesheet" type="text/css" href="app-assets/css/app.css">

</head>

<body data-col="2-columns" class=" 2-columns ">

	<div class="wrapper nav-collapsed menu-collapsed">
	<%  NotificationDao.seenUser(); %>
		
		<aside th:replace="/UserHeaderFooter/Asidebar::Asidebar"></aside> 
	<nav th:replace="/UserHeaderFooter/Navbar::Navbar"></nav>
		

		<div class="main-panel">
			<div class="main-content">
				<div class="content-wrapper">

					<section id="shopping-cart">
						<div class="row">
							<div class="col-sm-12">
								<div  class="card">
									<div  class="card-header">
										<h4 class="card-title">
											<b> List of Users </b>
										</h4>
							    </div>
									<div style="margin:40px;" class="card-body">
										<div class="card-block">

											<table class="table table-responsive-md text-center ">
												<thead>
													<tr>  <tr>
														<th>SrNo</th>
														<th>Name</th>
														<th>Mobile No</th>
														<th>Address</th>
														<th>Email</th>
														<th>Password</th>
														<th>Action</th>
                                                     </tr>
												</thead>
              	<tr th:each="userList,status:${userList }">
									            	<td th:text="${status.index+1 }"></td>
													<td th:text="${userList.user_name }"></td>
													<td th:text="${userList.user_mobno }"></td>
													<td th:text="${userList.user_adderess }"></td>
													<td th:text="${userList.user_emailid }"></td>
													<td th:text="${userList.user_pass }"></td>

		<td><a th:href="@{'/userOperation'+','+'DELETE'+','+${userList.id }}"><i class="ft-trash font-medium-3 red"></i></a>|| 
		<a th:href="@{'/userOperation'+','+'EDIT'+','+${userList.id }}"><i class="ft-edit orange"></i></a></td>	</tr>
							

							<!--  <td><a  href="edit?id=<c:out value='${user.id}' />"><i class="ft-trash font-medium-3 red"></i></a> ||
                            <a  href="delete?id=<c:out value='${user.id}' />"><i class="ft-edit orange"></i></a> </td>    -->

			                     
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

	<script src="app-assets/vendors/js/core/jquery-3.2.1.min.js"  type="text/javascript"></script>
	<script src="app-assets/vendors/js/core/popper.min.js"	type="text/javascript"></script>
	<script src="app-assets/vendors/js/core/bootstrap.min.js"  type="text/javascript"></script>
	<script src="app-assets/vendors/js/perfect-scrollbar.jquery.min.js" type="text/javascript"></script>
	<script src="app-assets/vendors/js/prism.min.js" type="text/javascript"></script>
	<script src="app-assets/vendors/js/jquery.matchHeight-min.js" type="text/javascript"></script>
	<script src="app-assets/vendors/js/screenfull.min.js"  	type="text/javascript"></script>
	<script src="app-assets/vendors/js/pace/pace.min.js"  type="text/javascript"></script>
	<!-- BEGIN VENDOR JS-->
	<!-- BEGIN PAGE VENDOR JS-->
	<script src="app-assets/vendors/js/datatable/datatables.min.js"  type="text/javascript"></script>
	<!-- END PAGE VENDOR JS-->
	<!-- BEGIN APEX JS-->
	<script src="app-assets/js/app-sidebar.js" type="text/javascript"></script>
	<script src="app-assets/js/notification-sidebar.js"  type="text/javascript"></script>
	<script src="app-assets/js/customizer.js" type="text/javascript"></script>
	<!-- END APEX JS-->
	<!-- BEGIN PAGE LEVEL JS-->
	<script src="app-assets/js/data-tables/datatable-basic.js" type="text/javascript"></script>
	<!-- END PAGE LEVEL JS-->
        </body>
</html>