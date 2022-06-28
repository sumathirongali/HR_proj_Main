package hr_package;

import java.sql.*;
import Model.*;
import java.util.ArrayList;
import java.util.List;

public class DbManager {

	public static Connection getSQLConnection() {
		try{  
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/srh_01", "root", "Suma@4997");

			return conn;
		}
		//con.close();  
		catch(Exception e){ 
			System.out.println(e);
			return null;
		}  

	}
	

	public int InsertOrUpdateEmpAddress(EmployeeAddress objEmpAddress)
	{
		try{
			int i;
			String sqlQuery;
			EmployeeAddress objEmpAdd = GetEmpAddress(objEmpAddress.EmployeeID);
			if(objEmpAdd != null && objEmpAdd.EmployeeID != null && objEmpAdd.EmployeeID.length() > 0)
			{
				sqlQuery = "UPDATE emp_address SET street = '" + objEmpAddress.Street + "',house_num = '" + objEmpAddress.HouseNum
						+ "',pin_code = " + objEmpAddress.Pincode + ",city = '" + objEmpAddress.City 
						+ "',state = '" + objEmpAddress.State + "',country = '" + objEmpAddress.Country 
						+ "',phone = '" + objEmpAddress.Phone + "',personal_email_id = '" + objEmpAddress.Email
						+ "' WHERE emp_id = " + objEmpAddress.EmployeeID + ";";
			}
			else
			{
				sqlQuery = "INSERT INTO emp_address VALUES(" + objEmpAddress.EmployeeID + ",'" + objEmpAddress.Street + "','"
						+ objEmpAddress.HouseNum + "'," + objEmpAddress.Pincode + ",'" + objEmpAddress.City + "','" + objEmpAddress.State + "','"
						+ objEmpAddress.Country + "','" + objEmpAddress.Phone + "','" + objEmpAddress.Email + "');";
			}
			Connection conn = getSQLConnection();
			Statement stmt = conn.createStatement(); 
			i = stmt.executeUpdate(sqlQuery);
			conn.close();
			return i;
		}
		catch(Exception ex){
			ex.printStackTrace();
			return -1;
		}
	}

	public EmployeeAddress GetEmpAddress(String empID)
	{
		EmployeeAddress objEmpAddress = null;
		try{
			objEmpAddress = new EmployeeAddress();
			Connection conn = getSQLConnection();
			Statement stmt = conn.createStatement(); 
			ResultSet rs = stmt.executeQuery("SELECT * FROM emp_address WHERE emp_id = " + empID + ";");

			while(rs.next())
			{
				objEmpAddress.EmployeeID = rs.getString("emp_id");
				objEmpAddress.Street = rs.getString("street");
				objEmpAddress.HouseNum = rs.getString("house_num");
				objEmpAddress.Pincode  = Integer.parseInt(rs.getString("pin_code"));
				objEmpAddress.City = rs.getString("city");
				objEmpAddress.State = rs.getString("state");
				objEmpAddress.Country = rs.getString("country");
				objEmpAddress.Phone = rs.getString("phone");
				objEmpAddress.Email = rs.getString("personal_email_id");
			}
			conn.close();
			return objEmpAddress;
		}
		catch(Exception ex){ 
			ex.printStackTrace();
			return objEmpAddress;
		}
	}

	public int InsertOrUpdateEmpJobTitle(EmployeeJobTitle objEmpJobTitle)
	{
		try{
			int i;
			String sqlQuery;
			EmployeeJobTitle objEmpAdd = GetEmpJobTitle(objEmpJobTitle.EmployeeID);
			if(objEmpAdd != null && objEmpAdd.EmployeeID != null && objEmpAdd.EmployeeID.length() > 0)
			{
				sqlQuery = "UPDATE emp_job_title SET employment_status = '" + objEmpJobTitle.EmployeeStatus 
						+ "',employment_sub_status = '" + objEmpJobTitle.EmployeeSubStatus
						+ "',employment_title = '" + objEmpJobTitle.EmployeeTitle + "',curr_job_title = '" + objEmpJobTitle.CurrentJobTitle 
						+ "',working_status = '" + objEmpJobTitle.WorkingStatus 
						+ "' WHERE emp_id = " + objEmpJobTitle.EmployeeID + ";";
			}
			else
			{
				sqlQuery = "INSERT INTO emp_job_title VALUES(" + objEmpJobTitle.EmployeeID + ",'" + objEmpJobTitle.EmployeeStatus + "','"
						+ objEmpJobTitle.EmployeeSubStatus + "','" + objEmpJobTitle.EmployeeTitle + "','" + objEmpJobTitle.CurrentJobTitle 
						+ "','" + objEmpJobTitle.WorkingStatus + "');";
			}
			Connection conn = getSQLConnection();
			Statement stmt = conn.createStatement();
			i = stmt.executeUpdate(sqlQuery);
			conn.close();
			return i;
		}
		catch(Exception ex){
			ex.printStackTrace();
			return -1;
		}
	}

