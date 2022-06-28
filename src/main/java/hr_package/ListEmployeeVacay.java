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


@WebServlet("/ListEmployeeVacay")
public class ListEmployeeVacay extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public ListEmployeeVacay() {
        super();
        
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		EmployeePayDAO VacayDao = new EmployeePayDAO();
		
		List<EmployeePayDisplay> EmployeeVacayBalList = VacayDao.getEmployeeBalVacayList();
		List<EmployeePayDisplay> EmployeeVacayAppList = VacayDao.getEmployeeVacayAppList();
		RequestDispatcher dispatcher = request.getRequestDispatcher("leaveDetailsDisp.jsp");
		request.setAttribute("EmployeeVacayBalList", EmployeeVacayBalList);
		request.setAttribute("EmployeeVacayAppList", EmployeeVacayAppList);
		dispatcher.forward(request, response);
	}



}
