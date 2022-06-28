package hr_package;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import Model.EmployeePayDisplay;

public class EmployeePayDAO {

	// DISPLAY EMPLOYEE PAY TABLE
	public List<EmployeePayDisplay> getEmployeePayList(){

		List<EmployeePayDisplay> EmployeePayList = new ArrayList<EmployeePayDisplay>();
		Connection conn = DbManager.getSQLConnection();

		try {
			Statement stmt=conn.createStatement();
			ResultSet rs=stmt.executeQuery("SELECT e.emp_id as emp_id, e.last_name as last_name, e.first_name as first_name, ep.gross_yearly as gross_yearly, ep.gross_monthly as gross_monthly FROM employees e JOIN emp_pay ep ON e.emp_id = ep.emp_id");

			while(rs.next()) {
				EmployeePayDisplay objEmpPayDetails = new EmployeePayDisplay();
				objEmpPayDetails.EmployeeID = rs.getString("emp_id");
				objEmpPayDetails.LastName = rs.getString("last_name");
				objEmpPayDetails.FirstName = rs.getString("first_name");
				objEmpPayDetails.GrossMonthly = rs.getString("gross_monthly");
				objEmpPayDetails.GrossYearly = rs.getString("gross_yearly");
				EmployeePayList.add(objEmpPayDetails);
			}

			rs.close();
			conn.close();
		}
		catch(SQLException e) {
			System.out.println(e.getMessage());
			e.printStackTrace();
		}
		return EmployeePayList;
	}



	// DISPLAY EMPLOYEE TAX TABLE

	public List<EmployeePayDisplay> getEmployeeTaxDetails(String emp_Id){

		List<EmployeePayDisplay> EmployeeTaxList = new ArrayList<EmployeePayDisplay>(); 
		Connection conn = DbManager.getSQLConnection();

		try { 

			Statement stmt=conn.createStatement(); 
			ResultSet rs=stmt.executeQuery("SELECT * FROM emp_tax where emp_id=" + emp_Id + ";");

			while(rs.next()) {

				EmployeePayDisplay objEmpTaxDetails = new EmployeePayDisplay(); 
				objEmpTaxDetails.EmployeeID = rs.getString("emp_id");
				objEmpTaxDetails.Solidaritysurcharge = rs.getString("solidarity_surcharge");
				objEmpTaxDetails.ChurchTax = rs.getString("church_tax");
				objEmpTaxDetails.IncomeTax = rs.getString("income_tax");
				objEmpTaxDetails.PensionInsurance = rs.getString("pension_insurance");
				objEmpTaxDetails.UnemploymentInsurance = rs.getString("unemployment_insurance"); 
				objEmpTaxDetails.HealthInsurance = rs.getString("health_insurance"); 
				objEmpTaxDetails.CareInsurance = rs.getString("care_insurance"); 
				objEmpTaxDetails.NetMonthly = rs.getString("net_monthly");

				EmployeeTaxList.add(objEmpTaxDetails); 
			} 
			rs.close(); 
			conn.close(); 
		}
		catch(SQLException e) { 
			System.out.println(e.getMessage());
			e.printStackTrace(); 
		} 
		return EmployeeTaxList; 
	}

	// DISPLAY EMPLOYEE PAY HISTORY TABLE


	public List<EmployeePayDisplay> getEmployeeSalHistList(){

		List<EmployeePayDisplay> EmployeeSalHistList = new ArrayList<EmployeePayDisplay>();
		Connection conn = DbManager.getSQLConnection();

		try {
			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery("SELECT * FROM emp_payment_hist;");

			while(rs.next()) {
				EmployeePayDisplay objEmpSalHistDetails = new EmployeePayDisplay();
				objEmpSalHistDetails.EmployeeID = rs.getString("emp_id");
				objEmpSalHistDetails.GrossYearly = rs.getString("gross_yearly");
				objEmpSalHistDetails.Year= rs.getString("finanical_year");
				EmployeeSalHistList.add(objEmpSalHistDetails);
			}
			rs.close();
			conn.close();
		}
		catch (SQLException ex) {
			System.out.println(ex);
			ex.printStackTrace();
		}
		return EmployeeSalHistList;
	}

	// DISPLAY EMPLOYEE LEAVE BALANCE TABLE

