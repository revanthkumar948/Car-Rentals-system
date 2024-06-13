<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="p1.Dbutil"%>
    <%@page import="java.sql.*"%>
    <%@page import="java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Conformed Bookings</title>
<style>
 body {
            font-family: Arial, sans-serif;
            background-color: black;
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
        
        header {
            background-color: #333;
            padding: 15px;
            color: #fff;
            text-align: center;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        header img {
            width: 80px; /* Adjust the size as needed */
            height: 80px; /* Adjust the size as needed */
            margin-right: 10px;
            border-radius: 50%; /* Make the logo circular */
        }

        nav {
            display: flex;
            justify-content: center;
            background-color: #555;
            padding: 10px;
        }

        nav a {
            color: #fff;
            text-decoration: none;
            padding: 10px 20px;
            margin: 0 10px;
            border-radius: 5px;
            transition: background-color 0.3s ease;
        }

        nav a:hover {
            background-color: #777;
        }

        section {
            display: none;
            padding: 20px;
            line-height: 1.6;
            width: 80%;
            margin: 0 auto;
            background-color: #fff;
            border: 1px solid #ddd;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }
        h3 {
             color:#069;
        }

</style>
</head>
<body>
 <header>
        <a href="index.html"><img src="https://cdn.create.vista.com/downloads/a0a25464-cffe-4a7c-85b1-1732769fcb2c_640.jpeg" alt="Car Logo"></a>
        <h1>Revanth's Rental Services  </h1>  <h7><sub>-sabse sastha and sabse badiya.</sub></h7>
        
    </header>
    

    <nav>
        <a href="index.html">Home</a>
        <a href="availablecar.html">Rent a Car</a>
        <a href="bookingdetails.jsp">Booked Car</a>
        <a href="return.jsp">Return a Car</a>
        <a href="logout.jsp">Logout</a>
        
    </nav>
    <br>
    <br>
    <br>


	
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