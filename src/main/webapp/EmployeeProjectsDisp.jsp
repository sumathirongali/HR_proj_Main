<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ page import="java.sql.*"%>
<%@ page import="java.io.*"%>
<%@ page import="java.util.*"%>
<%@ page import="Model.*"%>

<jsp:include page="dashboard.jsp" />


<link href="css/leaveStyle.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="JavaScript/leavejScript.js"></script>

<title>Insert title here</title>


<div class="container"
	style="margin-right: auto; margin-left: auto; width: 750px;">
	<div class="row">
		<div class="form-row">
			<%
			List<EmployeePayDisplay> EmployeeProjectsList;
			%>
			<h4 style="text-align: center">
				<b>Project Assign. Details</b>
			</h4>
			<div class="form-row">
				<a class="btn btn-secondary" href="EmployeeProjectsNewEntry.jsp"
					role="button" style='margin: 8px; float: center ;margin-left: 100px'> Add To
					Project</a>
			</div>

			<div class="form-row">
				<a class="btn btn-secondary" href="UpdateEmployeeProjects"
					role="button" style='margin: 8px; float: right; '>Update
					Project Assign. </a>
			</div>

		</div>
		<div class="outer-wrapper">
			<div class="table-wrapper">
				<input type="text" id="EmpProjInput" onkeyup="myEmpProjFunction()"
					placeholder="Search for Employee ID.." title="Type in Employee ID">
				<table id="EmpProjTable"
					class="table table-striped table-bordered table-hover table-sm">
					<thead class="thead-dark">
						<tr>
							<th scope="col">Sl Num</th>
							<th scope="col">Employee ID</th>
							<th scope="col">Reporting To</th>
							<th scope="col">Project ID</th>
							<th scope="col">Project Name</th>
						</tr>
					</thead>
					<%
						EmployeeProjectsList = (List<EmployeePayDisplay>) request.getAttribute("EmployeeProjectsList");
						if (EmployeeProjectsList != null && !EmployeeProjectsList.isEmpty()) {
							for (int i = 0; i < EmployeeProjectsList.size(); i++) {
						%>
					<tbody>
						<tr>
							<td><%=(i + 1)%></td>
							<td><%=EmployeeProjectsList.get(i).getEmployeeID()%></td>
							<td><%=EmployeeProjectsList.get(i).getReportingTo()%></td>
							<td><%=EmployeeProjectsList.get(i).getProjectID()%></td>
							<td><%=EmployeeProjectsList.get(i).getProjectName()%></td>
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
	<div class="row">
		<a class="btn btn-warning" style='margin-left: 600px' href="PayDetailsEntry.jsp"><b>Back</b></a>
	</div>
</div>