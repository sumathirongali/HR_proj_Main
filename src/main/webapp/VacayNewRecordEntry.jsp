<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ page import="java.sql.*"%>
<%@ page import="java.io.*"%>

<jsp:include page="header.jsp" />
<jsp:include page="navbar.jsp" />


<title>New Vacation Request</title>


	<div class="container"
		style="margin-right: auto; margin-left: auto; width: 750px;">
		<form method="post" action="UploadEmpVacayDetails" id="vacayOneForm">
			<h3>
				<b>Enter New Vacation Record</b>
			</h3>
			<div class="row">
				<div class="col">
					<div class="form-row">
						<div class="form-group col-md-6">
							<label for="inputEmployeeID">Employee ID</label> <input
								type="text" class="form-control" name="emp_id" value=<%=request.getParameter("emp_Id")%>>
						</div>
						<div class="form-group col-md-6">
							<label for="leave_type">Leave Type</label> <select
								name="leave_type" class="form-control">
								<option value="Casual">Casual</option>
								<option value="Sick">Sick</option>
								<option value="Annual">Annual</option>
								<option value="parental">parental</option>
								<option value="Volunteering">Volunteering</option>
							</select>
						</div>
					</div>

					<div class="form-row">
						<div class="form-group col-md-6">
							<label for="inputStartdate">Start date</label> <input type="date"
								name="start_date" class="form-control" id="inputStartDate">
						</div>
						<div class="form-group col-md-6">
							<label for="inputEnddate">End date</label> <input type="date"
								name="end_date" class="form-control" id="inputEndDate">
						</div>
					</div>

					<div class="form-row">

						<div class="form-group col-md-6">
							<label for="inputEmployeeID">Vacation Status</label> <select
								name="vacation_status" class="form-control">
								<option value="Pending">Pending</option>
								<option value="Approved">Approved</option>
								<option value="Rejected">Rejected</option>
							</select>
						</div>
						<div class="form-group col-md-6">
							<label for="inputEmployeeID">Leave Note</label> <input
								type="text" class="form-control" name="leave_note">
						</div>
					</div>
				</div>
			</div>

			<div class="form-row">
				<div class="form-group col-md-12">
					<div>
						<!-- <a class="btn btn-secondary" href="ListEmployeeVacay"
							role="button" style='margin: 5px; float: right'>Cancel</a> -->
					</div>
					<div>
						<button class="btn btn-success" style='margin: 5px; float: right'
							type="submit" value="submit"
							onclick="return confirm('User details are saved.')">Submit</button>
					</div>
				</div>
			</div>

		</form>
		<hr
			style="height: 2px; border-width: 0; color: gray; background-color: gray">
		
	</div>
