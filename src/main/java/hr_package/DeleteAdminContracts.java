package hr_package;

import java.io.*;  
import javax.servlet.*;  
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.sql.*; 

@WebServlet("/DeleteAdminContracts")
public class DeleteAdminContracts extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	private String dbURL = "jdbc:mysql://localhost:3306/srh_01";
	private String dbUser = "root";
	private String dbPass = "root";
	
    public DeleteAdminContracts() {
        super();
       
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		PrintWriter out = response.getWriter();  
		response.setContentType("text/html");  
        out.println("<html><body>");
        
		Connection conn = null;
		
		
		try {
			DriverManager.registerDriver(new com.mysql.jdbc.Driver());
			conn = DriverManager.getConnection(dbURL, dbUser, dbPass);
			Statement st=conn.createStatement();
        	ResultSet rs;
        	String queryString = "Select * from admin_contracts";
        	rs = st.executeQuery(queryString);
        	out.println("<table cellpadding=\"15\" border=\"1\" style=\"background-color: #ffffcc;\">");
        	out.println("<tr><td><b>Contract Type</b></td><td><b>Contract ID</b></td><td><b>Contract Manager</b></td>");
        	out.println("<td><b>Start Date</b></td><td><b>End Date</b></td>");
        	out.println("<td><b>Action</b></td></tr>");
        	
        	while(rs.next()) {
        		out.println("<form method='post' action='DeleteAdminContracts'>");
        		out.println("<tr>");
        		out.println("<td>");
        		out.println(rs.getString("contract_type"));
        		out.println("<td>");
        		out.println("<input name='contract_id' value='"+rs.getString("contract_id") + "'/>");
        		out.println("<td>");
        		out.println(rs.getString("contract_manager"));
        		out.println("<td>");
        		out.println(rs.getString("start_date"));
        		out.println("<td>");
        		out.println(rs.getString("end_date"));
        		out.println("<td>");
        		out.println("<input type='submit' value='delete'>");
        		out.println("</tr>");
        		out.println("</form>");
        	}
        	out.println("</table>");
        	out.println("</html></body>");
        	out.println("<td><form action=\"adminContracts.jsp\" method=\"get\"><button type=\"submit\"><-- back</button></form></td>");
        	
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
		String contract_id = request.getParameter("contract_id");
		String message = null;
		
		try {
			DriverManager.registerDriver(new com.mysql.jdbc.Driver());
			conn = DriverManager.getConnection(dbURL, dbUser, dbPass);

			String sql = "delete from admin_contracts where contract_id = ?";
			PreparedStatement statement = conn.prepareStatement(sql);
			statement.setString(1, contract_id);
			
			int row = statement.executeUpdate();
			if (row > 0) {
				message = "File uploaded and saved into database";
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
