package hr_package;


import java.io.*;  
import javax.servlet.*;  
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.sql.*;  


@WebServlet("/DisplayAdminContracts")
public class DisplayAdminContracts extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	private String dbURL = "jdbc:mysql://localhost:3306/srh_01";
	private String dbUser = "root";
	private String dbPass = "root";
	
    public DisplayAdminContracts() {
        super();
        
    }

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		PrintWriter out = response.getWriter();  
		response.setContentType("text/html");  
        out.println("<html><body>");
        
		Connection conn = null; 

        try
        {
			DriverManager.registerDriver(new com.mysql.jdbc.Driver());
			conn = DriverManager.getConnection(dbURL, dbUser, dbPass);
			Statement st=conn.createStatement();
        	ResultSet rs;
        	String queryString = "Select * from admin_contracts";
        	rs = st.executeQuery(queryString);
        	out.println("<table cellpadding=\"15\" border=\"1\" style=\"background-color: #ffffcc;\">");
        	out.println("<tr><td><b>Contract Type</b></td><td><b>Contract ID</b></td><td><b>Contract Manager</b></td>");
        	out.println("<td><b>Start Date</b></td><td><b>End Date</b></td><td><b>Contract Workers</b></td>");
        	out.println("<td><b>Contract Budget</b></td>");
        	
        	while (rs.next()) {
        		String ct = rs.getString("contract_type");
        		String ci = rs.getString("contract_id");
        		String cm = rs.getString("contract_manager");
        		String sd = rs.getString("start_date");
        		String ed = rs.getString("end_date");
        		String cw = rs.getString("contract_workers");
        		String cb = rs.getString("contract_budget");
        		out.println("<tr><td>" + ct + "</td><td>" + ci + "</td><td>" + cm + "</td><td>" + sd + "</td><td>" + ed + 
        					"</td><td>" + cw + "</td><td>" + cb + "</td>");
        		
        		out.println("</tr>");
        	
        	}
        	
        	out.println("<td><form action=\"adminContracts.jsp\" method=\"get\"><button type=\"submit\"><-- back</button></form></td>");
        	out.println("</table>");
        	out.println("<td><a href='UpdateAdminContracts'>Update Records</td><br>");
        	out.println("<td><a href='DeleteAdminContracts'>Delete Records</td>");
        	out.println("</html></body>");
        	conn.close();
        	rs.close();
        	
        }
        catch (Exception e) {
        	out.print(e);
        	e.printStackTrace();
        }

	}
	
}
