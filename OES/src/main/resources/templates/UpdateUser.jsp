<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.*"%>
<%@page import="com.codeo.shop.dbutil.ConnectionProvider"%>
<%@page import="com.codeo.shop.entity.User"%>
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<%  
String id = request.getParameter("id");
String name= request.getParameter("name");
String contact = request.getParameter("contact");
String Address = request.getParameter("Address");
String email = request.getParameter("email");
String password = request.getParameter("Pass");

System.out.println(id);
System.out.println(name);
System.out.println(email);
System.out.println(contact);
try {
Connection con = ConnectionProvider.getconnection();
String update_user="update user_registration set user_name =?,user_mobno=?,user_adderess =?,user_emailid=?,user_pass=? where user_id ="+id;
PreparedStatement psmt = con.prepareStatement(update_user);

System.out.println(update_user);
psmt.setString(1, name);
psmt.setString(2, contact);
psmt.setString(3, Address);
psmt.setString(4, email);
psmt.setString(5, password);

int result =0;

	result = psmt.executeUpdate();
	
}
catch(Exception e)
{
	e.printStackTrace();
}
finally{
	response.sendRedirect("UserList.jsp");
}
%>


</body>
</html>