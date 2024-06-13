<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ page import="p1.Dbutil"%>
    <%@page import="java.sql.*"%>
    <%@page import="java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
Dbutil.name="";
Dbutil.drivinglicence=0;
Dbutil.fromda="";
Dbutil.toda="";
Dbutil.car="";
Dbutil.price=0;
Dbutil.avail=false;
response.sendRedirect("login.html");

%>

</body>
</html>