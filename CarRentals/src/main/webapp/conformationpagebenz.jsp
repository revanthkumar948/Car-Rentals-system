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
int amt=12000;
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
  Dbutil.car="MERCEDEZ BENZ";
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
<p style="background-color:tomato;">* Cancellation is not available and once booked amount to be paid in full</p>
        <input type="submit" value="Back to Home" class="b">
</form>
    </div>

    <div class="image-container">
        <img src="data:image/jpeg;base64,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" alt="Booked Car Image">
    </div>
</div>
</body>
</html>