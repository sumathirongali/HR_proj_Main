package hr_package;

import java.io.IOException;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Model.ProjectContracts;

/**
 * Servlet implementation class ProjContracts
 */
@WebServlet("/ProjContracts")

public class ProjContracts extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProjContracts() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		
		String deleteId = request.getParameter("Delete_ProjId");
		
		if (deleteId != null)
		{
			String message = null;
			try {
				String[] deleteArray = deleteId.split(";");
				String deleteProjContractsQuery = "Delete FROM project_contracts WHERE project_id = '" + deleteArray[0] + "' AND project_name = '" + deleteArray[1] + "' AND reporting_to = '" + deleteArray[2] + "' AND stakeholder_id = '" + deleteArray[3] 
						+ "' AND stakeholder_name = '" + deleteArray[4] + "' AND start_date = '" + deleteArray[5] + "' AND end_date = '" + deleteArray[6] + "';";
				int i = DbManager.InsertOrUpdateorDeleteEmpDetails(deleteProjContractsQuery);
				
				if (i > 0) {
					message = "Successfully Saved!";
				}
			}
			catch (Exception ex) {
				message = "ERROR: " + ex.getMessage();
			ex.printStackTrace();
			}
			finally {
				// sets the message in request scope
				request.setAttribute("Message", message);
			}
		}
			
		// Building Get Query	
		String getListProjContractsQuery = "SELECT * FROM project_contracts;";
		ResultSet rs = DbManager.GetEmpDetails(getListProjContractsQuery);
		
 		List <ProjectContracts> projContractsList = LoadProjList(rs);	
		

        RequestDispatcher dispatcher = request.getRequestDispatcher("listProjContracts.jsp");
        request.setAttribute("projContractsList", projContractsList);
        dispatcher.forward(request, response);

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//doGet(request, response);
		
		String searchId = request.getParameter("proj_search");
		String searchProjectQuery = "SELECT * FROM project_contracts WHERE project_id = '" + searchId + "' OR project_name = '" + searchId + "' OR reporting_to = '" + searchId 
				+ "' OR stakeholder_id = '" + searchId + "' OR stakeholder_name = '" + searchId +"';";
		
		ResultSet rs = DbManager.GetEmpDetails(searchProjectQuery);
		
		List <ProjectContracts> projContractsList = LoadProjList(rs);	
		

        RequestDispatcher dispatcher = request.getRequestDispatcher("listProjContracts.jsp");
        request.setAttribute("projContractsList", projContractsList);
        dispatcher.forward(request, response);
		
	}
	
	private List<ProjectContracts> LoadProjList(ResultSet rs){
			
			List <ProjectContracts> projContractsList = new ArrayList <> ();
			
			try {
				while(rs.next())
				{
					ProjectContracts objProjContracts = new ProjectContracts();
					
					objProjContracts.projectID = rs.getString("project_id");
					objProjContracts.projectName = rs.getString("project_name");
					objProjContracts.reportingTo = rs.getInt("reporting_to");
					objProjContracts.projectBudget = rs.getInt("project_budget");
					objProjContracts.startDate = rs.getString("start_date");
					objProjContracts.endDate = rs.getString("end_date");
					objProjContracts.stakeholderId = rs.getString("stakeholder_id");
					objProjContracts.stakeholdername = rs.getString("stakeholder_name");
					
					projContractsList.add(objProjContracts);								
				}
	
			} catch (Exception ex) {
				// TODO Auto-generated catch block
				ex.printStackTrace();
			}
			
			return projContractsList;		
			
		}

}
