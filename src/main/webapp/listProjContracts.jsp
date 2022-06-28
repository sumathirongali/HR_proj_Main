<%@ page language="java" import="java.util.*, Model.*"
	contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<jsp:include page="dashboard.jsp" />

<script type="text/javascript">
	$.get( "ProjContracts", function(data) {
	}
</script>

<div
	style="margin-left: auto; margin-right: auto; width: 1450px; padding: 15px">
	<div class="form-group col-5">
		<h2 style="text-align: left">
			<b>Project Contracts</b>
		</h2>
		<%
		List<ProjectContracts> projContractsList;
		%>
		<div align="right">
			<form class="d-flex" method="post" action="ProjContracts" novalidate>
				<input class="form-control me-2" type="search" placeholder="Search"
					aria-label="Search" name="proj_search">
				<button class="btn btn-info btn-light btn-sm bi bi-search"
					type="submit">
					<i class="fa fa-search"></i>
				</button>

				<a class="btn btn-success " href="addProjContracts.jsp"
					role="button" style='margin-left: 100px'>New Proj.</a>
				<a class="btn btn-success " href="ListEmployeeProjects"
					role="button" style='margin-left: 2px'>More Details </a>
			</form>
		</div>

	</div>

	<form class="d-flex" method="get" action="ProjContracts" novalidate>
		<table class="table table-striped table-bordered table-hover table-sm"
			style="width: 80%">
			<thead class="thead-dark">
				<tr>
					<th scope="col">Project ID</th>
					<th scope="col">Project Name</th>
					<th scope="col">ManagerId</th>
					<th scope="col">Customer ID</th>
					<th scope="col">Customer Name</th>
					<th scope="col">Budget</th>
					<th scope="col">Start Date</th>
					<th scope="col">End Date</th>
					<th scope="col" class="text-right" style="width: 30%">Action</th>
				</tr>
			</thead>

			<%
			projContractsList = (List<ProjectContracts>) request.getAttribute("projContractsList");

			if (projContractsList != null && !projContractsList.isEmpty()) {
				for (int i = 0; i < projContractsList.size(); i++) {
			%>
			<tbody>
				<tr class="tr-data">
					<td><%=projContractsList.get(i).projectID%></td>
					<td><%=projContractsList.get(i).projectName%></td>
					<td><%=projContractsList.get(i).reportingTo%></td>
					<td><%=projContractsList.get(i).stakeholderId%></td>
					<td><%=projContractsList.get(i).stakeholdername%></td>
					<td><%=projContractsList.get(i).projectBudget%></td>
					<td><%=projContractsList.get(i).startDate%></td>
					<td><%=projContractsList.get(i).endDate%></td>


					<td class="text-right"><a
						href="UploadProjContracts?Edit_ProjId=<%=projContractsList.get(i).projectID%>;<%=projContractsList.get(i).projectName%>;<%=projContractsList.get(i).reportingTo%>;<%=projContractsList.get(i).stakeholderId%>;<%=projContractsList.get(i).stakeholdername%>;<%=projContractsList.get(i).startDate%>;<%=projContractsList.get(i).endDate%>"
						type="button" class="btn btn-light btn-sm"><i
							class="bi bi-pencil-fill"></i>Edit</a> <a
						href="ProjContracts?Delete_ProjId=<%=projContractsList.get(i).projectID%>;<%=projContractsList.get(i).projectName%>;<%=projContractsList.get(i).reportingTo%>;<%=projContractsList.get(i).stakeholderId%>;<%=projContractsList.get(i).stakeholdername%>;<%=projContractsList.get(i).startDate%>;<%=projContractsList.get(i).endDate%>"
						type="button" class="btn btn-light btn-sm"
						onclick=" return confirm('Are you sure you want to delete this record?')"
						id="DeleteProject"> <i class="bi bi-person-x-fill"></i>Delete
					</a></td>
				</tr>
				<%
				}

				} else {
				%>
				<tr>
					<td colspan="7">No Data Found</td>
				</tr>
			</tbody>
			<%
			}
			%>
		</table>
		<div>
			<button class="btn btn-success" style='margin: 5px; float: right'
				type="submit">View All</button>
		</div>
	</form>
</div>
