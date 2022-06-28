package hr_package;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.RequestDispatcher;
import java.sql.*;

import Model.EmployeeEducation;

//@WebServlet(name="EmpEducation",urlPatterns={"/EmpEducation"})
@WebServlet("/EmpEducation")
public class EmpEducation extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public EmpEducation() {
		super();
		// TODO Auto-generated constructor stub
	}

	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		String message = null;
		try {
			//Fetches input entered from request and save to Model Class Object
			EmployeeEducation objEmpEducation = fetchRequestDetails(request);

			//Building query to decide whether to update necessary details or Insert new details 
			String sqlDetailsCheckQuery = "SELECT * FROM emp_education WHERE emp_id = " + objEmpEducation.employeeID +  ";";				
			Boolean bEmpExists = DbManager.IfEmpDetailsExists(sqlDetailsCheckQuery);

			String sqlInsertorUpdateQuery;

			if (bEmpExists)
			{
				//Update query if exists already
				sqlInsertorUpdateQuery = "UPDATE emp_education SET start_date = '" + objEmpEducation.startDate + "',end_date = '" + objEmpEducation.endDate + "',country = '" 
						+ objEmpEducation.country + "',institute_name = '" + "',education_type = '" + objEmpEducation.educationType + objEmpEducation.instituteName + "',major = '" + objEmpEducation.major + "',grade = " 
						+ objEmpEducation.grade + " WHERE emp_id = " + objEmpEducation.employeeID + ";";
			}
			else
			{
				//Insert query if not exists
				sqlInsertorUpdateQuery = "INSERT INTO emp_education VALUES(" + objEmpEducation.employeeID + ",'" + objEmpEducation.educationType + "','"
						+ objEmpEducation.startDate + "','" + objEmpEducation.endDate + "','" + objEmpEducation.country + "','" + objEmpEducation.instituteName + "','"
						+ objEmpEducation.major + "'," + objEmpEducation.grade + ");";
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
	public EmployeeEducation fetchRequestDetails(HttpServletRequest request)
	{
		EmployeeEducation objEmpEducation = new EmployeeEducation();
		objEmpEducation.employeeID = Integer.parseInt(request.getParameter("emp_ID"));
		objEmpEducation.educationType = request.getParameter("emp_educationtype");
		objEmpEducation.startDate = request.getParameter("emp_startdate");
		objEmpEducation.endDate = request.getParameter("emp_enddate");
		objEmpEducation.country = request.getParameter("emp_country");
		objEmpEducation.instituteName = request.getParameter("emp_institutename");
		objEmpEducation.major = request.getParameter("emp_major");
		objEmpEducation.grade = Float.parseFloat(request.getParameter("emp_grade"));

		return objEmpEducation;
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// Building Get Query	
		String EmpID = request.getParameter("emp_Id");
		String getEmpDetailsQuery = "SELECT * FROM emp_education WHERE emp_id = " + Integer.parseInt(EmpID) +";";
		ResultSet rs = DbManager.GetEmpDetails(getEmpDetailsQuery);

		EmployeeEducation objEmpEducation = new EmployeeEducation();

		try {
			while(rs.next())
			{				
				objEmpEducation.employeeID = rs.getInt("emp_id");
				objEmpEducation.educationType = rs.getString("education_type");
				objEmpEducation.startDate = rs.getString("start_date");
				objEmpEducation.endDate = rs.getString("end_date");
				objEmpEducation.country = rs.getString("country");
				objEmpEducation.instituteName = rs.getString("institute_name");
				objEmpEducation.major = rs.getString("major");
				objEmpEducation.grade = rs.getFloat("grade");				
			}
		} catch (Exception ex) {
			// TODO Auto-generated catch block
			ex.printStackTrace();
		}
		request.setAttribute("emp_ID", EmpID);
		request.setAttribute("EmpEduDetails", objEmpEducation);
		RequestDispatcher dispatcher = request.getRequestDispatcher("empEducation.jsp");
		dispatcher.forward(request, response);

	}

}
