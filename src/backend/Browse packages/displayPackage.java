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


public class displayPackage extends HttpServlet {


    public int y =0;
    class activity{
        public String aname, desc;
        public int day;

        public activity(String aname, String desc, int day){
            this.aname = aname;
            this.desc = desc;
            this.day = day;
        }
    }
    class vPackage {

        public String vpackage;
        public String desc,destination, duration, hotel;
        public int cost;
        public List<activity> activities;

            public vPackage(String vpackage, String desc, String destination, String duration, String hotel, int cost, List<activity> activities) {
                this.vpackage = vpackage;
                this.desc = desc;
                this.destination = destination;
                this.duration = duration;
                this.hotel = hotel;
                this.cost = cost;
                this.activities = new ArrayList<>(activities);
            }

        }
    public void doGet(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException {
        
        response.setContentType("application/json");
        PrintWriter pw=response.getWriter();
        int flag=0;
        Connection con;
        Statement st;
        ResultSet rs1,rs2;        
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
                PackageName varchar(255) NOT NULL,-2
                description text,-3
                destination varchar(255) NOT NULL,-4
                cost int NOT NULL,-5
                duration varchar(32),-6
                hotels varchar(255),-7
                primary key(PPID)


                activity-schema

                PPID int not null,
                activityname varchar(255),-2
                description TEXT,-3
                day int,-4
                primary key(activityname),
                foreign key(ppid) references packages(ppid)
                */
                                
                try
                {
                    String name = request.getParameter("val");
                    // pw.println("<script>");
                    // pw.println("alert(\"Failed! Try Again!val= "+name+" \");");
                    // pw.println("</script>");

                    String psrch = "SELECT * FROM packages where PackageName=\""+name+"\";";
                    st=con.createStatement();
                    rs1=st.executeQuery(psrch);
                    rs1.next();
                    String asrch = "SELECT * FROM activity where PPID=\""+rs1.getString(1)+"\";";
                    Statement actSt = con.createStatement();
                    rs2=actSt.executeQuery(asrch);

                    List<activity> activities = new ArrayList<>();

                    while(rs2.next()){
                        activities.add(new activity(rs2.getString(2),rs2.getString(3),rs2.getInt(4)));
                        // pw.println("<p>"+rs2.getString(2)+"</p>");
                    }
                    vPackage packages;
                    
                    packages = new vPackage(rs1.getString(2),rs1.getString(3),rs1.getString(4),rs1.getString(6),rs1.getString(7),rs1.getInt(5),activities);
                    
        
                    Gson gson = new GsonBuilder().create();
                    JsonObject jsonobject = (JsonObject)gson.toJsonTree(packages);
                    // JsonObject jsonobject = new JsonObject();
                    // jsonobject.add("packages", jarray);

                    pw.println(jsonobject);
                    // pw.println("alert(\"Success! Click ok to view table contnts \");");
                    // // pw.println("location='http://localhost:8080/Ex4b/viewServlet';");
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





















// import java.sql.*;
// import java.io.*;
// import jakarta.servlet.*;
// import jakarta.servlet.http.*;
// import java.util.Objects;
// import java.io.IOException;
// import java.util.ArrayList;
// import java.util.List;
// import com.google.gson.Gson;
// import com.google.gson.GsonBuilder;
// import com.google.gson.JsonArray;
// import com.google.gson.JsonObject;


// public class displayPackage extends HttpServlet {


//     public int y =0;
//     class activity{
//         public String aname, desc;
//         public int day;

//         public activity(String aname, String desc, int day){
//             this.aname = aname;
//             this.desc = desc;
//             this.day = day;
//         }
//     }
//     class vPackage {

//         public String vpackage;
//         public String desc,destination, duration, hotel;
//         public int cost;
//         public List<activity> activities;

//             public vPackage(String vpackage, String desc, String destination, String duration, String hotel, int cost, List<activity> activities) {
//                 this.vpackage = vpackage;
//                 this.desc = desc;
//                 this.destination = destination;
//                 this.duration = duration;
//                 this.hotel = hotel;
//                 this.cost = cost;
//                 this.activities = new ArrayList<>(activities);
//             }

//         }
//     public void doGet(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException {
        
//         response.setContentType("application/json");
//         PrintWriter pw=response.getWriter();
//         int flag=0;
//         Connection con;
//         Statement st;
//         ResultSet rs1,rs2;        
//         try
//         {
//             Class.forName("com.mysql.cj.jdbc.Driver");
//             try
//             {
//                 flag=1;
//                 con =DriverManager.getConnection("jdbc:mysql://localhost:3306/vacayplanner","root","root");
//                 /*
//                 packages-schema

//                 PPID int NOT NULL,
//                 PackageName varchar(255) NOT NULL,-2
//                 description text,-3
//                 destination varchar(255) NOT NULL,-4
//                 cost int NOT NULL,-5
//                 duration varchar(32),-6
//                 hotels varchar(255),-7
//                 primary key(PPID)


//                 activity-schema

//                 PPID int not null,
//                 activityname varchar(255),-2
//                 description TEXT,-3
//                 day int,-4
//                 primary key(activityname),
//                 foreign key(ppid) references packages(ppid)
//                 */
                                
//                 try
//                 {
//                     String name = request.getParameter("val");

//                     String psrch = "SELECT * FROM packages where PackageName=\""+name+"\";";
//                     st=con.createStatement();
//                     rs1=st.executeQuery(psrch);
//                     String asrch = "SELECT * FROM activity where PPID=\""+rs1.getString(1)+"\";";
//                     Statement actSt = con.createStatement();
//                     rs2=st.executeQuery(asrch);

//                     List<activity> activities = new ArrayList<>();

//                     while(rs2.next()){
//                         activities.add(new activity(rs2.getString(2),rs2.getString(3),rs2.getInt(4)));
//                     }
//                     vPackage packages = new vPackage(rs1.getString(2),rs1.getString(3),rs1.getString(4),rs1.getString(6),rs1.getString(7),rs1.getInt(5),activities);
//                     Gson gson = new GsonBuilder().create();
//                     JsonArray jarray = gson.toJsonTree(packages).getAsJsonArray();
//                     JsonObject jsonobject = new JsonObject();
//                     jsonobject.add("packages", jarray);

//                     pw.println(jsonobject);
//                     // pw.println("alert(\"Inserted Successfully! Click ok to view table contnts \");");
//                     // pw.println("location='http://localhost:8080/Ex4b/viewServlet';");
//                     // pw.println("</script>");

//                 }
//                 catch(SQLException e)
//                 {
//                     // pw.println("<script>");
//                     // pw.println("alert(\"Failed! Try Again!flag1 "+e+" \");");
//                     // pw.println("location='http://localhost:8080/Ex4b/options.html';");
//                     // pw.println("</script>");
//                     flag=1;
//                 }
//             }
//             catch (SQLException e)
//             {
//                 flag=2;
//             }     
//         }
//         catch(ClassNotFoundException e)
//         {
//             flag=3; 
//         }
//         // if(flag==2)
//         // {
//         //     // pw.println("<script>");
//         //     // pw.println("alert(\"Failed to establish connection.Try again Later. Error Code :1 flag: 2 \");");
//         // //     pw.println("location='http://localhost:8080/Ex4b/options.html';");
//         //     // pw.println("</script>");
//         // }
//         // else if(flag==3)
//         // {
//         //     // pw.println("<script>");
//         //     // pw.println("alert(\"Driver class not found.Error Code :0 flag: 3\");");
//         //     // // pw.println("location='http://localhost:8080/Ex4b/options.html';");
//         //     // pw.println("</script>");
//         // }
//         pw.close();
//     }
// }