<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style>
	tr,td{
		padding:10px;
		font-weight: bold;
	      }
	      th{
			  font-size: 20px;
		  }
	      #td{
			  width:100px;
		  }
	table img{
		border:1px solid black;
	     width:650px;
	     height:400px;
	     }
	 .table{
	 margin-top:-300px;
	 width:1000px;
     margin-left:100px;		  
	 }
	 h3{text-align:center;}
</style>
<meta charset="UTF-8">
    <title>About Us</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="" name="keywords">
    <meta content="" name="description">

    <!-- Favicon -->
    <link href="img/favicon.ico" rel="icon">

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
                    
                    <a href="aboutUs.jsp" id="textConfig" class="nav-item nav-link active">ကျွန်ုပ်တို့အကြောင်း</a>
                    <a href="contact.jsp" id="textConfig" class="nav-item nav-link">ဆက်သွယ်ရန်</a>
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
                    
                    <a href="aboutUs.jsp" id="textConfig" class="nav-item nav-link active">ကျွန်ုပ်တို့အကြောင်း</a>
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
                    
                    <a href="aboutUs.jsp" id="textConfig" class="nav-item nav-link active">ကျွန်ုပ်တို့အကြောင်း</a>
                    <a href="contact.jsp" id="textConfig" class="nav-item nav-link">ဆက်သွယ်ရန်</a>
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


       


        <!-- About Start --><br>
        
	
	<table class="table">
		<tr>
		<td  colspan="2"><h3><u>အလုပ်ရှာသူများအတွက် လမ်းညွှန်</u></h3></td>
		</tr>
		<tr><td id="td"><br><br><br><br><br><br>အဆင့်(၁)</th>
		<th><img src="img/p27.jpg" ></th>
		<th><br><br><br><br><br><br>အကောင့်ဝင်မည်ကို နှိပ်ပါ </th>
		</tr><br>
		<tr><th><br><br><br><br><br><br>အဆင့် (၂)</th>
		<th><img src="img/p24.jpg" ></th>
		<th><br><br><br><br><br><br>အလုပ်ရှာသူ ကို နှိပ်ပါ </th>
		</tr><br>
		<tr><th><br><br><br><br><br><br>အဆင့်(၃)</th>
		<th><img src="img/p22.jpg"></th>
		<th><br><br><br><br><br><br>အကောင့်မရှိပါက highlightပြထားသော နေရာတွင်  <br> ရှိသော အကောင့်ဖွင့်မည်ကိုနှိပ်ပါ</th>
		</tr><br>
		<tr><th><br><br><br><br><br><br>အဆင့်(၄)</th>
		<th><img src="img/pp5.png"></th>
		<th><br><br><br><br><br><br>ပုံတွင်ပြထားသည့်အတိုင်း အချက်အလက်များကို <br> ပြည့်စုံစွာ ဖြည့်စွက်၍ အကောင့်ဝင်နိုင်ပါသည် </th>
		</tr><br>
		<tr><th><br><br><br><br><br><br>အဆင့်(၅)</th>
		<th><img src="img/p26.jpg" width="400" height="300"></th>
		<th><br><br><br><br><br><br>အကောင့်ရှိပြီးသား ဖြစ်ပါက အသုံးပြုအမည်နှင့် <br> လျှို့ဝှက်နံပါတ်ကို ထည့်၍ အကောင့်ဝင်ပါ </th>
		</tr><br>
		<tr><th><br><br><br><br><br><br>အဆင့်(၆)</th>
		<th><img src="img/pp1.png" width="400" height="300"></th>
		<th><br><br><br><br><br><br>အကောင့်ဝင်ပြီးပါက အောက် ရှာဖွေရန်ဘားတွင်လည်း <br> မြို့အလိုက်ဖြင့်ရှာမည်ကို ရွေးကာ မြို့နာမည်ထည့်ပြီး <br> ရှာဖွေမည်နှိပ်၍ အလုပ်ရှာဖွေနိုင်ပါပြီ </th>
		</tr>
		
		<tr><th><br><br><br><br><br><br>အဆင့်(၇)</th>
		<th><img src="img/p7.jpg" width="400" height="300"></th>
		<th><br><br><br><br><br><br>ဘေးရှိ "ကြည့်ရန်" ခလုတ်ကို နှိပ်၍ အလုပ်အကြောင်း <br>အသေးစိတ် ကြည့်ရှုနိုင်ပါသည် </th></tr>
		
		<tr><th><br><br><br><br><br><br>အဆင့်(၈)</th>
		<th><img src="img/p8.jpg" width="400" height="300"></th>
		<th><br><br><br><br><br><br>လုပ်ငန်းအတွေ့အကြုံ ရှိ /မရှိ ဖြည့်စွက်ပြီး <br> လျှောက်ရန် ခလုတ်ကို နှိပ်၍ အလုပ်လျှောက်နိုင်ပါပြီ </th>
		</tr> 
		
		<tr><th><br><br><br><br><br><br>အဆင့်(၉)</th>
		<th><img src="img/p9.jpg" width="400" height="300"></th>
		<th><br><br><br><br><br><br>လျှောက်ပြီးသော အလုပ်များကို ထပ်မလျှောက်နိုင်စေရန် <br> အတွက် 'အလုပ်လျှောက်ပြီးကြောင်း' ဖော်ပြထားပါသည် </th>
		</tr> 
		
		
		<tr><th><br><br><br><br><br><br>အဆင့်(၁၀)</th>
		<th><img src="img/pp2.png" width="400" height="300"></th>
		<th><br><br><br><br><br><br>profileကို နှိပ်၍လဲ လျှောက်ထားသော အလုပ်များနှင့် <br>အင်တာဗျုး ခေါ်မခေါ် ကြည့်ရှုစစ်ဆေးနိုင်ပါသည်</th>
		</tr> 
		
		<tr><th><br><br><br><br><br><br>အဆင့်(၁၁)</th>
		<th><img src="img/pp3.png" width="400" height="300"></th>
		<th><br><br><br><br><br><br>အချက်အလက်များ ပြင်မည်' ခလုတ်ကို နှိပ်၍လဲ profile <br>ကို ပြင်နိုင်သည့်အပြင် အခြားစာရွက်စာတမ်းများလည်း <br> ထပ်မံဖြည့်ထည့်နိုင်ပါသည်</th>
		</tr> <br><br>
		
		<tr><td colspan="2"><h3 style="margin-top: 10%; text-decoration: underline;"> အလုပ်ရှင်များအတွက် လမ်းညွှန်</h3> </td></tr>
		
		<tr><th><br><br><br><br><br><br>အဆင့်(၁)</th>
		<th><img src="img/p27.jpg" width="400" height="300"></th>
		<th><br><br><br><br><br><br>အကောင့်ဝင်မည်ကို နှိပ်ပါ</th>
		</tr> 
		
		<tr><th><br><br><br><br><br><br>အဆင့်(၂)</th>
		<th><img src="img/p12.jpg" width="300" height="300"></th>
		<th><br><br><br><br><br><br>အလုပ်ရှင်ကို နှိပ်ပါ</th>
		</tr>
		<tr><th><br><br><br><br><br><br>အဆင့်(၃)</th>
		<th><img src="img/p13.jpg"></th>
		<th><br><br><br><br><br><br>အကောင့်မရှိပါက highlightပြထားသော နေရာတွင်  <br> ရှိသော အကောင့်ဖွင့်မည်ကိုနှိပ်ပါ</th>
		</tr>
		<tr><th><br><br><br><br><br><br>အဆင့်(၄)</th>
		<th><img src="img/p14.jpg"></th>
		<th><br><br><br><br><br><br>အကောင့်ရှိပြီးသား ဖြစ်ပါက ဝိုင်းထားသောနေရာမှ ဝင်ပါ </th>
		</tr><br>
		<tr><th><br><br><br><br><br><br>အဆင့်(၅)</th>
		<th><img src="img/p15.jpg"></th>
		<th><br><br><br><br><br><br>အကောင့်ဝင်ပြီးပါပြီ </th>
		</tr><br>
		<tr><th><br><br><br><br><br><br>အဆင့်(6)</th>
		<th><img src="img/p16.jpg"></th>
		<th><br><br><br><br><br><br>'အလုပ်သစ်တင်ရန်' ခလုတ်ကို နှိပ်၍ လုပ်ငန်းအချက် <br> အလက်များဖြည့်စွက်ကာ အလုပ်သစ်တင်နိုင်ပါသည် </th>
		</tr><br>
		<tr><th><br><br><br><br><br><br>အဆင့်(၇)</th>
		<th><img src="img/p17.jpg"></th>
		<th><br><br><br><br><br><br>တင်လိုက်သောအလုပ်အား home pageတွင် <br>ဖော်ပြထားပါသည် </th>
		</tr><br>
		<tr><th><br><br><br><br><br><br>အဆင့်(၈)</th>
		<th><img src="img/p18.jpg"></th>
		<th><br><br><br><br><br><br>တင်လိုက်သော အလုပ်များအား 'ပြင်ချင်/ဖျက်ချင်ပါက' <br> ဘေးရှိ ခလုတ်များအား အသုံးပြု၍ ဖျက်နိုင်ပါသည် </th>
		</tr><br>
		<tr><th><br><br><br><br><br><br>အဆင့်(၉)</th>
		<th><img src="img/p19.jpg"></th>
		<th><br><br><br><br><br><br>အမှိုက်ဘုံးဘေးမှ ခလုတ်လေးကို နှိပ်၍ ကုမ္ပဏီဘက်မှ <br> ပြင်ဆင်လိုသောအချက်အလက်များဖြည့်ကာ <br> ပြင်ဆင်နိုင်မည် ဖြစ်ပါသည် </th>
		</tr><br>
		<tr><th><br><br><br><br><br><br>အဆင့်(၁၀)</th>
		<th><img src="img/p20.jpg"></th>
		<th><br><br><br><br><br><br>'လျှောက်ထားသူများ' ခလုတ်ကိုနှိပ်၍ အလုပ်လျှောက်သူများကို <br> ကြည့်ရှူ နိုင်ပါသည် </th>
		</tr><br>
		<tr><th><br><br><br><br><br><br>အဆင့်(၁၁)</th>
		<th><img src="img/pp4.png"></th>
		<th><br><br><br><br><br><br>အလုပ်လျှောက်ထားသူများ၏ ကိုယ်ရေးအချက်အလက်  </th>
		</tr><br>
		
	
	</table>

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