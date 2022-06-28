<jsp:include page="editEmpAll.jsp" />

<script>
	window.onload = function(){
		var message = "<%=request.getAttribute("message_empAddress")%>
	";
		if (message != null && message != "" && message != "null")
			alert(message);
	}
</script>

<div class="container"
	style="margin-right: auto; margin-left: auto; width: 750px;">

	<!-- Modal -->
	<div class="modal fade" id="myModal" role="dialog">
		<div class="modal-dialog">

			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">Alert</h4>
				</div>
				<div class="modal-body">
					<p id="error"></p>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				</div>
			</div>

		</div>
	</div>

	<form method="post" action="EmpAddress" id="addressform">
		<h2 style="text-align: center">
			<b> Employee Address</b>
		</h2>
		<div class="form-group">
			<div class="form-group col-md-12"></div>
		</div>
		<div class="form-row">
			<div class="form-group col-md-6">
				<label for="houseNo">House Number<span
					style="color: red; font-size: large;"> *</span></label> <input type="text"
					class="form-control" id="houseNo" name="House_no"
					autocomplete="off" placeholder="Enter House Number"
					value="<%=request.getAttribute("ipHouseNum")%>" required>
			</div>
			<div class="form-group col-md-6">
				<label for="street">Street<span
					style="color: red; font-size: large;"> *</span></label> <input type="text"
					class="form-control" id="street" name="Street"
					placeholder="Enter street" required
					value="<%=request.getAttribute("ipStreet")%>" autocomplete="off">
			</div>
		</div>

		<div class="form-row">
			<div class="form-group col-md-6">
				<label for="city">City<span
					style="color: red; font-size: large;"> *</span></label> <input type="text"
					class="form-control" id="city" name="City" autocomplete="off"
					placeholder="Enter City" required
					value="<%=request.getAttribute("ipCity")%>">
			</div>
			<div class="form-group col-md-6">
				<label for="state">State<span
					style="color: red; font-size: large;"> *</span></label> <input type="text"
					class="form-control" id="state" name="State" autocomplete="off"
					placeholder="Enter State" required
					value="<%=request.getAttribute("ipState")%>">
			</div>
		</div>
		<div class="form-row">
			<div class="form-group col-md-6">
				<label for="pincode">Pin Code (Only Numbers)<span
					style="color: red; font-size: large;"> *</span></label> <input type="text"
					class="form-control" id="pincode" name="pin_code"
					autocomplete="off" placeholder="Enter Pincode" required
					pattern="[0-9]+" maxlength="10"
					value="<%=request.getAttribute("ipPincode")%>">
			</div>
			<div class="form-group col-md-6">
				<label for="country">Country<span
					style="color: red; font-size: large;"> *</span></label> <input type="text"
					class="form-control" id="country" name="Country" autocomplete="off"
					placeholder="Enter Country" required
					value="<%=request.getAttribute("ipCountry")%>">
			</div>
		</div>
		<div class="form-row">

			<div class="form-group col-md-6">
				<label for="phonenumber">Phone Number<span
					style="color: red; font-size: large;"> *</span></label> <input type="text"
					class="form-control" id="phonenumber" name="PhNumber"
					autocomplete="off" placeholder="Enter Phone Number" required
					value="<%=request.getAttribute("ipPhone")%>">
			</div>
			<div class="form-group col-md-6">
				<label for="email">Personal Email ID<span
					style="color: red; font-size: large;"> *</span></label> <input type="email"
					class="form-control" id="email" name="Email" autocomplete="off"
					placeholder="Enter email ID" required
					value="<%=request.getAttribute("ipEmail")%>">
			</div>
		</div>

		<div class="form-row">

			<div class="form-group col-md-6" style="visibility: hidden">
				<label for="employeeID">Employee ID</label> <input type="text"
					class="form-control" id="employeeID" name="emp_ID"
					value="<%=request.getAttribute("emp_ID")%>" readonly>
			</div>
			<div class="form-group col-md-6">
				<div>
					<a class="btn btn-secondary" href="getEmployeeList" role="button"
						style='margin: 5px; float: right'>Cancel</a>
				</div>
				<div>
					<button class="btn btn-success" style='margin: 5px; float: right'
						type="submit">Save</button>
				</div>
			</div>

		</div>

	</form>
</div>
<jsp:include page="footer.jsp" />