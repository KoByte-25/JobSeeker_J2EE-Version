<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Post a Job</title>
<meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="" name="keywords">
    <meta content="" name="description">

    <!-- Favicon -->
    <link href="img/favicon.ico" rel="icon">
    <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
    

    <!-- Google Web Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Heebo:wght@400;500;600&family=Inter:wght@700;800&display=swap" rel="stylesheet">
    
    <!-- Icon Font Stylesheet -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">

    <!-- Libraries Stylesheet -->
    <link href="lib/animate/animate.min.css" rel="stylesheet">
    <link href="lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">

    <!-- Customized Bootstrap Stylesheet -->
    <link href="css/bootstrap.min.css" rel="stylesheet">

    <!-- Template Stylesheet -->
    <link href="css/style.css" rel="stylesheet">
    <style>
    	#textConfig
    	{
    		font-size: 17px;
    	}
    		
	   .input-field{
		width:60%;
		height: 30px;
		background:#f0f0f0;
		border:1px solid #85bbbd;
		border-radius: 10px;
		display: flex;
		align-items: center;
	    cursor: pointer;
		}
		
		.input-field1{
		width:13%;
		height: 30px;
		background:#f0f0f0;
		border:1px solid #85bbbd;
		border-radius: 10px;
		display: flex;
		align-items: center;
	    cursor: pointer;
	    margin: 0 10px;
		}

		.sub-btn{
    	width:100px;
		height: 30px;
		border:none;
		border-radius: 50px;
		background: #f0f0f0;
		color:black;
		font-weight: 600;
		align-item:center;
		margin-left:25%;
		cursor: pointer;
		}
		
  		.sub-btn:hover{
		background: #31f5b4;
		color: white;
		align-item:center;
		}
		
		.h1{
		color:#black;
		background-color:transparent;
		width:100%;
		padding-top:0px;
		}
		
		.div1{
		background-color:#31f5b4;
		width:40%;
		margin-left:25%;
		padding-bottom:5px;
		padding-top:5px;
		border-top-left-radius:10px;
		border-top-right-radius:10px;
		}
		
		.div2{
		background-color:#9af1d4;
		width:40%;
		height:700px;
		margin-left:25%;
		padding-top:25px;
		border-bottom-left-radius:10px;
		border-bottom-right-radius:10px;
		}
		
	 	.div3{
	   	align-item:center;
	   	height:100%;
	   	margin-top: 3%;
	   	margin-left: 10%;
	   	}
    	
    </style>
</head>
<body>
<div class="container-xxl bg-white p-0">
        <!-- Spinner Start -->
        <div id="spinner" class="show bg-white position-fixed translate-middle w-100 vh-100 top-50 start-50 d-flex align-items-center justify-content-center">
            <div class="spinner-border text-primary" style="width: 3rem; height: 3rem;" role="status">
                <span class="sr-only">Loading...</span>
            </div>
        </div>
        <!-- Spinner End -->


        <!-- Navbar Start -->
        <nav class="navbar navbar-expand-lg bg-white navbar-light shadow sticky-top p-0" style="height: 150px">
            <a href="company home.jsp" class="navbar-brand d-flex align-items-center text-center py-0 px-4 px-lg-5">
                <h1 class="m-0 text-primary"><img src="./Photo/Logo/JobSeeker.jpg" height="100px" width=""></h1>
            </a>
            <button type="button" class="navbar-toggler me-4" data-bs-toggle="collapse" data-bs-target="#navbarCollapse">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarCollapse">
                <div class="navbar-nav ms-auto p-4 p-lg-0">
                    <a href="company home.jsp" id="textConfig" class="nav-item nav-link active">ပင်မစာမျက်နှာ</a>
                    
                    <a href="aboutUs.jsp" id="textConfig" class="nav-item nav-link">ကျွန်ုပ်တို့အကြောင်း</a>
                    <a href="contact.jsp" id="textConfig" class="nav-item nav-link">ဆက်သွယ်ရန်</a>
                    
                    <% 
                    	String comUserName = (String) session.getAttribute("Company User Name");
                    
                    	if(comUserName==null)
                    	{
                    		%>
                    			<a href="comLoginandRegister.jsp" id="textConfig" class="dropdown-item">အကောင့်ဝင်မည် </a>
                    		<%
                    	}
                    	else
                    	{
                    		%>
                    			<a href="logout" id="textConfig" class="nav-item nav-link">အကောင့်ထွက်မည်</a>
                    		<%
                    	}
                    %>
                </div>
                <a href="postAjob.jsp" id="textConfig" class="btn btn-primary rounded-0 py-4 px-lg-5 d-none d-lg-block">အလုပ်သစ်တင်ရန်<i class="fa fa-arrow-right ms-3"></i></a>
            </div>
        </nav>
        <!-- Navbar End -->
        
<form method="post" enctype="multipart/form-data" action="postingJobs">
<div class="div3">
<div class="div1" align="center">
	<h1 class="h1"> လုပ်ငန်း အချက်အလက် ဖြည့်စွက်ပါ </h1>
