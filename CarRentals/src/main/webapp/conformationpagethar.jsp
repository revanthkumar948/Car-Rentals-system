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
int amt=3500;
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

Dbutil.st.executeUpdate("insert into rentinginfo values("+dl+",'"+fromdate+"','"+todate+"',"+amount+")");
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
  Dbutil.car="MAHINDRA THAR";
  Dbutil.avail=true;
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