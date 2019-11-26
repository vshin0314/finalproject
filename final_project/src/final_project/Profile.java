package final_project;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Profile
 */
@WebServlet("/Profile")
public class Profile extends HttpServlet {
	private static final long serialVersionUID = 1L;
	public static final String CREDENTIALS_STRING = "jdbc:mysql://google/find_my_bills?cloudSqlInstance=find-my-bills:us-west1:find-my-bills&socketFactory=com.google.cloud.sql.mysql.SocketFactory&useSSL=false&user=sang&password=";
    static Connection conn = null;
    static PreparedStatement ps= null;
    static ResultSet rs= null;   
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Profile() {
        super();
        // TODO Auto-generated constructor stub
    }

    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
    	String action = (String)request.getParameter("acn");
    	String username = (String)request.getParameter("un");
    	PrintWriter out = response.getWriter();
    	//query following bills
    	try {
    		Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(CREDENTIALS_STRING);
			if(action.equals("follow")) {
				String temp = "";
	    		ps = conn.prepareStatement("SELECT BillID FROM Follow WHERE Username=?");
	    		ps.setString(1, username);
	    		rs = ps.executeQuery();
	    		if(rs.next()) {
	    			temp = temp + rs.getString("BillID") + ",";
		    		while(rs.next()) {
		    			temp = temp + rs.getString("BillID") + ",";
		    		}
		    		temp = temp.substring(0, temp.length()-1);
	    		}
	    		out.print(temp);
	    		//request.setAttribute("data", temp);
	    	}else {
	    		String friendname ="";
	    		if(action.equals("friends")) {	
	    			ps = conn.prepareStatement("SELECT * FROM Friends WHERE (User1=? OR User2=?) AND status=?");
		    		ps.setString(1, username);
		    		ps.setString(2, username);
		    		ps.setInt(3, 1);
		    		rs = ps.executeQuery();
		    		if(rs.next()) {
		    			if(rs.getString("User1").equals(username))
		    				friendname = rs.getString("User2") + ",";
		    			else 
		    				friendname = rs.getString("User1") + ",";
		    			while(rs.next()) {
		    				if(rs.getString("User1").equals(username))
			    				friendname = friendname + rs.getString("User2") + ",";
			    			else 
			    				friendname = friendname + rs.getString("User1") + ",";
		    			}
		    			friendname = friendname.substring(0, friendname.length()-1);
		    			System.out.println(friendname);
		    		}
	    		}else {
	    			ps = conn.prepareStatement("SELECT * FROM Friends WHERE NOT actionUser=? AND (User1=? OR User2=?) AND status=?");
	    			ps.setString(1, username);
	    			ps.setString(2, username);
		    		ps.setString(3, username);
		    		ps.setInt(4, 0);
		    		rs = ps.executeQuery();
		    		if(rs.next()) {
		    			friendname = rs.getString("actionUser") + ",";
		    			while(rs.next()) {
		    				friendname = friendname + rs.getString("actionUser") + ",";
		    			}
		    			friendname = friendname.substring(0, friendname.length()-1);
		    		}
	    		}
	    		out.print(friendname);
	    	}
    	}catch(SQLException sqle) {
			sqle.printStackTrace();
		}catch(Exception e) {
			e.printStackTrace();
		}
 //   	try {
    		out.flush();
//			RequestDispatcher dispatch = getServletContext().getRequestDispatcher("/Profile.jsp");
//			dispatch.forward(request, response);
//		} catch(IOException e) {
//			e.printStackTrace();
//		} catch(ServletException e) {
//			e.printStackTrace();
//		}
    	
    }

}
