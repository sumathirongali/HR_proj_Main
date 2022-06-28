package Model;

public class EmployeePayDisplay {

	// emp_pay Table
	public String EmployeeID;
	public String LastName;
	public String FirstName;
	public String GrossMonthly;

	public void setEmployeeID(String EmployeeID) {
		this.EmployeeID = EmployeeID;
	}
	public String getEmployeeID() {
		return (this.EmployeeID);
	}

	public void setLastName(String LastName) {
		this.LastName = LastName;
	}
	public String getLastName() {
		return (this.LastName);
	}

	public void setFirstName(String FirstName) {
		this.FirstName = FirstName;
	}
	public String getFirstName() {
		return (this.FirstName);
	}

	public void setGrossMonthly(String GrossMonthly) {
		this.GrossMonthly = GrossMonthly;
	}

	public String getGrossMonthly() {
		return(this.GrossMonthly);
	}

	// emp_tax Table
	public String Solidaritysurcharge;
	public String ChurchTax;
	public String IncomeTax;
	public String PensionInsurance;
	public String UnemploymentInsurance;
	public String HealthInsurance;
	public String CareInsurance;
	public String NetMonthly;

	public void setSolidaritysurcharge(String Solidaritysurcharge) {
		this.Solidaritysurcharge = Solidaritysurcharge;
	}
	public String getSolidaritysurcharge() {
		return (this.Solidaritysurcharge);
	}

	public void setChurchTax(String ChurchTax) {
		this.ChurchTax = ChurchTax;
	}
	public String getChurchTax() {
		return (this.ChurchTax);
	}

	public void setIncomeTax(String IncomeTax) {
		this.IncomeTax = IncomeTax;
	}
	public String getIncomeTax() {
		return (this.IncomeTax);
	}

	public void setPensionInsurance(String PensionInsurance) {
		this.PensionInsurance = PensionInsurance;
	}
	public String getPensionInsurance() {
		return (this.PensionInsurance);
	}

	public void setUnemploymentInsurance(String UnemploymentInsurance) {
		this.UnemploymentInsurance = UnemploymentInsurance;
	}
	public String getUnemploymentInsurance() {
		return (this.UnemploymentInsurance);
	}

	public void setHealthInsurance(String HealthInsurance) {
		this.HealthInsurance = HealthInsurance;
	}
	public String getHealthInsurance() {
		return (this.HealthInsurance);
	}

	public void setCareInsurance(String CareInsurance) {
		this.CareInsurance = CareInsurance;
	}
	public String getCareInsurance() {
		return (this.CareInsurance);
	}

	public void setNetMonthly(String NetMonthly) {
		this.NetMonthly = NetMonthly;
	}
	public String getNetMonthly() {
		return (this.NetMonthly);
	}

	// emp_payment_hist Table
	public String GrossYearly;
	public String Year;

	public void setGrossYearly(String GrossYearly) {
		this.GrossYearly = GrossYearly;
	}
	public String getGrossYearly() {
		return (this.GrossYearly);
	}

	public void setYear(String Year) {
		this.Year = Year;
	}
	public String getYear() {
		return (this.Year);
	}

	// emp_vacation table
	public String StartDate;
	public String EndDate;
	public String LeaveType;
	public String VacationStatus;
	public String LeaveNote;

	public void setStartDate(String StartDate) {
		this.StartDate = StartDate;
	}
	public String getStartDate() {
		return (this.StartDate);
	}

	public void setEndDate(String EndDate) {
		this.EndDate = EndDate;
	}
	public String getEndDate() {
		return (this.EndDate);
	}

	public void setLeaveType(String LeaveType) {
		this.LeaveType = LeaveType;
	}
	public String getLeaveType() {
		return (this.LeaveType);
	}

	public void setVacationStatus(String VacationStatus) {
		this.VacationStatus = VacationStatus;
	}
	public String getVacationStatus() {
		return (this.VacationStatus);
	}

	public void setLeaveNote(String LeaveNote) {
		this.LeaveNote = LeaveNote;
	}
	public String getLeaveNote() {
		return (this.LeaveNote);
	}

	// emp_leave_balance table
	public String CasualLeaves;
	public String SickLeaves;
	public String AnnualLeaves;
	public String ParentalLeaves;
	public String VolunteeringLeaves;
	public String FinancialYear;

	public void setCasualLeaves(String CasualLeaves) {
		this.CasualLeaves = CasualLeaves;
	}
	public String getCasualLeaves() {
		return (this.CasualLeaves);
	}

	public void setSickLeaves(String SickLeaves) {
		this.SickLeaves = SickLeaves;
	}
	public String getSickLeaves() {
		return (this.SickLeaves);
	}