	public EmployeeJobTitle GetEmpJobTitle(String empID)
	{
		EmployeeJobTitle objEmpJobTitle= null;
		try {
			objEmpJobTitle= new EmployeeJobTitle();
			Connection conn = getSQLConnection();
			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery("SELECT * FROM emp_job_title WHERE emp_id = " + empID + ";");

			while(rs.next())
			{
				objEmpJobTitle.EmployeeID = rs.getString("emp_id");
				objEmpJobTitle.EmployeeStatus = rs.getString("employment_status");
				objEmpJobTitle.EmployeeSubStatus = rs.getString("employment_sub_status");
				objEmpJobTitle.EmployeeTitle  = rs.getString("employment_title");
				objEmpJobTitle.CurrentJobTitle = rs.getString("curr_job_title");
				objEmpJobTitle.WorkingStatus = rs.getString("working_status");
			}
			conn.close();
			return objEmpJobTitle;
		}
		catch(Exception ex){ 
			ex.printStackTrace();
			return objEmpJobTitle;
		}
	}
	
	public static int InsertOrUpdateorDeleteEmpDetails(String sqlQuery)
	{
		try
		{
			Connection conn = getSQLConnection();
			Statement stmt = conn.createStatement(); 
			int i = stmt.executeUpdate(sqlQuery);
			conn.close();
			return i;
		}
		catch(Exception e){
			System.out.println(e);
			return -1;
		}
	}

	public static ResultSet GetEmpDetails(String sqlQuery) {

		 ResultSet rs;
	    try 
	    {
	        Connection conn = getSQLConnection();
	        Statement stmt = conn.createStatement();
	        rs = stmt.executeQuery(sqlQuery);           
	        return rs;
	    } 
	    catch (Exception ex) 
	    {
	        System.out.println(ex);
	        return rs = null;
	    }
	}


	public int CountCheckInTable(String tableName, String whereClause)
	{
		int iresult = 0;
		try {
			Connection conn = getSQLConnection();
			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery("SELECT COUNT(*) FROM " + tableName + " " + (whereClause.length() > 0 ? "WHERE " + whereClause : "") + ";");
			
			while(rs.next())
			{
				iresult = rs.getInt(1);
			}
			conn.close();
			return iresult;
		}
		catch(Exception ex){ 
			ex.printStackTrace();
			return iresult;
		}
	}
	
	public List<AdminContractsMod> GetAdminContractList(String searchKeyWord)
	{
		
		List<AdminContractsMod> admincontractlist = new ArrayList<AdminContractsMod>();

		try {
			Connection conn = getSQLConnection();
			Statement stmt=conn.createStatement();  			
			ResultSet rs=stmt.executeQuery("SELECT DISTINCT admin_contracts_final.* FROM\r\n"
					+ "(SELECT * FROM admin_contracts WHERE contract_id LIKE '%"+searchKeyWord+"%'\r\n"
					+ "UNION ALL\r\n"
					+ "SELECT * FROM admin_contracts WHERE contract_type LIKE '%"+searchKeyWord+"%'\r\n"
					+ "UNION ALL\r\n"
					+ "SELECT * FROM admin_contracts WHERE contract_manager LIKE '%"+searchKeyWord+"%') as admin_contracts_final ORDER BY contract_id");
			AdminContractsMod objadmincontractlist = null;
			
			while(rs.next())
			{
				objadmincontractlist = new AdminContractsMod();
				objadmincontractlist.ContractID = rs.getString("contract_id");
				objadmincontractlist.Contracttype= rs.getString("contract_type");
				objadmincontractlist.ContractManager= rs.getString("contract_manager");
				objadmincontractlist.Startdate = rs.getString("start_date");
				objadmincontractlist.Enddate = rs.getString("end_date");
				objadmincontractlist.ContractWorkers = rs.getString("contract_workers");
				objadmincontractlist.ContractBudjet = rs.getString("contract_budget");
				admincontractlist.add(objadmincontractlist);
			}
			conn.close();
			return admincontractlist;
		}
		catch(Exception ex){ 
			ex.printStackTrace();
			return admincontractlist;
		}
	}
	
	public int DeleteAdminContracts(String ContractID)
	{
		try {
			int result = 0; 
			Connection conn = getSQLConnection();
			Statement stmt=conn.createStatement(); 
			result = stmt.executeUpdate("delete from admin_contracts where contract_id ='"+ ContractID +"'");
			conn.close();
			return result;
		}
		catch(Exception ex){ 
			ex.printStackTrace();
			return 0;
		}
	}
	
	public int DeleteEmployee(String Emp_ID)
	{
		try {
			int result =0;
			Connection conn = getSQLConnection();
			Statement stmt=conn.createStatement(); 
			result = stmt.executeUpdate("update emp_job_title set working_status ='"+ "Separated"+"' where emp_id = "+ Emp_ID);
			if (result== 1)
			{
				result = stmt.executeUpdate("delete from login where emp_id ="+ Emp_ID);
			}
			conn.close();
			return result;
		}
		catch(Exception ex){ 
			ex.printStackTrace();
			return 0;
			
		}
	}

	public static Boolean IfEmpDetailsExists(String sqlQuery) {

		ResultSet rs;
		try 
		{
			Connection conn = getSQLConnection();
			Statement stmt = conn.createStatement();
			rs = stmt.executeQuery(sqlQuery);           
			if (!rs.next())
			{
				conn.close();
				return false;
			}
			else
			{
				conn.close();
				return true;
			}
		} 
		catch (Exception ex) 
		{
			System.out.println(ex);
			return false;
		}
	}
}



