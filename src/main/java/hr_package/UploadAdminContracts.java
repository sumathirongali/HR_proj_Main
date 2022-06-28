package hr_package;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/UploadAdminContracts")
public class UploadAdminContracts extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	private String dbURL = "jdbc:mysql://localhost:3306/srh_01";
	private String dbUser = "root";
	private String dbPass = "root";
	
    public UploadAdminContracts() {
        super();
        
    }


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//doGet(request, response);
		
		String contract_type = request.getParameter("contract_type");
		String contract_id = request.getParameter("contract_id");
		String contract_manager = request.getParameter("contract_manager");
		String start_date = request.getParameter("start_date");
		String end_date = request.getParameter("end_date");
		String contract_workers = request.getParameter("contract_workers");
		String contract_budget = request.getParameter("contract_budget");
		RequestDispatcher dispatcher = null;
		Connection conn = null; 
		String message = null;
		try {

			conn = DbManager.getSQLConnection();
			String sql = "insert into admin_contracts(contract_type, contract_id, contract_manager, start_date, end_date, contract_workers, contract_budget)"
					+ "values (?, ?, ?, ?, ?, ?, ?)";
			PreparedStatement statement = conn.prepareStatement(sql);
			statement.setString(1, contract_type);
			statement.setString(2, contract_id);
			statement.setString(3, contract_manager);
			statement.setString(4, start_date);
			statement.setString(5, end_date);
			statement.setString(6, contract_workers);
			statement.setString(7, contract_budget);

			int row = statement.executeUpdate();
			if (row > 0) {
				message = "File uploaded and saved into database";
			}
			dispatcher = request.getRequestDispatcher("ListAdminContract");
		}catch (SQLException ex) {
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
			dispatcher.forward(request, response);
		}
}

}
