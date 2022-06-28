<%@ page language="java" import="java.util.*, Model.*"
	contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<jsp:include page="editEmpAll.jsp" />

<script type="text/javascript">
	$.get( "EmpInsurance", function(data) {
	}
</script>
 
<div class="container" style="margin-right: auto; margin-left: auto; width: 750px;">

		<% EmployeeInsurance EmpInsDetails; %>
	  <form method="post" action="EmpInsurance" id="insuranceform">
		   <h2 style="text-align: center"><b>Employee Insurance Details</b></h2>
		        <div class="form-group">
			    <div class="form-group col-md-12"></div>
		        </div>
		        
	
		<%	
		EmpInsDetails = (EmployeeInsurance)request.getAttribute("EmpInsDetails");	
		
		if(EmpInsDetails != null) {
		
		%>	
	
		        
	   <div class="form-row">        
	       <div class="form-group col-md-6">
		       <label for="inputEmployeeID">Employee ID</label>
			   <input type="text" class="form-control" id="inputEmployeeID" name="emp_ID" required readonly="readonly" value=<%=EmpInsDetails.employeeID %>>
	       </div>
	   </div>
	   
	   	   <div class="form-row">
           <div class="form-group col-md-6">
		       <label for="inputSocialSecurityNumber">Social Security Number</label>
			   <input type="text" class="form-control" id="inputSocialSecurityNumber" name="emp_socialsecuritynumber" required value=<%=EmpInsDetails.socialSecurityNumber %>>
		   </div>
	  </div>
	  
	  
	  <div class="form-row">		
		   <div class="form-group col-md-6">
			   <label for="inputtaxid">Tax ID</label>
			   <input type="text" class="form-control" id="inputTaxId" name="emp_taxid" required value=<%=EmpInsDetails.taxID %>>
		   </div>
	  </div>
	  
	  		
	  <div class="form-row">	
		<div class="form-group col-md-6">
            <label for="inputhealthinsurancetype">Health Insurance Type</label>
                <select name="emp_healthinsurancetype" id="inputHealthInsuranceType" required>
                    <option value="Public">Public</option>
                    <option value="Private">Private</option>
                 </select>
         </div>
       </div>
       
       <div class="form-row">  
          <div class="form-group col-md-6">
			 <label for="inputhealthinsuranceid">Health Insurance ID</label>
				<input type="text" class="form-control" id="inputHealthInsuranceId" required name="emp_healthinsuranceid" value=<%=EmpInsDetails.healthInsuranceID %>>
		  </div>
	   </div> 
	   
	   
	   <div class="form-row"> 
		   <div class="form-group col-md-6">
			  <label for="inputhealthinsuranceprovider">Health Insurance Provider</label>
				<input type="text" class="form-control" id="inputHealthInsuranceProvider" required name="emp_healthinsuranceprovider" value=<%=EmpInsDetails.healthInsuranceProvider %>>
		   </div>
       </div>  
	   
	   			<%
		
		} else {
	%>
	
		   <div class="form-row">        
	       <div class="form-group col-md-6">
		       <label for="inputEmployeeID">Employee ID</label>
			   <input type="text" class="form-control" id="inputEmployeeID" name="emp_ID" required>
	       </div>
	   </div>
	

	   
	   
	   <div class="form-row">
           <div class="form-group col-md-6">
		       <label for="inputSocialSecurityNumber">Social Security Number</label>
			   <input type="text" class="form-control" id="inputSocialSecurityNumber" required pattern="[0-9]+" maxlength="10" title="Please enter only numbers" name="emp_socialsecuritynumber">
		   </div>
	  </div>
	  
	  
	  <div class="form-row">		
		   <div class="form-group col-md-6">
			   <label for="inputtaxid">Tax ID</label>
			   <input type="text" class="form-control" id="inputTaxId" name="emp_taxid" required maxlength="10">
		   </div>
	  </div>
	  
	  		
	  <div class="form-row">	
		<div class="form-group col-md-6">
            <label for="inputhealthinsurancetype">Health Insurance Type</label>
                <select name="emp_healthinsurancetype" id="inputHealthInsuranceType" required>
                    <option value="Public">Public</option>
                    <option value="Private">Private</option>
                 </select>
         </div>
       </div>
       
       <div class="form-row">  
          <div class="form-group col-md-6">
			 <label for="inputhealthinsuranceid">Health Insurance ID</label>
				<input type="text" class="form-control" id="inputHealthInsuranceId" name="emp_healthinsuranceid" required maxlength="10">
		  </div>
	   </div> 
	   
	   
	   <div class="form-row"> 
		   <div class="form-group col-md-6">
			  <label for="inputhealthinsuranceprovider">Health Insurance Provider</label>
				<input type="text" class="form-control" id="inputHealthInsuranceProvider" name="emp_healthinsuranceprovider" required>
		   </div>
       </div> 
       
	<%
		}
	%>   
            
       <div class="form-row">
		   <div class="form-group col-md-12">
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
            
            
	