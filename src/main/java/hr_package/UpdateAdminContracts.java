package hr_package;

import java.io.*;  
import javax.servlet.*;  
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.sql.*; 


@WebServlet("/UpdateAdminContracts")
public class UpdateAdminContracts extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	private String dbURL = "jdbc:mysql://localhost:3306/srh_01";
	private String dbUser = "root";
	private String dbPass = "root";
	
    public UpdateAdminContracts() {
        super();
        
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();    
        out.println("<html><body>");
        
		Connection conn = null;
		Statement st = null;
		ResultSet rs = null;
		
		try {
			DriverManager.registerDriver(new com.mysql.jdbc.Driver());
			conn = DriverManager.getConnection(dbURL, dbUser, dbPass);
			st=conn.createStatement();
        	String queryString = "Select * from admin_contracts";
        	rs = st.executeQuery(queryString);
        	out.println("<table border=\"1\" style=\"background-color: #ffffcc;\">");
        	out.println("<tr><td><b>Contract Type</b></td><td><b>Contract ID</b></td><td><b>Contract Manager</b></td>");
        	out.println("<td><b>Start Date</b></td><td><b>End Date</b></td><td><b>Contract Workers</b></td>");
        	out.println("<td><b>Contract Budget</b></td>");
        	out.println("<td><b>Action</b></td></tr>");
        	
        	while(rs.next()) {
        		out.println("<form method='post' action='UpdateAdminContracts'>");
        		out.println("<tr>");
        		out.println("<td>");
        		out.println("<input type ='text' name='contract_type' value='"+rs.getString("contract_type")+ "'/>");
        		out.println("<td>");
        		out.println("<input type ='text' name='contract_id' value='"+rs.getString("contract_id") + "'/>");
        		out.println("<td>");
        		out.println("<input type ='text' name='contract_manager' value='"+rs.getString("contract_manager")+ "'/>");
        		out.println("<td>");
        		out.println("<input type ='text' name='start_date' value='"+rs.getString("start_date")+ "'/>");
        		out.println("<td>");
        		out.println("<input type ='text' name='end_date' value='"+rs.getString("end_date")+ "'/>");
        		out.println("<td>");
        		out.println("<input type ='text' name='contract_workers' value='"+rs.getString("contract_workers")+ "'/>");
        		out.println("<td>");
        		out.println("<input type ='text' name='contract_budget' value='"+rs.getString("contract_budget")+ "'/>");
        		out.println("<td>");
        		out.println("<input type='submit' value='update'>");
        		out.println("</tr>");
        		out.println("</form>");
        	}
        	out.println("</table>");
        	out.println("</html></body>");
        	out.println("<td><form action=\"ListAdminContract\" method=\"get\"><button type=\"submit\"><-- back</button></form></td>");
        	conn.close();
        	rs.close();
		}
		catch (Exception e) {
			out.println(e);
			e.printStackTrace();
		}
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		doGet(request, response);
		PrintWriter out = response.getWriter();  
		response.setContentType("text/html");  
        out.println("<html><body>");
        
		Connection conn = null;
		
		String contract_type = request.getParameter("contract_type");
		String contract_id = request.getParameter("contract_id");
		String contract_manager = request.getParameter("contract_manager");
		String start_date = request.getParameter("start_date");
		String end_date = request.getParameter("end_date");
		String contract_workers = request.getParameter("contract_workers");
		String contract_budget = request.getParameter("contract_budget");
		String message = null;
		
		try {
			DriverManager.registerDriver(new com.mysql.cj.jdbc.Driver());
			conn = DriverManager.getConnection(dbURL, dbUser, dbPass);
			
			String sql = "update admin_contracts set contract_type = ?, contract_id = ?, contract_manager = ?, start_date = ?, end_date = ?, contract_workers = ?, contract_budget = ? where contract_id = ?";
			
			PreparedStatement statement = conn.prepareStatement(sql);
			statement.setString(1, contract_type);
			statement.setString(2, contract_id);
			statement.setString(3, contract_manager);
			statement.setString(4, start_date);
			statement.setString(5, end_date);
			statement.setString(6, contract_workers);
			statement.setString(7, contract_budget);
			
			int row = statement.executeUpdate();
			if (row > 0) {
				message = "File updated and saved into database";
			}
        	
		}
		catch (SQLException ex) {
			message = "ERROR: " + ex.getMessage();
			ex.printStackTrace();
		}finally {
			if (conn != null) {
				try {
					conn.close();
				}catch (SQLException ex) {
					ex.printStackTrace();
				}
			}
			request.setAttribute("Message", message);
		}
	}

}
