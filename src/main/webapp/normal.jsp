<%@page import="com.learn.mycart.entities.User" %>
<%
 User user=(User)session.getAttribute("current-user");
if (user==null)
{
	session.setAttribute("message","You are not logged in!!");
	response.sendRedirect("login.jsp");
	
}else{
	
	if(user.getUserType().equals("admin")){
	
	session.setAttribute("message","You are not normal user!!!Do not access this page");
	response.sendRedirect("login.jsp");
	}
}

%>


<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title> Admin Panel</title>

<%@include file="Components/common_css_js.jsp" %>


</head>
<body>

<%@include file="Components/Navbar.jsp" %>



<h1>this is normal user panal</h1>
</body>
</html>