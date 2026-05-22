<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="header"><h2>Register</h2></div>
	<form action="cusRegister" method="POST">
		<div class="input">
			<label>အသုံးပြုသူအမည် :</label>
			<input type="text" name="name" placeholder="Enter Username" required>
		</div>
		<div class="input">
			<label>လျှို့ဝှက်နံပါတ် : </label>
			<input type="password" name="password" placeholder="Password" required>
		</div>
		<div class="input">
			<label>နာမည်အပြည့်အစုံ :</label>
			<input type="text" name="fullname" placeholder="Full Name" required>
		</div>
		<div class="input">
			<label>မွေးသက္ကရာဇ် : </label>
			<input type="date" name="date" placeholder="Date of birth"  required >
		</div>
		<div class="input">
			<label>မှတ်ပုံတင်အမှတ်: </label>
			<input type="text" name="NRC" placeholder=""  required >
		</div>
		<div class="input">
			<label>ဖုန်းနံပါတ် :</label>
			<input type="tel" name="phone" placeholder="Phone Number" required>
		</div>
		<div class="input">
			<label>အီးမေးလ် :</label>
			<input type="email" name="email" placeholder="E-mail" required>
		</div>
		<div class="input">
			<label>ပညာအရည်အချင်း :</label>
				<select name="education" >
					<option value="အထက်တန်းအောက်">အထက်တန်းအောက်</option>
					<option value="အထက်တန်းနှင့်အထက်">အထက်တန်းနှင့်အထက်</option>
					<option value="တက္ကသိုလ်/ကောလိပ် တက်ဆဲ">တက္ကသိုလ်/ကောလိပ် တက်ဆဲ</option>
                    <option value="ဘွဲ့ရ">ဘွဲ့ရ</option>
				</select>
		</div>
		<div class="input">
			<label>ကွန်ပျူတာကျွမ်းကျင်မှုအဆင့် :</label>
				<select name="computer" >
					<option value="မရှိပါ">မရှိပါ</option>
					<option value="အခြေခံ">အခြေခံ</option>
					<option value="ကောင်း">ကောင်း</option>
                    <option value="အဆင့်မြင့်">အဆင့်မြင့်</option>
				</select>
		</div>
		<div class="input">
			<label>မျှော်မှန်းလစာ :</label>
			<input type="text" name="salary" />	
		</div>
		<div class="input">
			<label>အရင်တုန်းက လုပ်ဖူးသောအလုပ်များ :</label>
			<input type="text" name="prevJobs" />	
		</div>
		<div class="input">
			<input type="submit"  name="submit" value="Register" class="btn">
		</div>
		
	</form>
</body>
</html>