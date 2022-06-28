package hr_package;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import Model.EmployeeTypes;
import java.sql.PreparedStatement;

public class EmployeeDAO {
	
	private static final String UPDATE_EMPLYOEE_SQL = "update employees set first_name = ?,middle_name= ?, last_name =? where emp_id = ?";

	
	public List<EmployeeTypes> getEmployeeList(String searchKeyWord) {

		List<EmployeeTypes> employeeList = new ArrayList<EmployeeTypes>();

		try {

			Connection conn = DbManager.getSQLConnection();
			Statement stmt=conn.createStatement();  			
			ResultSet rs=stmt.executeQuery("SELECT emp.*,title.working_status FROM employees emp\r\n"
					+ "LEFT JOIN emp_job_title title ON emp.emp_id = title.emp_id\r\n"
					+ "WHERE (emp.emp_id LIKE '%" + searchKeyWord
					+ "%' OR emp.first_name LIKE '%"+searchKeyWord+"%'OR emp.last_name LIKE '%"+searchKeyWord+"%' "
							+ "OR title.working_status LIKE '%"+searchKeyWord+"%' OR emp.offical_email_id LIKE '%"+searchKeyWord+"%');");
			
			EmployeeTypes objEmpDetails = null;			
			
			while(rs.next())
			{
				objEmpDetails = new EmployeeTypes();
				
				objEmpDetails.EmployeeID = Integer.parseInt(rs.getString("emp_id"));
				objEmpDetails.first_name = rs.getString("first_name");
				objEmpDetails.last_name = rs.getString("last_name");
				objEmpDetails.mail_id = rs.getString("offical_email_id");
				objEmpDetails.WorkingStatus = rs.getString("working_status");
				
				// Adding the Student Object to List
				employeeList.add(objEmpDetails);
			}
			
			// Closing the Resources
			rs.close();
			conn.close();

		} catch (SQLException e) {

			System.out.println(e.getMessage());
			e.printStackTrace();
		} 

		return employeeList;
	}
	
	
	public void viewEmployeeDetails(int id) {
		
	}
	
	public boolean updateUser(EmployeeTypes objEmpDetails) throws SQLException {
		boolean rowUpdated;
		
		Connection conn = DbManager.getSQLConnection();
		
		try(PreparedStatement statement = conn.prepareStatement(UPDATE_EMPLYOEE_SQL);) {
			
			//statement.setString(1, objEmpDetails.EmployeeID);
			statement.setString(2, objEmpDetails.last_name);
			statement.setString(3, objEmpDetails.middle_name);
			statement.setString(4, objEmpDetails.first_name);		

			rowUpdated = statement.executeUpdate() > 0;
		}
		return rowUpdated;
	}
	
}
