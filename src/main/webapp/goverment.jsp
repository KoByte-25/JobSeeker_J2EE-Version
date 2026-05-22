<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Job Seeker</title>
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
    <style>
    	#textConfig
    	{
    		font-size: 17px;
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
            <a href="index.jsp" class="navbar-brand d-flex align-items-center text-center py-0 px-4 px-lg-5">
                <h1 class="m-0 text-primary"><img src="./Photo/Logo/JobSeeker.jpg" height="100px" width=""></h1>
            </a>
            <button type="button" class="navbar-toggler me-4" data-bs-toggle="collapse" data-bs-target="#navbarCollapse">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarCollapse">
                <div class="navbar-nav ms-auto p-4 p-lg-0">
                    <a href="index.jsp" id="textConfig" class="nav-item nav-link active">ပင်မစာမျက်နှာ</a>
                    
                    <a href="aboutUs.jsp" id="textConfig" class="nav-item nav-link">ကျွန်ုပ်တို့အကြောင်း</a>
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


        <!-- Carousel Start -->
        <div class="container-fluid p-0">
            <div class="owl-carousel header-carousel position-relative">
                <div class="owl-carousel-item position-relative" style="height: 700px">
                    <img class="img-fluid" src="./Photo/background/background2.jpg" alt="">
                    <div class="position-absolute top-0 start-0 w-100 h-100 d-flex align-items-center" style="background: rgba(43, 57, 64, .5);">
                        <div class="container">
                            <div class="row justify-content-start">
                                <div class="col-10 col-lg-8">
                                    <h1 class="display-3 text-white animated slideInDown mb-4">အလုပ်ရှာနေပါသလား....</h1>
                                    <p class="fs-5 fw-medium text-white mb-4 pb-2"> Job Seeker ရှိပါတယ်။ Job Seeker မှာ သင်နှင့်သင့်လျော်သည့် အလုပ်ကို ရှာဖွေလိုက်ပါ....</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="owl-carousel-item position-relative" style="height: 700px">
                    <img class="img-fluid" src="./Photo/background/background1.jpg" alt="">
                    <div class="position-absolute top-0 start-0 w-100 h-100 d-flex align-items-center" style="background: rgba(43, 57, 64, .5);">
                        <div class="container">
                            <div class="row justify-content-start">
                                <div class="col-10 col-lg-8">
                                    <h1 class="display-3 text-white animated slideInDown mb-4">အလုပ်သမားလိုအပ်နေသလား?</h1>
                                    <p class="fs-5 fw-medium text-white mb-4 pb-2">Job Seeker ကိုသတိရလိုက်ပါ......</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Carousel End -->


        <!-- Search Start -->
        <div class="container-fluid bg-primary mb-5 wow fadeIn" data-wow-delay="0.1s" style="padding: 35px;">
            <div class="container">
            <form action="search.jsp" method="post">
                <div class="row g-2">
                    <div class="col-md-10">
                        <div class="row g-2">
	                        <div class="col-md-4">
	                                <select class="form-select border-0" style="background: transparent;">
	                                    <option selected></option>
	                                </select>
	                            </div>
                            <div class="col-md-4">
                                <select class="form-select border-0" name="searchBy">
                                    <option value="town">မြို့အလိုက်ရှာမည်</option>
                                    <option value="salary">နေ့စားခ/လစာဖြင့်ရှာမည်</option>
                                </select>
                            </div>
                            <div class="col-md-4">
                                <input type="text" class="form-control border-0" name="keyword" required/>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-2">
                        <button class="btn btn-dark border-0 w-100" type="submit">ရှာဖွေမည်</button>
                    </div>
                </div>
                </form>
            </div>
        </div>
        <!-- Search End -->


        <!-- Category Start -->
        <div class="container-xxl py-5">
            <div class="container">
                <h1 class="text-center mb-5 wow fadeInUp" data-wow-delay="0.1s">ကဏ္ဍများ</h1>
                <div class="tab-class text-center wow fadeInUp" data-wow-delay="0.3s">
                    <ul class="nav nav-pills d-inline-flex justify-content-center border-bottom mb-5">
                        <li class="nav-item">
                            <div class="d-flex align-items-center text-start mx-3 ms-0 pb-3" data-bs-toggle="pill">
                                <a href="index.jsp"><h6 class="mt-n1 mb-0">ဆိုင်များ</h6></a>
                            </div>
                        </li>
                        <li class="nav-item">
                            <div class="d-flex align-items-center text-start mx-3 me-0 pb-3" data-bs-toggle="pill">
                                <a href="bank.jsp"><h6 class="mt-n1 mb-0">ဘဏ်</h6></a>
                            </div>
                        </li>
                        <li class="nav-item">
                            <div class="d-flex align-items-center text-start mx-3 me-0 pb-3 active" data-bs-toggle="pill">
                                <a href="goverment.jsp"><h6 class="mt-n1 mb-0">အစိုးရရုံးများ</h6></a>
                            </div>
                        </li>
                        <li class="nav-item">
                            <div class="d-flex align-items-center text-start mx-3 me-0 pb-3" data-bs-toggle="pill">
                                <a href="private.jsp"><h6 class="mt-n1 mb-0">ပုဂ္ဂလိကရုံးများ</h6></a>
                            </div>
                        </li>
                        <li class="nav-item">
                            <div class="d-flex align-items-center text-start mx-3 pb-3" data-bs-toggle="pill">
                                <a href="factory.jsp"><h6 class="mt-n1 mb-0">စက်ရုံများ</h6></a>
                            </div>
                        </li>
                    </ul>
                    <div class="tab-content">
                    <%
                    try {
            			Class.forName("com.mysql.jdbc.Driver");
            		} catch (ClassNotFoundException e) {
            			// TODO Auto-generated catch block
            			e.printStackTrace();
            		}
                    
                    Connection conn;
                                        
                    try {
            			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/job_seeker","root","root");
            			
            			  String comType = "အစိုးရရုံးများ";
            			  String flag = "accepted";
            			  String selectQuery = "SELECT * FROM jobs where company_type=? and acceptance=?";
            			  
            			  PreparedStatement ps = conn.prepareStatement(selectQuery);
						  ps.setString(1, comType);
						  ps.setString(2, flag);
						  
            			  ResultSet rs = ps.executeQuery();
            			  while(rs.next())
            			  {
        		    %>
            					 <div id="tab-1" class="tab-pane fade show p-0 active"> <!--  ဆိုင်များ -->
		                            <div class="job-item p-4 mb-4">
		                                <div class="row g-4">
		                                    <div class="col-sm-12 col-md-8 d-flex align-items-center">
		                                        <img class="flex-shrink-0 img-fluid border rounded" src="getJob?job_Id=<%= rs.getInt(1) %>" alt="Image not Found" style="width: 80px; height: 80px;">
		                                        <div class="text-start ps-4">
		                                            <h5 class="mb-3"> <%= rs.getString(2) %> </h5>
		                                            <span class="text-truncate me-3"><i class="fa fa-map-marker-alt text-primary me-2"></i> <%= rs.getString(6) %> </span>
		                                            <span class="text-truncate me-3"><i class="fa fa-star text-primary me-3"></i> <%= rs.getString(4) %> </span>
		                                            <span class="text-truncate me-0"><i class="far fa-money-bill-alt text-primary me-2"></i> <%= rs.getInt(8) %> </span>
		                                        </div>
		                                    </div>
		                                    <div class="col-sm-12 col-md-4 d-flex flex-column align-items-start align-items-md-end justify-content-center">
		                                        <div class="d-flex mb-3">
		                                            <%
		                                        		if(adminName==null)
		                                        		{
		                                        	%>
		                                        		<a class="btn btn-primary" href="Job Details.jsp?job_Id=<%= rs.getInt(1) %>">ကြည့်ရန်</a>
		                                            <%
		                                        		}
		                                        		else
		                                        		{
		                                        	%>
		                                        		<a class="btn btn-primary" href="deleteJob?job_Id=<%= rs.getInt(1) %>">ဖျက်မည်</a>
		                                        	<%
		                                        		}
		                                        	%>
		                                        </div>
		                                    </div>
		                                </div>
		                            </div>
		                            
			                	</div>
            					 <%
            			  		}
			                } catch (SQLException e) {
			            			// TODO Auto-generated catch block
			            			e.printStackTrace();
			            		}
            			%>
		        </div>
	        </div>
        </div>
        <!-- Category End -->
        

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