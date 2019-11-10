

import java.io.BufferedReader;

import java.io.IOException;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
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

/**
 * Servlet implementation class Servlet
 */
@WebServlet("/Servlet")
public class Servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
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
		HttpSession session = request.getSession();
		String search = (String) request.getParameter("search").trim().replaceAll("\\s", "+");;
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
		session.setAttribute("data", json);
		request.setAttribute("keyword", search);
		
		System.out.println("helllllow");
		System.out.println(jsonString);
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

