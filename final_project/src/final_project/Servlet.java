package final_project;


import java.io.BufferedReader;

import java.io.IOException;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.google.gson.stream.JsonReader;
import com.google.gson.stream.JsonToken;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 * Servlet implementation class Servlet
 */
@WebServlet("/Servlet")
public class Servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final String CREDENTIALS_STRING = "jdbc:mysql://google/find_my_bills?cloudSqlInstance=find-my-bills:us-west1:find-my-bills&socketFactory=com.google.cloud.sql.mysql.SocketFactory&useSSL=false&user=sang&password=";
    private static Connection conn = null;
    private static PreparedStatement ps= null;
    private static ResultSet rs= null;
    String search;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Servlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String option = (String) request.getParameter("select");
		if(option.equals("users")) {
			try {
				search = (String) request.getParameter("search").trim();
				Class.forName("com.mysql.jdbc.Driver");
				conn = DriverManager.getConnection(CREDENTIALS_STRING);
				ps = conn.prepareStatement("SELECT * FROM Users WHERE LOWER(Lname)=? OR LOWER(Fname)=?");
				ps.setString(1, search.toLowerCase());
				ps.setString(2, search.toLowerCase());
				rs = ps.executeQuery();
				GsonBuilder builder = new GsonBuilder();
				builder.setPrettyPrinting();
				Gson gson = builder.create();			    
				ArrayList<User> temp = new ArrayList<>();
				Users users = new Users();
				int c = 0;
				while(rs.next()) {
					User user = new User();
					user.Fname = rs.getString("Fname");
					user.Lname = rs.getString("Lname");
					user.username = rs.getString("Username");
					user.linkedin = rs.getString("linkedin");
					System.out.println(rs.getString("linkedin"));
					temp.add(user);
					++c;
				}
				users.users = new User[c];
				for(int i=0; i<temp.size(); ++i) {
					users.users[i] = temp.get(i);
				}
				String json = gson.toJson(users);
				request.setAttribute("data", json);
				request.setAttribute("keyword", search);
				request.setAttribute("option", "users");
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
		}else {
			search = (String) request.getParameter("search").trim().replaceAll("\\s", "+");;
			String stringUrl = "https://api.propublica.org/congress/v1/bills/search.json?query=" + search;
	        URL url = new URL(stringUrl);
	        //URLConnection uc = url.openConnection();
	        HttpURLConnection connection = (HttpURLConnection)url.openConnection();
	        connection.setRequestProperty("X-API-Key", "CPWOT5bhpi2Dfaxm1rbjp2KBfe0CGjbIezUpv38C");
	
	        //InputStreamReader inputStreamReader = new InputStreamReader(uc.getInputStream());
			
	        BufferedReader reader = null;
			StringBuilder stringBuilder;
			
			
			connection.setRequestMethod("GET");
			connection.setReadTimeout(15*1000);
		    connection.connect();
		    
		    reader = new BufferedReader(new InputStreamReader(connection.getInputStream()));
		    stringBuilder = new StringBuilder();
		    
		    String line = null;
		    while ((line = reader.readLine()) != null)
		    {
		    	stringBuilder.append(line + "\n");
		    }
		    reader.close();
		    String jsonString =  stringBuilder.toString();
			
			GsonBuilder builder = new GsonBuilder();
			builder.setPrettyPrinting();
			Gson gson = builder.create();
			
			SearchResult results = gson.fromJson(jsonString, SearchResult.class);
			String json = gson.toJson(results);
			request.setAttribute("data", json);
			request.setAttribute("keyword", search);
			request.setAttribute("option", "bills");
			System.out.println("helllllow");
			System.out.println(jsonString);
		}//end else statement		
		try {
			RequestDispatcher dispatch = getServletContext().getRequestDispatcher("/results.jsp");
			dispatch.forward(request, response);
		} catch(IOException e) {
			e.printStackTrace();
		} catch(ServletException e) {
			e.printStackTrace();
		}finally {
			
		}
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

class SearchResult {
	private Result[] results;
}

class Result {
	Bill[] bills;
	int num_results;
}

class Bill {
	String bill_id, number, title, sponsor_title, sponsor_name, sponsor_state, sponsor_party, primary_subject, summary, summary_short;
}

class Users {
	User[] users;
}

class User {
	String Fname;
	String Lname;
	String username;
	String linkedin;
}

