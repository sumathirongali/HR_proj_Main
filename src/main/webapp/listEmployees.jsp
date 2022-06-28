<%@ page language="java" import="java.util.*, Model.*"
	contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<jsp:include page="dashboard.jsp" />

<script>
	<%	List<EmployeeTypes> employeeList;%>
</script>

<div style="margin-left: auto; margin-right: auto; width: 950px; padding: 15px">
	<form method="POST" action="ListEmployees" novalidate>
		<div class="form-row">
			<div class="form-group col-6">
				<h2 style="text-align: left">
					<b>Employees List</b>
				</h2>
			</div>
		</div>
		<div class="form-row">
			<div class="form-group col-5">	
				<div align="auto">
					<input class="form-control" type="search" placeholder="Search by Employee ID or Name or Email or Status" aria-label="Search" name="searchKeyword" 
					value="<%= request.getAttribute("searchKeyword") != null ? request.getAttribute("searchKeyword") :"" %>" 	
					autocomplete="off">
				</div>
			</div>
			<div class="form-group col-7">	
				<div align="left">
					<button class="btn btn-info btn-light btn-sm bi bi-search" type="submit" name="action" value="searchKeyword">
						<i class="fa fa-search"></i>
					</button>
					<a class="btn btn-success " href="addEmployee.jsp" role="button"
					style='margin-left: 10px;'>New Employee</a>
				</div>
			</div>
		</div>
			
		<div class="form-row">
			<div class="form-group col-12">
				<table class="table table-striped table-bordered table-hover table-sm" style="width: 100%">
					<thead class="thead-dark">
						<tr style="vertical-align: middle;">
							<th scope="col">Emp ID</th>
							<th scope="col">Name</th>
							<th scope="col">Email ID</th>
							<th scope="col">Status</th>
							<th scope="col" style="text-align: center; width: 25%;">Action</th>
						</tr>
					</thead>
			
					<%
					employeeList = (List<EmployeeTypes>) request.getAttribute("employeeList");
			
					if (employeeList != null && !employeeList.isEmpty()) {
			
						for (int i = 0; i < employeeList.size(); i++) {
					%>
			
					<tbody>
						<tr class="tr-data" style="vertical-align: middle;">
							<td><%=employeeList.get(i).EmployeeID%></td>
							<td><%=employeeList.get(i).first_name%> <%=employeeList.get(i).last_name%></td>
							<td><%=employeeList.get(i).mail_id%></td>
			
							<%
							String status = employeeList.get(i).WorkingStatus;
							if (status == "Seperated") {
							%>
							<td style="color: red"><%=employeeList.get(i).WorkingStatus%></td>
							<%
							} else {
							%>
							<td style="color: green"><%=employeeList.get(i).WorkingStatus%></td>
							<%
							}
							%>
			
							<td class="text-right">
								<a href="viewEmployeeDetails.jsp?emp_Id=<%=employeeList.get(i).EmployeeID%>" type="button" style="padding-top: 10px;"
									class="btn btn-light btn-sm"><i	class="bi bi-eye-fill"></i>View</a> 
								<a href="editEmpAll.jsp?emp_Id=<%=employeeList.get(i).EmployeeID%>" type="button" class="btn btn-light btn-sm" style="padding-top: 10px;"><i
									class="bi bi-pencil-fill"></i>Edit</a>
								<button class="btn btn-light btn-sm" style='margin: 5px; float: right' type="submit" name="btnDeleteEmployee" 
									value='<%=employeeList.get(i).EmployeeID%>' onclick=" return confirm('Are you sure you want to delete this record?')">
									<i class="bi bi-person-x-fill"></i>Delete</button>
							</td>
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
			</div>
		</div>
	</form>
</div>
