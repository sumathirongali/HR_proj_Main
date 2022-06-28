<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.mysql.cj.protocol.Resultset"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="hr_package.DbManager" %>

<%
String first_name = request.getParameter("first_name");
String last_name = request.getParameter("last_name");
String middle_name = request.getParameter("middle_name");
String gender = request.getParameter("gender");
String dob = request.getParameter("dob");
String doj = request.getParameter("doj");
String marital_status = request.getParameter("marital_status");
int children = Integer.parseInt(request.getParameter("children"));
String nationality = request.getParameter("nationality");
String mail_id = request.getParameter("mail_id");

try{
	ResultSet rs = null;
	Connection conn = DbManager.getSQLConnection();
	Statement st = conn.createStatement();
	String sql = "INSERT INTO employees (last_name,middle_name,first_name,gender,joining_date,date_of_birth,nationality,martial_status,children,offical_email_id) values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
	PreparedStatement statement = conn.prepareStatement(sql);
	statement.setString(1, last_name);
	statement.setString(2, middle_name);
	statement.setString(3, first_name);
	statement.setString(4, gender);
	statement.setString(5, doj);
	statement.setString(6, dob);
	statement.setString(7, nationality);
	statement.setString(8, marital_status);
	statement.setInt(9, children);
	statement.setString(10, mail_id);

	int i = statement.executeUpdate();
	if(i > 0)
	{
	out.print("Record Updated Successfully");
	}
	else
	{
	out.print("There is a problem in updating Record.");
	}
	conn.close();

	response.sendRedirect("getEmployeeList");
	}
	catch(Exception e)
	{
		out.println(e);
	}
%>
    