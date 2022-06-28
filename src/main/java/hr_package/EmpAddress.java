package hr_package;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mysql.cj.Session;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.RequestDispatcher;

import Model.AdminContractsMod;
import Model.EmployeeAddress;
import hr_package.*;

//@WebServlet(name="EmpAddress",urlPatterns={"/EmpAddress"})
@WebServlet("/EmpAddress")
public class EmpAddress extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	public EmpAddress() {
        super();
        // TODO Auto-generated constructor stub
    }
	
	 public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	 {
		 	String EmpID = request.getParameter("emp_Id");
			DbManager objDb = new DbManager();
			
			EmployeeAddress objEmpAddress = new EmployeeAddress();
			objEmpAddress = objDb.GetEmpAddress(EmpID);
			request.setAttribute("emp_ID", EmpID);
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
	
	@Override
    public void doPost(HttpServletRequest request, HttpServletResponse response)
        throws IOException, ServletException {
		String message = null;
		int emailCount = 0;
		EmployeeAddress objEmpAddress;
		try {
			objEmpAddress = new EmployeeAddress();
			objEmpAddress.EmployeeID = request.getParameter("emp_ID");
			objEmpAddress.Street = request.getParameter("Street");
			objEmpAddress.HouseNum = request.getParameter("House_no");
			objEmpAddress.Pincode = Integer.parseInt(request.getParameter("pin_code"));
			objEmpAddress.City = request.getParameter("City");
			objEmpAddress.State = request.getParameter("State");
			objEmpAddress.Country = request.getParameter("Country");
			objEmpAddress.Phone = request.getParameter("PhNumber");
			objEmpAddress.Email = request.getParameter("Email");
			
			DbManager objDBHelper = new DbManager();
			
			emailCount = objDBHelper.CountCheckInTable("emp_address",(objEmpAddress.Email.trim().length() > 0 ? " personal_email_id = '" + objEmpAddress.Email.trim() + "' and emp_id not in ('" + objEmpAddress.EmployeeID + "')" : ""));

			if(emailCount==0)
			{
				int i = objDBHelper.InsertOrUpdateEmpAddress(objEmpAddress);
				
				if (i > 0) {
					message = "Successfully Saved!";
				}
			}
			else
			{
				request.setAttribute("emp_ID", objEmpAddress.EmployeeID);
				request.setAttribute("ipStreet", objEmpAddress.Street == null ? "":objEmpAddress.Street);
				request.setAttribute("ipHouseNum", objEmpAddress.HouseNum == null ? "":objEmpAddress.HouseNum);
				request.setAttribute("ipPincode", objEmpAddress.Pincode == null ? "":objEmpAddress.Pincode);
				request.setAttribute("ipCity", objEmpAddress.City == null ? "":objEmpAddress.City);
				request.setAttribute("ipState", objEmpAddress.State == null ? "":objEmpAddress.State);
				request.setAttribute("ipCountry", objEmpAddress.Country == null ? "":objEmpAddress.Country);
				request.setAttribute("ipPhone", objEmpAddress.Phone == null ? "":objEmpAddress.Phone);
				request.setAttribute("ipEmail", objEmpAddress.Email == null ? "":objEmpAddress.Email);
				message = "Email ID already exists";
			}
		} catch (Exception ex) {
			message = "ERROR: " + ex.getMessage();
			ex.printStackTrace();
		}
		finally {
			// sets the message in request scope
			request.setAttribute("message_empAddress", message);

			// forwards to the message page
			if(emailCount==0)
				getServletContext().getRequestDispatcher("/editEmpAll.jsp?emp_Id=" + request.getParameter("emp_ID")).forward(request, response);
			else
			{
				getServletContext().getRequestDispatcher("/empAddress.jsp?emp_Id=" + request.getParameter("emp_ID")).forward(request, response);
			}
		}
	}
}
