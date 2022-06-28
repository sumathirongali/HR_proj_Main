<jsp:include page="editEmpAll.jsp" />

<script>
    window.onload = function() {
    	if (("<%= request.getAttribute("ipEmployeeStatus") %>") != "")
        	document.getElementById('empStatus').value = "<%= request.getAttribute("ipEmployeeStatus") %>";
        if (("<%= request.getAttribute("ipEmployeeSubStatus") %>") != "")
        	document.getElementById('Empsubstatus').value = "<%= request.getAttribute("ipEmployeeSubStatus") %>";
        if (("<%= request.getAttribute("ipWorkingStatus") %>") != "")
        	document.getElementById('Workingstatus').value = "<%= request.getAttribute("ipWorkingStatus") %>";
    }
    
    function ValidateFields()
    {
    	var strDDLempStatus = "";
    	strDDLempStatus = document.getElementById("empStatus").value;
    	if(strDDLempStatus=="select"){
    		alert("Please select Employee Status");
    		document.getElementById("empStatus").focus();
    		return false;
    	}
    	var strDDLempsubStatus = "";
    	strDDLempsubStatus = document.getElementById("Empsubstatus").value;
    	if(strDDLempsubStatus=="select"){
    		alert("Please select Employee sub Status");
    		document.getElementById("Empsubstatus").focus();
    		return false;
    	}
    	var strDDLworkingStatus = "";
    	strDDLworkingStatus = document.getElementById("Workingstatus").value;
    	if(strDDLworkingStatus=="select"){
    		alert("Please select Working Status");
    		document.getElementById("Workingstatus").focus();
    		return false;
    	}
    	   	
    }
</script>

<div class="container" style="margin-right: auto; margin-left: auto; width: 650px;">
	
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
  
	<form method="post" action="EmpJobTitle" id="titleform">
		<h2 style="text-align: center"><b>Employee Job Title</b></h2>
		<div class="form-group">
			<div class="form-group col-md-12"></div>
		</div>
		<div class="form-row">
			<div class="form-group col-md-6">
				<label for="employeeID">Employee ID</label>
				<input type="text" class="form-control" id="employeeID" name="emp_ID" value="<%= request.getAttribute("ipEmployeeID") %>" readonly>
			</div>
			<div class="form-group col-md-6">
				<label for="empStatus">Employment Status <span style="color:red; font-size: large;"> *</span></label>
				<select id="empStatus" class="form-control" name="empStatus">
					<option hidden value="select">Please select Employment Status</option>
				    <option value="Internal">Internal</option>    
				    <option value="External">External</option>
				</select>
			</div>
		</div>
		<div class="form-row">
			<div class="form-group col-md-6">
				<label for="empSubStatus">Employment Sub Status<span style="color:red; font-size: large;"> *</span></label>
				<select id="Empsubstatus" class="form-control" name="Empsubstatus">
					<option hidden value="select">Please select Employment sub status</option>
					<option value="Full time">Full Time</option>
					<option value="Part time">Part Time</option>
					<option value="Internship">Internship</option>
					<option value="Working student">Working Student</option>	
				</select>
			</div>
			<div class="form-group col-md-6">
				<label for="employeetitle">Employee Title<span style="color:red; font-size: large;"> *</span></label>
				<input type="text" class="form-control" autocomplete="off" id="empTitle" name="EmployeeTitle" placeholder="Enter Employee Title" required value="<%= request.getAttribute("ipEmployeeTitle") %>">
			</div>
		</div>
		<div class="form-row">
			<div class="form-group col-md-6">
				<label for="currjobtitle">Current Job Title<span style="color:red; font-size: large;"> *</span></label>
				<input type="text" class="form-control" autocomplete="off" id="currJobTitle" name="CurrentJobTitle" placeholder="Enter Current Job Title" required value="<%= request.getAttribute("ipCurrentJobTitle") %>">
			</div>				
			<div class="form-group col-md-6">
				<label for="Workingstatus">Working Status<span style="color:red; font-size: large;"> *</span></label>
				<select id="Workingstatus"  class="form-control" name="Workingstatus">
					<option hidden value="select">Please select working status</option>
					<option value="Active">Active</option>
					<option value="On leave">On leave</option>
					<option value="Separated">Separated</option>
					<option value="On notice">On notice</option>
					<option value="Prohibition">Prohibition</option>
					<option value="Retired">Retired</option>
				</select>
			</div>
		</div>
		<div class="form-row">
			<div class="form-group col-md-12">
				<div>
					<a class="btn btn-secondary" href="getEmployeeList" role="button"
						style='margin: 5px; float: right'>Cancel</a>
				</div>
				<div>
					<button class="btn btn-success" style='margin: 5px; float: right' data-dismiss="alert"
						type="submit" id="btnsubmit" onclick="return ValidateFields()">Save</button>
				</div>
			</div>
		</div>
	</form>
</div>
<jsp:include page="footer.jsp" />