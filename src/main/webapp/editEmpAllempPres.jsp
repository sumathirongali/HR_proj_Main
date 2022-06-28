<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<jsp:include page="header.jsp" />
<jsp:include page="navbar.jsp" />
<link href="css/style.css" rel="stylesheet">

<h3 style="text-align: center">Edit Employee Details</h3>

<link href="css/style.css" rel="stylesheet">

<div class="tab">
	<button class="tablinks" onclick="openCity(event, 'London')">
		<a class="nav-link active" aria-current="page"
			href="empPersonalInfo.jsp?emp_Id=<%=request.getSession().getAttribute("EMP_ID")%>">Personal
			Info</a>
	</button>
	<button class="tablinks" onclick="openCity(event, 'Paris')"
		name="editEmpId"
		value='<%=request.getSession().getAttribute("EMP_ID")%>'>
		<a class="nav-link" href="editEmployeeAddress?emp_Id=<%=request.getSession().getAttribute("EMP_ID")%>">Address</a>
	</button>
	<button class="tablinks" onclick="openCity(event, 'Tokyo')">
		<a class="nav-link" href="EmpEducation?empid=<%=request.getParameter("EMP_ID")%>">Education</a>
	</button>
	<button class="tablinks" onclick="openCity(event, 'London1')">
		<a class="nav-link active" aria-current="page"
			href="EmpInsurance?empid=<%=request.getParameter("EMP_ID")%>">Insurance</a>
	</button>
	<button class="tablinks" onclick="openCity(event, 'Paris1')">
		<a class="nav-link" href="editEmployeeJobTitle?emp_Id=<%=request.getSession().getAttribute("EMP_ID")%>">Job
			Title</a>
	</button>
	<button class="tablinks" onclick="openCity(event, 'Tokyo1')">
		<a class="nav-link" href="empLeaveBal.jsp?emp_Id=<%=request.getSession().getAttribute("EMP_ID")%>">Vacation</a>
	</button>
</div>

<!-- Tab content -->
<div id="London" class="tabcontent"></div>
<div id="Paris" class="tabcontent"></div>
<div id="Tokyo" class="tabcontent"></div>
<div id="London1" class="tabcontent"></div>
<div id="Paris1" class="tabcontent"></div>
<div id="Tokyo1" class="tabcontent"></div>


<script>
	function openCity(evt, cityName) {
		var i, tabcontent, tablinks;
		tabcontent = document.getElementsByClassName("tabcontent");
		for (i = 0; i < tabcontent.length; i++) {
			tabcontent[i].style.display = "none";
		}
		tablinks = document.getElementsByClassName("tablinks");
		for (i = 0; i < tablinks.length; i++) {
			tablinks[i].className = tablinks[i].className
					.replace(" active", "");
		}
		document.getElementById(cityName).style.display = "block";
		evt.currentTarget.className += " active";
	}
</script>

<jsp:include page="footer.jsp" />