</div>
<div class="div2" align="center">
	<input type="text" class="input-field" placeholder="ဆိုင်နာမည်/ကုမ္ပဏီနာမည်" name="comName"/> <br>
	<select name="companyType" class="input-field">
					<option value="">ကုမ္ပဏီ အမျိုးအစား</option>
					<option value="ဆိုင်များ"> ဆိုင်များ </option>
					<option value="စက်ရုံများ"> စက်ရုံများ </option>
					<option value="ဘဏ်"> ဘဏ် </option>
					<option value="အစိုးရရုံးများ"> အစိုးရရုံးများ </option>
					<option value="ပုဂ္ဂလိကရုံးများ"> ပုဂ္ဂလိကရုံးများ </option>
				</select> <br>
	<input type="text" class="input-field" placeholder="အလုပ်နေရာအမျိုးအစား " name="pos"/> <br>
	<textarea class="input-field" placeholder="ဆိုင်လိပ်စာ အပြည့်အစုံ" name="local" rows="5" cols="50"></textarea> <br>
	<input type="text" class="input-field" placeholder="မြို့နယ်" name="town"/> <br>
	<select class="input-field" name="monthlyOrdaily">
		<option value="လခစား"> လခစား </option>
		<option value="နေ့စား"> နေ့စား </option>		
	</select>
	<br>
	<input type="text" class="input-field" placeholder="ခန့်မှန်းလစာ " name="salary"/> <br>
	<p style="font-weight: bold;"> လုပ်ငန်းလိုအပ်ချက်များ </p>
	<p style="display: flex; margin-left: 20%;">
	 <b> အသက် </b> 
	 <select name="fromAge" class="input-field1">
	 	<% for(int i=10; i<=60; i++)
	 		{
	 	%>
	 		<option value="<%=i%>"><%=i%></option>
	 	<% 
	 		}
	 	%>
	 </select>
	 <b> မှ </b> 
	 <select name="toAge" class="input-field1">
	 	<% for(int i=18; i<=60; i++)
	 		{
	 	%>
	 		<option value="<%=i%>"><%=i%></option>
	 	<% 
	 		}
	 	%>
	 </select>
	 <b> အတွင်း </b> 
	</p>
	<textarea class="input-field" placeholder="ဤနေရာတွင် အခြားလိုအပ်ချက်များဖြည့်ပါ" name="job requirements" rows="5" cols="50"></textarea> <br>
	<input type="text" class="input-field" placeholder="အလုပ်လုပ်ချိန် " name="working hours"/> <br>
	<input type="file" class="input-field" placeholder="အလုပ်ဓာတ်ပုံ" name="photo"/> <br> 
	<input class="sub-btn" type="submit" value="တင်မည်"/>
	</div>
	</div>
</form>

<!-- Footer Start -->
        <div class="container-fluid bg-dark text-white-50 footer pt-5 mt-5 wow fadeIn" data-wow-delay="0.1s">
            <div class="container py-5">
                <div class="row g-5">
                    <div class="col-lg-6 col-md-6">
                        <h5 class="text-white mb-4">ကုမ္ပဏီနှင့်သက်ဆိုင်သော</h5>
                        <a class="btn btn-link text-white-50" href="aboutUs.jsp">ကျွန်ုပ်တို့အကြောင်း</a>
                        <a class="btn btn-link text-white-50" href="contact.jsp">ဆက်သွယ်ရန်</a>
                        <a class="btn btn-link text-white-50" href="userguide.jsp">ဝက်ဆိုဒ်လမ်းညွှန်</a>
                    </div>
                    <div class="col-lg-6 col-md-6">
                        <h5 class="text-white mb-4">ကုမ္ပဏီလိပ်စာ</h5>
                        <p class="mb-2"><i class="fa fa-map-marker-alt me-3"></i>ပုသိမ်-ငွေဆောင်လမ်း၊ ကြိုးတံတားဟောင်းအနီး။ ပုသိမ်မြို့။</p>
                        <p class="mb-2"><i class="fa fa-phone-alt me-3"></i>+95 9782134072</p>
                        <p class="mb-2"><i class="fa fa-envelope me-3"></i>jobseeker2372001@gmail.com</p>
                        <div class="d-flex pt-2">
                            <a class="btn btn-outline-light btn-social" href="https://www.facebook.com/profile.php?id=61557162775793"><i class="fab fa-facebook-f"></i></a>
                            <a class="btn btn-outline-light btn-social" href="https://www.youtube.com/channel/UChKoKVhG58MqZ617CofgiYQ"><i class="fab fa-youtube"></i></a>
                        </div>
                    </div>
                 </div>
            </div>
            <div  class="container">
                <div class="copyright">
                    <div class="row">
                        <div class="col-md-5 text-center text-md-start mb-3 mb-md-0" style="margin:auto;">
                            &copy; <a class="border-bottom" href="#">Job Seeker</a>, All Right Reserved. 
							
							<!--/*** This template is free as long as you keep the footer author’s credit link/attribution link/backlink. If you'd like to use the template without the footer author’s credit link/attribution link/backlink, you can purchase the Credit Removal License from "https://htmlcodex.com/credit-removal". Thank you for your support. ***/-->
							Developed By <a class="border-bottom" href="https://www.facebook.com/profile.php?id=61554436422734">Risk The Code - RTC</a>
							Template Designed By <a class="border-bottom" href="https://htmlcodex.com">HTML Codex</a>
                        </div>
                        </div>
                    </div>
                </div>
             </div>
        <!-- Footer End -->


        <!-- Back to Top -->
        <a href="#" class="btn btn-lg btn-primary btn-lg-square back-to-top"><i class="bi bi-arrow-up"></i></a>
    </div>

    <!-- JavaScript Libraries -->
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="lib/wow/wow.min.js"></script>
    <script src="lib/easing/easing.min.js"></script>
    <script src="lib/waypoints/waypoints.min.js"></script>
    <script src="lib/owlcarousel/owl.carousel.min.js"></script>

    <!-- Template Javascript -->
    <script src="js/main.js"></script>
</body>
</html>