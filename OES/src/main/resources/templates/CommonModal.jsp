

<%@page import="java.util.*"%>
<%@page import="com.codeo.shop.dbutil.ConnectionProvider"%>
<%@page import="com.codeo.shop.Dao.UserDaoImpl"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>



<style>
.my_profile {
	color: red;
	position: center;
}

.table table-user-information {
	-webkit-text-size-adjust: 100%;
	-webkit-tap-highlight-color: rgba(0, 0, 0, 0);
	font-family: "Helvetica Neue", Helvetica, Arial, sans-serif;
	font-size: 14px;
	line-height: 1.42857143;
	color: #333;
	box-sizing: border-box;
	border-spacing: 0;
	border-collapse: collapse;
	background-color: transparent;
	width: 100%;
	max-width: 100%;
	margin-bottom: 0;
}

.form-control {
	display: block;
	width: 100%;
	padding: 0.375rem 0.75rem;
	font-size: 1rem;
	font-weight: 400;
	line-height: 1.5;
	color: #212529;
	background-color: #fff;
	background-clip: padding-box;
	border: 1px solid #ced4da;
	-webkit-appearance: none;
	-moz-appearance: none;
	appearance: none;
	border-radius: 0.25rem;
	-webkit-transition: border-color 0.15s ease-in-out, -webkit-box-shadow
		0.15s ease-in-out;
	transition: border-color 0.15s ease-in-out, -webkit-box-shadow 0.15s
		ease-in-out;
	transition: border-color 0.15s ease-in-out, box-shadow 0.15s ease-in-out;
	transition: border-color 0.15s ease-in-out, box-shadow 0.15s ease-in-out,
		-webkit-box-shadow 0.15s ease-in-out;
}

.form-control {
	padding: 12px;
	border-radius: 22px;
	font-size: 14px;
}

select {
	word-wrap: normal;
}

button, select {
	text-transform: none;
}

input, button, select, optgroup, textarea {
	margin: 0;
	font-family: inherit;
	font-size: inherit;
	line-height: inherit;
}
</style>

