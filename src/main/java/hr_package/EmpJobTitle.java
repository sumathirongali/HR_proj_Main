package hr_package;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import hr_package.*;

import java.io.IOException;
import Model.*;

@WebServlet("/EmpJobTitle")
public class EmpJobTitle extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	public EmpJobTitle() {
        super();
        // TODO Auto-generated constructor stub
    }
	
	public void doGet(HttpServletRequest request, HttpServletResponse response)
	        throws IOException, ServletException 
	{
		String EmpID = request.getParameter("emp_Id");
		DbManager objDb = new DbManager();
		
		EmployeeJobTitle objEmpJobTitle = objDb.GetEmpJobTitle(EmpID);
		request.setAttribute("ipEmployeeID", EmpID);
		request.setAttribute("ipEmployeeStatus", objEmpJobTitle.EmployeeStatus == null ? "":objEmpJobTitle.EmployeeStatus);
		request.setAttribute("ipEmployeeSubStatus", objEmpJobTitle.EmployeeSubStatus == null ? "":objEmpJobTitle.EmployeeSubStatus);
		request.setAttribute("ipEmployeeTitle", objEmpJobTitle.EmployeeTitle == null ? "":objEmpJobTitle.EmployeeTitle);
		request.setAttribute("ipCurrentJobTitle", objEmpJobTitle.CurrentJobTitle == null ? "":objEmpJobTitle.CurrentJobTitle);
		request.setAttribute("ipWorkingStatus", objEmpJobTitle.WorkingStatus == null ? "":objEmpJobTitle.WorkingStatus);
		RequestDispatcher view = request.getRequestDispatcher("empJobTitle.jsp");
		view.forward(request, response);
	}
	
	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response)
	        throws IOException, ServletException {
		String message = null;
		try {
			 
			EmployeeJobTitle objempjobtitle= new EmployeeJobTitle();
			objempjobtitle.EmployeeID = request.getParameter("emp_ID");
			objempjobtitle.EmployeeStatus = request.getParameter("empStatus");
			objempjobtitle.EmployeeSubStatus = request.getParameter("Empsubstatus");
			objempjobtitle.EmployeeTitle = request.getParameter("EmployeeTitle");
			objempjobtitle.CurrentJobTitle = request.getParameter("CurrentJobTitle");
			objempjobtitle.WorkingStatus = request.getParameter("Workingstatus");
			
			DbManager objDB = new DbManager();
			
			int i = objDB.InsertOrUpdateEmpJobTitle(objempjobtitle);
			if (i > 0) {
				message = "Successfully Saved!";
			}
		}
		catch(Exception ex){
			message = "ERROR: " + ex.getMessage();
			ex.printStackTrace();
		}
		finally
		{
			request.setAttribute("Message", message);
			getServletContext().getRequestDispatcher("/editEmpAll.jsp?emp_Id=" + request.getParameter("emp_ID")).forward(request, response);
		}
	}

}
