
<!DOCTYPE html>
<html xmlns:th="http://www.thymeleaf.org">

<body data-col="2-columns" class=" 2-columns ">
	<aside class="aside"  th:fragment="Asidebar">
	<div data-active-color="white" data-background-color="purple-bliss"
		data-image="app-assets/img/sidebar-bg/01.jpg" class="app-sidebar">

		<div class="sidebar-header">
			<div class="logo clearfix">
				
					<div class="logo-img">
					<a th:href="@{/Admin/}" class="logo-text float-left">
						<img src="app-assets/img/logo.png">
					
					<span class="text align-middle">shop</span>
				</a></div><a id="sidebarToggle" href="javascript:;"
					class="nav-toggle d-none d-sm-none d-md-none d-lg-block"><i
					data-toggle="collapsed" class="ft-toggle-left toggle-icon"></i></a><a
					id="sidebarClose" href="javascript:;"
					class="nav-close d-block d-md-block d-lg-none d-xl-none"><i
					class="ft-x"></i></a>
			</div>
		</div>

		<div class="sidebar-content ps-container ps-theme-default ps-active-y"
			data-ps-id="73c31406-6fd2-c7f7-fafe-72f3948aa556">
			<div class="nav-container">
				<ul id="main-menu-navigation" data-menu="menu-navigation"
					class="navigation navigation-main">
					<li><a th:href="@{/Admin/adminPannel}"><i class="ft-home"></i><span
							data-i18n="" class="menu-title">DASHBOARD</span></a></li>

					<li class="has-sub nav-item"><a href="#"><i
							class="ft-package"></i><span data-i18n="" class="menu-title">WEBSITE
								MASTER</span></a>
						<ul class="menu-content">
							<li><a th:href="@{/Admin/allBanner}" class="menu-item">
									BANNER </a></li>
							
							<li><a th:href="@{/loginForm}" class="menu-item">LOGIN FORM</a>
							</li>

							<li><a th:href="@{/registrationForm}" class="menu-item">REGISTRATION
									FORM</a></li>
							<li><a th:href="@{/Admin/userList}" class="menu-item">REPORT</a></li>
						</ul></li>

					<li class=" nav-item"><a  th:href="@{/Admin/viewOrderAdmin}" ><i
							class="ft-book"></i><span data-i18n="" class="menu-title">APPROVAL-ORDERS
						</span></a></li>

					<li class="has-sub nav-item"><a href="#"><i
							class="icon-basket-loaded"></i><span data-i18n=""
							class="menu-title">CART</span></a>
						<ul class="menu-content">
							<li><a th:href="@{/Admin/viewProduct}" class="menu-item">VIEW
									PRODUCTS</a></li>
							<li><a th:href="@{/Admin/viewCategory}" class="menu-item">VIEW
									CATEGORY</a></li>
							<li><a th:href="@{/Admin/addProduct}" class="menu-item">ADD
									PRODUCTS</a></li>

						</ul></li>

					<li class=" nav-item"><a th:href="@{/Admin/userList}"><i class="ft-book"></i><span data-i18n="" class="menu-title">USERS</span></a>
					</li>

					<li class=" nav-item"><a th:href="@{/Admin/calendar}"><i
							class="ft-calendar"></i><span data-i18n="" class="menu-title">CALENDER</span></a>
					</li>

					<li class=" nav-item"><a th:href="@{/Admin/support}"><i
							class="ft-life-buoy"></i><span data-i18n="" class="menu-title">SUPPORT</span></a>
					</li>
				</ul>
			</div>
		</div>
	</div>
</aside>
</body>
</html>