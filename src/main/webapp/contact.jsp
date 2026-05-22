<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
 <meta charset="utf-8">
    <title>Contact</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="" name="keywords">
    <meta content="" name="description">

    <!-- Favicon -->

   
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
    	
    	.main{
    	height:500px;
    	}
    	.child{
    	display:flex;
    	justify-content: space-around;
    	margin-top:70px;
    	
    	}
    	
    	.form{
    	margin-top:20px;
    	background-color:#508a85;
   		 border: 1px solid #508a85;
    	width:300px;
  		 border-radius:80px 80px 80px 80px;
    	display:flex;
    	justify-content: space-around;
    	
    	
    	}
    	
    	.form img{
    	width:120px;
    	height:120px;
    	border-radius:40%;
        margin: 10px;
       
    	}
    	
    	.left{
    	
    	}
    	
    	ul:hover {
		opacity:1;
		
		}
		ul{
			opacity:0;
			position: relative;
			
			
		}
		
		.ri{
		width:300px;
		height:95px;
		margin-top:15px;
		
		
		
		
		}
		
		.right{
		font-size:13px;
		margin-left:10px;
		margin-top:10px;
		color:white;
		
		}
		.left{
		font-size:9px;
		margin-left:10px;
		margin-top:10px;
		color:white;
		}
		.down{
    	display:flex;
    	justify-content: space-around;
    	margin-top:90px;
    	}
    	.re{
		font-size:15px;
		margin-left:10px;
		margin-top:10px;
		color:yellow;
		
		}
		
		.fbnext{
		text-decoration:none;
		color:white;
		font-size:13px;
		margin-left:10px;
		margin-top:10px;
		}
		.fbnext:hover{
		color:black;}
		
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


         <%
			String uName = (String) session.getAttribute("cusUserName");
			String cName = (String) session.getAttribute("Company User Name");
			if(uName!=null)
			{
		%>
        <!-- Navbar Start -->
        <nav class="navbar navbar-expand-lg bg-white navbar-light shadow sticky-top p-0" style="height: 150px">
            <a href="index.jsp" class="navbar-brand d-flex align-items-center text-center py-0 px-4 px-lg-5">
                <h1 class="m-0 text-primary"><img src="./Photo/Logo/JobSeeker.jpg" height="100px" width=""></h1>
            </a>
            <button type="button" class="navbar-toggler me-4" data-bs-toggle="collapse" data-bs-target="#navbarCollapse">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarCollapse">
                <div class="navbar-nav ms-auto p-4 p-lg-0">
                    <a href="index.jsp" id="textConfig" class="nav-item nav-link ">ပင်မစာမျက်နှာ</a>
                    
                    <a href="aboutUs.jsp" id="textConfig" class="nav-item nav-link ">ကျွန်ုပ်တို့အကြောင်း</a>
                    <a href="contact.jsp" id="textConfig" class="nav-item nav-link active">ဆက်သွယ်ရန်</a>
                    <% 
                    	String adminName = (String) session.getAttribute("AdminUserName");
                		String cusUserName = (String) session.getAttribute("cusUserName");

                    	if(adminName == null)
                    	{
	                    	if(cusUserName==null)
	                    	{
	                    		%>
	                    			<div class="nav-item dropdown">
				                        <a href="#" id="textConfig" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">အကောင့်ဝင်မည်</a>
				                        <div class="dropdown-menu rounded-0 m-0">
				                            <a href="customerLoginandRegister.jsp" id="textConfig" class="dropdown-item">အလုပ်ရှာသူ</a>
				                            <a href="comLoginandRegister.jsp" id="textConfig" class="dropdown-item">အလုပ်ရှင်များ </a>
				                        </div>
				                    </div>
	                    		<%
	                    	}
	                    	else if(cusUserName!=null)
	                    	{
	                    		%>
	                    			<a href="logout" id="textConfig" class="nav-item nav-link">အကောင့်ထွက်မည်</a>
	                    		<%
	                    	}
                    	}
                    	else
                    	{
                    		%>
                    			<a href="logout" id="textConfig" class="nav-item nav-link">အကောင့်ထွက်မည်</a>
                    		<%
                    	}
                    %>
                </div>
                <%
                	
                	if(cusUserName==null)
            		{
            		
                %>
                <a href="profile.jsp" id="textConfig" class="btn btn-primary rounded-0 py-4 px-lg-5 d-none d-lg-block">ကိုယ်ရေးအချက်အလက်<i class="fa fa-arrow-right ms-3"></i></a>
            	<%
            		}
                	else
                	{
            	%>
            	<a href="profile.jsp" id="textConfig" class="btn btn-primary rounded-0 py-4 px-lg-5 d-none d-lg-block"><%= cusUserName %><i class="fa fa-arrow-right ms-3"></i></a>
            	<%
                	}
                
            	%>
            </div>
        </nav>
        <!-- Navbar End -->
        <%
			}
			else if(cName!=null)
			{
		%>
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
                    <a href="company home.jsp" id="textConfig" class="nav-item nav-link">ပင်မစာမျက်နှာ</a>
                    
                    <a href="aboutUs.jsp" id="textConfig" class="nav-item nav-link ">ကျွန်ုပ်တို့အကြောင်း</a>
                    <a href="contact.jsp" id="textConfig" class="nav-item nav-link active">ဆက်သွယ်ရန်</a>
                    
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
		<%
				
			}
			else
			{
		%>
		 <!-- Navbar Start -->
        <nav class="navbar navbar-expand-lg bg-white navbar-light shadow sticky-top p-0" style="height: 150px">
            <a href="index.jsp" class="navbar-brand d-flex align-items-center text-center py-0 px-4 px-lg-5">
                <h1 class="m-0 text-primary"><img src="./Photo/Logo/JobSeeker.jpg" height="100px" width=""></h1>
            </a>
            <button type="button" class="navbar-toggler me-4" data-bs-toggle="collapse" data-bs-target="#navbarCollapse">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarCollapse">
                <div class="navbar-nav ms-auto p-4 p-lg-0">
                    <a href="index.jsp" id="textConfig" class="nav-item nav-link ">ပင်မစာမျက်နှာ</a>
                    
                    <a href="aboutUs.jsp" id="textConfig" class="nav-item nav-link ">ကျွန်ုပ်တို့အကြောင်း</a>
                    <a href="contact.jsp" id="textConfig" class="nav-item nav-link active">ဆက်သွယ်ရန်</a>
                    <% 
                    	String adminName = (String) session.getAttribute("AdminUserName");
                		String cusUserName = (String) session.getAttribute("cusUserName");

                    	if(adminName == null)
                    	{
	                    	if(cusUserName==null)
	                    	{
	                    		%>
	                    			<div class="nav-item dropdown">
				                        <a href="#" id="textConfig" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">အကောင့်ဝင်မည်</a>
				                        <div class="dropdown-menu rounded-0 m-0">
				                            <a href="customerLoginandRegister.jsp" id="textConfig" class="dropdown-item">အလုပ်ရှာသူ</a>
				                            <a href="comLoginandRegister.jsp" id="textConfig" class="dropdown-item">အလုပ်ရှင်များ </a>
				                        </div>
				                    </div>
	                    		<%
	                    	}
	                    	else if(cusUserName!=null)
	                    	{
	                    		%>
	                    			<a href="logout" id="textConfig" class="nav-item nav-link">အကောင့်ထွက်မည်</a>
	                    		<%
	                    	}
                    	}
                    	else
                    	{
                    		%>
                    			<a href="logout" id="textConfig" class="nav-item nav-link">အကောင့်ထွက်မည်</a>
                    		<%
                    	}
                    %>
                </div>
                <%
                	
                	if(cusUserName==null)
            		{
            		
                %>
                <a href="profile.jsp" id="textConfig" class="btn btn-primary rounded-0 py-4 px-lg-5 d-none d-lg-block">ကိုယ်ရေးအချက်အလက်<i class="fa fa-arrow-right ms-3"></i></a>
            	<%
            		}
                	else
                	{
            	%>
            	<a href="profile.jsp" id="textConfig" class="btn btn-primary rounded-0 py-4 px-lg-5 d-none d-lg-block"><%= cusUserName %><i class="fa fa-arrow-right ms-3"></i></a>
            	<%
                	}
                
            	%>
            </div>
        </nav>
        <!-- Navbar End -->
		<%
			}
        %>


        <!-- Header End -->
        <div class=main>
         <div class=child> 
         <div class=form><img alt="" src="./img/z.jpg" class=img>
    		<div class=ri>
    		<h1 class=re>Zay Yar Min</h1>
    		<h1 class=left><i class="fa fa-envelope me-3"></i>sniperagent.zay@gmail.com</h1>
    		<h1 class=right><i class="fa fa-phone-alt me-3"></i>09782134072</h1>
    		<h1 class=right><i class="fab fa-facebook-f">&nbsp;&nbsp;</i><a class=fbnext href=https://www.facebook.com/profile.php?id=100063772065937&mibextid=ZbWKwL">Zay Yar</a></h1>
    		</div></div>
    		 <div class=form><img alt="" src="./img/h.jpg" class=img>
    		<div class=ri>
    		<h1 class=re>Htet Wai Yan Htun</h1>
    		<h1 class=left><i class="fa fa-envelope me-3"></i>htetwaiyanpt2018@gmail.com</h1>
    		<h1 class=right><i class="fa fa-phone-alt me-3"></i>09761588939</h1>
    		<h1 class=right><i class="fab fa-facebook-f"></i>&nbsp;&nbsp;<a class=fbnext href="https://www.facebook.com/profile.php?id=100027251972783&mibextid=ZbWKwL">David Htun</a></h1>
    		</div></div>
    		<div class=form><img alt="" src="./img/w.jpg" class=img>
    		<div class=ri>
    		<h1 class=re>Wai Yan Paing</h1>
    		<h1 class=left><i class="fa fa-envelope me-3"></i>yan37341@gmail.com</h1>
    		<h1 class=right><i class="fa fa-phone-alt me-3"></i>09695780336</h1>
    		<h1 class=right><i class="fab fa-facebook-f"></i>&nbsp;&nbsp;<a class=fbnext href="https://www.facebook.com/profile.php?id=100027251972783&mibextid=ZbWKwL">Wai Yan Paing</a></h1>
    		</div></div>
    		<div class=form><img alt="" src="./img/ymh.jpg" class=img>
    		<div class=ri>
    		<h1 class=re>Ye Myat Hein</h1>
    		<h1 class=left><i class="fa fa-envelope me-3"></i>ymyat0335@gmail.com</h1>
    		<h1 class=right><i class="fa fa-phone-alt me-3"></i>09687591761</h1>
    		<h1 class=right><i class="fab fa-facebook-f"></i>&nbsp;&nbsp;<a class=fbnext href="https://www.facebook.com/modern.waifu?mibextid=ZbWKwL">Ye Myat Hein</a></h1>
    		</div></div>
       </div>
       
         <div class=down> 
         <div class=form><img alt="" src="./img/k2.jpg" class=img>
    		<div class=ri>
    		<h1 class=re>Khin Hnin Wai</h1>
    		<h1 class=left><i class="fa fa-envelope me-3"></i>khinhninwai237@gmail.com</h1>
    		<h1 class=right><i class="fa fa-phone-alt me-3"></i>09671579100</h1>
    		<h1 class=right><i class="fab fa-facebook-f"></i>&nbsp;&nbsp;<a class=fbnext href="https://www.facebook.com/profile.php?id=100026400873014&mibextid=ZbWKwL">Khin Hnin Wai</a></h1>
    		</div></div>
    		 <div class=form><img alt="" src="./img/yuu.jpg" class=img>
    		<div class=ri>
    		<h1 class=re>Yuu Me Thwin</h1>
    		<h1 class=left><i class="fa fa-envelope me-3"></i>yuumethwin1012@gmail.com</h1>
    		<h1 class=right><i class="fa fa-phone-alt me-3"></i>09669138777</h1>
    		<h1 class=right><i class="fab fa-facebook-f"></i>&nbsp;&nbsp;<a class=fbnext href="https://www.facebook.com/yu.thwin.330?mibextid=ZbWKwL">Yuu Me Thwin</a></h1>
    		</div></div>
    		 <div class=form><img alt="" src="./img/y1.jpg" class=img>
    		<div class=ri>
    		<h1 class=re>Yoon Ngoan Phoo</h1>
    		<h1 class=left><i class="fa fa-envelope me-3"></i>yoonphoo79@gmail.com</h1>
    		<h1 class=right><i class="fa fa-phone-alt me-3"></i>09687852800</h1>
    		<h1 class=right><i class="fab fa-facebook-f"></i>&nbsp;<a class=fbnext href="https://www.facebook.com/yoon.phoo.334?mibextid=ZbWKwL">Yoon Ngoan Phoo</a></h1>
    		</div></div>
    		 <div class=form><img alt="" src="./img/ymhs.jpg" class=img>
    		<div class=ri>
    		<h1 class=re>Ya Min Htet San</h1>
    		<h1 class=left><i class="fa fa-envelope me-3"></i>tracy123@gmail.com</h1>
    		<h1 class=right><i class="fa fa-phone-alt me-3"></i>09792664166</h1>
    		<h1 class=right><i class="fab fa-facebook-f"></i>&nbsp;&nbsp;<a class=fbnext href="https://www.facebook.com/htet.thraphy?mibextid=ZbWKwL">Htet Thraphy</a></h1>
    		</div></div>
          </div>
        </div>
        <center><h3>*******သိလိုသမျှကို အဖွဲ့ဝင်များအား ဆက်သွယ်စုံစမ်းနိုင်ပါသည်။*******</h3></center>
        <!-- Header End -->


        <!-- Contact Start -->
        <div class="container-xxl py-5">
            <div class="container">
                
                <div class="row g-4">
                    <div class="col-12">
                        <div class="row gy-4">
                            <div class="col-md-4 wow fadeIn" data-wow-delay="0.1s">
                                <div class="d-flex align-items-center bg-light rounded p-4">
                                    <div class="bg-white border rounded d-flex flex-shrink-0 align-items-center justify-content-center me-3" style="width: 45px; height: 45px;">
                                        <i class="fa fa-map-marker-alt text-primary"></i>
                                    </div>
                                    <span>ပုသိမ်-ငွေဆောင်လမ်း၊ ကြိုးတံတားဟောင်းအနီး။ ပုသိမ်မြို့</span>
                                </div>
                            </div>
                            <div class="col-md-4 wow fadeIn" data-wow-delay="0.3s">
                                <div class="d-flex align-items-center bg-light rounded p-4">
                                    <div class="bg-white border rounded d-flex flex-shrink-0 align-items-center justify-content-center me-3" style="width: 45px; height: 45px;">
                                        <i class="fa fa-envelope-open text-primary"></i>
                                    </div>
                                    <span>jobseeker2372001@gmail.com</span>
                                </div>
                            </div>
                            <div class="col-md-4 wow fadeIn" data-wow-delay="0.5s">
                                <div class="d-flex align-items-center bg-light rounded p-4">
                                    <div class="bg-white border rounded d-flex flex-shrink-0 align-items-center justify-content-center me-3" style="width: 45px; height: 45px;">
                                        <i class="fa fa-phone-alt text-primary"></i>
                                    </div>
                                    <span>+959782134072</span>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6 wow fadeInUp" data-wow-delay="0.1s">
                        <iframe class="position-relative rounded w-100 h-100"
                            src="https://maps.google.com/maps?width=600&height=400&hl=en&q=University%20of%20Computer%20Studies,%20Pathein&t=&z=14&ie=UTF8&iwloc=B&output=embed"
                            frameborder="0" style="min-height: 400px; border:0;" allowfullscreen="" aria-hidden="false"
                            tabindex="0"></iframe>
                    </div>
                    <div class="col-md-6">                        <div class="wow fadeInUp" data-wow-delay="0.5s">
                            <p class="mb-4">သင်၏အကြံပြုချက် ကိုပေးပို့လိုက်ပါ။</p>
                            <form>
                                <div class="row g-3">
                                    <div class="col-md-6">
                                        <div class="form-floating">
                                            <input type="text" class="form-control" id="name" placeholder="Your Name">
                                            <label for="name">နာမည်</label>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-floating">
                                            <input type="email" class="form-control" id="email" placeholder="Your Email">
                                            <label for="email">အီးမေးလ်</label>
                                        </div>
                                    </div>
                                   
                                    <div class="col-12">
                                        <div class="form-floating">
                                            <textarea class="form-control" placeholder="Leave a message here" id="message" style="height: 150px"></textarea>
                                            <label for="message">အကြံပြုချက်</label>
                                        </div>
                                    </div>
                                    <div class="col-12">
                                        <button class="btn btn-primary w-100 py-3" type="submit">ပေးပို့မည်</button>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Contact End -->


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