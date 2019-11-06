<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Registration</title>
<script>
function validate() {
	let username = document.register.un.value;
	let password = document.register.pw.value;
	let pwcheck = document.register.pwc.value;
	if(username == "" || password == "" || pwcheck == "") {
		alert("Please complete the form!");
		return false;
	}
	if(pwcheck != password) {
		alert("Password does not match!");
		return false;
	}
	return true;
}
</script>
</head>
<body>
<form name="register" action="login" onsubmit="return validate()">
  Register<br>
  <input type="hidden" name="src" value="register">
  <input type="text" name="un" placeholder="Enter Username">
  <span style  = "color: red;"> ${unError}</span>
  <br>
  <input type="password" name ="pw" placeholder="Enter Password">
  <br>
  <input type="password" name ="pwc"placeholder="Enter Password Again">
  <br>
  <input type="submit" value="Submit">
</form>
</body>
</html>