package p1;
import java.sql.*;
import java.io.*;
public class Dbutil {
		
	public static Connection con;
	public static Statement st;
	public static int drivinglicence;
	public static String name;
	public static String fromda;
	public static String toda;
	public static String car;
	public static int price;
	public static boolean avail=false;
	public static void connect()
	{
		try
		{
			Class.forName("com.mysql.cj.jdbc.Driver");
			 con=DriverManager.getConnection("jdbc:mysql://localhost:3306/rentals","root","Keerthana@123");
			st=con.createStatement();
		}
		catch(Exception e)
		{
			
		}
	}

}
