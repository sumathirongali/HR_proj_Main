function newUserFunction() {
		var emptPwd1 = document.forms["newUserForm"]["password"].value;
		var emptId1 = document.forms["newUserForm"]["emp_id"].value;
		var emptconfirmpwd = document.forms["newUserForm"]["confirmpwd"].value;
		if (emptId1 == "") {
			alert("Please input valid Emp Id");
			return false;
		} else if (emptPwd1 == "") {
			alert("Please input a Password");
			return false;
		} else if (emptconfirmpwd == ""){
			alert("Please reconfirm password");
			return false;
		}
	}
	
function required() {
		var emptPwd = document.forms["loginform"]["Password"].value;
		var emptId = document.forms["loginform"]["emp_Id"].value;
		if (emptId == "") {
			alert("Please input valid Emp Id");
			return false;
		} else if (emptPwd == "") {
			alert("Please input a Password");
			return false;
		}
	}

function myFunction() {
  var input, filter, table, tr, td, i, txtValue;
  input = document.getElementById("myInput");
  filter = input.value.toUpperCase();
  table = document.getElementById("myTable");
  tr = table.getElementsByTagName("tr");
  for (i = 0; i < tr.length; i++) {
    td = tr[i].getElementsByTagName("td")[1];
    if (td) {
      txtValue = td.textContent || td.innerText;
      if (txtValue.toUpperCase().indexOf(filter) > -1) {
        tr[i].style.display = "";
      } else {
        tr[i].style.display = "none";
      }
    }       
  }
}

function myFunction2() {
  var input, filter, table, tr, td, i, txtValue;
  input = document.getElementById("myInput2");
  filter = input.value.toUpperCase();
  table = document.getElementById("myTable2");
  tr = table.getElementsByTagName("tr");
  for (i = 0; i < tr.length; i++) {
    td = tr[i].getElementsByTagName("td")[1];
    if (td) {
      txtValue = td.textContent || td.innerText;
      if (txtValue.toUpperCase().indexOf(filter) > -1) {
        tr[i].style.display = "";
      } else {
        tr[i].style.display = "none";
      }
    }       
  }
}

function myAdminFunction() {
  var input, filter, table, tr, td, i, txtValue;
  input = document.getElementById("adminInput");
  filter = input.value.toUpperCase();
  table = document.getElementById("adminTable");
  tr = table.getElementsByTagName("tr");
  for (i = 0; i < tr.length; i++) {
    td = tr[i].getElementsByTagName("td")[1];
    if (td) {
      txtValue = td.textContent || td.innerText;
      if (txtValue.toUpperCase().indexOf(filter) > -1) {
        tr[i].style.display = "";
      } else {
        tr[i].style.display = "none";
      }
    }       
  }
}

function myPayFunction() {
  var input, filter, table, tr, td, i, txtValue;
  input = document.getElementById("payInput");
  filter = input.value.toUpperCase();
  table = document.getElementById("payTable");
  tr = table.getElementsByTagName("tr");
  for (i = 0; i < tr.length; i++) {
    td = tr[i].getElementsByTagName("td")[1];
    if (td) {
      txtValue = td.textContent || td.innerText;
      if (txtValue.toUpperCase().indexOf(filter) > -1) {
        tr[i].style.display = "";
      } else {
        tr[i].style.display = "none";
      }
    }       
  }
}

function myPayHistFunction() {
  var input, filter, table, tr, td, i, txtValue;
  input = document.getElementById("payHistInput");
  filter = input.value.toUpperCase();
  table = document.getElementById("payHistTable");
  tr = table.getElementsByTagName("tr");
  for (i = 0; i < tr.length; i++) {
    td = tr[i].getElementsByTagName("td")[3];
    if (td) {
      txtValue = td.textContent || td.innerText;
      if (txtValue.toUpperCase().indexOf(filter) > -1) {
        tr[i].style.display = "";
      } else {
        tr[i].style.display = "none";
      }
    }       
  }
}

function myEmpProjFunction() {
  var input, filter, table, tr, td, i, txtValue;
  input = document.getElementById("EmpProjInput");
  filter = input.value.toUpperCase();
  table = document.getElementById("EmpProjTable");
  tr = table.getElementsByTagName("tr");
  for (i = 0; i < tr.length; i++) {
    td = tr[i].getElementsByTagName("td")[1];
    if (td) {
      txtValue = td.textContent || td.innerText;
      if (txtValue.toUpperCase().indexOf(filter) > -1) {
        tr[i].style.display = "";
      } else {
        tr[i].style.display = "none";
      }
    }       
  }
}


/*

function myEmpProjFunction() {
var input, filter, table, tr, td, i, txtValue;
input = document.getElementById("EmpProjInput");
filter = input.value.toUpperCase();
table = document.getElementById("EmpProjTable");
tr = table.getElementsByTagName("tr");
for (i = 0; i < tr.length; i++) {
td = tr[i].getElementsByTagName("td")[0];
if (td) {
txtValue = td.textContent || td.innerText;
if (txtValue.toUpperCase().indexOf(filter) > -1) {
tr[i].style.display = "";
} else {
tr[i].style.display = "none";
}
}
}
}*/