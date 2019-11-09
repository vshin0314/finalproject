<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Search Results</title>
<style>
#results{
  margin-left: 10%;
  margin-right: 10%;
 
}
td{
  display: flex;
  float: left;
}
</style>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">

</head>
<body>
<ol class="breadcrumb">
		<li class="breadcrumb-item"><a href="Home.jsp">Home</a></li>

		<li class="breadcrumb-item"><a href="About.jsp">About</a></li>
		
</ol>
<form action="Servlet">
  Search<br>
  <input type="text" name="search">
  <input type="submit" value="Submit">
</form>
<div id="results"></div>
</body>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
	let data = <%= session.getAttribute("data") %>;
	//let data = JSON.parse(temp);
	//window.alert(JSON.parse(data));
	$("#results").append("<hr style='border-top: dotted 1px;' />");
	if (data==null || data.results==null || data.results.length<1){
	    //alert("Fuck");
		//alert(data.bills==null);// + data.bills.length<1);
	}
	
	for(i=0; i<data.results[0].bills.length; i++) {
		$("#results").append('<table><tr><td rowspan="4">&nbsp</td><td>&nbsp</td></tr>'
		+'<tr><td>&nbsp'+data.results[0].bills[i].title+'</td></tr>'
		+'<tr><td>&nbsp'+data.results[0].bills[i].sponsor_name+'</td></tr>'
		+'<tr><td>&nbsp'+data.results[0].bills[i].sponsor_party+'</td></tr>'
		+'<tr><td>&nbsp'+data.results[0].bills[i].sponsor_state+'</td></tr>'
		+'<tr><td>&nbsp<i>Summary:</i> '+data.results[0].bills[i].summary_short+'</td></tr></table>'
		+"<hr style='border-top: dotted 1px;' />");
	}
	<%
		session.removeAttribute("data");
	%>
</script>
</html>