<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@page import="com.codeo.shop.Dao.Contact_QueryDao"%>
<%@page import="com.codeo.shop.entity.chat"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.Date"%>
<!--   <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> -->

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
<title>Admin | Banner</title>
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="apple-touch-fullscreen" content="yes">
<meta name="apple-mobile-web-app-status-bar-style" content="default">


<%@include file="component/AllCssFIles.jsp"%>
</head>

<body data-col="2-columns" class=" 2-columns ">

	<div class="wrapper nav-collapsed menu-collapsed">

		<%@include file="Asidebar.jsp"%>
		<%@include file="Navbar.jsp"%>

		<div class="main-panel">
			<div class="main-content">
				<div class="content-wrapper">

					<div class="mb-3">
						<a class="btn btn-raised gradient-crystal-clear white"><i
							aria-hidden="true"></i> ALL QUERIES </a>
					</div>
					

<%
Contact_QueryDao cqd=new Contact_QueryDao();
List<chat> ticketlist = cqd.getAllTicketList();
%>
					<section id="shopping-cart">
						<div class="row">
							<div class="col-sm-12">
								<div class="card">
									<div class="card-body">
										<div style="margin:40px;" class="card-block">
											<table style="margin-top: 50px;" class="table table-responsive-md text-center ">
												<thead>
													<tr>
														<th>Sr.No.</th>
														<th>TICKET DATE</th>
														<th>TICKET ID</th>
														<th>CHATS</th>
														<th>STATUS</th>
													</tr>
												</thead>
												<% int i=0;
												for(chat ticket:ticketlist){
					                       			Date date=ticket.getTicket_date();
														i++; %>
												<tr>
													<td><%=i %> <%if(ticket.getSeen().equals("No")){ %><span style="color:red; font-size:80%;">new</span><%} %></td>
													<td><%=date%></td>
						
							                     <td><%=ticket.getTicketId()%></td>
													<td><a href="AdminChat.jsp?ticketId=<%=ticket.getTicketId()%>" type="button" style="color:white; font-family:Serif; " class="btn btn-primary btn-sm">MESSAGE</a></td>
												    <%if(ticket.getStatus().equals("Open")){%>
												    <td><div  class="btn-group">
															<a style="background: #00FF00;" type="button" class="btn btn-primary">OPEN</a>
															<button style="background: #00FF00;" type="button"
																class="btn btn-primary dropdown-toggle dropdown-toggle-split"
																data-toggle="dropdown"></button>
															<div class="dropdown-menu">
																 <a	 class="dropdown-item"  href="Status_Servlet?Action=closeChat&T_Id=<%=ticket.getTicketId()%>">CLOSED</a>
															</div>
														</div>
													</td>
													  
												  <%  } else if(ticket.getStatus().equals("Close")){%>
												   <td><div  class="btn-group">
															<a style="background: red; color:white; cursor:none;" type="button" class="btn btn-primary">CLOSED</a>
															
														</div>
													</td>
													   
												  <%  }else{%>
												   <td><div  class="btn-group">
															<button style="background: orange;" type="button" class="btn btn-primary">WAITING</button>
															<button style="background: orange;" type="button"
																class="btn btn-primary dropdown-toggle dropdown-toggle-split"
																data-toggle="dropdown"></button>
															<div class="dropdown-menu">
																<a  class="dropdown-item" href="Status_Servlet?Action=openChat&T_Id=<%=ticket.getTicketId()%>">OPEN</a>
																 <a	 class="dropdown-item"  href="Status_Servlet?Action=closeChat&T_Id=<%=ticket.getTicketId()%>">CLOSED</a>
															</div>
														</div>
													</td>
													   
												   <% } %>
												    
												    
												    

												</tr>

												<%
												}
												%>
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