

import java.io.IOException;
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
 * Servlet implementation class login
 */
@WebServlet("/login")
public class login extends HttpServlet {
	private static final long serialVersionUID = 1L;
	public static final String CREDENTIALS_STRING = "jdbc:mysql://google/find_my_bills?cloudSqlInstance=find-my-bills:us-west1:find-my-bills&socketFactory=com.google.cloud.sql.mysql.SocketFactory&useSSL=false&user=sang&password=";
    static Connection conn = null;
    static PreparedStatement ps= null;
    static ResultSet rs= null;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public login() {
        super();
        // TODO Auto-generated constructor stub
    }

    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	String src = (String) request.getParameter("src");
    	String username = (String) request.getParameter("un");
    	String password = (String) request.getParameter("pw");
    	String next = "/Home.jsp";
    	try {
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(CREDENTIALS_STRING);
			//Coming from login.jsp
			if(src.equals("login")) {
				ps= conn.prepareStatement("SELECT Username FROM Users WHERE Username=?");
	    		ps.setString(1, username);
	    		rs = ps.executeQuery();
	    		//If username doesn't exist
	    		if(!rs.next()) {
	    			next = "/login.jsp";
	    			request.setAttribute("unError", "Please enter registered username");
	    			System.out.println("Username does not exist on the database");
	    		}else {
					ps= conn.prepareStatement("SELECT Username FROM Users WHERE Username=? AND Password=?");
		    		ps.setString(1, username);
		    		ps.setString(2, password);
		    		rs = ps.executeQuery();
		    		//If username and password entered don't match
		    		if(!rs.next()) {
		    			next = "/login.jsp";
		    			request.setAttribute("unError", "Password does not match!");
		    		}
	    		}
	    	}else {//coming from register.jsp
	    		ps= conn.prepareStatement("SELECT Username FROM Users WHERE Username=?");
	    		ps.setString(1, username);
	    		rs = ps.executeQuery();
	    		//Username is already taken by other user
	    		if(rs.next()) {
	    			next = "/register.jsp";
	    			request.setAttribute("unError", "Username is already taken!");
	    		}else {//Registering the user
		    		ps = conn.prepareStatement("INSERT INTO Users (Username, Password) VALUES (?,?)");
		    		ps.setString(1, username);
		    		ps.setString(2, password);
		    		ps.executeUpdate();
	    		}
	    	}
			
		}catch(SQLException sqle) {
			sqle.printStackTrace();
		}catch(Exception e) {
			e.printStackTrace();
		}
    	try {
			RequestDispatcher dispatch = getServletContext().getRequestDispatcher(next);
			dispatch.forward(request, response);
		} catch(IOException e) {
			e.printStackTrace();
		} catch(ServletException e) {
			e.printStackTrace();
		}
    }
}
