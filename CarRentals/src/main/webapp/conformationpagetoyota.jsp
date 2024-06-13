<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ page import="p1.Dbutil"%>
    <%@page import="java.sql.*"%>
    <%@page import="java.util.*"%>
    <%@page import="java.time.temporal.ChronoUnit"%>
    <%@page import="java.time.*"%>
    
    <%@page import="java.text.SimpleDateFormat"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
 body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
        }

        .container {
            max-width: 800px;
            margin: 20px auto;
            background-color: #fff;
            padding: 20px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            border-radius: 5px;
            display: flex;
            flex-wrap: wrap;
        }

        h2 {
            color: #007BFF;
            width: 100%;
        }

        img {
            max-width: 100%;
            height: auto;
            margin-bottom: 15px;
        }

        .details {
            flex: 1;
            padding-right: 20px;
        }

        .details p {
            margin-bottom: 15px;
        }

        a {
            text-decoration: none;
            color: #007BFF;
            display: block;
            margin-top: 15px;
        }
        .b {
            padding: 10px;
            background-color: #4CAF50;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }
        .b:hover {
            background-color: #45a049;
        }

</style>
</head>
<body>
<%
Dbutil.connect();
int amt=5000;
int dl=Dbutil.drivinglicence;
String fromdate=request.getParameter("fromDate");
String todate=request.getParameter("toDate");
LocalDate start = LocalDate.parse(fromdate);
LocalDate end   = LocalDate.parse(todate);

long days = ChronoUnit.DAYS.between(start, end);
days+=1;
long amount=days*amt;

if(Dbutil.avail==true)
{
	response.sendRedirect("error.html");
	Dbutil.con.close();

}
else{
Dbutil.st.executeUpdate("insert into rentinginfo values("+dl+"','"+fromdate+"','"+todate+"','"+amount+")");
String query1="select *from rentinginfo where drivinglicence="+dl+"";
int z=0;String c="";String b="";int m=0;
ResultSet es=Dbutil.st.executeQuery(query1);
if(es.next()) 
{
 z=es.getInt(1);
  c=es.getString(2);
  b=es.getString(3);
  m=es.getInt(4);
  Dbutil.fromda=c;
  Dbutil.toda=b;
  Dbutil.price=m;
  Dbutil.car="TOYOTA FORTUNER";
}
}
%>

<div class="container">
    <div class="details">
    <form action="index.html">
        <h2>Booking Confirmation</h2>
        <p><strong>From Date:</strong> <span id="displayFromDate"></span></p><%out.println(Dbutil.fromda); %>
        <p><strong>To Date:</strong> <span id="displayToDate"></span></p><%out.println(Dbutil.toda); %>
        <p><strong>Total Price:</strong> <span id="displayPrice"></span></p><%out.println(Dbutil.price); %>
        <p><strong>Booked Car Name:</strong> <span id="displayCarName"></span></p><%out.println(Dbutil.car); %>
<p style="background-color:tomato;">* Cancellation is not availbale and once booked amount to be paid in full</p>
        <input type="submit" value="Back to Home" class="b">
</form>
    </div>

    <div class="image-container">
        <img src="data:image/jpeg;base64,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" alt="Booked Car Image">
    </div>
</div>





</body>
</html>