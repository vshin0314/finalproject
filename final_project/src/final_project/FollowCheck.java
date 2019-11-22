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
 * Servlet implementation class FollowCheck
 */
@WebServlet("/FollowCheck")
public class FollowCheck extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final String CREDENTIALS_STRING = "jdbc:mysql://google/find_my_bills?cloudSqlInstance=find-my-bills:us-west1:find-my-bills&socketFactory=com.google.cloud.sql.mysql.SocketFactory&useSSL=false&user=sang&password=";
    private static Connection conn = null;
    private static PreparedStatement ps= null;
    private static ResultSet rs= null; 
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FollowCheck() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String username = (String) request.getParameter("un");
		String billid = (String) request.getParameter("billid");
		String src = (String) request.getParameter("src");
		PrintWriter out = response.getWriter();
		try {
			conn = DriverManager.getConnection(CREDENTIALS_STRING);
			ps = conn.prepareStatement("SELECT * FROM Follow WHERE Username=? AND BillID=?");
			ps.setString(1, username);
			ps.setString(2, billid);	
			rs = ps.executeQuery();
			if(rs.next()) {
				System.out.println("its in here");
				out.print("true");
			}else {
				out.print("false");
			}
		}catch(SQLException sqle) {
			sqle.printStackTrace();
		}catch(Exception e) {
			e.printStackTrace();
		}
		try {
			out.flush();
			out.close();
			RequestDispatcher dispatch = getServletContext().getRequestDispatcher(src);
			dispatch.forward(request, response);
		} catch(IOException e) {
			e.printStackTrace();
		} catch(ServletException e) {
			e.printStackTrace();
		}finally {
			
		}
	}

}
