<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ page import="java.sql.*"%>
<%@ page import="java.io.*"%>
<%@ page import="java.util.*"%>
<%@ page import="Model.*"%>

<jsp:include page="dashboard.jsp" />

<link href="css/leaveStyle.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="JavaScript/leavejScript.js"></script>

<title>Leave Details Display</title>

<!-- PAGE 1.1 -->
<%-- Employee Leave Balance Table --%>
<div class="container">
	<div class="row">
		<%
		List<EmployeePayDisplay> EmployeeVacayBalList;
		%>
		<div class="form-row">
			<h4>
				<b>Employee Leave Balance Table</b>
			</h4>
			<div class="form-row">
				<a class="btn btn-secondary" href="VacayNewRecordEntry.jsp"
					role="button" style='margin: 8px; float: right ;margin-left: 200px'>Vacation
					Request</a>
			</div>

			<div class="form-row">
				<a class="btn btn-secondary" href="UpdatePendingVacay" role="button"
					style='margin: 8px; float: right; '>Update Vacation Status</a>
			</div>
		</div>
		<div class="outer-wrapper">
			<div class="table-wrapper">
				<input type="text" id="myInput" onkeyup="myFunction()"
					placeholder="Search for Employee ID.."
					title="Type in an Employee ID">
				<table id="myTable"
					class="table table-striped table-bordered table-hover table-sm">
					<thead class="thead-dark">
						<tr>
							<th scope="col">Sl Num</th>
							<th scope="col">Employee ID</th>
							<th scope="col">Casual Leaves</th>
							<th scope="col">Sick Leaves</th>
							<th scope="col">Annual Leaves</th>
							<th scope="col">Parental Leaves</th>
							<th scope="col">Volunteering Leaves</th>
							<th scope="col">Financial Year</th>
						</tr>
					</thead>
					<%
					EmployeeVacayBalList = (List<EmployeePayDisplay>) request.getAttribute("EmployeeVacayBalList");
					if (EmployeeVacayBalList != null && !EmployeeVacayBalList.isEmpty()) {
						for (int i = 0; i < EmployeeVacayBalList.size(); i++) {
					%>
					<tbody>
						<tr>
							<td><%=(i + 1)%></td>
							<td><%=EmployeeVacayBalList.get(i).getEmployeeID()%></td>
							<td><%=EmployeeVacayBalList.get(i).getCasualLeaves()%></td>
							<td><%=EmployeeVacayBalList.get(i).getSickLeaves()%></td>
							<td><%=EmployeeVacayBalList.get(i).getAnnualLeaves()%></td>
							<td><%=EmployeeVacayBalList.get(i).getParentalLeaves()%></td>
							<td><%=EmployeeVacayBalList.get(i).getVolunteeringLeaves()%></td>
							<td><%=EmployeeVacayBalList.get(i).getFinancialYear()%></td>
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
		</div>
	</div>

	<hr
		style="height: 2px; border-width: 0; color: gray; background-color: gray">

	<%-- Employee Vacation Table --%>

	<%
	List<EmployeePayDisplay> EmployeeVacayAppList;
	%>
	<h4>
		<b>Employee Vacation Application Table</b>
	</h4>
	<div class="row">
		<div class="outer-wrapper">
			<div class="table-wrapper">
				<input type="text" id="myInput2" onkeyup="myFunction2()"
					placeholder="Search for Employee ID.."
					title="Type in an Employee ID">
				<table id="myTable2"
					class="table table-striped table-bordered table-hover table-sm">
					<thead class="thead-dark">
						<tr>
							<th scope="col">Sl Num</th>
							<th scope="col">Employee ID</th>
							<th scope="col">Start Date</th>
							<th scope="col">End Date</th>
							<th scope="col">Leave Type</th>
							<th scope="col">Vacation Status</th>
							<th scope="col">Leave Note</th>
						</tr>
					</thead>
					<%
					EmployeeVacayAppList = (List<EmployeePayDisplay>) request.getAttribute("EmployeeVacayAppList");
					if (EmployeeVacayAppList != null && !EmployeeVacayAppList.isEmpty()) {
						for (int i = 0; i < EmployeeVacayAppList.size(); i++) {
					%>
					<tbody>
						<tr>
							<td><%=(i + 1)%></td>
							<td><%=EmployeeVacayAppList.get(i).getEmployeeID()%></td>
							<td><%=EmployeeVacayAppList.get(i).getStartDate()%></td>
							<td><%=EmployeeVacayAppList.get(i).getEndDate()%></td>
							<td><%=EmployeeVacayAppList.get(i).getLeaveType()%></td>
							<td><%=EmployeeVacayAppList.get(i).getVacationStatus()%></td>
							<td><%=EmployeeVacayAppList.get(i).getLeaveNote()%></td>
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
		</div>
	</div>



	<hr
		style="height: 2px; border-width: 0; color: gray; background-color: gray">

</div>


</body>
</html>