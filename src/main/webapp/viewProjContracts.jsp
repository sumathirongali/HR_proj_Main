
<jsp:include page="header.jsp" />
<jsp:include page="navbar.jsp" />


<div style="margin-right: auto; margin-left: auto; width: 950px;">
	<h2 style="text-align: center">
		<b> Project Contract Details</b>
	</h2>
	<form method="get" action="RetrieveProjContracts" id="contractform">

		
		<div class="form-row">
			<div class="form-group col-md-6">
				<label for="inputProjId">Project ID</label> <input type="text"
					name="project_id" class="form-control" id="inputProjId"
					value="<%=request.getAttribute("project_id")%>">
			</div>
			<div class="form-group col-md-6">
				<label for="inputProjName">Project Name</label> <input type="text"
					name="project_name" class="form-control" id="inputProjName"
					value="<%=request.getAttribute("project_name")%>">
			</div>
		</div>

		<div class="form-row">
			<div class="form-group col-md-6">
				<label for="inputCustId">Customer ID</label> <input type="text"
					name="cutomer_id" class="form-control" id="inputCustId"
					value="<%=request.getAttribute("project_name")%>">
			</div>
			<div class="form-group col-md-6">
				<label for="inputCustName">Customer Name</label> <input type="text"
					name="customer_name" class="form-control" id="inputCustName"
					value="<%=request.getAttribute("project_name")%>">
			</div>
		</div>

		<div class="form-row">
			<div class="form-group col-md-6">
				<label for="inputProjStart">Starts</label> <input type="date"
					name="proj_start" class="form-control" id="inputProjStart"
					value="<%=request.getAttribute("project_name")%>">
			</div>
			<div class="form-group col-md-6">
				<label for="inputPwdEnd">Ends</label> <input type="date"
					name="proj_end" class="form-control" id="inputPwdEnd"
					value="<%=request.getAttribute("project_name")%>">
			</div>
		</div>

		<div class="form-row">
			<div class="form-group col-md-6">
				<label for="inputProjBud">Project Budget</label> <input type="text"
					name="proj_bud" class="form-control" id="inputProjBud"
					value="<%=request.getAttribute("project_name")%>">
			</div>
			<div class="form-group col-md-6">
				<label for="inputProjMng">Project Manager</label> <input type="text"
					name="proj_mng" class="form-control" id="inputProjMng"
					value="<%=request.getAttribute("project_name")%>">
			</div>
		</div>

		<div>
			<a class="btn btn-secondary" href="dashboard.jsp" role="button"
				style='margin: 5px; float: right'>Cancel</a>
		</div>
		<div>
			<button class="btn btn-success" style='margin: 5px; float: right'
				type="submit"
				onclick="return confirm('User details are saved.\nClick OK to redirect to homepage.')">Save</button>
		</div>

</form>
</div>

