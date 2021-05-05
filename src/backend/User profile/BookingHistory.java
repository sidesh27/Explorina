import java.io.*;  
import javax.servlet.*;  
import javax.servlet.http.*;  
import java.util.*;
import java.sql.*;  

public class BookingHistory extends HttpServlet
{
  public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException 
  {  
     PrintWriter out = response.getWriter();  
     response.setContentType("text/html");  
     
     HttpSession session = request.getSession(); 
     String fname = (String)session.getAttribute("uname");
     int uid = (Integer)session.getAttribute("uid");
     out.println("<html><body><table>");
     out.println("<thead class='thead-dark'>");
     out.println("<tr><th>Booking ID</th><th>Package Name</th><th>Booked On</th><th>Adults</th><th>Children</th><th>Total cost</th></tr>");
     out.println("</thead>");
     out.println("<tbody>");

     String JDBC_DRIVER = "com.mysql.jdbc.Driver";
     String DB_URL = "jdbc:mysql://localhost:3306/vacayplanner";

     String USER = "root";
     String PASS = "Sneh@2800";

     Connection conn = null;
     Statement stmt = null;

     try 
     {  
        //Open Connection
        Class.forName("com.mysql.jdbc.Driver");
        conn = DriverManager.getConnection(DB_URL,USER,PASS); 

        stmt = conn.createStatement();
        ResultSet rs = stmt.executeQuery("select * from bookings where uid = " + uid + ";");

        while (rs.next()) 
        {  
            String id = rs.getString("BID");  
            String name = rs.getString("packageName");
            int adults = rs.getInt("adults"); 
            int children = rs.getInt("children");
            int cost = rs.getInt("totalCost");  
        
            out.println("<tr class='alert' role='alert'><th scope='row'>" + id + "</th><td>" + name + "</td><td>" + rs.getDate("bookedOn") + "</td><td>" + adults + "</td><td>" + children + "</td><td>" + cost + "</td></tr>");   
        }  
        out.println("</tbody>"); 
        out.println("</table></body></html>");
        conn.close();      
     }

     catch(Exception E)
     {
      E.printStackTrace();
     }

     out.close();
  }
}

