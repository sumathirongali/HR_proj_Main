package hr_package;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.RequestDispatcher;
import Model.*;
/**
 * Servlet implementation class dashboardServlet
 */
@WebServlet("/dashboardServlet")
public class dashboardServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public dashboardServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String action = request.getParameter("action");
		String EmpID = request.getParameter("emp_ID");
		DbManager objDb = new DbManager();
		
		if ("empaddress".equals(action)) {
			EmployeeAddress objEmpAddress = new EmployeeAddress();
			objEmpAddress = objDb.GetEmpAddress(EmpID);
			request.setAttribute("ipEmployeeID", EmpID);
			request.setAttribute("ipStreet", objEmpAddress.Street == null ? "":objEmpAddress.Street);
			request.setAttribute("ipHouseNum", objEmpAddress.HouseNum == null ? "":objEmpAddress.HouseNum);
			request.setAttribute("ipPincode", objEmpAddress.Pincode == null ? "":objEmpAddress.Pincode);
			request.setAttribute("ipCity", objEmpAddress.City == null ? "":objEmpAddress.City);
			request.setAttribute("ipState", objEmpAddress.State == null ? "":objEmpAddress.State);
			request.setAttribute("ipCountry", objEmpAddress.Country == null ? "":objEmpAddress.Country);
			request.setAttribute("ipPhone", objEmpAddress.Phone == null ? "":objEmpAddress.Phone);
			request.setAttribute("ipEmail", objEmpAddress.Email == null ? "":objEmpAddress.Email);
			RequestDispatcher view = request.getRequestDispatcher("empAddress.jsp");
		    view.forward(request, response);
		} 
		else if ("emptitle".equals(action)) {
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
	}
}
