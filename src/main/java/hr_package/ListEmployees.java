package hr_package;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import Model.EmployeeTypes;

@WebServlet("/ListEmployees")
public class ListEmployees extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ListEmployees() {
        super();
        // TODO Auto-generated constructor stub
    }
    
    public void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		EmployeeDAO dao = new EmployeeDAO();
			

		// Getting Student List from Database
		List<EmployeeTypes> employeeList = dao.getEmployeeList("");
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("listEmployees.jsp");

		req.setAttribute("employeeList", employeeList);
		
		dispatcher.forward(req, resp);
	}
    

    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response)
        throws IOException, ServletException {
    	String message = null;
    	String searchKeyword = "";
    	RequestDispatcher dispatcher = null;
    	String emp_Id = request.getParameter("btnDeleteEmployee");
    	try {
    		DbManager dbHelper = new DbManager();
    		EmployeeDAO dao = new EmployeeDAO();
    		if(emp_Id!= null && emp_Id.trim().length() > 0) {
    			dbHelper.DeleteEmployee(emp_Id);
    		}
    		else
    			searchKeyword = request.getParameter("searchKeyword") != null ? request.getParameter("searchKeyword").trim() : "";

    		// Getting Employee List from Database
    		List<EmployeeTypes> employeeList = dao.getEmployeeList(searchKeyword);
    		
    		dispatcher = request.getRequestDispatcher("listEmployees.jsp");
    		
    		//Assigning values for UI
    		request.setAttribute("employeeList", employeeList);
    		request.setAttribute("searchKeyword", searchKeyword);
    		
    	} catch (Exception ex) {
			message = "ERROR: " + ex.getMessage();
			ex.printStackTrace();
		}
		finally {
			// sets the message in request scope
			request.setAttribute("message_employees", message);
			dispatcher.forward(request, response);
		}
    }

}