</head>
<body>


	<%
	HttpSession session2 = request.getSession();
	String user_name = (String) session2.getAttribute("UserName");

	if (user_name == null) {
	%>
	<!-- login modal if user=null -->
	<div class="modal" tabindex="-1" id="UserProfile">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h3 class="modal-title">My Profile</h3>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<h4>You are not login, login first.</h4>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-bs-dismiss="modal">Close</button>
					<a href="loginfrom.jsp"><button type="button"
							class="btn btn-primary">Login</button></a> <a
						href="RegistrationForm.jsp"><button type="button"
							class="btn btn-primary">Register</button></a>
				</div>
			</div>
		</div>
	</div>





	<%
	return;
	}
	%>



	<!-- My Profile modal Start-->


	<!--My Profile Modal-user -->
	<div class="modal fade" id="UserProfile" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h3 class="my_profile" id="exampleModalLabel">My Profile</h3>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<div>
						<section style="background-color: #eee;">

							<div class="card mb-4">
							<%
									int user_id = (int) session2.getAttribute("userid");
							UserDaoImpl udi=new UserDaoImpl();
							ResultSet rs=udi.getUserbyId(user_id);
							
																		while (rs.next()) {
										String User_MoNo = String.valueOf(rs.getString("user_mobno"));
									%>
							<form action="edit_user?id=<%=rs.getInt("user_id")%>" method="post">
								<div>
									
									<div class="card-body text-center" style="text-align: center;">
										<img src="img/hero/icon.png" alt="avatar"
											class="rounded-circle img-fluid" style="width: 150px;">
									</div>

									
									<table class="table table-user-information">
											<tbody>
												<tr>
													<td><strong> <span
															class="glyphicon glyphicon-asterisk text-primary"></span>
															Full Name
													</strong></td>

													<td class="text-primary">: <input type="text"
														name="name" value="<%=rs.getString("user_name")%>" /></td>
												</tr>
												<tr>
													<td><strong> <span
															class="glyphicon glyphicon-asterisk text-primary"></span>
															Contact Details
													</strong></td>
													<td class="text-primary">: <input type="text"
														name="Mobile" value="<%=User_MoNo%>" /></td>
												</tr>
												<tr>
													<td><strong> <span
															class="glyphicon glyphicon-asterisk text-primary"></span>
															Email Id
													</strong></td>
													<td class="">: 
													<%=rs.getString("user_emailid")%></td>
												</tr>
												<tr>
													<td><strong> <span
															class="glyphicon glyphicon-asterisk text-primary"></span>
															Addresss
													</strong></td>
													<td class="text-primary">: <input type="text"
														name="address" value="<%=rs.getString("user_adderess")%>" /></td>
												</tr>
											</tbody>
										</table>



								</div>
								<input type="hidden" value="user" name="page"> 
								<div class="modal-footer">
								<button  id='closeModal' type="button" class="btn btn-danger"
										data-bs-dismiss="modal">Close</button>
									<button type="submit" class="btn btn-primary">Update</button>
									
								</div>

								</form>
							</div>
						</section>
					</div>
				</div>
			</div>
		</div>

	</div>

	<!-- My Profile end -->





	<!-- Profile Modal-admin -->
	<div class="modal fade" id="AdminProfile" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h3 class="my_profile" id="exampleModalLabel">Update Profile
						Info</h3>
					<button type="button" class="btn-close" data-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<div>
						<section style="background-color: #eee;">

							<div class="card mb-4">
								<form action="edit_user?id=<%=rs.getInt("user_id")%>" method="post">
									<div>
										<div class="card-body text-center" style="text-align: center;">
											<img src="img/hero/icon.png" alt="avatar"
												class="rounded-circle img-fluid" style="width: 150px;">
										</div>


										<table class="table table-user-information">
											<tbody>
												<tr>
													<td><strong> <span
															class="glyphicon glyphicon-asterisk text-primary"></span>
															Full Name
													</strong></td>

													<td class="text-primary">: <input type="text"
														name="name" value="<%=rs.getString("user_name")%>" /></td>
												</tr>
												<tr>
													<td><strong> <span
															class="glyphicon glyphicon-asterisk text-primary"></span>
															Contact Details
													</strong></td>
													<td class="text-primary">: <input type="text"
														name="Mobile" value="<%=User_MoNo%>" /></td>
												</tr>
												<tr>
													<td><strong> <span
															class="glyphicon glyphicon-asterisk text-primary"></span>
															Email Id
													</strong></td>
													<td class="text-primary">:<%=rs.getString("user_emailid")%>
												</tr>
												<tr>
													<td><strong> <span
															class="glyphicon glyphicon-asterisk text-primary"></span>
															Addresss
													</strong></td>
													<td class="text-primary">: <input type="text"
														name="address" value="  <%=rs.getString("user_adderess")%>" /></td>
												</tr>
											</tbody>
										</table>


										<%
										}
										%>

									</div>
									<input type="hidden" value="Admin" name="page"> 
									<div class="modal-footer">
										<button  id='closeModal' type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
										<button type="submit" class="btn btn-primary" >Update </button>
										
									</div>
								</form>
							</div>
						</section>
					</div>
				</div>
			</div>
		</div>

	</div>

	<!-- My Profile end -->




	<!-- Set address during making orders modal start -->


	<!-- Modal -->
	<div class="modal fade" id="AddNewAddress" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div style="padding: 20px" class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title" id="exampleModalLabel">Add New Address</h4>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<form class="addressForm" id="validAddress" onsubmit="return validAddress()"
						action="SaveAddress?user_id=<%=user_id%>" method="post">
						<input type="hidden" name="_token"
							value="7izNrBqYjX16Icbzz1Vn8FgvFZk2Gjn6Ty3VcVjT"> <input
							type="hidden" value="website-checkout-shipping-address"
							name="page">
						<div class="row">
							<div class="col-md-12">
								<div class="form-group">
									<label>Full Name</label> <input type="text" name="name"
										class="form-control" value="" required>
								</div>
							</div>
							<div class="col-md-6">
								<div class="form-group">
									<label>Contact</label> <input type="text" name="mobile" id="mobileno"
										class="form-control"
										onkeypress="INGENIOUS.numericInput(event)" value="" required>
										<small id="contact_error" style="color:red; margin-left:10px;" ></small>
								</div>
							</div>
							<div class="col-md-6">
								<div class="form-group">
									<label>Email</label> <input type="email" name="email"
										class="form-control" value="" required>
								</div>
							</div>
							<div class="col-md-12">
								<div class="form-group">
									<textarea name="address" placeholder="Enter Your Address"
										class="form-control" cols="30" rows="4" required></textarea>
								</div>
							</div>
							<div class="col-md-6">
								<div class="form-group">
									<label>Landmark</label> <input type="text" name="landmark"
										class="form-control" value="" required>
								</div>
							</div>
							<div class="col-md-6">
								<div class="form-group">
									<label>Address Type</label> <select name="addresstype"
										class="form-control" required>
										<option value="Home">Home</option>
										<option value="Office">Office</option>
										<option value="Other">Other</option>
									</select>
								</div>
							</div>
							<div class="col-md-4">
								<div class="form-group">
									<label>City</label> <input type="text" name="city"
										class="form-control" value="" required>
								</div>
							</div>

							<div class="col-md-4">
								<div class="form-group">
									<label>Pincode</label> <input type="text" id="pincode" name="pincode"
										class="form-control"
										onkeypress="INGENIOUS.numericInput(event)" value="" required>
										<small id="pin_error" style="color:red; text-align:center;" ></small>
								</div>
							</div>

						</div>
						<div class="modal-footer">
							<div class="col-md-12 text-center">
								<button type="submit" class="btn btn-danger">Save</button>
								<button type="button" class="btn btn-primary"
									data-bs-dismiss="modal">Close</button>
							</div>

						</div>
					</form>
				</div>

			</div>
		</div>
	</div>
	<!-- Set address during making orders modal end -->



	<!-- Edit address during making orders modal start -->


	<!-- Modal -->
	<div class="modal fade" id="EditAddress" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div style="padding: 20px" class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title" id="exampleModalLabel">Edit Address</h4>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<form class="addressForm"
						action="SaveAddress?user_id=<%=user_id%>" method="post">
						<input type="hidden" name="_token"
							value="7izNrBqYjX16Icbzz1Vn8FgvFZk2Gjn6Ty3VcVjT"> <input
							type="hidden" value="website-checkout-shipping-address"
							name="page">
						<div class="row">
							<div class="col-md-12">
								<div class="form-group">
									<label>Full Name</label> <input type="text" name="name"
										class="form-control" value="" required>
								</div>
							</div>
							<div class="col-md-6">
								<div class="form-group">
									<label>Contact</label> <input type="text" name="mobile"
										class="form-control"
										 value="" required>
								</div>
							</div>
							<div class="col-md-6">
								<div class="form-group">
									<label>Email</label> <input type="email" name="email"
										class="form-control" value="" required>
								</div>
							</div>
							<div class="col-md-12">
								<div class="form-group">
									<textarea name="address" placeholder="Enter Your Address"
										class="form-control" cols="30" rows="4" required></textarea>
								</div>
							</div>
							<div class="col-md-6">
								<div class="form-group">
									<label>Landmark</label> <input type="text" name="landmark"
										class="form-control" value="">
								</div>
							</div>
							<div class="col-md-6">
								<div class="form-group">
									<label>Address Type</label> <select name="addresstype"
										class="form-control" required>
										<option value="Home">Home</option>
										<option value="Office">Office</option>
										<option value="Other">Other</option>
									</select>
								</div>
							</div>
							<div class="col-md-4">
								<div class="form-group">
									<label>City</label> <input type="text" name="city"
										class="form-control" value="" required>
								</div>
							</div>

							<div class="col-md-4">
								<div class="form-group">
									<label>Pincode</label> <input type="text" name="pincode"
										class="form-control"
										 value="" required>
								</div>
							</div>

						</div>
						<div class="modal-footer">
							<div class="col-md-12 text-center">
								<button type="submit" class="btn btn-danger">Save</button>
								<button type="button" class="btn btn-primary"
									data-bs-dismiss="modal">Close</button>
							</div>

						</div>
					</form>
				</div>

			</div>
		</div>
	</div>
	<!-- Edit address during making orders modal end -->

</body>
</html>