<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ page import="java.sql.*"%>
<%@ page import="java.io.*"%>

<jsp:include page="header.jsp" />
<jsp:include page="navbar.jsp" />

<div class="container"
	style="margin-right: auto; margin-left: auto; width: 750px;">
	<form action="UploadAdminContracts" method="POST" id="adminContOneForm">
		<h2 style="text-align: center">
			<b> New Admin. Contract</b>
		</h2>

		<div class="form-group">
			<div class="form-group col-md-12"></div>
		</div>

		<div class="form-row">
			<div class="form-group col-md-6">
				<label for="contract_type">Contract Type</label> <input type="text"
					class="form-control" id="employeeID" name="contract_type">
			</div>
			<div class="form-group col-md-6">
				<label for="contract_id">Contract ID</label> <input type="text"
					class="form-control" id="street" name="contract_id">
			</div>
		</div>

		<div class="form-row">
			<div class="form-group col-md-6">
				<label for="start_date">Start date</label> <input type="date"
					name="start_date" class="form-control" id="inputStartDate">
			</div>
			<div class="form-group col-md-6">
				<label for="end_date">End date</label> <input type="date"
					name="end_date" class="form-control" id="inputEndDate">
			</div>
		</div>

		<div class="form-row">
			<div class="form-group col-md-6">
				<label for="contract_manager">Contract manager</label> <input
					type="text" class="form-control" id="employeeID"
					name="contract_manager">
			</div>
			<div class="form-group col-md-6">
				<label for="contract_workers">Contract Workers</label> <input
					type="number" class="form-control" id="street"
					name="contract_workers">
			</div>
		</div>

		<div class="form-row">
			<div class="form-group col-md-6">
				<label for="contract_budget">Contract Budget</label> <input
					type="text" class="form-control" name="contract_budget">
			</div>
		</div>

		<div class="form-row">
			<div class="form-group col-md-12">
				<div>
					<a class="btn btn-secondary" href="ListAdminContract"
						role="button" style='margin: 5px; float: right'>Cancel</a>
				</div>
				<div>
					<button class="btn btn-success" style='margin: 5px; float: right'
						type="submit" href="ListAdminContract"
						onclick="return confirm('User details are saved.\nClick OK to redirect to homepage.')">Save</button>
				</div>
			</div>
		</div>
	</form>
</div>

</body>
</html>

<jsp:include page="footer.jsp" />