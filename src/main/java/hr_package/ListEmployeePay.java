package hr_package;

import java.io.IOException;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import Model.EmployeePayDisplay;


@WebServlet("/ListEmployeePay")
public class ListEmployeePay extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	
	  public ListEmployeePay() { 
		  super();
	  
	  }
	 

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			
		EmployeePayDAO TaxDao = new EmployeePayDAO();
		
		List<EmployeePayDisplay> EmployeePayList = TaxDao.getEmployeePayList();
		  
		RequestDispatcher dispatcher = request.getRequestDispatcher("morePayDetails.jsp");
		request.setAttribute("EmployeePayList", EmployeePayList);
		dispatcher.forward(request, response);
	}
	

}
