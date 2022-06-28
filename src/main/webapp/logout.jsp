<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
request.getSession(false).invalidate();  
response.setHeader("Cache-Control","no-cache");
response.setHeader("Cache-Control","no-store");
response.setHeader("Pragma","no-cache");
response.setDateHeader ("Expires", 0);
%>


<SCRIPT type="text/javascript">
    window.history.forward(-1);
    function noBack() { window.history.forward(); }
</SCRIPT>

<style> 
body {
  background-image: url(assets/img.jpg);
}
</style>

<p>You logged out successfully. <a href="login.jsp">Click to Login</a></p>



