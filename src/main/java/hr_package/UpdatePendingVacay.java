package hr_package;

import java.io.*;  
import javax.servlet.*;  
import javax.servlet.http.*;


import javax.servlet.annotation.*;
import java.sql.*;

@WebServlet("/UpdatePendingVacay")
public class UpdatePendingVacay extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public UpdatePendingVacay() {
        super();
        
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();    
        out.println("<html><body>");
        Connection conn = DbManager.getSQLConnection();
        
        try {
        	Statement stmt=conn.createStatement();
        	ResultSet rs = stmt.executeQuery("SELECT * FROM emp_vacation WHERE vacation_status = 'Pending';");
        	out.println("<table cellpadding=\"15\" border=\"1\" style=\"background-color: #ffffcc;\">");
        	out.println("<tr><td><b>Employee ID</b></td><td><b>Start Date</b></td><td><b>End Date</b></td>");
        	out.println("<td><b>Leave Type</b></td><td><b>Vacation Status</b></td>");
        	out.println("<td><b>Action</b></td></tr>");
        	
        	while(rs.next()) {
        		out.println("<form method='post' action='UpdatePendingVacay'>");
        		out.println("<tr><td>");
        		out.println("<input type ='text' name='emp_id' value='"+rs.getString("emp_id")+ "' readonly>");
        		out.println("<td>");
        		out.println("<input type ='date' name='start_date' value='"+rs.getString("start_date")+ "' readonly>");
        		out.println("<td>");
        		out.println("<input type ='date' name='end_date' value='"+rs.getString("end_date")+ "' readonly>");
        		out.println("<td>");
        		out.println("<input type ='text' name='leave_type' value='"+rs.getString("leave_type")+ "' readonly>");
        		out.println("<td>");
        		out.println("<select name='vacation_status'><option value='"+rs.getString("vacation_status")+ "'>Pending</option><option value='Approved'>Approved</option><option value='Rejected'>Rejected</option></select>");
        		out.println("<td>");
        		out.println("<input type='submit' value='update'>");
        		out.println("</tr>");
        		out.println("</form>");
        	}
        		out.println("</table>");
        		out.println("<hr style='height:2px;border-width:0;color:gray;background-color:gray'>");
        		out.println("<td><form action=\"ListEmployeeVacay\" method=\"get\"><button type=\"submit\"><-- back</button></form></td>");
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
        String vacation_status = request.getParameter("vacation_status");
        
        String message = null;
        
        try {
        	
        	String sql = "UPDATE emp_vacation SET vacation_status = ? WHERE emp_id = ? ORDER BY start_date DESC limit 1";
        	PreparedStatement statement = conn.prepareStatement(sql);
			statement.setString(1, vacation_status);
			statement.setString(2, emp_id);
			
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
