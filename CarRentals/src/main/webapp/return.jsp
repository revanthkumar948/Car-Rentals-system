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
<title>Return car</title>
<style>
        body {
            font-family: Arial, sans-serif;
            text-align: center;
            margin: 50px;
        }
        .error-message {
            color: #ff0000;
            font-size: 20px;
            margin-bottom: 20px;
        }
        .back-to-home {
            display: inline-block;
            padding: 10px 20px;
            background-color: #3498db;
            color: #fff;
            text-decoration: none;
            font-size: 18px;
            border-radius: 5px;
            cursor: pointer;
        }
    </style>
</head>
<body>
<%
Dbutil.connect();
int p=Dbutil.drivinglicence;
Dbutil.st.executeUpdate("delete from rentinginfo where  drivinglicence="+p+"");
Dbutil.name="";
Dbutil.drivinglicence=0;
Dbutil.fromda="";
Dbutil.toda="";
Dbutil.car="";
Dbutil.price=0;
Dbutil.avail=false;
%>
 <div class="error-message">
        Car returned successfully..!!!
    </div>
    <a href="index.html" class="back-to-home">Back to Home</a>

</body>
</html>