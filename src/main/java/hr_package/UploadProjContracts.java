package hr_package;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Model.ProjectContracts;

/**
 * Servlet implementation class UploadProjContracts
 */
@WebServlet("/UploadProjContracts")
public class UploadProjContracts extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public UploadProjContracts() {
		super();
		// TODO Auto-generated constructor stub
	}


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// Building Get Query	
		String editId = request.getParameter("Edit_ProjId");
		
		String[] editArray = editId.split(";");
		String getProjContractsQuery = "SELECT * FROM project_contracts WHERE project_id = '" + editArray[0] + "' AND project_name = '" + editArray[1] + "' AND reporting_to = '" + editArray[2] + "' AND stakeholder_id = '" + editArray[3] 
				+ "' AND stakeholder_name = '" + editArray[4] + "' AND start_date = '" + editArray[5] + "' AND end_date = '" + editArray[6] + "';";
		
		ResultSet rs = DbManager.GetEmpDetails(getProjContractsQuery);
		
		ProjectContracts objProjContracts = new ProjectContracts();
		
		try {
			while(rs.next())
			{				
				objProjContracts.projectID = rs.getString("project_id");
				objProjContracts.projectName = rs.getString("project_name");
				objProjContracts.reportingTo = rs.getInt("reporting_to");
				objProjContracts.projectBudget = rs.getInt("project_budget");
				objProjContracts.startDate = rs.getString("start_date");
				objProjContracts.endDate = rs.getString("end_date");
				objProjContracts.stakeholderId = rs.getString("stakeholder_id");
				objProjContracts.stakeholdername = rs.getString("stakeholder_name");			
			}
		} catch (Exception ex) {
			// TODO Auto-generated catch block
			ex.printStackTrace();
		}
		
        RequestDispatcher dispatcher = request.getRequestDispatcher("addProjContracts.jsp");
        request.setAttribute("ProjConDetails", objProjContracts);
        dispatcher.forward(request, response);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// gets values of text fields		
		String project_id = request.getParameter("project_id");
		String project_name = request.getParameter("project_name");
		String cutomer_id = request.getParameter("cutomer_id");
		String customer_name = request.getParameter("customer_name");
		String proj_start = request.getParameter("proj_start");
		String proj_end = request.getParameter("proj_end");
		Integer proj_bud = Integer.parseInt(request.getParameter("proj_bud"));
		Integer proj_mng = Integer.parseInt(request.getParameter("proj_mng"));
		
		String sqlDetailsCheckQuery = "SELECT * FROM project_contracts WHERE project_id = '" + project_id +  "' AND reporting_to = " + proj_mng + ";";				
		Boolean bEmpExists = DbManager.IfEmpDetailsExists(sqlDetailsCheckQuery);

		Connection conn = DbManager.getSQLConnection();
		try {
			// connects to the database
			//DriverManager.registerDriver(new com.mysql.jdbc.Driver());		

			// constructs SQL statement
			String InsertOrUpdateQuery = null;
			int row = 0;
			String message = null;
			
			if (bEmpExists)
			{
				InsertOrUpdateQuery = "UPDATE project_contracts SET project_id = '" + project_id + "',project_name = '" + project_name + "',reporting_to = " 
						+ proj_mng + ",project_budget = " + proj_bud + ",start_date = '" + proj_start + "',end_date = '" 
						+ proj_end + "',stakeholder_id = '" + cutomer_id + "',stakeholder_name = '" + customer_name
						+ "' WHERE project_id = '" + project_id + "' AND reporting_to = " + proj_mng+ ";";
				
				PreparedStatement statement = conn.prepareStatement(InsertOrUpdateQuery);

				// sends the statement to the database server
				row = statement.executeUpdate();
			}
			else
			{
				InsertOrUpdateQuery = "INSERT INTO project_contracts (project_id,project_name,reporting_to,project_budget,start_date,end_date,stakeholder_id,stakeholder_name) values (?, ?, ?, ?, ?, ?, ?, ?)";
				PreparedStatement statement = conn.prepareStatement(InsertOrUpdateQuery);
				statement.setString(1, project_id);
				statement.setString(2, project_name);
				//statement.setString(3, project_id);
				statement.setInt(3, proj_mng);
				statement.setInt(4, proj_bud);
				statement.setString(5, proj_start);
				statement.setString(6, proj_end);
				statement.setString(7, cutomer_id);
				statement.setString(8, customer_name);

				// sends the statement to the database server
				row = statement.executeUpdate();
			}
			
			if (row > 0) {
				message = "Successfully Saved!";
			}

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
			getServletContext().getRequestDispatcher("/listProjContracts.jsp").forward(request, response);
		}
	}
}
