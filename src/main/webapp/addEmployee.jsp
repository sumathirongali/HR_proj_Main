<jsp:include page="header.jsp" />
<jsp:include page="navbar.jsp" />

<script>
function ValidateFields()
{
	var strDDLgender = "";
	strDDLgender = document.getElementById("inputgender").value;
	if(strDDLgender=="select"){
		alert("Please select gender");
		document.getElementById("inputgender").focus();
		return false;
	}
	var strDDLmarital = "";
	strDDLmarital = document.getElementById("inputmarital_status").value;
	if(strDDLmarital=="select"){
		alert("Please select Marital Status");
		document.getElementById("inputmarital_status").focus();
		return false;
	}
}

window.onload = function(){
	var message = "<%=request.getAttribute("message")%>";
	if (message != null && message != "" && message != "null")
		alert(message);
	
	if (("<%= request.getAttribute("ipGender") %>") != "")
    	document.getElementById('inputgender').value = "<%= request.getAttribute("ipGender") %>";
    if (("<%= request.getAttribute("ipMaritalStatus") %>") != "")
    	document.getElementById('inputmarital_status').value = "<%= request.getAttribute("ipMaritalStatus") %>";
}
</script>

<div style="margin-right: auto; margin-left: auto; width: 850px;">
	<h2 style="text-align: center">
		<b> New Employee</b>
	</h2>
	<form method="post" action="EmployeeDetails" id="contractform">

		<div class="form-row">
			<div class="form-group col-md-6">
				<label for="inputFirstName">First Name<span
					style="color: red; font-size: large;"> *</span></label> <input type="text" value="<%=request.getAttribute("ipFirstName") != null ? request.getAttribute("ipFirstName") : ""%>"
					name="first_name" class="form-control" id="inputFirstName" required placeholder="Enter First Name" autocomplete="off">
			</div>
			<div class="form-group col-md-6">
				<label for="inputLastName">Last Name<span
					style="color: red; font-size: large;"> *</span></label> <input type="text" value="<%=request.getAttribute("ipLastName") != null ? request.getAttribute("ipLastName") : ""%>"
					name="last_name" class="form-control" id="inputLastName" required placeholder="Enter Last Name" autocomplete="off">
			</div>
		</div>

		<div class="form-row">
			<div class="form-group col-md-6">
				<label for="inputMiddleName">Middle Name</label> <input type="text" value="<%=request.getAttribute("ipMiddleName") != null ? request.getAttribute("ipMiddleName") : ""%>"
					name="middle_name" class="form-control" id="inputMiddleName" placeholder="Enter Middle Name" autocomplete="off">
			</div>
			<div class="form-group col-md-6">
				<label for="inputGender">Gender<span
					style="color: red; font-size: large;"> *</span></label> <select 
					name="gender" class="form-control" id="inputgender" required placeholder="Enter Gender">
					<option hidden value="select">Please select gender</option>
					<option value="Male">Male</option>
					<option value="Female">Female</option>
					<option value="Diverse">Diverse</option>
				</select>
			</div>
		</div>

		<div class="form-row">
			<div class="form-group col-md-6">
				<label for="inputdob">Date of Birth<span
					style="color: red; font-size: large;"> *</span></label>
					<input type="date" name="dob" class="form-control" id="inputdob" required placeholder="Enter Date of Joining" value="<%=request.getAttribute("ipDOB") != null ? request.getAttribute("ipDOB") : ""%>">
					
			</div>
			<div class="form-group col-md-6">
				<label for="inputdoj">Joining Date<span
					style="color: red; font-size: large;"> *</span></label>
					<input type="date" name="doj" class="form-control" id="inputdoj" required placeholder="Enter Date of Joining" value="<%=request.getAttribute("ipDOJ") != null ? request.getAttribute("ipDOJ") : ""%>">
			</div>
		</div>

		<div class="form-row">
			<div class="form-group col-md-6">
				<label for="inputMaritalStatus">Marital Status<span
					style="color: red; font-size: large;"> *</span></label> <select
					name="marital_status" class="form-control" id="inputmarital_status" required placeholder="Enter Marital Status">
					<option hidden value="select">Please select Marital Status</option>
					<option value="Single">Single</option>
					<option value="Married">Married</option>
					<option value="Single parent">Single parent</option>
				</select>
			</div>
			<div class="form-group col-md-6">
				<label for="inputChildren">Children<span
					style="color: red; font-size: large;"> </span></label> <input type="text"
					name="children" class="form-control" id="inputChildren" placeholder="Enter Children Details" value="<%=request.getAttribute("ipChildren") != null ? request.getAttribute("ipChildren") : ""%>" autocomplete="off">
			</div>
		</div>

		<div class="form-row">
			<div class="form-group col-md-6">
				<label for="inputNationality">Nationality<span
					style="color: red; font-size: large;"> *</span></label> <input type="text"
					name="nationality" class="form-control" id="inputNationality" required placeholder="Enter Nationality" value="<%=request.getAttribute("ipNationality") != null ? request.getAttribute("ipNationality") : ""%>" autocomplete="off">
			</div>
			<div class="form-group col-md-6">
				<label for="inputMailId">Off. Mail Id<span
					style="color: red; font-size: large;"> *</span></label> <input type="text"
					name="mail_id" class="form-control" id="inputMailId" required placeholder="Enter Official Email ID" value="<%=request.getAttribute("ipOffEmailID") != null ? request.getAttribute("ipOffEmailID") : ""%>" autocomplete="off">
			</div>

		</div>

		<div>
			<a class="btn btn-secondary" href="getEmployeeList" role="button"
				style='margin: 5px; float: right'>Cancel</a>
		</div>
		<div>
			<button class="btn btn-success" style='margin: 5px; float: right' type="submit" onclick="return ValidateFields()">Save</button>
		</div>
	</form>
</div>

