package hr_package;

import java.io.*;  
import javax.servlet.*;  
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.sql.*;

@WebServlet("/UpdateEmployeeProjects")
public class UpdateEmployeeProjects extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	private String dbURL = "jdbc:mysql://localhost:3306/srh_01";
	private String dbUser = "root";
	private String dbPass = "root";

    public UpdateEmployeeProjects() {
        super();
        
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();    
        out.println("<html><body>");
        
		Connection conn = null;
		Statement st = null;
		ResultSet rs = null;
		
		try {
			DriverManager.registerDriver(new com.mysql.jdbc.Driver());
			conn = DriverManager.getConnection(dbURL, dbUser, dbPass);
			st=conn.createStatement();
        	String queryString = "Select * from emp_project";
        	rs = st.executeQuery(queryString);
        	out.println("<table cellpadding=\"15\" border=\"1\" style=\"background-color: #ffffcc;\">");
        	out.println("<tr><td><b>Employee ID</b></td><td><b>Reporting To</b></td><td><b>Project ID</b></td>");
        	out.println("<td><b>Project Name</b></td>");
        	out.println("<td><b>Action</b></td></tr>");
        	
        	while(rs.next()) {
        		out.println("<form method='post' action='UpdateEmployeeProjects'>");
        		out.println("<tr>");
        		out.println("<td>");
        		out.println("<input type ='number' name='emp_id' value='"+rs.getString("emp_id")+ "' />");
        		out.println("<td>");
        		out.println("<input type ='number' name='reporting_to' value='"+rs.getString("reporting_to")+ "' />");
        		out.println("<td>");
        		out.println("<input type ='text' name='project_id' value='"+rs.getString("project_id")+ "'/>");
        		out.println("<td>");
        		out.println("<input type ='text' name='project_name' value='"+rs.getString("project_name")+ "'/>");
        		out.println("<td>");
        		out.println("<input type='submit' value='update'>");
        		out.println("</tr>");
        		out.println("</form>");
        	}
        		out.println("</table>");
        		out.println("</html></body>");
        		out.println("<td><form action=\"ListEmployeeProjects\" method=\"get\"><button type=\"submit\"><-- back</button></form></td>");
        		conn.close();
        		rs.close();
		}
		catch (Exception e) {
			out.println(e);
			e.printStackTrace();
		}
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
		PrintWriter out = response.getWriter();  
		response.setContentType("text/html");  
        out.println("<html><body>");
        
        String emp_id = request.getParameter("emp_id");
        String reporting_to = request.getParameter("reporting_to");
        String project_id = request.getParameter("project_id");
        String project_name = request.getParameter("project_name");
        
		Connection conn = null;
		String message = null;
		
		try {
			DriverManager.registerDriver(new com.mysql.jdbc.Driver());
			conn = DriverManager.getConnection(dbURL, dbUser, dbPass);
			
			String sql = "update emp_project set emp_id = ?, reporting_to = ?, project_id = ?, project_name = ? where emp_id = ?";
			
			PreparedStatement statement = conn.prepareStatement(sql);
			statement.setString(1, emp_id);
			statement.setString(2, reporting_to);
			statement.setString(3, project_id);
			statement.setString(4, project_name);
			statement.setString(5, emp_id);
			
			int row = statement.executeUpdate();
			if (row > 0) {
				message = "File updated and saved into database";
			}
			
			out.println("</html></body>");
			
		}
		catch (SQLException ex) {
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
