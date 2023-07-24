
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>Forgot Password</title>


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


<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN"
	crossorigin="anonymous"></script>



<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.2.0/css/all.css">


</head>
<body>

	<div class="main">
		<!-- Sing in  Form -->
		<section   class="sign-in">
			<div style="max-width: 900px; max-height:900px;" class="container">
				<div style="text-align: center; padding: 20px;">
					<h2 class="form-title">FORGOT PASSWORD</h2>
				</div>
				<div class="signin-content">




					<div  class="signin-form">


						<%@include file="message.jsp"%>

						<form method="post" action="forgotPassword" class="register-form"
							id="login-form">
							<div style="padding: 10px; font-size: 50px;">
								<p>ENTER YOUR REGISTER EMAIL ID</p>
							</div>
							<div class="form-group">
								<label for="username"><i
									class="fa fa-regular fa-envelope"></i></label> <input type="text"
									name="email" id="email-for-pass"  placeholder="Email" required/>
							</div>


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



							<div class="form-group form-button">
								<button class="btn btn-success" type="submit">Get New
									Password</button>
								<a href="loginfrom.jsp" class="btn btn-danger">Back to Login</a>

							</div>

						</form>


					</div>

					<div class="signup-image">

						<figure>
							<img src="AdminPanel/images/signup-image.jpg" alt="sing up image" />
						</figure>

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