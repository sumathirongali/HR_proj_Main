<%@ page language="java" import="java.util.*, Model.*"
	contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<jsp:include page="header.jsp" />
<jsp:include page="navbar.jsp" />

<div style="margin-right: auto; margin-left: auto; width: 950px;">
	<h2 style="text-align: center">
		<b> Add/Edit Project Contract</b>
	</h2>
			<% ProjectContracts ProjContDetails; %>
	<form method="POST" action="UploadProjContracts" id="contractform">

		<%	
		ProjContDetails = (ProjectContracts)request.getAttribute("ProjConDetails");	
		
		if(ProjContDetails != null) {
		
		%>	
		
		<div class="form-row">
			<div class="form-group col-md-6">
				<label for="inputProjId">Project ID</label> <input type="text"
					name="project_id" class="form-control" id="inputProjId" value="<%=ProjContDetails.projectID %>" required readonly="readonly">
			</div>
			<div class="form-group col-md-6">
				<label for="inputProjName">Project Name</label> <input type="text"
					name="project_name" class="form-control" id="inputProjName" value="<%=ProjContDetails.projectName %>" required>
			</div>
		</div>

		<div class="form-row">
			<div class="form-group col-md-6">
				<label for="inputCustId">Customer ID</label> <input type="text"
					name="cutomer_id" class="form-control" id="inputCustId" value="<%=ProjContDetails.stakeholderId %>" required>
			</div>
			<div class="form-group col-md-6">
				<label for="inputCustName">Customer Name</label> <input type="text"
					name="customer_name" class="form-control" id="inputCustName" value="<%=ProjContDetails.stakeholdername %>" required>
			</div>
		</div>

		<div class="form-row">
			<div class="form-group col-md-6">
				<label for="inputProjStart">Starts</label> <input type="date"
					name="proj_start" class="form-control" id="inputProjStart" value="<%=ProjContDetails.startDate %>" required>
			</div>
			<div class="form-group col-md-6">
				<label for="inputPwdEnd">Ends</label> <input type="date"
					name="proj_end" class="form-control" id="inputPwdEnd" value="<%=ProjContDetails.endDate %>" required>
			</div>
		</div>

		<div class="form-row">
			<div class="form-group col-md-6">
				<label for="inputProjBud">Project Budget</label> <input type="text"
					name="proj_bud" class="form-control" id="inputProjBud" value="<%=ProjContDetails.projectBudget %>" required pattern="[0-9]+" title="Please enter only numbers">
			</div>
			<div class="form-group col-md-6">
				<label for="inputProjMng">Project Manager</label> <input type="text"
					name="proj_mng" class="form-control" id="inputProjMng" value="<%=ProjContDetails.reportingTo %>" required readonly="readonly" pattern="[0-9]+" title="Please enter Manager Employee ID">
			</div>
		</div>
		
		<%
		
		} else {
	%>
			<div class="form-row">
			<div class="form-group col-md-6">
				<label for="inputProjId">Project ID</label> <input type="text"
					name="project_id" class="form-control" id="inputProjId" required>
			</div>
			<div class="form-group col-md-6">
				<label for="inputProjName">Project Name</label> <input type="text"
					name="project_name" class="form-control" id="inputProjName" required>
			</div>
		</div>

		<div class="form-row">
			<div class="form-group col-md-6">
				<label for="inputCustId">Customer ID</label> <input type="text"
					name="cutomer_id" class="form-control" id="inputCustId" required>
			</div>
			<div class="form-group col-md-6">
				<label for="inputCustName">Customer Name</label> <input type="text"
					name="customer_name" class="form-control" id="inputCustName" required>
			</div>
		</div>

		<div class="form-row">
			<div class="form-group col-md-6">
				<label for="inputProjStart">Starts</label> <input type="date"
					name="proj_start" class="form-control" id="inputProjStart" required>
			</div>
			<div class="form-group col-md-6">
				<label for="inputPwdEnd">Ends</label> <input type="date"
					name="proj_end" class="form-control" id="inputPwdEnd" required>
			</div>
		</div>

		<div class="form-row">
			<div class="form-group col-md-6">
				<label for="inputProjBud">Project Budget</label> <input type="text"
					name="proj_bud" class="form-control" id="inputProjBud" required pattern="[0-9]+" title="Please enter only numbers">
			</div>
			<div class="form-group col-md-6">
				<label for="inputProjMng">Project Manager</label> <input type="text"
					name="proj_mng" class="form-control" id="inputProjMng" required pattern="[0-9]+" title="Please enter Manager Employee ID">
			</div>
		</div>
		
	<%
		}
	%>  

		<div>
			<a class="btn btn-secondary" href="dashboard.jsp" role="button"
				style='margin: 5px; float: right'>Cancel</a>
		</div>
		<div>
			<button class="btn btn-success" style='margin: 5px; float: right'
				type="submit">Save</button>
		</div>

	</form>
</div>

