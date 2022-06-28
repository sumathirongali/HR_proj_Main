package hr_package;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;

import Model.EmployeeInsurance;
/**
 * Servlet implementation class EmpInsurance
 */
//@WebServlet(name="EmpInsurance",urlPatterns={"/EmpInsurance"})
@WebServlet("/EmpInsurance")
public class EmpInsurance extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EmpInsurance() {
        super();
        // TODO Auto-generated constructor stub
    }


	@Override
    public void doPost(HttpServletRequest request, HttpServletResponse response)
        throws IOException, ServletException {
		String message = null;
		try {
			//Fetches input entered from request and save to Model Class Object
			EmployeeInsurance objEmpInsurance = fetchRequestDetails(request);
			
			//Building query to decide whether to update necessary details or Insert new details 
			String sqlDetailsCheckQuery = "SELECT * FROM emp_insurance WHERE emp_id = " + objEmpInsurance.employeeID + ";";				
			Boolean bEmpExists = DbManager.IfEmpDetailsExists(sqlDetailsCheckQuery);
			
			String sqlInsertorUpdateQuery;
			
			if (bEmpExists)
			{
				//Update query if exists already
				sqlInsertorUpdateQuery = "UPDATE emp_insurance SET social_sec_num = '" + objEmpInsurance.socialSecurityNumber + "',tax_id = '" + objEmpInsurance.taxID + "',health_ins_type = '" 
						+ objEmpInsurance.healthInsuranceType + "',health_ins_id = '" + objEmpInsurance.healthInsuranceID + "',health_ins_provider = '" + objEmpInsurance.healthInsuranceProvider 
						+ "' WHERE emp_id = " + + objEmpInsurance.employeeID + ";";
			}
			else
			{
				//Insert query if not exists
				sqlInsertorUpdateQuery = "INSERT INTO emp_insurance VALUES(" + objEmpInsurance.employeeID + ",'" + objEmpInsurance.socialSecurityNumber + "','"
						+ objEmpInsurance.taxID + "','" + objEmpInsurance.healthInsuranceType + "','" + objEmpInsurance.healthInsuranceID + "','" + objEmpInsurance.healthInsuranceProvider + "');";

			}
			
			
			int i = DbManager.InsertOrUpdateorDeleteEmpDetails(sqlInsertorUpdateQuery);
			
			if (i > 0) {
				message = "Successfully Saved!";
			}
		} catch (Exception ex) {
			message = "ERROR: " + ex.getMessage();
			ex.printStackTrace();
		}
		finally {
			// sets the message in request scope
			request.setAttribute("Message", message);

			// forwards to the message page
			//getServletContext().getRequestDispatcher("/dashboard.jsp").forward(request, response);
			getServletContext().getRequestDispatcher("/editEmpAll.jsp?emp_Id=" + request.getParameter("emp_ID")).forward(request, response);
		}
	}
	
	
	//Fetch Details from Request
	public EmployeeInsurance fetchRequestDetails(HttpServletRequest request)
	{
		EmployeeInsurance objEmpInsurance = new EmployeeInsurance();
		objEmpInsurance.employeeID = Integer.parseInt(request.getParameter("emp_ID"));
		objEmpInsurance.socialSecurityNumber = request.getParameter("emp_socialsecuritynumber");
		objEmpInsurance.taxID = request.getParameter("emp_taxid");
		objEmpInsurance.healthInsuranceType = request.getParameter("emp_healthinsurancetype");
		objEmpInsurance.healthInsuranceID = request.getParameter("emp_healthinsuranceid");
		objEmpInsurance.healthInsuranceProvider = request.getParameter("emp_healthinsuranceprovider");
		
		return objEmpInsurance;
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// Building Get Query
		String EmpID = request.getParameter("emp_Id");
		String getEmpDetailsQuery = "SELECT * FROM emp_insurance WHERE emp_id = " + Integer.parseInt(EmpID) + ";";
		ResultSet rs = DbManager.GetEmpDetails(getEmpDetailsQuery);
		
		//List <EmployeeInsurance> userDetailsList = new ArrayList <> ();
		EmployeeInsurance objEmpInsurance = new EmployeeInsurance();
		
		try {
			while(rs.next())
			{				
				objEmpInsurance.employeeID = rs.getInt(EmpID);
				objEmpInsurance.socialSecurityNumber = rs.getString("social_sec_num");
				objEmpInsurance.taxID = rs.getString("tax_id");
				objEmpInsurance.healthInsuranceType = rs.getString("health_ins_type");
				objEmpInsurance.healthInsuranceID = rs.getString("health_ins_id");
				objEmpInsurance.healthInsuranceProvider = rs.getString("health_ins_provider");					
				
			}
		} catch (Exception ex) {
			// TODO Auto-generated catch block
			ex.printStackTrace();
		}
		request.setAttribute("EmpInsDetails", objEmpInsurance);
		request.setAttribute("emp_ID", EmpID);
        RequestDispatcher dispatcher = request.getRequestDispatcher("empInsurance.jsp");
        dispatcher.forward(request, response);
		
	}
	
}

    
   