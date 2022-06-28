package hr_package;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Model.EmployeeTypes;

/**
 * Servlet implementation class EmployeeDetails
 */
@WebServlet("/EmployeeDetails")
public class EmployeeDetails extends HttpServlet {
	private static final long serialVersionUID = 1L;


	public EmployeeDetails() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// gets values of text fields		
		String first_name = request.getParameter("first_name");
		String last_name = request.getParameter("last_name");
		String middle_name = request.getParameter("middle_name");
		String gender = request.getParameter("gender");
		String dob = request.getParameter("dob");
		String doj = request.getParameter("doj");
		String marital_status = request.getParameter("marital_status");
		int children = Integer.parseInt(request.getParameter("children"));
		String nationality = request.getParameter("nationality");
		String mail_id = request.getParameter("mail_id");

		Connection conn = DbManager.getSQLConnection();
		try {
			// connects to the database
			//DriverManager.registerDriver(new com.mysql.jdbc.Driver());		

			// constructs SQL statement
			String sql = "INSERT INTO employees (last_name,middle_name,first_name,gender,joining_date,date_of_birth,nationality,martial_status,children,offical_email_id) values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
			PreparedStatement statement = conn.prepareStatement(sql);
			statement.setString(1, last_name);
			statement.setString(2, middle_name);
			statement.setString(3, first_name);
			statement.setString(4, gender);
			statement.setString(5, doj);
			statement.setString(6, dob);
			statement.setString(7, nationality);
			statement.setString(8, marital_status);
			statement.setInt(9, children);
			statement.setString(10, mail_id);

			// sends the statement to the database server
			int row = statement.executeUpdate();
		} catch (SQLException ex) {
			//message = "ERROR: " + ex.getMessage();
			ex.printStackTrace();
		} finally {
			if (conn != null) {
				// closes the database connection
				try {
					conn.close();
				} catch (SQLException ex) {
					ex.printStackTrace();
				}
			}
			// sets the message in request scope
			//request.setAttribute("Message", message);

			// forwards to the message page
			getServletContext().getRequestDispatcher("/getEmployeeList").forward(request, response);
		}
	}
}
