import javax.servlet.http.*;
import javax.servlet.*;
import java.io.*;

public class LogServlet extends HttpServlet{
	public void doGet(HttpServletRequest request,HttpServletResponse response) throws ServletException,IOException{
		
		response.setContentType("text");
		PrintWriter pw = response.getWriter();

		Cookie[] cookies = request.getCookies();
 

		if (cookies != null) {
			HttpSession session = request.getSession(); 
			String fname = (String)session.getAttribute("fname");
			String lname = (String)session.getAttribute("lname");
			//pw.println("VALUE: " +cookies[0].getValue() + "; TOTAL COOKIES: " + cookies.length);
			pw.println(fname + " " + lname);
		}
		else{
			pw.println("NO COOKIES FOUND");
		}
		
		pw.close();
	}
}
