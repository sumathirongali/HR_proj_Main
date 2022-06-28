<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ page import="java.sql.*"%>
<%@ page import="java.io.*"%>
<%@ page import="java.util.*"%>
<%@ page import="Model.*"%>

<jsp:include page="header.jsp" />
<jsp:include page="navbar.jsp" />

<link href="css/leaveStyle.css" rel="stylesheet" type="text/css">
<title>Tax and Net Salary</title>

<%-- TAX DEDUCTION AND NET SALARY DISPLAY --%>

<div class="row">
	<form method="get" action="ListEmployeePay" id="payTwoForm">
		CALCULATED TAX DATA
		<div class="col">
			<% List<EmployeePayDisplay> EmployeeTaxList; %>
			<h3>
				<b>Tax and Net Salary</b>
			</h3>
			<%
    String sel_id = request.getParameter("emp_Id");
%>
			<%
			System.out.println("........here1111..."+sel_id);%>
			<%
		 		EmployeeTaxList = (List<EmployeePayDisplay>)request.getAttribute("EmployeeTaxList");
				
				if(EmployeeTaxList != null && !EmployeeTaxList.isEmpty()){
				for(int i=0; i<EmployeeTaxList.size(); i++)
				{
					String Emp_id = EmployeeTaxList.get(i).getEmployeeID();
					System.out.println(Emp_id+"........here..."+sel_id);
					//if(Emp_id.equals(sel_id))
					{
						System.out.println("...in");
					
			%>
			<label for="emp_id">Employee ID:</label> <input class="netSal"
				style="margin-left: 15px" type="text" name="emp_id"
				value=<%= EmployeeTaxList.get(i).getEmployeeID()%> readonly><br>
			<label for="solidarity_surcharge">Solidarity Surcharge:</label> <input
				class="netSal" style="margin-left: 15px" type="text"
				name="solidarity_surcharge"
				value=<%= EmployeeTaxList.get(i).getSolidaritysurcharge() %>
				readonly><br> <label for="chruch_tax">Chruch
				Tax:</label> <input class="netSal" style="margin-left: 15px" type="text"
				name="chruch_tax" value=<%= EmployeeTaxList.get(i).getChurchTax() %>
				readonly><br> <label for="income_tax">Income
				Tax:</label> <input class="netSal" style="margin-left: 15px" type="text"
				name="income_tax" value=<%= EmployeeTaxList.get(i).getIncomeTax() %>
				readonly><br> <label for="pension_insurance">Pension
				Insurance:</label> <input class="netSal" style="margin-left: 15px"
				type="text" name="pension_insurance"
				value=<%= EmployeeTaxList.get(i).getPensionInsurance()%> readonly><br>
			<label for="unemployment_insurance">Unemployment Insurance:</label> <input
				class="netSal" style="margin-left: 15px" type="text"
				name="unemployment_insurance"
				value=<%= EmployeeTaxList.get(i).getUnemploymentInsurance()%>
				readonly><br> <label for="health_insurance">Health
				Insurance:</label> <input class="netSal" style="margin-left: 15px"
				type="text" name="health_insurance"
				value=<%= EmployeeTaxList.get(i).getHealthInsurance()%> readonly><br>
			<label for="care_insurance">Care Insurance:</label> <input
				class="netSal" style="margin-left: 15px" type="text"
				name="care_insurance"
				value=<%= EmployeeTaxList.get(i).getCareInsurance() %> readonly><br>
			<label for="net_monthly"><b>Net Monthly Salary:</b></label> <input
				class="netSal" style="font-weight: bold; margin-left: 15px"
				type="text" name="net_monthly"
				value=<%= EmployeeTaxList.get(i).getNetMonthly() %> readonly><br>
			<hr style="width: 50%">
			<% 	}} 
				} else {
			%>
			<label>No Records Available</label>
			<%
				}
			%>
		</div>

		<div class="center">
			<button class="btn btn-warning" type="submit" value="submit" style='margin: 5px; float: right'>Back</button>
			<hr
				style="height: 2px; border-width: 0; color: gray; background-color: gray">
		</div>

	</form>
</div>
