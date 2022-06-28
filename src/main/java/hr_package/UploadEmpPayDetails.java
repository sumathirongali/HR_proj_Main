package hr_package;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/UploadEmpPayDetails")
public class UploadEmpPayDetails extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	private String dbURL = "jdbc:mysql://localhost:3306/srh_01";
	private String dbUser = "root";
	private String dbPass = "root";
	
    public UploadEmpPayDetails() {
        super();
            }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//doGet(request, response);
		
		String emp_id = request.getParameter("emp_id");
		String emp_tax_class = request.getParameter("emp_tax_class");
		String gross_yearly = request.getParameter("gross_yearly");
		String gross_monthly = request.getParameter("gross_monthly");
		String bonus = request.getParameter("bonus");
		String job_level = request.getParameter("job_level");
		String pay_scale_group = request.getParameter("pay_scale_group");
		String payment_method = request.getParameter("payment_method");
		
		String iban = request.getParameter("iban");
		String bic = request.getParameter("bic");
		String bank_name = request.getParameter("bank_name");
		
		String social_sec_num = request.getParameter("social_sec_num");
		String tax_id = request.getParameter("tax_id");
		String health_ins_type = request.getParameter("health_ins_type");
		String health_ins_id = request.getParameter("health_ins_id");
		String health_ins_provider = request.getParameter("health_ins_provider");
		
		Connection conn = null; 
		String message = null;
		
		try {
			DriverManager.registerDriver(new com.mysql.jdbc.Driver());
			conn = DriverManager.getConnection(dbURL, dbUser, dbPass);
			
			String sqlOne = "INSERT INTO emp_pay(emp_id, emp_tax_class, gross_yearly, gross_monthly, bonus, job_level, pay_scale_group, payment_method) VALUES(?,?,?,?,?,?,?,?);";
			PreparedStatement statement = conn.prepareStatement(sqlOne);
			statement.setString(1, emp_id);
			statement.setString(2, emp_tax_class);
			statement.setString(3, gross_yearly);
			statement.setString(4, gross_monthly);
			statement.setString(5, bonus);
			statement.setString(6, job_level);
			statement.setString(7, pay_scale_group);
			statement.setString(8, payment_method);
			
			String sqlTwo = "INSERT INTO emp_bank_details(emp_id, iban, bic, bank_name) VALUES(?,?,?,?);";
			PreparedStatement statementTwo = conn.prepareStatement(sqlTwo);
			statementTwo.setString(1, emp_id);
			statementTwo.setString(2, iban);
			statementTwo.setString(3, bic);
			statementTwo.setString(4, bank_name);
			
			String sqlThree = "INSERT INTO emp_insurance(emp_id, social_sec_num, tax_id, health_ins_type, health_ins_id, health_ins_provider) VALUES(?,?,?,?,?,?);";
			PreparedStatement statementThree = conn.prepareStatement(sqlThree);
			statementThree.setString(1, emp_id);
			statementThree.setString(2, social_sec_num);
			statementThree.setString(3, tax_id);
			statementThree.setString(4, health_ins_type);
			statementThree.setString(5, health_ins_id);
			statementThree.setString(6, health_ins_provider);
			
			int row = statement.executeUpdate();
			int rowTwo = statementTwo.executeUpdate();
			int rowThree = statementThree.executeUpdate();
			if(row > 0 && rowTwo > 0 && rowThree > 0) {
				message = "File uploaded and saved into the database.";
			}
			response.sendRedirect("PayDetailsEntry.jsp");
		}catch(SQLException ex) {
			message = "ERROR: " + ex.getMessage();
			ex.printStackTrace();
		}finally {
			if (conn != null) {
				try {
					conn.close();
				}catch (SQLException ex) {
					ex.printStackTrace();
				}
			}
			request.setAttribute("Message", message);
		}
	}

}
