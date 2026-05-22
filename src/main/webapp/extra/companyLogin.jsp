<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="./My_CSS/login.css" type="text/css">
</head>
<body>
	<div class="header"><h2>ကုမ္ပဏီအကောင့်ဖြင့်ဝင်ရောက်ပါ</h2></div>
	<form action="companyLogin" method="POST">
		<div class="input">
			<label>အသုံးပြုသူအမည်</label>
			<input type="text" name="name">
		</div>
		
		<div class="input">
			<label>လျှို့ဝှက်နံပါတ်</label>
			<input type="password" name="pwd">
		</div>
		
		<div class="input">
			<input type="submit" name="submit" value="Login" class="btn"><br>
			အကောင့်မရှိသေးဘူးလား? <a href="companyRegister.jsp"> အကောင့်ဖွင့်ရန် </a>
		</div>
		
	</form>
</body>
</html>