	public List<EmployeePayDisplay> getEmployeeBalVacayList(){

		List<EmployeePayDisplay> EmployeeVacayBalList = new ArrayList<EmployeePayDisplay>();
		Connection conn = DbManager.getSQLConnection();

		try {
			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery("SELECT * FROM emp_leave_balance;");

			while(rs.next()) {
				EmployeePayDisplay objEmpVacayBalDetails = new EmployeePayDisplay();
				objEmpVacayBalDetails.EmployeeID = rs.getString("emp_id");
				objEmpVacayBalDetails.CasualLeaves = rs.getString("casual_leaves");
				objEmpVacayBalDetails.SickLeaves = rs.getString("sick_leaves");
				objEmpVacayBalDetails.AnnualLeaves = rs.getString("Annual_leaves");
				objEmpVacayBalDetails.ParentalLeaves = rs.getString("parental_leaves");
				objEmpVacayBalDetails.VolunteeringLeaves = rs.getString("volunteering_leaves");
				objEmpVacayBalDetails.FinancialYear = rs.getString("financial_year");
				EmployeeVacayBalList.add(objEmpVacayBalDetails);
			}

			rs.close();
			conn.close();
		}
		catch (SQLException ex) {
			System.out.println(ex);
			ex.printStackTrace();
		}
		return EmployeeVacayBalList;
	}

	// DISPLAY EMPLOYEE VACATION TABLE

	public List<EmployeePayDisplay> getEmployeeVacayAppList(){

		List<EmployeePayDisplay> EmployeeVacayAppList = new ArrayList<EmployeePayDisplay>();
		Connection conn = DbManager.getSQLConnection();

		try {

			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery("SELECT * FROM emp_vacation ORDER BY start_date desc;");

			while(rs.next()) {
				EmployeePayDisplay objEmpVacayAppDetails = new EmployeePayDisplay();
				objEmpVacayAppDetails.EmployeeID = rs.getString("emp_id");
				objEmpVacayAppDetails.StartDate = rs.getString("start_date");
				objEmpVacayAppDetails.EndDate = rs.getString("end_date");
				objEmpVacayAppDetails.LeaveType = rs.getString("leave_type");
				objEmpVacayAppDetails.VacationStatus = rs.getString("vacation_status");
				objEmpVacayAppDetails.LeaveNote = rs.getString("leave_note");
				EmployeeVacayAppList.add(objEmpVacayAppDetails);
			}

			rs.close();
			conn.close();
		}
		catch (SQLException ex) {
			System.out.println(ex);
			ex.printStackTrace();
		}
		return EmployeeVacayAppList;
	}

	// DISPLAY ADMIN CONTRACTS TABLE
	public List<EmployeePayDisplay> getAdminContractsList(){

		List<EmployeePayDisplay> AdminContractsList = new ArrayList<EmployeePayDisplay>();
		Connection conn = DbManager.getSQLConnection();

		try {
			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery("Select * from admin_contracts");

			while(rs.next()) {
				EmployeePayDisplay objAdminContractsDetails = new EmployeePayDisplay();
				objAdminContractsDetails.ContractType = rs.getString("contract_type");
				objAdminContractsDetails.ContractID = rs.getString("contract_id");
				objAdminContractsDetails.ContractManager = rs.getString("contract_manager");
				objAdminContractsDetails.ContractStartDate = rs.getString("start_date");
				objAdminContractsDetails.ContractEndDate = rs.getString("end_date");
				objAdminContractsDetails.ContractWorkers = rs.getString("contract_workers");
				objAdminContractsDetails.ContractBudget = rs.getString("contract_budget");
				AdminContractsList.add(objAdminContractsDetails);
			}
			rs.close();
			conn.close();
		}
		catch (SQLException ex) {
			System.out.println(ex);
			ex.printStackTrace();
		}
		return AdminContractsList;

	}
	// DISPLAY EMPLOYEE PROJECT TABLE

	public List<EmployeePayDisplay> getEmployeeProjectsList(){

		List<EmployeePayDisplay> EmployeeProjectsList = new ArrayList<EmployeePayDisplay>();
		Connection conn = DbManager.getSQLConnection();

		try {
			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery("Select * from emp_project");

			while(rs.next()) {
				EmployeePayDisplay objEmployeeProjectsDetails = new EmployeePayDisplay();
				objEmployeeProjectsDetails.EmployeeID = rs.getString("emp_id");
				objEmployeeProjectsDetails.ReportingTo = rs.getString("reporting_to");
				objEmployeeProjectsDetails.ProjectID = rs.getString("project_id");
				objEmployeeProjectsDetails.ProjectName = rs.getString("project_name");
				EmployeeProjectsList.add(objEmployeeProjectsDetails);
			}
			rs.close();
			conn.close();
		}
		catch (SQLException ex) {
			System.out.println(ex);
			ex.printStackTrace();
		}
		return EmployeeProjectsList;

	}
}

