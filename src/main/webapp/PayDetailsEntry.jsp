<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ page import="java.sql.*"%>
<%@ page import="java.io.*"%>

<jsp:include page="dashboard.jsp" />

<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<title>Insert Pay Details Here</title>

<!-- PAGE 1.0 -->

<div class="container"
	style="margin-right: auto; margin-left: auto; width: 750px;">
	<div class="form-row">
		<a class="btn btn-secondary" href="ListEmployeePay" role="button"
			style='margin: 20px; float: center'>More Pay Related Details</a>
	</div>
	<form method="post" action="UploadEmpPayDetails" id="payOneForm">
		<h3>
			<b>Enter New Employee Pay Details</b>
		</h3>
		<div class="form-row">
			<div class="form-group col-md-6">
				<h4>
					<b>Salary Details</b>
				</h4>
				Employee ID:<br> <input type="number" name="emp_id"><br>
				Employee Tax Class:<br> <select name="emp_tax_class">
					<option value="1">1</option>
					<option value="2">2</option>
					<option value="3">3</option>
					<option value="4">4</option>
					<option value="5">5</option>
					<option value="6">6</option>
				</select><br> Yearly Gross Salary:<br> <input type="number"
					name="gross_yearly" id="gross_yearly" step=".01" value=0.00><br>
				Monthly Gross Salary:<br> <input type="number"
					name="gross_monthly" id="gross_monthly" class="gross_monthly"
					readonly step=".01" value=0.00><br> Yearly Bonus:<br>
				<input type="number" name="bonus" step=".01"><br>
				Payment Method:<br> <select name="payment_method">
					<option value="Weekly">Weekly</option>
					<option value="Monthly">Monthly</option>
				</select><br>
				<!-- Pay Scale Group:<br>
				<input type="text" name="pay_scale_group"><br>
				Job Level:<br>
				<input type="text" name="job_level"><br><br> -->
				<!-- Pay Scale Group:<br>
<input type="text" name="pay_scale_group"><br> -->
				Pay Scale Group:<br> <select name="pay_scale_group">
					<option value="a">A</option>
					<option value="b">B</option>
					<option value="c">C</option>
					<option value="d">D</option>
				</select><br>
				<!-- Job Level:<br>
<input type="text" name="job_level"><br><br> -->
				Job Level:<br> <select name="job_level">
					<optgroup label="A">
						<option value="a1">A1</option>
						<option value="a2">A2</option>
						<option value="a3">A3</option>
					</optgroup>
					<optgroup label="B">
						<option value="b1">B1</option>
						<option value="b2">B2</option>
						<option value="b3">B3</option>
					</optgroup>
					<optgroup label="C">
						<option value="c1">C1</option>
						<option value="c2">C2</option>
						<option value="c3">C3</option>
						<option value="c4">C4</option>
					</optgroup>
					<optgroup label="D">
						<option value="d1">D1</option>
						<option value="d2">D2</option>
						<option value="d3">D3</option>
					</optgroup>
				</select>
			</div>
			<div class="form-group col-md-6">
				<h4>
					<b>Bank Details</b>
				</h4>
				IBAN:<br> <input type="text" name="iban"><br> BIC:<br>
				<input type="text" name="bic"><br> Bank Name:<br>
				<input type="text" name="bank_name"><br>
			</div>
			<div class="center">
				<button type="submit" value="submit"
					onclick="return confirm('User details are saved.')">Submit
					All</button>
			</div>
		</div>
		<br>

	</form>

	<script>
		const gross_monthly = parseInt($('.gross_monthly').val());

		$('#gross_yearly').keyup(
				function() {
					$('.gross_monthly').val(
							gross_monthly + parseInt($(this).val() || 0) / 12);
				});
	</script>
</div>

<hr
	style="height: 2px; border-width: 0; color: gray; background-color: gray">


