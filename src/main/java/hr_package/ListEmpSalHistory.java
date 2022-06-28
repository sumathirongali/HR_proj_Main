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

@WebServlet("/ListEmpSalHistory")
public class ListEmpSalHistory extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public ListEmpSalHistory() {
        super();
        
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		EmployeePayDAO SalHistDao = new EmployeePayDAO();
		List<EmployeePayDisplay> EmployeeSalHistList = SalHistDao.getEmployeeSalHistList();
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("PayHistoryDisp.jsp");
		request.setAttribute("EmployeeSalHistList", EmployeeSalHistList);
		dispatcher.forward(request, response);
		
	}



}
