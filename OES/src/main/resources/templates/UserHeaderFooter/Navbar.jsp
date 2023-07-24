
<html xmlns:th="http://www.thymeleaf.org">
<head>

</head>
<body data-col="2-columns" class=" 2-columns " th:fragment="Navbar">
	<jsp:include page="CommonModal.jsp" />
	
	
	<!-- Navbar (Header) Starts-->
	<nav class="navbar navbar-expand-lg navbar-light bg-faded"
		th:object="${aminInfo}">
		<div class="container-fluid">
			<div class="navbar-header">
				<h3 style="color: red;" class="font-weight-bold"
					th:text="'Welcome : '+${aminInfo.user_name }"></h3>
				<button type="button" data-toggle="collapse"
					class="navbar-toggle d-lg-none float-left">

					<span class="sr-only">Toggle navigation</span><span
						class="icon-bar"></span><span class="icon-bar"></span><span
						class="icon-bar"></span>
				</button>

			</div>
			<div class="navbar-container">
				<div id="navbarSupportedContent" class="collapse navbar-collapse">
					<ul class="navbar-nav">

						<li class="dropdown nav-item"><a id="dropdownBasic3" href="#"
							data-toggle="dropdown"
							class="nav-link position-relative dropdown-toggle"><i
								class="ft-flag font-medium-3 blue-grey darken-4"></i><span
								class="selected-language d-none"></span></a>
							<div class="dropdown-menu dropdown-menu-right">
								<a href="javascript:;" class="dropdown-item py-1"> <img
									src="app-assets/img/flags/us.png" class="langimg" /><span>
										English</span></a><a href="javascript:;" class="dropdown-item py-1"><img
									src="app-assets/img/flags/es.png" class="langimg" /><span>
										Spanish</span></a><a href="javascript:;" class="dropdown-item py-1"><img
									src="app-assets/img/flags/br.png" class="langimg" /><span>
										Portuguese</span></a><a href="javascript:;" class="dropdown-item"><img
									src="app-assets/img/flags/de.png" class="langimg" /><span>
										French</span></a>
							</div></li>

						
						<li class="dropdown nav-item"><a id="dropdownBasic2" href="#"
							data-toggle="dropdown"
							class="nav-link position-relative dropdown-toggle"><i
								class="ft-bell font-medium-3 blue-grey darken-4"></i><span
								class="notification badge badge-pill badge-danger" th:text="${notificationCount }"></span>
						</a>
							<div
								class="notification-dropdown dropdown-menu dropdown-menu-right">
								<div class="noti-list">
									<a href="ViewOrderAdmin.jsp"
										class="dropdown-item noti-container py-3 border-bottom border-bottom-blue-grey border-bottom-lighten-4"><i
										class="ft-bell info float-left d-block font-large-1 mt-1 mr-2"></i><span
										class="noti-wrapper"><span
											class="noti-title line-height-1 d-block text-bold-400 info">
												<span th:if="${newOrders!=0 }" style="color: #8B0000; font-size: 150%;" th:text="${newOrders }"></span>
												<span th:unless="${newOrders!=0 }" style="color: #8B0000; font-size: 150%;" >>No Any</span>
												 New Order Received
										</span><span class="noti-text"> Click Here, To See All New
												Orders.</span></span> </a> <a href="UserList.jsp"
										class="dropdown-item noti-container py-3 border-bottom border-bottom-blue-grey border-bottom-lighten-4"><i
										class="ft-bell warning float-left d-block font-large-1 mt-1 mr-2"></i><span
										class="noti-wrapper">
										<span class="noti-title line-height-1 d-block text-bold-400 warning">
												<span th:if="${newUsers!=0 }"  style="color: #8B0000; font-size: 150%;"
												th:text="${newUsers }"> </span>
 
 														<span th:unless="${newUsers!=0 }">	No Any </span>
													 New User Registered
										</span>
										<span class="noti-text"> Click Here, To See All New
												User.</span></span></a> <a href="@{/Support}"
										class="dropdown-item noti-container py-3 border-bottom border-bottom-blue-grey border-bottom-lighten-4"><i
										class="ft-bell danger float-left d-block font-large-1 mt-1 mr-2"></i><span
										class="noti-wrapper"><span
											class="noti-title line-height-1 d-block text-bold-400 danger">
											<span th:if="${newQuery!=0 }"
												style="color: #8B0000; font-size: 150%;" th:text="${newQuery }"></span>
												<span th:if="${newQuery==0 }">	No Any</span>
												 New Query Received
										</span><span class="noti-text"> Click Here, To See All New
												Query.</span></span></a>

								</div>
								<a th:if="${notificationCount!=0 }"
									class="noti-footer primary text-center d-block border-top border-top-blue-grey border-top-lighten-4 text-bold-400 py-1">Read
									All Notifications</a>
								
								<a th:if="${notificationCount==0 }"
									class="noti-footer primary text-center d-block border-top border-top-blue-grey border-top-lighten-4 text-bold-400 py-1">No
									Any Notifications</a>
							
							</div></li>
				
						<li class="dropdown nav-item"><a id="dropdownBasic3" href="#"
							data-toggle="dropdown"
							class="nav-link position-relative dropdown-toggle"> <i
								class="ft-user font-medium-3 blue-grey darken-4"></i>
						</a>
							<div aria-labelledby="dropdownBasic3"
								class="dropdown-menu dropdown-menu-right">
								<a href="javascript:;" class="dropdown-item py-1"> <span th:text="${aminInfo.user_name }+' (Admin Manager) '"></span></a> 
								<a href="javascript:;"
									class="dropdown-item py-1"><span th:text="'AID: '+${aminInfo.id}" ></span></a>
								<div class="dropdown-divider"></div>
								<a href="javascript:;" class="dropdown-item py-1"><i
									class="ft-edit mr-2"></i><span data-toggle="modal"
									data-target="#AdminProfile">Edit Profile</span></a> <a
									th:href="@{/logout}" class="dropdown-item"><i
									class="ft-power mr-2"></i><span>Logout</span></a>
							</div></li>
					</ul>
				</div>
			</div>
		</div>
	</nav>


</body>

</html>