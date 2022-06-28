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

@WebServlet("/UploadEmpVacayDetails")
public class UploadEmpVacayDetails extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private String dbURL = "jdbc:mysql://localhost:3306/srh_01";
	private String dbUser = "root";
	private String dbPass = "root";
	
    public UploadEmpVacayDetails() {
        super();
        
    }


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// doGet(request, response);
		String emp_id = request.getParameter("emp_id");
		String start_date = request.getParameter("start_date");
		String end_date = request.getParameter("end_date");
		String leave_type = request.getParameter("leave_type");
		String vacation_status = request.getParameter("vacation_status");
		String leave_note = request.getParameter("leave_note");
		
		Connection conn = null; 
		String message = null;
		
		try {
			
			DriverManager.registerDriver(new com.mysql.jdbc.Driver());
			conn = DriverManager.getConnection(dbURL, dbUser, dbPass);
			
			String sql = "INSERT INTO emp_vacation(emp_id, start_date, end_date, leave_type, vacation_status, leave_note) VALUES(?,?,?,?,?,?);";
			PreparedStatement statement = conn.prepareStatement(sql);
			statement.setString(1, emp_id);
			statement.setString(2, start_date);
			statement.setString(3, end_date);
			statement.setString(4, leave_type);
			statement.setString(5, vacation_status);
			statement.setString(6, leave_note);
			
			int row = statement.executeUpdate();
			if(row > 0) {
				message = "File uploaded and saved into the database.";
			}

			response.sendRedirect("VacayNewRecordEntry.jsp");
		}catch(SQLException ex) {
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
