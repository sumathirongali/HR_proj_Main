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
<title>Pay History Display</title>

<%-- SALARY YEARLY HISTORY DISPLAY --%>
<div class="container"
	style="margin-right: auto; margin-left: auto; width: 750px;">
	<h4>
		<b>Employee Pay History</b>
	</h4>
	<div class="row">
		<%
		List<EmployeePayDisplay> EmployeeSalHistList;
		%>

		<div class="outer-wrapper">
			<div class="table-wrapper">
				<input type="text" id="payHistInput" onkeyup="myPayHistFunction()"
					placeholder="Search by Year.." title="Type in Financial Year">
				<table id="payHistTable"
					class="table table-striped table-bordered table-hover table-sm">
					<thead class="thead-dark">
						<tr>
							<th>Sl Num</th>
							<th>Employee ID</th>
							<th>Gross Salary</th>
							<th>Financial Year</th>
						</tr>
					</thead>
					<%
					EmployeeSalHistList = (List<EmployeePayDisplay>) request.getAttribute("EmployeeSalHistList");
					if (EmployeeSalHistList != null && !EmployeeSalHistList.isEmpty()) {
						for (int i = 0; i < EmployeeSalHistList.size(); i++) {
					%>
					<tbody>
						<tr>
							<td><%=(i + 1)%></td>
							<td><%=EmployeeSalHistList.get(i).getEmployeeID()%></td>
							<td><%=EmployeeSalHistList.get(i).getGrossYearly()%></td>
							<td><%=EmployeeSalHistList.get(i).getYear()%></td>
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
<div class="form-row">
	<a href="ListEmployeePay" role="button"
		 class="btn btn-warning" style='margin-left: 600px'>Back</a>
</div>
