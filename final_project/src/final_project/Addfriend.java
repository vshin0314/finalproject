package final_project;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
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
		String username = (String) request.getParameter("un");
		String friendname = (String) request.getParameter("friend");
		try {
			conn = DriverManager.getConnection(CREDENTIALS_STRING);
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
		}catch(SQLException sqle) {
			sqle.printStackTrace();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				rs.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		try {
			RequestDispatcher dispatch = getServletContext().getRequestDispatcher("/results.jsp");
			dispatch.forward(request, response);
		} catch(IOException e) {
			e.printStackTrace();
		} catch(ServletException e) {
			e.printStackTrace();
		}
    }


}
