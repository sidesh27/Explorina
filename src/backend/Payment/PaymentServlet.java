import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.util.*;
import java.lang.*;
import java.io.*;
import java.sql.*;

public class PaymentServlet extends HttpServlet{
  public void doPost(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException{
    String JDBC_DRIVER = "com.mysql.jdbc.Driver";
    String DB_URL = "jdbc:mysql://localhost:3306/vacayplanner";

    String USER = "root";
    String PASS = "root";

    response.setContentType("text/html");
    PrintWriter out = response.getWriter();

    String cardnum = request.getParameter("cardnumber");
    String cardholder = request.getParameter("cdholder");
    String exp_month = request.getParameter("expmonth");
    int exp_year = Integer.parseInt(request.getParameter("expyear"));
    int CVV = Integer.parseInt(request.getParameter("cvv")); 

      out.println("<script>");
      out.println("alert(\""+cardnum+"\")");
      out.println("</script>");

      out.println("<script>");
      out.println("alert(\""+cardholder+"\")");
      out.println("</script>");

      out.println("<script>");
      out.println("alert(\""+exp_month+"\")");
      out.println("</script>");

      out.println("<script>");
      out.println("alert(\""+exp_year+"\")");
      out.println("</script>");

    Connection conn = null;
    int valid = 1;
    int found = 0;

    try{

      conn = DriverManager.getConnection(DB_URL,USER,PASS);

      String query = "SELECT * FROM bankaccounts WHERE CardHolder=\"" + cardholder + "\";";
      Statement stmt = conn.createStatement();

      String ccnum="", expiryMonth="";
      int cvv = 0, expiryYear = 0;

      ResultSet rs = stmt.executeQuery(query);
      
      out.println("<script>");
      out.println("alert(\"Executing servlet\")");
      out.println("</script>");

      if(rs.next()){
        found = 1;
        ccnum = rs.getString("CardNumber");
        expiryMonth = rs.getString("expMonth");
        cvv = rs.getInt("cvv");
        expiryYear = rs.getInt("expYear");
      out.println("<script>");
      out.println("alert(\"NOT EMPTY\")");
      out.println("</script>");
      }
      
      int attempts = 0;

      while (attempts <= 3) {
        if (attempts == 3) {
          out.println("<script>");
          out.println("alert(\"You have exceeded the attempt limit! Please try again later!\")");
          out.println("location='http://localhost:8080/VP/index.html'");
          out.println("</script>");
          break;
        }
        if (found == 1) {
          if (cardnum.equals(ccnum))
          {
            if (cvv == CVV) {
              if (exp_year == expiryYear && expiryMonth.equals(exp_month)) {
                out.println("<script>");
                out.println("alert(\"Processing Payment..!! Payment Successful..!!\")");
                out.println("</script>");
                break;
              }
              else {
                out.println("<script>");
                out.println("alert(\"Incorrect Expiry Date! Please Try Again\")");
                out.println("location='http://localhost:8080/VP/payment.html'");
                out.println("</script>");
                attempts = attempts + 1;
              }
            }
            else {
              out.println("<script>");
              out.println("alert(\"Incorrect cvv!! Please Try Again!!\")");
              out.println("location='http://localhost:8080/VP/payment.html'");
              out.println("</script>");
              attempts = attempts + 1;
            }
          }
          else
          {
            out.println("<script>");
            out.println("alert(\"Incorrect Card Number..!! Please Try Again!\")");
            out.println("location='http://localhost:8080/VP/payment.html'");
            out.println("</script>");
            attempts = attempts + 1;
          }
        }
        else {
          out.println("<script>");
          out.println("alert(\"Invalid Card Holder Name! Please Try Again!\")");
          out.println("location='http://localhost:8080/VP/payment.html'");
          out.println("</script>");
          attempts = attempts + 1;
        }
      }
    }
    catch(Exception E){
      E.printStackTrace();
    }

    out.close();

  }
}

