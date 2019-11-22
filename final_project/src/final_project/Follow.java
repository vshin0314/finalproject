package final_project;

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
 * Servlet implementation class Follow
 */
@WebServlet("/Follow")
public class Follow extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final String CREDENTIALS_STRING = "jdbc:mysql://google/find_my_bills?cloudSqlInstance=find-my-bills:us-west1:find-my-bills&socketFactory=com.google.cloud.sql.mysql.SocketFactory&useSSL=false&user=sang&password=";
    private static Connection conn = null;
    private static PreparedStatement ps= null;
    private static ResultSet rs= null; 
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Follow() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String username = (String) request.getParameter("un");
		String billid = (String) request.getParameter("billid");
		String src = (String) request.getParameter("src");
		boolean follow = ((String) request.getParameter("follow")).equals("true");
		try {
			conn = DriverManager.getConnection(CREDENTIALS_STRING);
			//already follwing
			if(follow) {
				System.out.println("deleted!");
				ps = conn.prepareStatement("DELETE FROM Follow WHERE Username=? AND BillID=?");
				ps.setString(1, username);
				ps.setString(2, billid);	
				ps.executeUpdate();
			//not following
			}else {
				System.out.println("inserted!");
				ps = conn.prepareStatement("INSERT INTO Follow(Username, BillID) VALUES (?,?)");
				ps.setString(1, username);
				ps.setString(2, billid);	
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
