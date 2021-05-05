import java.sql.*;
import java.io.*;
import jakarta.servlet.*;
import jakarta.servlet.http.*;

public class getDestinations extends HttpServlet {
    public void doGet(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException {
        
        response.setContentType("text");
        PrintWriter pw=response.getWriter();
        Connection con;
        Statement st;
        ResultSet rs;        
        try
        {
            Class.forName("com.mysql.cj.jdbc.Driver");
            try
            {
                con =DriverManager.getConnection("jdbc:mysql://localhost:3306/vacayplanner","root","root");
                
                try
                {
                    String srch = " SELECT DISTINCT(destination) FROM packages;"; 
                    st=con.createStatement();
                    rs=st.executeQuery(srch);
                    int count = 0;

                    while(rs.next()){
                        pw.println("<li><a class=\"destoptions\" href=\"#\" title=\"Sub Menu\">"+rs.getString(1)+"</a></li>");
                        count++;
  
                    }
                }
                  catch(SQLException e)
                {
                    pw.println(e);
                }
            }
            catch (SQLException e)
            {
               pw.println(e);
            }     
        }
        catch(ClassNotFoundException e)
        {
            pw.println(e);
        }
        pw.close();
    }

}