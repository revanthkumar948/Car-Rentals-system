<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="p1.Dbutil" %>
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
Dbutil.connect();
int id=Integer.parseInt(request.getParameter("loginId"));
String password=request.getParameter("password");
String query1="select *from customers where drivinglicence="+id+" && pwd='"+password+"'";
int z=0;String c="";String b="";
ResultSet es=Dbutil.st.executeQuery(query1);
if(es.next()) 
{
 z=es.getInt(1);
  c=es.getString(2);
  b=es.getString(3);
  
}

if(z==id && c.equals(password))
{
	Dbutil.drivinglicence=id;
	Dbutil.name=b;
	
	try{
	String query2="select *from rentinginfo where drivinglicence="+id+"";
	String f="";String g="";int h=0;
	ResultSet ps=Dbutil.st.executeQuery(query2);
	if(ps.next()) 
	{
	 f=es.getString(2);
	  g=es.getString(3);
	  h=es.getInt(4);
	  
	}
	Dbutil.fromda=f;
	Dbutil.toda=g;
	Dbutil.price=h;
	}
	catch(Exception e)
	{
		
	}
	response.sendRedirect("index.html");
}
else
{
	out.println("invalid credentials");
}
Dbutil.con.close();

%>


</body>
</html>