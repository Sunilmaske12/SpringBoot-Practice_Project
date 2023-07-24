
<!DOCTYPE html>
<html lang="en"  xmlns:th="http://www.thymeleaf.org">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>Register Form</title>

<!-- Font Icon -->

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/material-design-iconic-font/2.2.0/css/material-design-iconic-font.min.css">
<!-- Main css -->
<link rel="stylesheet" href="AdminPanel/css/style.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/jquery-validation@1.19.5/dist/jquery.validate.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<style type="text/css">
	.error{
		padding: 10px;
		color: red;
	}
.success{
	margin-bottom: 25px;
	margin-left:10px;
	
}

</style>
</head>
<body >

	<div>
		<div class="main">
			<section class="signup">
				<div class="container">
					<div class="signup-content">
						<div class="signup-form">
							<h2 class="form-title">REGISTER</h2>

							<form th:action="@{/registerUser}" th:object="${User}" method="post" onsubmit="return validRegister()"  class="register-form"
								id="register-form" >
								
								<!-- changes current -->
								<div class="form-group">
									
									<label for="name"> <i 
										class="zmdi zmdi-account material-icons-name  success"></i></label> <input
										type="text" th:field="*{user_name}" id="name" placeholder="Your Name" >
									<small class="error" id="name_error"> </small>
								</div>
								<div class="form-group">
									<label for="contact"><i class="zmdi zmdi-phone success"></i></label>
									<input type="text" th:field="*{user_mobno}" id="contact"
										placeholder="Mobile No"  />
										<small class="error" id="mobile_error"></small>
								</div>
								<div class="form-group">
									<label for="Address"><i class="zmdi zmdi-book success"></i></label>
									<input type="text" th:field="*{User_adderess}" id="Address"
										placeholder="Address"  />
										<small class="error" id="address_error"></small> 
								</div>
								<div class="form-group">
									<label for="email"><i class="zmdi zmdi-email success"></i></label> <input
										type="text" th:field="*{user_emailid}" id="email" placeholder="Your Email"  />
										<small class="error" id="email_error"></small>
								</div>
								<div class="form-group">
									<label for="pass"><i class="zmdi zmdi-lock success"></i></label> <input
										type="text" th:field="*{user_pass}" id="pass" placeholder="Password"  />
									<small class="error" id="pass_error"></small>
									
								</div>
								
								<div class="form-group">
									<label for="re-pass"><i class="zmdi zmdi-lock-outline success"></i></label>
									<input type="text" name="re_user_pass" id="re_pass"
										placeholder="Confirm password"  />
										<small class="error" id="re_pass_error"></small>
								</div>

								<!-- <div class="form-group">
									<input type="checkbox" name="agree-term" id="agree-term"
										class="agree-term" /> <label for="agree-term"
										class="label-agree-term"><span><span></span></span>I agree all statements in <a href="#" class="term-service">Terms
											of service</a></label>

								</div> -->
								<div class="form-group form-button">
									<a><input type="submit"  name="signup" id="signup"
										class="form-submit" value="Register" /></a>
								</div>
							</form>
						</div>
						<div class="signup-image">

							<figure>
								<img src="AdminPanel/images/signup-image.jpg"
									alt="sing up image" />
							</figure>
							<a th:href="@{/loginForm}" class="signup-image-link"><b>I am
									already Register</b></a>
						</div>
					</div>
				</div>
			</section>
		</div>
	</div>
	<!--  form  div end -->

	
	<!-- JS -->
	
	<!-- <script src="js/main.js"></script>  -->
	<script type="text/javascript" src="js/Validation.js"></script>
	<script type="text/javascript" src="js/CommonScript.js"></script>
	
	</body>
</html>