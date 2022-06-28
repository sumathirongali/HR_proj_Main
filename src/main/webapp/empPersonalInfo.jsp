<%@page import="com.mysql.cj.protocol.Resultset"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="hr_package.DbManager" %>

<jsp:include page="editEmpAll.jsp" />

<%
try {
	ResultSet rs = null;
	Connection conn = DbManager.getSQLConnection();
	Statement st = conn.createStatement();
	String id = request.getParameter("emp_Id");
	int num = Integer.parseInt(id);
	rs = st.executeQuery("SELECT * FROM employees where emp_id='" + id + "'");
	while (rs.next()) {
%>

<div style="margin-right: auto; margin-left: auto; width: 650px;">
	<h2 style="text-align: center">
		<b> Personal Details</b>
	</h2>
	<form method="post" action="empPersonalInfoUpdate.jsp?emp_Id=<%=request.getParameter("emp_Id")%>" class="needs-validation">

		<div class="form-row">
			<div class="form-group col-md-6">
				<label for="inputFirstName">First Name</label> <input type="text"
					name="first_name" class="form-control" id="inputFirstName"
					value="<%=rs.getString("first_name")%>" required>
			</div>
			<div class="form-group col-md-6">
				<label for="inputLastName">Last Name</label> <input type="text"
					name="last_name" class="form-control" id="inputLastName"
					value="<%=rs.getString("last_name")%>" required>
			</div>
		</div>

		<div class="form-row">
			<div class="form-group col-md-6">
				<label for="inputMiddleName">Middle Name</label> <input type="text"
					name="middle_name" class="form-control" id="inputMiddleName"
					value="<%=rs.getString("middle_name")%>" required>
			</div>
			<div class="form-group col-md-6">
				<label for="inputGender">Gender</label> <select name="gender"
					class="form-control" id="inputgender"
					value="<%=rs.getString("gender")%>">
					<option selected><%=rs.getString("gender")%></option>
					<option value="Male">Male</option>
					<option value="Female">Female</option>
					<option value="Diverse">Diverse</option>
				</select>
			</div>
		</div>

		<div class="form-row">
			<div class="form-group col-md-6">
				<label for="inputdob">Date of Birth</label> <input type="date"
					name="dob" class="form-control" id="inputdob"
					value="<%=rs.getDate("date_of_birth")%>">
			</div>
			<div class="form-group col-md-6">
				<label for="inputdoj">Joining Date</label> <input type="date"
					name="doj" class="form-control" id="inputdoj"
					value="<%=rs.getDate("joining_date")%>">
			</div>
		</div>

		<div class="form-row">
			<div class="form-group col-md-6">
				<label for="inputMaritalStatus">Marital Status</label> <select
					name="marital_status" class="form-control" id="inputmarital_status"
					value="<%=rs.getString("martial_status")%>">
					<option selected><%=rs.getString("martial_status")%></option>
					<option value="Single">Single</option>
					<option value="Married">Married</option>
					<option value="Single parent">Single parent</option>
				</select>
			</div>
			<div class="form-group col-md-6">
				<label for="inputChildren">Children</label> <input type="text"
					name="children" class="form-control" id="inputChildren"
					value="<%=rs.getInt("children")%>">
			</div>
		</div>

		<div class="form-row">
			<div class="form-group col-md-6">
				<label for="inputNationality">Nationality</label> <input type="text"
					name="nationality" class="form-control" id="inputNationality"
					value="<%=rs.getString("nationality")%>" required>
			</div>
			<div class="form-group col-md-6">
				<label for="inputMailId">Off. Mail Id</label> <input type="text"
					name="mail_id" class="form-control" id="inputMailId"
					value="<%=rs.getString("offical_email_id")%>" required>
			</div>

		</div>

		<div>
			<a class="btn btn-secondary" href="getEmployeeList" role="button"
						style='margin: 5px; float: right'>Cancel</a>
		</div>
		<div>
		<input class="btn btn-success" role="button"
							style='margin: 5px; float: right' type="submit" value="Save"
							 onclick="return confirm('User details are saved.\nClick OK to redirect to homepage.')">
			<%-- <a class="btn btn-success" style='margin: 5px; float: right'
				type="submit" value="submit"
				href="empPersonalInfoUpdate.jsp?emp_Id=<%=rs.getString("emp_Id")%>"
				onclick="return confirm('User details are saved.\nClick OK to redirect to homepage.')">Save</a> --%>
		</div>

		<%
		}
		} catch (Exception e) {
		e.printStackTrace();
		}
		%>
	</form>
</div>
