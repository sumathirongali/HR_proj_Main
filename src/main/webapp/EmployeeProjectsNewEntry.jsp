<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ page import="java.sql.*"%>
<%@ page import="java.io.*"%>

<jsp:include page="header.jsp" />
<jsp:include page="navbar.jsp" />


<div class="container"
	style="margin-right: auto; margin-left: auto; width: 750px;">
	<form action="UploadEmployeeProjects" method="POST" id="EmpProjOneForm">
		<h3>
			<b>Enter New Employee Project Record</b>
		</h3>
		<div class="row">
			<div class="col">
				Employee ID:<br> <input type="number" name="emp_id"><br>
				Reporting To:<br> <input type="number" name="reporting_to"><br>
				Project ID:<br> <input type="text" name="project_id"><br>
				Project Name:<br> <input type="text" name="project_name"><br>
			</div>
		</div>
		<br>
		<div>
			<a class="btn btn-success" type="submit" value="submit"
				onclick="return confirm('User details are saved.\nClick OK to redirect to homepage.')">Submit</a>
		</div>
		<hr
			style="height: 2px; border-width: 0; color: gray; background-color: gray">
			
		<div>
			<a href="ListEmployeeProjects" role="button" class="btn btn-warning">Back</a>
		</div>
	</form>
</div>



<jsp:include page="footer.jsp" />