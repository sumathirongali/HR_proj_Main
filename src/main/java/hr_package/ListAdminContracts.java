package hr_package;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import hr_package.*;
import java.io.IOException;
import java.util.List;
import Model.*;



@WebServlet("/ListAdminContract")
public class ListAdminContracts extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public ListAdminContracts() {
        super();
        // TODO Auto-generated constructor stub
    }
    
    public void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    	
    	DbManager dbHelper = new DbManager();

		// Getting Student List from Database
		List<AdminContractsMod> contractList = dbHelper.GetAdminContractList("");
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("listAdminContracts.jsp");

		req.setAttribute("contractList", contractList);
		
		dispatcher.forward(req, resp);
    }
    
    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response)
        throws IOException, ServletException {
    	String message = null;
    	String searchKeyword = "";
    	RequestDispatcher dispatcher = null;
    	String contractID = request.getParameter("btnDeleteContract");
    	try {
    		DbManager dbHelper = new DbManager();
    		
    		if(contractID!= null && contractID.trim().length() > 0) {
    			dbHelper.DeleteAdminContracts(contractID);
    		}
    		else
    			searchKeyword = request.getParameter("searchKeyword") != null ? request.getParameter("searchKeyword").trim() : "";

    		// Getting Admin Contract List from Database
    		List<AdminContractsMod> contractList = dbHelper.GetAdminContractList(searchKeyword);
    		
    		dispatcher = request.getRequestDispatcher("listAdminContracts.jsp");
    		
    		//Assigning values for UI
    		request.setAttribute("contractList", contractList);
    		request.setAttribute("searchKeyword", searchKeyword);
    		
    	} catch (Exception ex) {
			message = "ERROR: " + ex.getMessage();
			ex.printStackTrace();
		}
		finally {
			// sets the message in request scope
			request.setAttribute("message_adminContracts", message);
			dispatcher.forward(request, response);
		}
    }
}