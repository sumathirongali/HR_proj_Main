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

@WebServlet("/ListEmpTaxAndNetSal")
public class ListEmpTaxAndNetSal extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public ListEmpTaxAndNetSal() {
        super();
        
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String EmpID= request.getParameter("emp_Id");
		EmployeePayDAO TaxNetDao = new EmployeePayDAO();
		List<EmployeePayDisplay> EmployeeTaxList = TaxNetDao.getEmployeeTaxDetails(EmpID);
		RequestDispatcher dispatcher = request.getRequestDispatcher("TaxAndNetPayDisp.jsp?emp_Id=request.getParameter(\"emp_Id\")");
		request.setAttribute("EmployeeTaxList", EmployeeTaxList);
		dispatcher.forward(request, response);
	}


}
