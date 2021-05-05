import java.sql.*;
import java.io.*;
import jakarta.servlet.*;
import jakarta.servlet.http.*;

public class getCustDestinations extends HttpServlet {
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
                    String srch = " SELECT DISTINCT(DestName) FROM custActivity;"; 
                    st=con.createStatement();
                    rs=st.executeQuery(srch);

                    while(rs.next()){
                        pw.println("<option value=\""+rs.getString(1)+"\">"+rs.getString(1));
                        
  
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