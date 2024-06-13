<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="p1.Dbutil"%>
    <%@page import="java.sql.*"%>
    <%@page import="java.util.*"%>
    <%@page import="java.time.temporal.ChronoUnit"%>
    <%@page import="java.time.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<% 
Dbutil.connect();
int drivinglicence=Integer.parseInt(request.getParameter("drivinglicence"));
			String password=request.getParameter("password");
		String name=request.getParameter("name");
			 Dbutil.st.executeUpdate("insert into customers values("+drivinglicence+",'"+password+"','"+name+"')");
%>
<h2>account creation success return to login page..!!!</h2>
<a href="login.html">Login page</a>

</body>
</html>