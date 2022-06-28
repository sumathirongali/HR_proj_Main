<%@page contentType="text/html; charset=iso-8859-1" language="java"
	import="java.security.MessageDigest"%>
<%@page import="com.mysql.cj.protocol.Resultset"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.*"%>
<%@page import="hr_package.DbManager" %>

<%!String userid;
	String userdbPsw;
	String job_level;%>

<%
//PreparedStatement ps = null;
ResultSet rs = null;
ResultSet rs1 = null;
MessageDigest alg = MessageDigest.getInstance("MD5");
alg.reset();
String id = request.getParameter("emp_Id");
String password = request.getParameter("Password");
int num = Integer.parseInt(id);
String sql = "select * from login where emp_id=? and password=?";

alg.update(password.getBytes());
byte[] digest = alg.digest();

StringBuffer hashedpasswd = new StringBuffer();
String hx;
for (int i = 0; i < digest.length; i++) {
	hx = Integer.toHexString(0xFF & digest[i]);
	//0x03 is equal to 0x3, but we need 0x03 for our md5sum
	if (hx.length() == 1) {
		hx = "0" + hx;
	}
	hashedpasswd.append(hx);
}
password = hashedpasswd.toString();

try {
	Connection conn = DbManager.getSQLConnection();
	Statement st = conn.createStatement();
	rs = st.executeQuery("SELECT * FROM login where emp_id='" + num + "'");
	while (rs.next()) {
		userid = rs.getString("emp_id");
		userdbPsw = rs.getString("password");
	}
	

	rs1 = st.executeQuery("SELECT * FROM emp_pay where emp_id='" + num + "'");
	while (rs1.next()) {
	job_level = rs1.getString("job_level");
	}

	if (id.equals(userid) && password.equals(userdbPsw)) {
		if (job_level.equals("b3")) {
			session.setAttribute("EMP_ID", userid);
			response.sendRedirect("dashboard.jsp");
		} else {
			session.setAttribute("EMP_ID", userid);
			response.sendRedirect("editEmpAllempPres.jsp");
		}
	} else {
		response.sendRedirect("login.jsp");
	}
} catch (Exception sqe) {
	out.println(sqe);
}
%>


