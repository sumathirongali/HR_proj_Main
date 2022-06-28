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


@WebServlet("/ListEmployeeProjects")
public class ListEmployeeProjects extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public ListEmployeeProjects() {
        super();
        
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		EmployeePayDAO EmployeeProjectsDao = new EmployeePayDAO();
		List<EmployeePayDisplay> EmployeeProjectsList = EmployeeProjectsDao.getEmployeeProjectsList();
		RequestDispatcher dispatcher = request.getRequestDispatcher("EmployeeProjectsDisp.jsp");
		request.setAttribute("EmployeeProjectsList", EmployeeProjectsList);
		dispatcher.forward(request, response);
	}




}
