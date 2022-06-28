<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 
<%@ page import="java.sql.*" %> 
<%@ page import="java.io.*" %>
<%@ page import="java.util.*" %>
<%@ page import="Model.*" %>

<jsp:include page="header.jsp" />
<jsp:include page="navbar.jsp" />

<!DOCTYPE html>
<html>
<head>
<link href="CSS/leaveStyle.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="JavaScript/leavejScript.js"></script> 
<meta charset="ISO-8859-1">
<title>Admin Contracts Display</title>
</head>
<body>

<div class="container" style="margin-right: auto; margin-left: auto; width: 750px;">
	<div class="row">
		<% List<EmployeePayDisplay> AdminContractsList;%>
		<h4><b>Admin Contracts Table</b></h4>
		<div class = "outer-wrapper">
		<div class = "table-wrapper">
		<input type="text" id="adminInput" onkeyup="myAdminFunction()" placeholder="Search for Contract Type.." title="Type in contract type">
		<table id="adminTable" class="table table-striped table-bordered table-hover table-sm">
			<thead class="thead-dark">
			<tr>
			<th scope="col">Sl Num</th>
			<th scope="col">Contract Type</th>
			<th scope="col">Contract ID</th>
			<th scope="col">Contract Manager</th>
			<th scope="col">Start Date</th>
			<th scope="col">End Date</th>
			<th scope="col">Contract Workers</th>
			<th scope="col">Contract Budget</th>
			</tr>
			</thead>
		<%
			AdminContractsList = (List<EmployeePayDisplay>)request.getAttribute("AdminContractsList");
			if(AdminContractsList != null && !AdminContractsList.isEmpty()){
			for(int i=0; i<AdminContractsList.size(); i++){
					
		%>
			<tbody>
			<tr>
			<td><%= (i+1) %></td>
			<td><%= AdminContractsList.get(i).getContractType()%></td>
			<td><%= AdminContractsList.get(i).getContractID()%></td>
			<td><%= AdminContractsList.get(i).getContractManager()%></td>
			<td><%= AdminContractsList.get(i).getContractStartDate()%></td>
			<td><%= AdminContractsList.get(i).getContractEndDate()%></td>
			<td><%= AdminContractsList.get(i).getContractWorkers()%></td>
			<td><%= AdminContractsList.get(i).getContractBudget()%></td>
			</tr>
			</tbody>
		<% 		} 
		   	} else {
		%>
			<tr><td>No Records Available</td></tr>
		<%
				}
		%>
		</table>
		
		</div>
		</div>
	</div>
<hr style="height:2px;border-width:0;color:gray;background-color:gray">

	<div class="form-row">
		<a class="btn btn-secondary" href="AdminContractsNewEntry.jsp" role="button"
			  style='margin: 20px; float: center'>Insert new Admin Contracts records</a>
	</div>
	
	<div class="form-row">
		<a class="btn btn-secondary" href="UpdateAdminContracts" role="button"
			  style='margin: 20px; float: center'>Update Admin Contracts records</a>
	</div>
	
	<div class="form-row">
		<a class="btn btn-secondary" href="DeleteAdminContracts" role="button"
			  style='margin: 20px; float: center'>Delete Admin Contracts records</a>
	</div>
<hr style="height:2px;border-width:0;color:gray;background-color:gray">

	<div class="row">
		<a href="PayDetailsEntry.jsp"><b><-- back</b></a>
	</div> 
</div>

</body>
</html>