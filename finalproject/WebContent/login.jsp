<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
<script>
function validate() {
	let username = document.login.un.value;
	let password = document.login.pw.value;
	if(username == "" || password == "") {
		alert("Please complete the form!");
		return false;
	}
	return true;
}
</script>
</head>
<body>
<form name="login" action="login" onsubmit="return validate()">
  Login<br>
  <input type="hidden" name="src" value="login">
  <input type="text" name ="un" placeholder="Enter Username">
  <span style  = "color: red;"> ${unError}</span>
  <br>
  <input type="password" name ="pw"placeholder="Enter Password">
  <br>
  <input type="submit" value="Submit">
</form>
</body>
</html>