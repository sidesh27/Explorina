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



public class getActivities extends HttpServlet {


    public int y =0;
    class vActivity {

        public String DestName;
        public String ActivityName;
        public String desc;
        public int duration, AcitivityCost;

            public vActivity(String DestName, String ActivityName,String desc, int duration, int AcitivityCost) {
                this.DestName = DestName;
                this.ActivityName = ActivityName;
                this.desc = desc;
                this.duration = duration;
                this.AcitivityCost = AcitivityCost;
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
                custActivity-schema

                DestName varchar(255),
                ActivityName varchar(255),
                description TEXT,
                duration int,
                AcitivityCost int NOT NULL,
                */
                                
                try
                {
                    String val = request.getParameter("val");
                    // pw.println("<script>");
                    // pw.println("alert(\"val="+val+" \");");
                    // pw.println("</script>");
                    String srch = "SELECT * FROM custActivity where DestName=\'"+ val+"\';";
                    st=con.createStatement();
                    rs=st.executeQuery(srch);
                    List<vActivity> packages = new ArrayList<>();
                    while(rs.next()){
                        packages.add(new vActivity(rs.getString(1), rs.getString(2), rs.getString(3), rs.getInt(4), rs.getInt(5)));
                    }
                    Gson gson = new GsonBuilder().create();
                    JsonArray jarray = gson.toJsonTree(packages).getAsJsonArray();
                    JsonObject jsonobject = new JsonObject();
                    jsonobject.add("packages", jarray);

                    pw.println(jsonobject);
                    // pw.println("<p>"+jsonobject+"</p>");
                    // pw.println("alert(\"Inserted Successfully! Click ok to view table contnts \");");
                    // pw.println("location='http://localhost:8080/Ex4b/viewServlet';");
                    // pw.println("</script>");

                }
                catch(SQLException e)
                {
                    // pw.println("<script>");
                    // pw.println("alert(\"Failed! Try Again!flag1 "+e+" \");");
                    // // pw.println("location='http://localhost:8080/Ex4b/options.html';");
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
        //     pw.println("<script>");
        //     pw.println("alert(\"Failed to establish connection.Try again Later. Error Code :1 flag: 2 \");");
        //     // pw.println("location='http://localhost:8080/Ex4b/options.html';");
        //     pw.println("</script>");
        // }
        // else if(flag==3)
        // {
        //     pw.println("<script>");
        //     pw.println("alert(\"Driver class not found.Error Code :0 flag: 3\");");
        //     // pw.println("location='http://localhost:8080/Ex4b/options.html';");
        //     pw.println("</script>");
        // }
        pw.close();
    }
}