<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Company Register</title>
<link rel="stylesheet" href="./My_CSS/register1.css" type="text/css">
</head>
<body>
<div class="header"><h2>ကုမ္ပဏီ ပရိုဖိုင်ဖန်တီးရန် ခုပဲ မှတ်ပုံတင်လိုက်ပါ</h2></div>
	<form action="companyRegister" method="POST">
		<div class="input">
			<label>အသုံးပြုသူအမည် :</label>
			<input type="text" name="username" placeholder="Enter Username" required>
		</div>
		<div class="input">
			<label>လျှို့ဝှက်နံပါတ် : </label>
			<input type="password" name="pwd" placeholder="Password" required>
		</div>
		<div class="input">
			<input type="submit"  name="submit" value="မှတ်ပုံတင်ရန်" class="btn"> <br>
			အကောင့်ရှိပြီးသားလား? <a href="companyLogin.jsp"> ဝင်ရန် </a>
		</div>
		
		
	</form>
</body>
</html>