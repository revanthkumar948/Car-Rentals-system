<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="p1.Dbutil"%>
    <%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
Dbutil.connect();

int amount=Integer.parseInt(request.getParameter("t4"));
String query1="select * from bankinfo where userid="+Dbutil.currentid+" ";
ResultSet qs=Dbutil.st.executeQuery(query1);
if(qs.next()) {
 int z=qs.getInt(1);
String x=qs.getString(2);String c=qs.getString(3);
int v=qs.getInt(4);
amount+=v;
String f="update bankinfo set balance="+amount+" where userid="+Dbutil.currentid+" ";
Dbutil.st.executeUpdate(f);

out.println("deposit is successful");
}
%>

</body>
</html>