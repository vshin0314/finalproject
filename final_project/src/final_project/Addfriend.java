package final_project;


import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Addfriend
 */
@WebServlet("/Addfriend")
public class Addfriend extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final String CREDENTIALS_STRING = "jdbc:mysql://google/find_my_bills?cloudSqlInstance=find-my-bills:us-west1:find-my-bills&socketFactory=com.google.cloud.sql.mysql.SocketFactory&useSSL=false&user=sang&password=";
    private static Connection conn = null;
    private static PreparedStatement ps= null;
    private static ResultSet rs= null;  
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Addfriend() {
        super();
        // TODO Auto-generated constructor stub
    }
    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	String src = (String) request.getParameter("src");
    	String username = (String) request.getParameter("un");
		String friendname = (String) request.getParameter("friend");
		String action = (String) request.getParameter("action");
		try {
			conn = DriverManager.getConnection(CREDENTIALS_STRING);
			//user wants to add friend
			if(action.equals("add")) {
				ps = conn.prepareStatement("INSERT INTO Friends(User1, User2, status, actionUser) VALUES (?,?,?,?)");
				ps.setString(1, username);
				ps.setString(2, friendname);
				ps.setInt(3, 0);
				ps.setString(4, username);
				ps.executeUpdate();
				ps = conn.prepareStatement("INSERT INTO RequestQueue(Username, Requestee) VALUES (?,?)");
				ps.setString(1, friendname);
				ps.setString(2, username);
				ps.executeUpdate();
			//user wants to delete friend
			}else if(action.equals("delete")) {
				ps = conn.prepareStatement("DELETE FROM Friends WHERE (User1=? AND User2=?) OR (User1=? AND User2=?)");
				ps.setString(1, username);
				ps.setString(2, friendname);
				ps.setString(3, friendname);
				ps.setString(4, username);
				ps.executeUpdate();
			//user wants to accept friend
			}else {
				ps = conn.prepareStatement("UPDATE Friends SET status=? WHERE actionUser=? AND User2=? AND status=?");
				ps.setInt(1, 1);
				ps.setString(2, friendname);
				ps.setString(3, username);
				ps.setInt(4, 0);
				ps.executeUpdate();
			}
		}catch(SQLException sqle) {
			sqle.printStackTrace();
		}catch(Exception e) {
			e.printStackTrace();
		}
		try {
			RequestDispatcher dispatch = getServletContext().getRequestDispatcher(src);
			dispatch.forward(request, response);
		} catch(IOException e) {
			e.printStackTrace();
		} catch(ServletException e) {
			e.printStackTrace();
		}
    }


}
