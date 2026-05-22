<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE-edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Log in</title>
<link rel="stylesheet" href="./My_CSS/login.css" type="text/css">
</head>
<body>
<div class="header"><h2>Register</h2></div>
	<form action="cusLogin" method="POST">
		<div class="input">
			<label>အသုံးပြုသူအမည်</label>
			<input type="text" name="name">
		</div>
		
		<div class="input">
			<label>လျှို့ဝှက်နံပါတ်</label>
			<input type="password" name="pwd">
		</div>
		
		<div class="input">
			<a href="cusRegister.jsp" style="text-decoration: none;"> အကောင့်မရှိသေးဘူးလား? အကောင့်ဖွင့်ပါ။ </a><br>
			<input type="submit" name="submit" value="Login" class="btn">
		</div>
		
	</form>
</body>
</html>