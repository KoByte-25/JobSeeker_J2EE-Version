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

        <!-- Category Start -->
        <div class="container-xxl py-5">
            <div class="container">
            	<%
            		request.setCharacterEncoding("UTF-8");
            		String searchBy = request.getParameter("searchBy");
            		String keyword = request.getParameter("keyword");
            		
            		if(searchBy.equals("town"))
            		{
            	%>
                <h1 class="text-center mb-5 wow fadeInUp" data-wow-delay="0.1s"><%= keyword %> တွင်ရှိသောအလုပ်များ</h1>
                <div class="tab-class text-center wow fadeInUp" data-wow-delay="0.3s">
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
            			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/j2ee_job_seeker","root","root");
          			  	String selectQuery = "SELECT * FROM jobs where township like ?";
          			  	PreparedStatement ps = conn.prepareStatement(selectQuery);
          			  	ps.setString(1, "%" + keyword + "%");					  
        			  	ResultSet rs = ps.executeQuery();
        			  	int count=0;
        			  	while(rs.next())
        			  	{
        			  		count++;
        			  	}
            			if(count>0)
            			{
            			  String selectQuery1 = "SELECT * FROM jobs where township like ?";
              			  PreparedStatement ps1 = conn.prepareStatement(selectQuery1);
              			  ps1.setString(1, "%" + keyword + "%");					  
            			  ResultSet rs1 = ps1.executeQuery();
						 
            			  while(rs1.next())
            			  {
        		    %>
            					 <div id="tab-1" class="tab-pane fade show p-0 active"> <!--  ဆိုင်များ -->
		                            <div class="job-item p-4 mb-4">
		                                <div class="row g-4">
		                                <div class="col-sm-12 col-md-8 d-flex align-items-center">
		                                        <img class="flex-shrink-0 img-fluid border rounded" src="getJob?job_Id=<%= rs1.getInt(1) %>" alt="Image not Found" style="width: 80px; height: 80px;">
		                                        <div class="text-start ps-4">
		                                            <h5 class="mb-3"> <%= rs1.getString(2) %> </h5>
		                                            <span class="text-truncate me-3"><i class="fa fa-map-marker-alt text-primary me-2"></i> <%= rs1.getString(6) %> </span>
		                                            <span class="text-truncate me-3"><i class="fa fa-star text-primary me-3"></i> <%= rs1.getString(4) %> </span>
		                                            <span class="text-truncate me-0"><i class="far fa-money-bill-alt text-primary me-2"></i> <%= rs1.getInt(8) %> </span>
		                                        </div>
		                                    </div>
		                                    <div class="col-sm-12 col-md-4 d-flex flex-column align-items-start align-items-md-end justify-content-center">
		                                        <div class="d-flex mb-3">
		                                        	<%
		                                        		if(adminName==null)
		                                        		{
		                                        	%>
		                                        		<a class="btn btn-primary" href="Job Details.jsp?job_Id=<%= rs1.getInt(1) %>">ကြည့်ရန်</a>
		                                            <%
		                                        		}
		                                        		else
		                                        		{
		                                        	%>
		                                        		<a class="btn btn-primary" href="deleteJob?job_Id=<%= rs1.getInt(1) %>">ဖျက်မည်</a>
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
            			  }            			 
            			  else if(count==0)
            			  {
            				  %>
            				  	<h1> <%= keyword %>အတွက် တင်ထားသောလုပ်ငန်းများမရှိသေးပါ။ </h1>
            				  <%
            			  }
            			  else{}
			             } catch (SQLException e) {
			            			// TODO Auto-generated catch block
			            			e.printStackTrace();
			            		}
            		}
            		else if(searchBy.equals("salary"))
            		{
            			int salary = Integer.parseInt(keyword);
                    	%>
                        <h1 class="text-center mb-5 wow fadeInUp" data-wow-delay="0.1s">လစာ <%= keyword %> နှင့်အထက်ရှိသော အလုပ်များ </h1>
                        <div class="tab-class text-center wow fadeInUp" data-wow-delay="0.3s">
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
                    			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/j2ee_job_seeker","root","root");
                    			
                    			  int count = 0;
                    			  String selectQuery = "SELECT * FROM jobs where salary>=? order by salary";
                    			  PreparedStatement ps = conn.prepareStatement(selectQuery);
                    			  ps.setInt(1, salary);
                    			  ResultSet rs = ps.executeQuery();
                    			  while(rs.next())
                    			  {
                    				  count++;
                    			  }
                    			  if(count>0)
                    			  {
                    			  selectQuery = "SELECT * FROM jobs where salary>=? order by salary";
                    			  ps.setInt(1, salary);
        						  rs = ps.executeQuery();
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
                    			  }
                    			  else
                    			  {
                    				  %>
                    				  	<h1> မရှိသေးပါ။ </h1>
                    				  <%
                    			  }
        			                } catch (SQLException e) {
        			            			// TODO Auto-generated catch block
        			            			e.printStackTrace();
        			            		}
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