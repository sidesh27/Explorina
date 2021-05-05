import javax.servlet.*;
import javax.servlet.http.*;
import java.util.*;
import java.lang.*;
import java.io.*;
import java.sql.*;


public class LoginServlet extends HttpServlet{
  public void doPost(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException{
    String JDBC_DRIVER = "com.mysql.jdbc.Driver";
    String DB_URL = "jdbc:mysql://localhost:3306/vacayplanner";

    String USER = "root";
    String PASS = "Sneh@2800";

    response.setContentType("text/html");
    PrintWriter out = response.getWriter();

    String mailid = request.getParameter("mailid");
    String pw = request.getParameter("password");

    Connection conn = null;
    int found = 0;

    // Delete existing cookies
    Cookie[] cookies = request.getCookies();
    if (cookies != null) {
      for (int i = 0; i < cookies.length; i++) {
        cookies[i].setMaxAge(0);
        response.addCookie(cookies[i]);
      }
    }

    try{
      conn = DriverManager.getConnection(DB_URL,USER,PASS);

      String query = "SELECT * FROM users WHERE EmailAddress='" + mailid + "';";
      Statement stmt = conn.createStatement();

      ResultSet rs = stmt.executeQuery(query);

      if (rs.next()){
        String password = rs.getString("password");
        String fname = rs.getString("FirstName");
        String lname = rs.getString("LastName");
        int user_id = rs.getInt("UID");
        
        if(pw.equals(password)){
          found = 1;
          HttpSession session = request.getSession();
          session.setAttribute("fname", fname);
          session.setAttribute("lname", lname);
          session.setAttribute("uid", user_id);
          response.sendRedirect("/VP/index.html");
        }
      }

      if(found == 0){
        out.println("<script>");
        out.println("alert(\"Invalid username or password!! Please Try Again\")");
        out.println("location='http://localhost:8080/VP/login.html'");
        out.println("</script>");
      }
    }
    catch(Exception E){
      E.printStackTrace();
    }

    out.close();

  }
}

