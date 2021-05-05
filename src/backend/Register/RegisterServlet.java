import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.util.*;
import java.io.*;
import java.sql.*;

public class RegisterServlet extends HttpServlet
{
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
      String JDBC_DRIVER = "com.mysql.jdbc.Driver";
      String DB_URL = "jdbc:mysql://localhost:3306/vacayplanner";

      String USER = "root";
      String PASS = "root";

      response.setContentType("text/html");
      PrintWriter out = response.getWriter();

      String email = request.getParameter("mailid");
      String fname = request.getParameter("fname");  
      String lname = request.getParameter("lname");
      String pass = request.getParameter("password");
      String gender = request.getParameter("gender");
      String contactno = request.getParameter("contact");
    
      Connection conn = null;
      Statement stmt = null;

      try{
          //Open Connection
        Class.forName("com.mysql.jdbc.Driver");
        conn = DriverManager.getConnection(DB_URL,USER,PASS);    
          
        PreparedStatement ps= conn.prepareStatement("Insert into users (FirstName, LastName, EmailAddress, gender, password, dob, contact)  values(?,?,?,?,?,?,?)");

        ps.setString(1, fname);
        ps.setString(2, lname);
        ps.setString(3, email);
        ps.setString(4, gender);
        ps.setString(5, pass);
        ps.setDate(6, java.sql.Date.valueOf(request.getParameter("dob")));
        ps.setString(7, contactno);

        ps.execute();

        out.println("<script>");
        out.println("alert(\"Account successfully created!!\")");
        out.println("location='http://localhost:8080/VP/login.html'"); 
        out.println("</script>");     

        //response.sendRedirect("http://localhost:8080/VP/login.html");    
      }
      catch (Exception e)
      {
        e.printStackTrace();
      }

      out.close();

    }
  
}