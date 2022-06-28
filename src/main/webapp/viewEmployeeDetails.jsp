
<%@page import="com.mysql.cj.protocol.Resultset"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="hr_package.DbManager" %>

<jsp:include page="header.jsp" />
<jsp:include page="navbar.jsp" />

<%
ResultSet rs = null;
Connection conn = DbManager.getSQLConnection();
Statement st = conn.createStatement();
String id = request.getParameter("emp_Id");
int num = Integer.parseInt(id);

rs = st.executeQuery("SELECT * FROM employees where emp_id='" + num + "'");
while (rs.next()) {

%>

<div style="margin-right: auto; margin-left: auto; width: 750px;">
	<h2 style="text-align: center">
		<b>Personal Details</b>
	</h2>
	<form method="GET" id="contractform">
		<fieldset disabled>

			<!-- EMPLOYEE DETAILS -->
			<div class="form-row">
				<div class="form-group col-md-6">
					<label for="inputFirstName">First Name</label> <input type="text"
						name="first_name" class="form-control" id="inputFirstName"
						value="<%=rs.getString("first_name")%>">
				</div>
				<div class="form-group col-md-6">
					<label for="inputLastName">Last Name</label> <input type="text"
						name="last_name" class="form-control" id="inputLastName"
						value="<%=rs.getString("last_name")%>">
				</div>
			</div>

			<div class="form-row">
				<div class="form-group col-md-6">
					<label for="inputMiddleName">Middle Name</label> <input type="text"
						name="middle_name" class="form-control" id="inputMiddleName"
						value="<%=rs.getString("middle_name")%>">
				</div>
				<div class="form-group col-md-6">
					<label for="inputGender">Gender</label> <input type="text"
						name="gender" class="form-control" id="inputGender"
						value="<%=rs.getString("gender")%>">
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
					<label for="inputMaritalStatus">Marital Status</label> <input
						type="text" name="marital_status" class="form-control"
						id="inputMaritalStatus"
						value="<%=rs.getString("martial_status")%>">
				</div>
				<div class="form-group col-md-6">
					<label for="inputChildren">Children</label> <input type="text"
						name="children" class="form-control" id="inputChildren"
						value="<%=rs.getString("children")%>">
				</div>
			</div>

			<div class="form-row">
				<div class="form-group col-md-6">
					<label for="inputNationality">Nationality</label> <input
						type="text" name="nationality" class="form-control"
						id="inputNationality" value="<%=rs.getString("nationality")%>">
				</div>
				<div class="form-group col-md-6">
					<label for="inputMailId">Off. Mail Id</label> <input type="text"
						name="mail_id" class="form-control" id="inputMailId"
						value="<%=rs.getString("offical_email_id")%>">
				</div>
			</div>
			<%
			}
			rs.close();
			ResultSet rs1 = st.executeQuery("SELECT * FROM emp_address where emp_id='" + num + "'");
			while (rs1.next()) {
			%>
			<!-- EMPLOYEE ADDRESS -->


			<h2 style="text-align: center">
				<b> Employee Address</b>
			</h2>
			<div class="form-group">
				<div class="form-group col-md-12"></div>
			</div>
			<div class="form-row">
				<div class="form-group col-md-6">
					<label for="houseNo">House Number</label> <input type="text"
						class="form-control" id="houseNo" name="House_no"
						placeholder="Enter House Number"
						value="<%=rs1.getString("house_num")%>">
				</div>
				<div class="form-group col-md-6">
					<label for="street">Street</label> <input type="text"
						class="form-control" id="street" name="Street"
						placeholder="Enter street" required
						value="<%=rs1.getString("street")%>">
				</div>
			</div>

			<div class="form-row">
				<div class="form-group col-md-6">
					<label for="city">City</label> <input type="text"
						class="form-control" id="city" name="City"
						placeholder="Enter City" required
						value="<%=rs1.getString("city")%>">
				</div>
				<div class="form-group col-md-6">
					<label for="state">State</label> <input type="text"
						class="form-control" id="state" name="State"
						placeholder="Enter State" required
						value="<%=rs1.getString("state")%>">
				</div>
			</div>

			<div class="form-row">
				<div class="form-group col-md-6">
					<label for="country">Country</label> <input type="text"
						class="form-control" id="country" name="Country"
						placeholder="Enter Country" required
						value="<%=rs1.getString("country")%>">
				</div>
				<div class="form-group col-md-6">
					<label for="pincode">Pin Code (Only Numbers)</label> <input
						type="text" class="form-control" id="pincode" name="pin_code"
						placeholder="Enter Pincode" required pattern="[0-9]+"
						maxlength="10" value="<%=rs1.getBigDecimal("pin_code")%>">
				</div>
			</div>

			<div class="form-row">
				<div class="form-group col-md-6">
					<label for="email">Personal Email ID</label> <input type="email"
						class="form-control" id="email" name="Email"
						placeholder="Enter email ID" required
						value="<%=rs1.getString("personal_email_id")%>">
				</div>

				<div class="form-group col-md-6">
					<label for="phonenumber">Phone Number</label> <input type="text"
						class="form-control" id="phonenumber" name="ipPhone"
						placeholder="Enter Phone Number" required
						value="<%=rs1.getString("phone")%>">
				</div>
			</div>
			<%
			}
			rs1.close();
			ResultSet rs2 = st.executeQuery("SELECT * FROM emp_education where emp_id='" + num + "'");
			while (rs2.next()) {
			%>
			<!-- EMPLOYEE EDUCATION -->


			<h2 style="text-align: center">
				<b> Employee Education </b>
			</h2>

			<div class="form-group">
				<div class="form-group col-md-12"></div>
			</div>

			<div class="form-row">
				<div class="form-group col-md-6">
					<label for="Education type">Education type</label> <input
						type="text" name="emp_educationtype" class="form-control"
						id="inputEducationType"
						value="<%=rs2.getString("education_type")%>">
				</div>
				<div class="form-group col-md-6">
					<label for="inputInstituteName">Institute name</label> <input
						type="text" name="emp_institutename" class="form-control"
						id="inputEmpInstituteName"
						value="<%=rs2.getString("institute_name")%>">
				</div>
			</div>

			<div class="form-row">
				<div class="form-group col-md-6">
					<label for="inputStartdate">Start date</label> <input type="date"
						name="emp_startdate" class="form-control" id="inputStartDate"
						value="<%=rs2.getString("start_date")%>">
				</div>
				<div class="form-group col-md-6">
					<label for="inputEnddate">End date</label> <input type="date"
						name="emp_enddate" class="form-control" id="inputEndDate"
						value="<%=rs2.getString("end_date")%>">
				</div>
			</div>

			<div class="form-row">
				<div class="form-group col-md-6">
					<label for="inputMajorName">Major</label> <input type="text"
						name="emp_major" class="form-control" id="inputMajor"
						value="<%=rs2.getString("major")%>">
				</div>
				<div class="form-group col-md-6">
					<label for="inputGrade">Grade</label> <input type="text"
						name="emp_grade" class="form-control" id="inputgrade"
						value="<%=rs2.getString("grade")%>">
				</div>
			</div>

			<div class="form-row">
				<div class="form-group col-md-6">
					<label for="inputCountryName">Country</label> <input type="text"
						name="emp_country" class="form-control" id="inputCountry"
						value="<%=rs2.getString("country")%>">
				</div>
			</div>
			<%
			}
			rs2.close();
			ResultSet rs3 = st.executeQuery("SELECT * FROM emp_job_title where emp_id='" + num + "'");
			while (rs3.next()) {
			%>

			<!-- EMPLOYEE JOB TITLE -->


			<h2 style="text-align: center">
				<b> Employee Job Title </b>
			</h2>

			<div class="form-group">
				<div class="form-group col-md-12"></div>
			</div>

			<div class="form-row">
				<div class="form-group col-md-6">
					<label for="inputempid">Employee ID</label> <input type="text"
						name="employee_id" class="form-control" id="inputempid"
						value="<%=rs3.getString("emp_id")%>">
				</div>
				<div class="form-group col-md-6">
					<label for="inputworkstatus">Working Status</label> <input
						type="text" name="working_status" class="form-control"
						id="inputworkstatus" value="<%=rs3.getString("working_status")%>">
				</div>
			</div>

			<div class="form-row">
				<div class="form-group col-md-6">
					<label for="Employmentstatus">Employment Status</label> <input
						type="text" name="employment_status" class="form-control"
						id="inputEmploymentstatus"
						value="<%=rs3.getString("employment_status")%>">
				</div>
				<div class="form-group col-md-6">
					<label for="Substatus">Sub Status</label> <input type="text"
						name="employment_sub_status" class="form-control"
						id="inputSubstatus"
						value="<%=rs3.getString("employment_sub_status")%>">
				</div>
			</div>

			<div class="form-row">
				<div class="form-group col-md-6">
					<label for="inputemptitle">Employment Title</label> <input
						type="text" name="employment_title" class="form-control"
						id="inputemptitle" value="<%=rs3.getString("employment_title")%>">
				</div>
				<div class="form-group col-md-6">
					<label for="inputjobtitle">Job Title</label> <input type="text"
						name="curr_job_title" class="form-control" id="inputjobtitle"
						value="<%=rs3.getString("curr_job_title")%>">
				</div>
			</div>
			<%
			}
			rs3.close();
			ResultSet rs4 = st.executeQuery("SELECT * FROM emp_exp_hist where emp_id='" + num + "'");
			while (rs4.next()) {
			%>

			<!-- EMPLOYEE EXPERIENCE -->


			<h2 style="text-align: center">
				<b> Employee Experience </b>
			</h2>

			<div class="form-row">
				<div class="form-group col-md-6">
					<label for="inputEmpName">Employer Name</label> <input type="text"
						name="employer_name" class="form-control" id="inputEmpName"
						value="<%=rs4.getString("employer_name")%>">
				</div>
				<div class="form-group col-md-6">
					<label for="inputCityName">City</label> <input type="text"
						name="workCity" class="form-control" id="inputCityName"
						value="<%=rs4.getString("city")%>">
				</div>
			</div>

			<div class="form-row">
				<div class="form-group col-md-6">
					<label for="inputProjStart">Starts</label> <input type="date"
						name="work_start" class="form-control" id="inputProjStart"
						value="<%=rs4.getDate("start_date")%>">
				</div>
				<div class="form-group col-md-6">
					<label for="inputPwdEnd">Ends</label> <input type="date"
						name="work_end" class="form-control" id="inputPwdEnd"
						value="<%=rs4.getDate("end_date")%>">
				</div>
			</div>

			<div class="form-row">
				<div class="form-group col-md-6">
					<label for="inputJob">Job</label> <input type="text" name="job"
						class="form-control" id="inputJob"
						value="<%=rs4.getString("job")%>">
				</div>
				<div class="form-group col-md-6">
					<label for="inputJobTitle">Job Title</label> <input type="text"
						name="job_title" class="form-control" id="inputJob"
						value="<%=rs4.getString("job_title")%>">
				</div>
			</div>


			<div class="form-row">
				<div class="form-group col-md-6">
					<label for="inputDomain">Domain</label> <input type="text"
						name="domain" class="form-control" id="inputDomain"
						value="<%=rs4.getString("domain")%>">
				</div>
				<div class="form-group col-md-6">
					<label for="inputCityName">Country</label> <input type="text"
						name="country" class="form-control" id="inputCityName"
						value="<%=rs4.getString("country_key")%>">
				</div>
			</div>
			<%
			}
			rs4.close();
			ResultSet rs5 = st.executeQuery("SELECT * FROM emp_insurance where emp_id='" + num + "'");
			while (rs5.next()) {
			%>

			<!-- EMPLOYEE INSURANCE -->


			<h2 style="text-align: center">
				<b>Employee Insurance Details</b>
			</h2>
			<div class="form-group">
				<div class="form-group col-md-12"></div>
			</div>

			<div class="form-row">
				<div class="form-group col-md-6">
					<label for="inputSocialSecurityNumber">Social Security
						Number</label> <input type="text" class="form-control"
						id="inputSocialSecurityNumber" name="emp_socialsecuritynumber"
						value="<%=rs5.getString("social_sec_num")%>">
				</div>
				<div class="form-group col-md-6">
					<label for="inputtaxid">Tax ID</label> <input type="text"
						class="form-control" id="inputTaxId" name="emp_taxid"
						value="<%=rs5.getString("tax_id")%>">
				</div>
			</div>

			<div class="form-row">
				<div class="form-group col-md-6">
					<label for="inputhealthinsurancetype">Health Insurance Type</label>
					<input type="text" class="form-control" id="inputTaxId"
						name="emp_HealthInsuranceType"
						value="<%=rs5.getString("health_ins_type")%>">
				</div>
				<div class="form-group col-md-6">
					<label for="inputhealthinsuranceid">Health Insurance ID</label> <input
						type="text" class="form-control" id="inputHealthInsuranceId"
						name="emp_healthinsuranceid"
						value="<%=rs5.getString("health_ins_id")%>">
				</div>
			</div>

			<div class="form-row">
				<div class="form-group col-md-6">
					<label for="inputhealthinsuranceprovider">Health Insurance
						Provider</label> <input type="text" class="form-control"
						id="inputHealthInsuranceProvider"
						name="emp_healthinsuranceprovider"
						value="<%=rs5.getString("health_ins_provider")%>">
				</div>
			</div>
		</fieldset>
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
					<a class="btn btn-primary" href="editEmpAll.jsp?emp_Id=<%=num%>" role="button"
						style='margin: 5px; float: right'>Edit</a>
				</div>
			</div>
		</div>
	</form>
</div>
