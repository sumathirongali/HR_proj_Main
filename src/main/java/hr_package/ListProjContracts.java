package hr_package;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.*;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/ListProjContracts")
public class ListProjContracts extends HttpServlet {
	private static final long serialVersionUID = 1L;

	// database connection settings
	private String dbURL = "jdbc:mysql://localhost:3306/srh_01";
	private String dbUser = "root";
	private String dbPass = "root"; 


	public ListProjContracts() {
		super();
		// TODO Auto-generated constructor stub
	}


	//protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		protected void doPost(HttpServletRequest request, HttpServletResponse response)
		        throws IOException, ServletException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());

		Connection conn = null; // connection to the database
		String message = null;  // message will be sent back to client

		response.setContentType("text/html");

		try {
			// connects to the database
			DriverManager.registerDriver(new com.mysql.jdbc.Driver());
			conn = DriverManager.getConnection(dbURL, dbUser, dbPass);

			// constructs SQL statement
			String sql = "SELECT * FROM project_contracts";
			Statement stmt=conn.createStatement();  
			stmt.executeQuery(sql);

			ResultSet rs= stmt.getResultSet();
			System.out.println(rs.getString(1)+"  "+rs.getString(2)+"  "+rs.getString(3)); 
			while(rs.next())
			{
				System.out.println(rs.getString(1)+"  "+rs.getString(2)+"  "+rs.getString(3)); 
				
				request.setAttribute("project_id", rs.getString(1));
				request.setAttribute("project_name", rs.getString(2));
				//statement.setString(3, project_id);
				request.setAttribute("project_manager", rs.getString(4));
				request.setAttribute("project_budget",rs.getString(5));
				request.setAttribute("start_date",rs.getString(6));
				request.setAttribute("end_date",rs.getString(7));
				request.setAttribute("stakeholder_id",rs.getString(8));
				request.setAttribute("stakeholder_name",rs.getString(9));
				
			}
			conn.close();
		}

		catch(Exception e){ 
			System.out.println(e);
		} 			
	}
}