	public void setAnnualLeaves(String AnnualLeaves) {
		this.AnnualLeaves = AnnualLeaves;
	}
	public String getAnnualLeaves() {
		return (this.AnnualLeaves);
	}

	public void setParentalLeaves(String ParentalLeaves) {
		this.ParentalLeaves = ParentalLeaves;
	}
	public String getParentalLeaves() {
		return (this.ParentalLeaves);
	}

	public void setVolunteeringLeaves(String VolunteeringLeaves) {
		this.VolunteeringLeaves = VolunteeringLeaves;
	}
	public String getVolunteeringLeaves() {
		return (this.VolunteeringLeaves);
	}

	public void setFinancialYear(String FinancialYear) {
		this.FinancialYear = FinancialYear;
	}
	public String getFinancialYear() {
		return (this.FinancialYear);
	}

	// admin_contracts table
	public String ContractType;
	public String ContractID;
	public String ContractManager;
	public String ContractStartDate;
	public String ContractEndDate;
	public String ContractWorkers;
	public String ContractBudget;

	public void setContractType(String ContractType) {
		this.ContractType = ContractType;
	}
	public String getContractType() {
		return (this.ContractType);
	}

	public void setContractID(String ContractID) {
		this.ContractID = ContractID;
	}
	public String getContractID() {
		return (this.ContractID);
	}

	public void setContractManager(String ContractManager) {
		this.ContractManager = ContractManager;
	}
	public String getContractManager() {
		return (this.ContractManager);
	}

	public void setContractStartDate(String ContractStartDate) {
		this.ContractStartDate = ContractStartDate;
	}
	public String getContractStartDate() {
		return (this.ContractStartDate);
	}

	public void setContractEndDate(String ContractEndDate) {
		this.ContractEndDate = ContractEndDate;
	}
	public String getContractEndDate() {
		return (this.ContractEndDate);
	}

	public void setContractWorkers(String ContractWorkers) {
		this.ContractWorkers = ContractWorkers;
	}
	public String getContractWorkers() {
		return (this.ContractWorkers);
	}

	public void setContractBudget(String ContractBudget) {
		this.ContractBudget = ContractBudget;
	}
	public String getContractBudget() {
		return (this.ContractBudget);
	}

	// emp_insurance table
	public String SocialSecurityNumber;
	public String TaxID;
	public String HealthInsuranceType;
	public String HealthInsuranceID;
	public String HealthInsuranceProvider;

	public void setSocialSecurityNumber(String SocialSecurityNumber) {
		this.SocialSecurityNumber = SocialSecurityNumber;
	}
	public String getSocialSecurityNumber() {
		return (this.SocialSecurityNumber);
	}

	public void setTaxID(String TaxID) {
		this.TaxID = TaxID;
	}
	public String getTaxID() {
		return (this.TaxID);
	}

	public void setHealthInsuranceType(String HealthInsuranceType) {
		this.HealthInsuranceType = HealthInsuranceType;
	}
	public String getHealthInsuranceType() {
		return (this.HealthInsuranceType);
	}

	public void setHealthInsuranceID(String HealthInsuranceID) {
		this.HealthInsuranceID = HealthInsuranceID;
	}
	public String getHealthInsuranceID() {
		return (this.HealthInsuranceID);
	}

	public void setHealthInsuranceProvider(String HealthInsuranceProvider) {
		this.HealthInsuranceProvider = HealthInsuranceProvider;
	}
	public String getHealthInsuranceProvider() {
		return (this.HealthInsuranceProvider);
	}

	// emp_bank_details table
	public String IBAN;
	public String BIC;
	public String BankName;

	public void setIBAN(String IBAN) {
		this.IBAN = IBAN;
	}
	public String getIBAN() {
		return (this.IBAN);
	}

	public void setBIC(String BIC) {
		this.BIC = BIC;
	}
	public String getBIC() {
		return (this.BIC);
	}

	public void setBankName(String BankName) {
		this.BankName = BankName;
	}
	public String getBankName() {
		return (this.BankName);
	}
	// emp_project table

	public String ReportingTo;
	public String ProjectID;
	public String ProjectName;

	public void setReportingTo(String ReportingTo) {
		this.ReportingTo = ReportingTo;
	}
	public String getReportingTo() {
		return (this.ReportingTo);
	}

	public void setProjectID(String ProjectID) {
		this.ProjectID = ProjectID;
	}
	public String getProjectID() {
		return (this.ProjectID);
	}

	public void setProjectName (String ProjectName) {
		this.ProjectName = ProjectName;
	}
	public String getProjectName () {
		return (this.ProjectName);
	}
}