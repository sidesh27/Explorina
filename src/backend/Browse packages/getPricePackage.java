import java.sql.*;
import java.io.*;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.util.Objects;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;



public class getPricePackage extends HttpServlet {


    public int y =0;
    class vPackage {

        public String vpackage;
        public String desc;

            public vPackage(String vpackage, String desc) {
                this.vpackage = vpackage;
                this.desc = desc;
            }

        }
    public void doGet(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException {
        
        response.setContentType("application/json");
        PrintWriter pw=response.getWriter();
        int flag=0;
        Connection con;
        Statement st;
        ResultSet rs;        
        try
        {
            Class.forName("com.mysql.cj.jdbc.Driver");
            try
            {
                flag=1;
                con =DriverManager.getConnection("jdbc:mysql://localhost:3306/vacayplanner","root","root");
                /*
                packages-schema

                PPID int NOT NULL,
                PackageName varchar(255) NOT NULL,
                description text,
                destination varchar(255) NOT NULL,
                cost int NOT NULL,
                duration varchar(32),
                hotels varchar(255),
                primary key(PPID)
                */
                                
                try
                {
                    int from = Integer.parseInt(request.getParameter("from"));
                    int to = Integer.parseInt(request.getParameter("to"));

                    String srch = "SELECT PackageName,description FROM packages where cost between "+from+" and "+to+";";
                    st=con.createStatement();
                    rs=st.executeQuery(srch);

                    List<vPackage> packages = new ArrayList<>();
                    while(rs.next()){
                        packages.add(new vPackage(rs.getString(1), rs.getString(2)));
                    }
                    
                    Gson gson = new GsonBuilder().create();
                    JsonArray jarray = gson.toJsonTree(packages).getAsJsonArray();
                    JsonObject jsonobject = new JsonObject();
                    jsonobject.add("packages", jarray);

                    pw.println(jsonobject);
                    // pw.println("alert(\"Inserted Successfully! Click ok to view table contnts \");");
                    // pw.println("location='http://localhost:8080/Ex4b/viewServlet';");
                    // pw.println("</script>");

                }
                catch(SQLException e)
                {
                    // pw.println("<script>");
                    // pw.println("alert(\"Failed! Try Again!flag1 "+e+" \");");
                    // pw.println("location='http://localhost:8080/Ex4b/options.html';");
                    // pw.println("</script>");
                    flag=1;
                }
            }
            catch (SQLException e)
            {
                flag=2;
            }     
        }
        catch(ClassNotFoundException e)
        {
            flag=3; 
        }
        // if(flag==2)
        // {
        //     // pw.println("<script>");
        //     // pw.println("alert(\"Failed to establish connection.Try again Later. Error Code :1 flag: 2 \");");
        // //     pw.println("location='http://localhost:8080/Ex4b/options.html';");
        //     // pw.println("</script>");
        // }
        // else if(flag==3)
        // {
        //     // pw.println("<script>");
        //     // pw.println("alert(\"Driver class not found.Error Code :0 flag: 3\");");
        //     // // pw.println("location='http://localhost:8080/Ex4b/options.html';");
        //     // pw.println("</script>");
        // }
        pw.close();
    }
}