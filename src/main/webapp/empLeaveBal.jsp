<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
	rs = st.executeQuery("SELECT * FROM emp_leave_balance where emp_id='" + id + "'");
	while (rs.next()) {
%>

<div class="container"
	style="margin-right: auto; margin-left: auto; width: 450px;">

	<h2 style="text-align: center">
		<b> Employee Leave Balance</b>
	</h2> 
	<div class="form-group">
		<div class="form-group col-md-12"></div>
	</div>	
	
		<div class="form-row" >
			<div class="form-group col-md-6">
				<label for="houseNo">Casual Bal.</label> <input type="text"
					class="form-control" name="casual_leaves"
					value="<%=rs.getString("casual_leaves")%>" readonly="readonly">
			</div>
			<div class="form-group col-md-6">
				<label for="street">Sick Bal.</label> <input type="text"
					class="form-control" id="street" name="sick_leaves"
					value="<%=rs.getString("sick_leaves")%>" readonly="readonly">
			</div>
		</div>

		<div class="form-row">
			<div class="form-group col-md-6">
				<label for="houseNo">Annual Bal.</label> <input type="text"
					class="form-control" name="casual_leaves"
					value="<%=rs.getString("Annual_leaves")%>" readonly="readonly">
			</div>
			<div class="form-group col-md-6">
				<label for="street">Paternal Bal.</label> <input type="text"
					class="form-control" name="sick_leaves"
					value="<%=rs.getString("parental_leaves")%>" readonly="readonly">
			</div>
		</div>

		<div class="form-row">
			<div class="form-group col-md-6">
				<label for="houseNo">Volunteering Bal.</label> <input type="text"
					class="form-control" name="volunteering_leaves"
					value="<%=rs.getString("volunteering_leaves")%>" readonly="readonly">
			</div>
			<div class="form-group col-md-6">
				<label for="street">Financial Year</label> <input type="text"
					class="form-control" name="financial_year"
					value="<%=rs.getString("financial_year")%>" readonly="readonly">
			</div>
		</div>
	
	<div class="form-row">
		<div class="form-group col-md-6">
			<div>
				<a class="btn btn-secondary" href="getEmployeeList" role="button"
					style='margin: 5px; float: right'>Cancel</a>
			</div>
			<div>
				<a class="btn btn-success" style='margin: 5px; float: right'
					href="VacayNewRecordEntry.jsp?emp_Id=<%=request.getParameter("emp_Id")%>" role="button">Apply Leave</a>
			</div>
		</div>
	</div>
	<%
	}
	} catch (Exception e) {
	e.printStackTrace();
	}
	%>
</div>
<jsp:include page="footer.jsp" />