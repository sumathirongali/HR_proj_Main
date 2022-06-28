<%@ page language="java" import="java.util.*, Model.*"
	contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<jsp:include page="dashboard.jsp" />

<script>
	window.onload = function() {

		//document.getElementById("searchKeyword").click();
		//var data = xhr.responseText;
		//alert("sf");
	};
	//xhr.open('GET', '${pageContext.request.contextPath}/ListAdminContract', true);
	//xhr.send(null);

	function deleteContract(contractID) {
		alert(contractID);
		//document.getElementById("deleteContract").click();
		/*
		$.ajax({
		     type: 'POST',
		     url: 'localhost:8080/ListAdminContract',
		     data: {"contractID": contractID}
		});
		 */
		$.ajax({
			url : 'localhost:8080/ListAdminContract',
			data : {
				postVariableName : contractID
			},
			type : 'POST'
		});
	}
<%List<AdminContractsMod> contractList;%>
	
</script>

<div
	style="margin-left: auto; margin-right: auto; width: 1050px; padding: 15px">
	<form method="post" action="ListAdminContract" novalidate>
		<div class="form-row">
			<div class="form-group col-6">
				<h2 style="text-align: left">
					<b>Admin Contract List</b>
				</h2>
			</div>
		</div>
		<div class="form-row">
			<div class="form-group col-4">
				<div align="auto">
					<input class="form-control" type="search"
						placeholder="Search by Contract ID or Type or Manager"
						aria-label="Search" name="searchKeyword"
						value="<%=request.getAttribute("searchKeyword") != null ? request.getAttribute("searchKeyword") : ""%>"
						autocomplete="off">
				</div>
			</div>
			<div class="form-group col-8">
				<div align="left">
					<button class="btn btn-info btn-light btn-sm bi bi-search"
						type="submit" name="action" value="searchKeyword">
						<i class="fa fa-search"></i>
					</button>
					<a class="btn btn-success " href="AdminContractsNewEntry.jsp" role="button"
					style='margin-left: 100px'>New Contract</a>
				</div>
			</div>
		</div>
		<div class="form-row">
			<div class="form-group col-12">
				<table
					class="table table-striped table-bordered table-hover table-sm"
					style="width: 100%">
					<thead class="thead-dark">
						<tr>
							<th scope="col">Contract ID</th>
							<th scope="col">Contract Type</th>
							<th scope="col">Contract Manager</th>
							<th scope="col">Start Date</th>
							<th scope="col">End Date</th>
							<th scope="col">Contract Workers</th>
							<th scope="col">Contract Budget</th>
							<th scope="col" style="text-align: center;">Action</th>
						</tr>
					</thead>

					<%
					contractList = (List<AdminContractsMod>) request.getAttribute("contractList");
					if (contractList != null && !contractList.isEmpty()) {
						for (int i = 0; i < contractList.size(); i++) {
					%>
					<tbody>
						<tr>
							<td><%=contractList.get(i).ContractID%></td>
							<td><%=contractList.get(i).Contracttype%></td>
							<td><%=contractList.get(i).ContractManager%></td>
							<td><%=contractList.get(i).Startdate%></td>
							<td><%=contractList.get(i).Enddate%></td>
							<td class="text-center"><%=contractList.get(i).ContractWorkers%></td>
							<td><%=contractList.get(i).ContractBudjet%></td>
							<td style="vertical-align: middle;"><a
								href="UpdateAdminContracts" type="button"
								class="btn btn-light btn-sm" style="padding-top: 10px;"><i
									class="bi bi-pencil-fill"></i>Edit</a>
								<button class="btn btn-light btn-sm"
									style='margin: 5px; float: right' type="submit"
									name="btnDeleteContract"
									value='<%=contractList.get(i).ContractID%>'
									onclick=" return confirm('Are you sure you want to delete this record?')">
									<i class="bi bi-person-x-fill"></i>Delete
								</button></td>
						</tr>
						<%
						}

						} else {
						%>
						<tr>
							<td colspan="8" style="text-align: center;">No Data Found</td>
						</tr>
					</tbody>
					<%
					}
					%>
				</table>
				<button class="btn btn-success" style='visibility: hidden;'
					type="submit" name="action" value="deleteContract"></button>
			</div>
		</div>
	</form>
</div>