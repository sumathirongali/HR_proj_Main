
<link href="css/style_ver.css" rel="stylesheet">
<jsp:include page="header.jsp" />

<script type="text/javascript" src="JavaScript/leavejScript.js"></script>

<form method="post" name="newUserForm" action="newUserValidate.jsp"
	onsubmit="return newUserFunction()">
	<div class="container">
		<div class="row justify-content-center">
			<div class="col-md-5">
				<div class="card">
					<h2 class="card-title text-center">Register New User</h2>
					<div class="card-body py-md-4">

						<div class="form-group">
							<input type="text" class="form-control" placeholder="Employee Id"
								name="emp_id">
						</div>

						<div class="form-group">
							<input type="password" class="form-control"
								placeholder="Password" name="password">
						</div>
						<div class="form-group">
							<input type="password" class="form-control"
								placeholder="confirm-password" name="confirmpwd">
						</div>
						<div
							class="d-flex flex-row align-items-center justify-content-between">
							<a href="login.jsp">Login</a> <input class="btn btn-primary"
								role="button" style='float: center' type="submit"
								onclick="return confirm('New User is created.\nClick Ok to Login.')"
								href="login.jsp" value="Create Account">
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</form>


<jsp:include page="footer.jsp" />