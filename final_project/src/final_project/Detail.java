package final_project;

import java.io.BufferedReader;

import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.net.HttpURLConnection;
import java.net.URL;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

/**
 * Servlet implementation class Detail
 */
@WebServlet("/Detail")
public class Detail extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Detail() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String billid = (String) request.getParameter("billid").trim();
		System.out.println(billid);
		String temp[] = new String[2];
		temp = billid.split("-");
		String stringUrl = "https://api.propublica.org/congress/v1/" + temp[1] + "/bills/"+ temp[0] + ".json";
        URL url = new URL(stringUrl);
        //URLConnection uc = url.openConnection();
        HttpURLConnection connection = (HttpURLConnection)url.openConnection();
        connection.setRequestProperty("X-API-Key", "CPWOT5bhpi2Dfaxm1rbjp2KBfe0CGjbIezUpv38C");

        //InputStreamReader inputStreamReader = new InputStreamReader(uc.getInputStream());
		
        BufferedReader reader = null;
		StringBuilder stringBuilder;
		PrintWriter out = response.getWriter();
		
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
		
		BillResult results = gson.fromJson(jsonString, BillResult.class);
		String json = gson.toJson(results);
		out.print(jsonString);
		out.flush();
		System.out.println(jsonString);
//		try {
//			RequestDispatcher dispatch = getServletContext().getRequestDispatcher("/Profile.jsp");
//			dispatch.forward(request, response);
//		} catch(IOException e) {
//			e.printStackTrace();
//		} catch(ServletException e) {
//			e.printStackTrace();
//		}finally {
//			
//		}
	}

}
class BillResult {
	private BillDetail[] results;
}
class BillDetails {
	BillDetail details;
	String latest_major_action_date;
	String committees;
	String summary;
}
class BillDetail {
	String title;
	String sponsor;
	String sponsor_party;
	String sponsor_state;
	String cosponsors;
	Cosponsors cosponsors_by_party;
	String govtrack_url;
}
class Cosponsors {
	int r;
	int d;
}
