<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.mysql.cj.protocol.Resultset"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.security.MessageDigest"%>
<%@page import="hr_package.DbManager" %>

<%
String emp_id = request.getParameter("emp_id");
String password = request.getParameter("password");
String confirmPwd = request.getParameter("confirmpwd");
try {
	ResultSet rs = null;
	Connection conn = DbManager.getSQLConnection();
	Statement st = conn.createStatement();
	int num = Integer.parseInt(emp_id);
	/* rs = st.executeQuery("SELECT * FROM login where emp_id='" + num + "'");
	if (rs.getString("emp_id") == emp_id) {
		System.out.print("User already present");
	} else{ */
		if (password.equals(confirmPwd)) {
			MessageDigest alg = MessageDigest.getInstance("MD5");
			alg.reset();
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
			
		int i = st.executeUpdate("insert into login(emp_id,password)values('" + num + "','" + password + "')");

		response.sendRedirect("newUser.jsp");
		}
		else
		{
			System.out.print("Please input valid credentials");

			response.sendRedirect("newUser.jsp");
		}
	//}

} catch (Exception e) {
	System.out.print(e);
	e.printStackTrace();
}
%>