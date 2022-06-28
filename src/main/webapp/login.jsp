
<jsp:include page="header.jsp" />

<script type="text/javascript" src="JavaScript/leavejScript.js"></script>
<style> 
body {
  background-image: url(assets/HRM.jpg);
  background-repeat: no-repeat;
}
</style>
<img class="mt-5 mb-7">
<div class="col-md-6 offset-md-3">
	<div class="text-center mt-5">

		<form method="post" style="max-width: 380px; margin: auto;" name="loginform"
			action="loginvalidate.jsp" onsubmit="return required()">
			<div class="text-center" >

				<img class="bi bi-person-circle"></img> <img class="mt-4 mb-4">
				<svg xmlns="http://www.w3.org/2000/svg" width="100" height="100"
					fill="currentColor" class="bi bi-person-circle" viewBox="0 0 16 16">
                <path d="M11 6a3 3 0 1 1-6 0 3 3 0 0 1 6 0z" />
                <path fill-rule="evenodd"
						d="M0 8a8 8 0 1 1 16 0A8 
                8 0 0 1 0 8zm8-7a7 7 0 0 0-5.468 11.37C3.242 11.226 4.805 
                10 8 10s4.757 1.225 5.468 2.37A7 7 0 0 0 8 1z" />
       
                
                <h1><b>HR4u Login</b></h1>
               <div>
                <div class="mb-3 col-md-12">
                   
                        <input type="text" name="emp_Id"
								placeholder="Employee Id" class="form-control">
                </div>
                
                <div class="mb-3 col-md-12">
                   
                        <input type="password" name="Password"
								placeholder="Password" class="form-control">
                </div>
            </div>    
        <div>
        <a class="link" href="newUser.jsp"
							role="text" style='margin: 5px; float: center; color:black;'>New User ?</a>
            <input class="btn btn-success" role="button"
							style='float: center' type="submit" value="Sign In">
          </div>                
              </svg>
			</div>
		</form>
	</div>
</div>


<jsp:include page="footer.jsp" />