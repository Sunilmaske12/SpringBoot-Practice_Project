<!DOCTYPE html>
<html xmlns:th="http//www.thymeleaf.org">
	<head>
		<title>Chat</title>
		<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
		<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
		<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" >
		<link rel="stylesheet"href="https://use.fontawesome.com/releases/v5.5.0/css/all.css">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js" ></script>
		<link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/malihu-custom-scrollbar-plugin/3.1.5/jquery.mCustomScrollbar.min.css">
		<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/malihu-custom-scrollbar-plugin/3.1.5/jquery.mCustomScrollbar.min.js"></script>
		<link rel="stylesheet" href="css/style.css" type="text/css">
		
<style type="text/css">

	body,html{
			height: 100%;
			margin: 0;
			background: #7F7FD5;
	       background: -webkit-linear-gradient(to right, #91EAE4, #86A8E7, #7F7FD5);
	        background: linear-gradient(to right, #91EAE4, #86A8E7, #7F7FD5);
		}
	
</style>


	</head>
	
	<body>
	
		<div class="container-fluid h-100">
			<div class="row justify-content-center h-100">
			
				<div class="col-md-8 col-xl-6 chat">
					<div class="card card_chat">
						<div class="card-header msg_head">
							<div class="d-flex bd-highlight">
								<div class="img_cont">
									<img src="https://static.turbosquid.com/Preview/001292/481/WV/_D.jpg" class="rounded-circle user_img">
									<span class="online_icon"></span>
								</div>
								<div class="user_info">
									<span>Chat with Admin_Manager</span>
									<p>1767 Messages</p>
								</div>
								
							</div>
							
						</div>
						<div th:each="chats:${chats}" class="card-body msg_card_body" >
						
						
							<div th:if="${chats.UserName == Null}"  class="d-flex justify-content-start mb-4">
								<div class="img_cont_msg">
									<img src="https://static.turbosquid.com/Preview/001292/481/WV/_D.jpg" class="rounded-circle user_img_msg">
								</div>
								<div class="msg_cotainer">
									<a th:text="${chats.Chats}"></a>
									<span class="msg_time" th:text="${chats.Time }+'||'+${chats.Date }"></span>
								</div>
							</div>
						
							
							<div th:if="${chats.UserName != Null}" class="d-flex justify-content-end mb-4">
								<div class="msg_cotainer">
									<a th:text="${chats.Chats}"></a>
									<span class="msg_time" th:text="${chats.Time }+'||'+${chats.Date }"></span>
								</div>
								<div class="img_cont_msg">
									<img src="img/hero/Chat_Icon.png" class="rounded-circle user_img_msg">
									
								</div>
							</div>
							
							
						</div>
						<div class="card-footer">
							
							<form action="chat">
							<div class="input-group">
							<div th:if="${status == 'Close' }" style="text-align:center; margin-left:30%;"><h4>Ticket is closed</h4></div>
							
						
								<div th:unless="${status == 'Close' }" class="input-group-append">
									<span class="input-group-text attach_btn"><i class="fas fa-paperclip"></i></span>
								</div>
								<textarea name="message" class="form-control type_msg" placeholder="Type your message..."></textarea>
								<div class="input-group-append">
									<button type="submit" class="input-group-text send_btn"><i class="fas fa-location-arrow"></i></button>
								</div>
								<input type="hidden" name="Action" value="chatByUser">
								<input type="hidden" name="ticketId" value="<%=ticketId%>"><%}}else{ %>
								
								<div class="input-group-append">
									<span class="input-group-text attach_btn"><i class="fas fa-paperclip"></i></span>
								</div>
								<textarea name="message" class="form-control type_msg" placeholder="Type your message..."></textarea>
								<div class="input-group-append">
									<button type="submit" class="input-group-text send_btn"><i class="fas fa-location-arrow"></i></button>
								</div>
								<input type="hidden" name="Action" value="chatByUser">
								<input type="hidden" name="ticketId" value="<%=ticketId%>">
							</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</body>
</html>
	
