package hr_package;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class RetrieveProjContracts
 */
@WebServlet("/RetrieveProjContracts")
public class RetrieveProjContracts extends HttpServlet {
	private static final long serialVersionUID = 1L;



	public RetrieveProjContracts() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());

		Connection conn = DbManager.getSQLConnection();
		String message = null;  // message will be sent back to client

		try {
			
			// constructs SQL statement
			Statement stmt=conn.createStatement();  			
			ResultSet rs=stmt.executeQuery("select * from project_contracts where proj_id=p10");  
			
			request.setAttribute("project_id", rs.getString(1));
			request.setAttribute("project_name", rs.getString(2));
			//statement.setString(3, project_id);
			request.setAttribute("project_manager", rs.getString(4));
			request.setAttribute("project_budget",rs.getString(5));
			request.setAttribute("start_date",rs.getString(6));
			request.setAttribute("end_date",rs.getString(7));
			request.setAttribute("stakeholder_id",rs.getString(8));
			request.setAttribute("stakeholder_name",rs.getString(9));

		} catch (SQLException ex) {
			message = "ERROR: " + ex.getMessage();
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
			request.setAttribute("Message", message);

			// forwards to the message page
			//getServletContext().getRequestDispatcher("viewProjContracts.jsp").forward(request, response);
		}

	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
