<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="com.codeo.shop.entity.User"%>
<%@page import="java.sql.*"%>
<%@page import="com.codeo.shop.dbutil.ConnectionProvider"%>
<%@page import="com.codeo.shop.controller.RegistrationServlet"%>
<%@page import="com.codeo.shop.Dao.UserDaoImpl"%>
<%@page import="com.codeo.shop.Dao.UserDAO"%>

<!DOCTYPE html>
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
<title>Online Electrical Shopee </title>
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

<body>


	<%

//request.getAttribute("user");
Connection con = ConnectionProvider.getconnection();
     
UserDaoImpl userDAO = new UserDaoImpl();
int id = Integer.parseInt(request.getParameter("id"));
//User useredit= new User();
//useredit =userDAO.edituser(id);
 
//System.out.println(useredit.getId()+ " "+useredit.getUser_name());
String EDIT_USER = "select user_id, user_name, user_mobno, user_adderess, user_emailid, user_pass from user_registration where user_id="+id;
   
//String EDIT_USER = "select * from user_registraton where user_id="+id;
Statement statement = con.createStatement();
ResultSet  rs = statement.executeQuery(EDIT_USER);


   %>


<body data-col="2-columns" class=" 2-columns ">

	<div class="wrapper nav-collapsed menu-collapsed">
        <%@include file="Asidebar.jsp"%>
        <%@include file="Navbar.jsp"%>
        <div class="main-panel">
			<div class="main-content">
				<div class="content-wrapper">

  <div class="row match-height">
		<div class="col-md-12">
			<div class="card">
				<div class="card-header">
					<h4 class="card-title" id="basic-layout-form-center">Update Deatils</h4>
					</div>
				<div class="card-body">
					<div class="px-3">
             <%  
                  while(rs.next())
                     {
             %>
          <!-- user_id, user_name, user_mobno, user_adderess, user_emailid, , user_type -->           
                     	<form class="form" action="UpdateUser.jsp" method="post" >
							<div class="row justify-content-md-center">
								<div class="col-md-6">
									<div class="form-body">
									 <div class="form-group">
											<input type="hidden" id="eventInput1" class="form-control" name="id" value="<%=rs.getInt("user_id") %>">
										</div>  
										<div class="form-group">
											<label for="eventInput1">Full Name</label>
											<input type="text" id="eventInput1" class="form-control" name="name" value="<%=rs.getString("user_name")%>">
										</div>

										<div class="form-group">
											<label for="eventInput2">Contact</label>
											<input type="text" id="eventInput2" class="form-control" name="contact" value="<%=rs.getString("user_mobno")%>">
										</div>

										<div class="form-group">
											<label for="eventInput3">Address</label>
											<input type="text" id="eventInput3" class="form-control" name="Address" value="<%=rs.getString("user_adderess")%>">
										</div>

										<div class="form-group">
											<label for="eventInput4">Email</label>
											<input type="email" id="eventInput4" class="form-control" name="email" value="<%=rs.getString("user_emailid") %>">
										</div>

										<div class="form-group">
											<label for="eventInput5">Password</label>
											<input type="tel" id="eventInput5" class="form-control" name="Pass" value="<%=rs.getString("user_pass")%>">
										</div>

									</div>
								</div>
							</div>

							<div class="form-actions center">
								
								<button type="submit" class="btn btn-raised btn-primary">
								<i class="fa fa-check-square-o"></i> Submit
								</button>
							</div>
						</form>	
						<% } %>
					<!-- here close that scriplet tag -->
                      </div>		</div>
				</div>
			</div>
		</div>
	</div></div></div></div>
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