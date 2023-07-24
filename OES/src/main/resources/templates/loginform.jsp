
<%
HttpSession session3 = request.getSession();
session3.removeAttribute("UserName");
session3.removeAttribute("usertype");
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>Login Form</title>


<!-- Main css -->
<link rel="stylesheet" href="AdminPanel/css/style.css">




<meta charset="UTF-8">
<link rel="apple-touch-icon" type="image/png"
	href="https://cpwebassets.codepen.io/assets/favicon/apple-touch-icon-5ae1a0698dcc2402e9712f7d01ed509a57814f994c660df9f7a952f3060705ee.png">

<meta name="apple-mobile-web-app-title" content="CodePen">

<link rel="shortcut icon" type="image/x-icon"
	href="https://cpwebassets.codepen.io/assets/favicon/favicon-aec34940fbc1a6e787974dcd360f2c6b63348d4b1f4e06c77743096d55480f33.ico">

<link rel="mask-icon" type="image/x-icon"
	href="https://cpwebassets.codepen.io/assets/favicon/logo-pin-b4b4269c16397ad2f0f7a01bcdf513a1994f4c94b8af2f191c09eb0d601762b1.svg"
	color="#111">




<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.2.0/css/all.css">


<style>
.social-login-icon {
	padding: 0px 10px;
	text-decoration: none;
	font-size: 30px;
}

.socials {
	display: flex;
}
</style>
</head>
<body>

	<div class="main">
		<!-- Sing in  Form -->
		<section class="sign-in">
			<div class="container">
				<div class="signin-content">
					<div class="signin-image">

						<figure>
							<img src="AdminPanel/images/signin-image.jpg" alt="sing up image" />
						</figure>
						<a href="RegistrationForm.jsp" class="signup-image-link"><b>
								Create an account</b></a>
								
								


					</div>
					
					
					<div>
						<div class="signin-form">
							<h2 class="form-title">Online Eletrical Shopee</h2>

							<%@include file="message.jsp"%>
							
							<form method="post" action="Login" class="register-form"
								id="login-form">
								
								<div class="form-group">
									<label for="username"><i
										class="fa fa-regular fa-envelope"></i></label> <input type="text"
										name="Email"  placeholder="Email" />
								</div>
								<div class="form-group">
									<label for="password"><i class="fa fa-solid fa-lock"></i></label>
									<input type="password" name="password" 	placeholder="Password" />
								</div>




								<input type="hidden" name="user_type" value="Normal_User">
								<%
								String errorMessage = (String) request.getAttribute("errorMessage");
								if (errorMessage != null && !errorMessage.isEmpty()) {
								%>
								<p style="color: red;">
									<%=request.getAttribute("errorMessage")%>
								</p>
								<%
								}
								%>
								<!-- 	
					<tr> <td>User Type:</td>
					  <td>
                    <select name="userType">
                        <option value="admin">Admin</option>
                        <option value="user">User</option>
                    </select>  </td> </tr> -->

								<div class="form-group">
									<a href="forgotPassword.jsp" class="signup-image-link"><b>
								Forgot Password</b></a>
								</div>
								
								<div class="form-group form-button">
									<input type="submit" name="signin" id="signin"
										class="form-submit" value="Log in"
										style="font-size: 20px; padding: 14px 25px;" />

								</div>
								
							</form>
							
							
							<div>
								<h3>
									<span>Or login with</span>
									
								</h3>
								<ul class="socials">


									<li><a href="#" class="social-login-icon fab fa-instagram"></a></li>
									<li><a href="#" class="social-login-icon fab fa-facebook"></a></li>
									<li><a href="#" class="social-login-icon fab fa-twitter"></a></li>
								</ul>

							</div>
						</div>
					</div>
				</div>
			</div>
		</section>
	</div>


	<!-- JS -->
	<script src="vendor/jquery/jquery.min.js"></script>
	<script src="js/main.js"></script>
</body>
</html>