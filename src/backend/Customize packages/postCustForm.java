import java.sql.*;
import java.io.*;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.util.*;
import java.text.SimpleDateFormat;  
import java.util.Date;  

public class postCustForm extends HttpServlet {
    public void doGet(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException {
        
        response.setContentType("text/html");
        System.out.println("HIHHIHIHIHIHIHIIH");

        PrintWriter pw=response.getWriter();
  
        Enumeration en=request.getParameterNames();

		while(en.hasMoreElements())
		{
			Object objOri=en.nextElement();
			String param=(String)objOri;
			String value=request.getParameter(param);
			pw.println("Parameter Name is '"+param+"' and Parameter Value is '"+value+"'");
			System.out.println("param="+param+"val="+value);
		}		
			pw.close();	

    }
}