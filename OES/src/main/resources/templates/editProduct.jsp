<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="com.codeo.shop.Dao.CategoryDao"%>
<%@page import="java.util.List"%>
<%@page import="com.codeo.shop.entity.Category"%>
<%@page import="com.codeo.shop.entity.Product"%>
<!--  <%@ taglib uri="http://java.sun.com/jstl/core" prefix="c" %>  -->

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
        <%@include file="Asidebar.jsp"%>
        <%@include file="Navbar.jsp"%>
        
        <div class="main-panel">
			<div class="main-content">
				<div class="content-wrapper">

 <%Product product = (Product)request.getAttribute("product") ; %>
 
  <div class="row match-height">
		<div class="col-md-12">
			<div class="card">
				<div class="card-header">
					<h4 class="card-title" id="basic-layout-form-center">Update Details</h4>
					</div>
				<div class="card-body">
					<div class="px-3">
           
           <!-- prod_id, prod_name, prod_description, prod_price, prod_discount, prod_quantity, prod_imageName, cid -->
                    	<form class="form" action="Productoperation?action=Update" method="post" enctype="multipart/form-data">
												<div class="form-body">
													<div class="form-group">
														<label for="eventRegInput1">Enter Product Name </label> <input
															type="text" id="eventRegInput1" class="form-control"
															name="p_name" value="<c:out value="${product.prod_name}"></c:out>" />
													
													</div>
                                                  <!--  
													<div class="form-group">
														<label for="eventRegInput1">Enter Product description </label>
														<textarea id="donationinput7" rows="5"
															class="form-control square" name="p_desc" value='<c:out value="${product.prod_description}"></c:out>' /></textarea>
													  </div>
                                                   -->
                                                       <div class="form-group">
														<label for="eventRegInput1">Enter Product description </label>
                                                       <textarea id="donationinput7" rows="5" class="form-control square" name="p_desc">
                                                       <c:out value="${product.prod_description}"></c:out> </textarea>
                                                       </div>
                                                       
													<div class="form-group">
														<label>Enter Product Price </label> <input type="text"
															class="form-control" name="p_price" value='<c:out value="${product.prod_price}"></c:out>' />
													</div>
													
													<div class="form-group">
														 <input type="hidden"
															class="form-control" name="id" value='<c:out value="${product.id}"></c:out>' />
													</div>

													<div class="form-group">
														<label>Enter Product Discount </label> <input type="text"
															class="form-control" name="p_discount"  value='<c:out value="${product.prod_discount}"></c:out>'
										 />
													</div>

													<div class="form-group">
														<label>Enter Product Quntity </label> <input type="text"
															class="form-control" name="p_quntity" value="<%=product.getProd_quantity() %> "/>
														
													</div>
                                    
													<div class="form-group">
													<!--  	<label>Select Product Image </label> -->
													 <input type="hidden" class="form-control" name="p_image" value='<c:out value="${product.prod_imageName}"></c:out>'/>
													</div>  
												</div>
                                              
                                             
                                              <div class="form-group">
 	                                               <label> Product Category </label> <input type="text"
															class="form-control" name="cid"
															value='<c:out value="${product.cid}"></c:out>' />
													</div>
                                              
		
												<div class="form-actions center">
													
													<button type="submit" class="btn btn-raised btn-primary">
														<i class="fa fa-check-square-o"></i>Save Changes
													</button>
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