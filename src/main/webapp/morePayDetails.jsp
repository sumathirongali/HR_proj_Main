<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ page import="java.sql.*"%>
<%@ page import="java.io.*"%>
<%@ page import="java.util.*"%>
<%@ page import="Model.*"%>

<jsp:include page="header.jsp" />
<jsp:include page="navbar.jsp" />

<link href="css/leaveStyle.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="JavaScript/leavejScript.js"></script>


<%-- GROSS SALARY AND BASIC EMPLOYEE DETAILS DISPLAY --%>
<div class="container">
	<div class="row">
		<%
		List<EmployeePayDisplay> EmployeePayList;
		%>
		<h4>
			<b>Employee Pay: More Details</b>
		</h4>
		<div class="form-row">
			<a class="btn btn-secondary" href="UpdateEmployeePay" role="button"
				style='margin: 8px; float: right; margin-left: 200px'>UpdateGrossSalary</a>
				<a class="btn btn-secondary" href="ListEmpSalHistory" role="button"
				style='margin: 8px; float: right; '>Pay History</a>
		</div>
		<div class="outer-wrapper">
			<div class="table-wrapper">
				<input type="text" id="payInput" onkeyup="myPayFunction()"
					placeholder="Search for Employee ID.."
					title="Type in an Employee ID">
				<table id="payTable"
					class="table table-striped table-bordered table-hover table-sm">
					<thead class="thead-dark">
						<tr>
							<th scope="col">Sl Num</th>
							<th scope="col">Employee ID</th>
							<th scope="col">Last Name</th>
							<th scope="col">First Name</th>
							<th scope="col">Yearly Gross Salary</th>
							<th scope="col">Monthly Gross Salary</th>
							<th scope="col">Tax and Net Salary</th>
						</tr>
					</thead>
					<%
					EmployeePayList = (List<EmployeePayDisplay>) request.getAttribute("EmployeePayList");
					if (EmployeePayList != null && !EmployeePayList.isEmpty()) {
						for (int i = 0; i < EmployeePayList.size(); i++) {
					%>
					<tbody>
						<tr>
							<td><%=(i + 1)%></td>
							<td><%=EmployeePayList.get(i).getEmployeeID()%></td>
							<td><%=EmployeePayList.get(i).getLastName()%></td>
							<td><%=EmployeePayList.get(i).getFirstName()%></td>
							<td><%=EmployeePayList.get(i).getGrossYearly()%></td>
							<td><%=EmployeePayList.get(i).getGrossMonthly()%></td>
							<td><a href="ListEmpTaxAndNetSal?emp_Id=<%=EmployeePayList.get(i).getEmployeeID() %>"><b>TaxAndNetPayDisp</b></a></td>
						</tr>
					</tbody>
					<%
					}
					} else {
					%>
					<tr>
						<td>No Records Available</td>
					</tr>
					<%
					}
					%>
				</table>

			</div>

			<div class="form-row">
				<a class="btn btn-warning" href="PayDetailsEntry.jsp" role="button"
					style='margin: 20px; float: center'>Back</a>
			</div>

		</div>
	</div>
</div>

<hr
	style="height: 2px; border-width: 0; color: gray; background-color: gray">
