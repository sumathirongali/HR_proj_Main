package hr_package;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/UploadEmployeeProjects")
public class UploadEmployeeProjects extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	private String dbURL = "jdbc:mysql://localhost:3306/srh_01";
	private String dbUser = "root";
	private String dbPass = "root";
	
    public UploadEmployeeProjects() {
        super();
        
    }


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String emp_id = request.getParameter("emp_id");
		String reporting_to = request.getParameter("reporting_to");
		String project_id = request.getParameter("project_id");
		String project_name = request.getParameter("project_name");
		
		Connection conn = null; 
		String message = null;
		
		try {
			DriverManager.registerDriver(new com.mysql.jdbc.Driver());
			conn = DriverManager.getConnection(dbURL, dbUser, dbPass);
			
			String sql = "INSERT INTO emp_project(emp_id, reporting_to, project_id, project_name) VALUES(?,?,?,?);";
			PreparedStatement statement = conn.prepareStatement(sql);
			statement.setString(1, emp_id);
			statement.setString(2, reporting_to);
			statement.setString(3, project_id);
			statement.setString(4, project_name);
			
			int row = statement.executeUpdate();
			
			if (row > 0) {
				message = "File uploaded and saved into database";
			}
				response.sendRedirect("EmployeeProjectsNewEntry.jsp");
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
