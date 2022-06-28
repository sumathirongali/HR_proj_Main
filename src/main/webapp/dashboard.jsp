<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<jsp:include page="header.jsp" />
<jsp:include page="navbar.jsp" />

<link href="css/style.css" rel="stylesheet">

<div class="tab">
	<button class="tablinks" onclick="openCity(event, 'London')">
		<a class="nav-link active" aria-current="page" href="getEmployeeList">Employees</a>
	</button>
	<button class="tablinks" onclick="openCity(event, 'Paris')">
		<a class="nav-link" href="listProjContracts.jsp">Proj Contracts</a>
	</button>
	<button class="tablinks" onclick="openCity(event, 'Tokyo')">
		<a class="nav-link" href="ListAdminContract">Admin Contracts</a>
	</button>
	<button class="tablinks" onclick="openCity(event, 'Paris1')">
		<a class="nav-link" href="PayDetailsEntry.jsp">Pay Details</a>
	</button>
	<button class="tablinks" onclick="openCity(event, 'Tokyo1')">
		<a class="nav-link" href="ListEmployeeVacay">Vacation Details</a>
	</button>
</div>

<!-- Tab content -->
<div id="London" class="tabcontent"></div>
<div id="Paris" class="tabcontent"></div>
<div id="Tokyo" class="tabcontent"></div>
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

