import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.util.*;
import java.lang.*;
import java.io.*;
import java.sql.*;


public class LogoutServlet extends HttpServlet{
  public void doGet(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException{
    
    response.setContentType("text/html");
    PrintWriter out = response.getWriter();

    HttpSession session = request.getSession(); 
    String fname = (String)session.getAttribute("uname");

    session.invalidate();  

    Cookie[] cookies = request.getCookies();
    if (cookies != null) {
      for (int i = 0; i < cookies.length; i++) {
        cookies[i].setMaxAge(0);
        response.addCookie(cookies[i]);
      }
    }

    out.println("<script>");
    out.println("alert(\"Logging out\")");
    out.println("location='http://localhost:8080/VP/index.html'");
    out.println("</script>");

    out.close();
  }
}

