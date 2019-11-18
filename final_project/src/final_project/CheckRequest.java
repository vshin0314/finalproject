package final_project;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Vector;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class CheckRequest
 */
@WebServlet("/CheckRequest")
public class CheckRequest extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final String CREDENTIALS_STRING = "jdbc:mysql://google/find_my_bills?cloudSqlInstance=find-my-bills:us-west1:find-my-bills&socketFactory=com.google.cloud.sql.mysql.SocketFactory&useSSL=false&user=sang&password=";
    private static Connection conn = null;
    private static PreparedStatement ps= null;
    private static ResultSet rs= null;       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CheckRequest() {
        super();
        // TODO Auto-generated constructor stub
    }

    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String username = (String) request.getParameter("un");
		String src = (String) request.getParameter("src");
		PrintWriter out = response.getWriter();
		try {
			conn = DriverManager.getConnection(CREDENTIALS_STRING);
			ps = conn.prepareStatement("SELECT * FROM RequestQueue WHERE Username=?");
			ps.setString(1, username);
			rs = ps.executeQuery();
			String requests = "";
			while(rs.next()) {
				requests = requests + rs.getString("Requestee") + ",";
			}
			if(requests.equals("")) {
				out.print(requests);
			}
			else
				out.print(requests.substring(0, requests.length()-1));
		}catch(SQLException sqle) {
			sqle.printStackTrace();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				rs.close();
				out.flush();
				out.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
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
