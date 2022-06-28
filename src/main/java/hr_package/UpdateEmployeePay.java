package hr_package;

import java.io.*;  
import javax.servlet.*;  
import javax.servlet.http.*;


import javax.servlet.annotation.*;
import java.sql.*;



@WebServlet("/UpdateEmployeePay")
public class UpdateEmployeePay extends HttpServlet {
	private static final long serialVersionUID = 1L;
       	
	
	  public UpdateEmployeePay() { 
		  super();
	  
	  }
	 
	
	  protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException { 

			response.setContentType("text/html");
			PrintWriter out = response.getWriter();    
	        out.println("<html>");
	        out.println("<body>");
	        Connection conn = DbManager.getSQLConnection();
	        
	        try {
	        	Statement stmt=conn.createStatement();
	        	ResultSet rs = stmt.executeQuery("SELECT * FROM emp_pay;");
	    
	        	out.println("<table cellpadding=\"15\" border=\"1\" style=\"background-color: #ffffcc;\">");
	        	out.println("<tr><td><b>Employee ID</b></td><td><b>Gross Yearly</b></td><td><b>Gross Monthly</b></td>");
	        	out.println("<td><b>Action</b></td></tr>");
	        	
	        	while(rs.next()) {
	        		out.println("<form method='post' action='UpdateEmployeePay'>");
	        		out.println("<tr><td>");
	        		out.println("<input type ='text' name='emp_id' value='"+rs.getString("emp_id")+ "' readonly>");
	        		out.println("<td>");
	        		out.println("<input type ='text' name='gross_yearly' value='"+rs.getString("gross_yearly")+ "'/>");
	        		out.println("<td>");
	        		out.println("<input type ='text' name='gross_monthly' value='"+rs.getString("gross_monthly")+ "'/>");
	        		out.println("<td>");
	        		out.println("<input type='submit' value='update'>");
	        		out.println("</tr>");
	        		out.println("</form>");
	        	}
	        	out.println("</table>");
	        	
	        	out.println("<hr style='height:2px;border-width:0;color:gray;background-color:gray'>");
	        	out.println("<td><form action=\"ListEmployeePay\" method=\"get\"><button type=\"submit\"><-- back</button></form></td>");
	        	out.println("</html></body>");
	        	conn.close();
	        	rs.close();
	        }
			catch (Exception e) {
				out.println(e);
				e.printStackTrace();
			}
	  }
	 

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
		PrintWriter out = response.getWriter();  
		response.setContentType("text/html");  
        out.println("<html><body>");
        Connection conn = DbManager.getSQLConnection();
        
        String emp_id = request.getParameter("emp_id");
        String gross_yearly = request.getParameter("gross_yearly");
        String gross_monthly = request.getParameter("gross_monthly");
        
		
		String message = null;
		
		try {
			
			String sql = "UPDATE emp_pay SET gross_yearly = ?, gross_monthly = ? WHERE emp_id = ?";
			PreparedStatement statement = conn.prepareStatement(sql);
			statement.setString(1, gross_yearly);
			statement.setString(2, gross_monthly);
			statement.setString(3, emp_id);
			
			int row = statement.executeUpdate();
			if (row > 0) {
				message = "File updated and saved into database";
			}
			
			out.println("</html></body>");
			
		}catch (SQLException ex) {
			message = "ERROR: " + ex.getMessage();
			ex.printStackTrace();
		}finally {
			if (conn != null) {
				try {
					conn.close();
				}catch (SQLException ex) {
					ex.printStackTrace();
				}
			}
			request.setAttribute("Message", message);
		}
		
        
	}

}
