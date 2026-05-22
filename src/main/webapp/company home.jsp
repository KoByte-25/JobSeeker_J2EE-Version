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
        
					<div class="container-xxl py-5">
            			<div class="container">
                			<h1 class="text-center mb-5 wow fadeInUp" data-wow-delay="0.1s"><%= comUserName %> မှတင်ထားသော အလုပ်များ</h1>
                		</div>
                	</div>
					<% 
						   int comAccId = 0;
						   String flag="accepted";
						   Connection conn;
							
						   try {
	                  			Class.forName("com.mysql.jdbc.Driver");
	                  		} catch (ClassNotFoundException e) {
	                  			// TODO Auto-generated catch block
	                  			e.printStackTrace();
	                  		} 
						   
	                  		try {
	                  			conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/j2ee_job_seeker","root","root");
		                        String selectquery="select * from company_account where Com_User_Name=?";
		                        
	                  			PreparedStatement ps=conn.prepareStatement(selectquery);
	                  			ps.setString(1, comUserName);
	                  			
	                  			ResultSet rs=ps.executeQuery();
	                  			if(rs.next())
	                  			{
	                  				comAccId = rs.getInt(1);
	                  				String selectquery1 = "select * from jobs where Com_Acc_Id=? and acceptance=?";
	                  				
	                  				ps = conn.prepareStatement(selectquery1);
	                  				ps.setInt(1, comAccId);
	                  				ps.setString(2, flag);
	                  				
	                  				ResultSet rs1 = ps.executeQuery();
	                  				while(rs1.next())
	                  				{
                  		
                  	%>
        <!-- About Start -->
        <div class="container-xxl py-5">
        	<div style="display: flex; float: right;">
                    		<a href="job edit.jsp?job_Id=<%= rs1.getInt(1) %>"><i class='bx bx-edit' style="font-size: 50px"></i></a>
                    		<a href="deleteJob?job_Id=<%= rs1.getInt(1) %>"> <i class='bx bxs-trash' style="font-size: 50px"></i> </a>
            </div>
            <div class="container">
                <div class="row g-5 align-items-center">
                    <div class="col-lg-6 wow fadeIn" data-wow-delay="0.1s">
                        <div class="row g-0 about-bg rounded overflow-hidden">
                        	<img class="img-fluid" src="getJob?job_Id=<%= rs1.getInt(1) %>" style="width: 100%; height: 500px;">
                        </div>
                    </div>
                    <div class="col-lg-6 wow fadeIn" data-wow-delay="0.5s">
                    	
                        <h1 class="mb-4"><i class="fa fa-star text-primary me-3"></i><%= rs1.getString(4) %></h1>
                        <p><i class="fa fa-map-marker-alt text-primary me-3"></i><%= rs1.getString(5) %> ၊ <%= rs1.getString(6) %></p>
                        <p><i class="far fa-money-bill-alt text-primary me-3"></i>
                        <% 
                        	if(rs1.getString(7).equals("နေ့စား"))
                        	{
                        		%>
                        			နေ့စားခ - <%= rs1.getInt(8) %>
                        		<%
                        	}
                        	
                        	else
                        	{
                        		%>
                    			အခြေခံလစာ - <%= rs1.getInt(8) %>
                    		<%
                        	}
                        %>
                        </p>
                        <p><i class="text-primary me-3"><img src="./Photo/icon/age-group.jpg" width="20px" height="20px"></i> အသက် <%= rs1.getString(14) %> မှ <%= rs1.getString(15) %> အတွင်း</p>
                        <p><i class="fa fa-check text-primary me-3"></i><%= rs1.getString(9) %></p>
                        <p><i class="fa fa-clock text-primary me-3"></i><%= rs1.getString(10) %></p>
                        <p style="color: #00b474; font-size: 20px"> *JobSeeker Admin Team မှ စစ်ဆေးပြီးဖြစ်ပါသည်။ </p>
                        <a class="btn btn-primary py-3 px-5 mt-3" href="applicants.jsp?jobId=<%= rs1.getInt(1) %>&comName=<%= rs1.getString(2) %>&pos=<%= rs1.getString(4) %>"> လျှောက်ထားသူများကိုကြည့်ရန် </a>
                    </div>
                </div>
            </div>
        </div>
        <!-- About End -->
					<%		}
	                  	}
	                			
	                		} catch (SQLException e) {
	                			// TODO Auto-generated catch block
	                			e.printStackTrace();
	                		} 
	                  		
	                %>
	                <%
	                try {
              			conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/j2ee_job_seeker","root","root");
                        String selectquery="select * from company_account where Com_User_Name=?";
                        
              			PreparedStatement ps=conn.prepareStatement(selectquery);
              			ps.setString(1, comUserName);
              			
              			ResultSet rs=ps.executeQuery();
              			if(rs.next())
              			{
              				comAccId = rs.getInt(1);
              				String selectquery1 = "select * from jobs where Com_Acc_Id=? and acceptance is null";
              				
              				ps = conn.prepareStatement(selectquery1);
              				ps.setInt(1, comAccId);
              				
              				ResultSet rs1 = ps.executeQuery();
              				while(rs1.next())
              				{
          		
          	%>
			<!-- About Start -->
			<div class="container-xxl py-5">
				<div style="display: flex; float: right;">
			            		<a href="job edit.jsp?job_Id=<%= rs1.getInt(1) %>"><i class='bx bx-edit' style="font-size: 50px"></i></a>
			            		<a href="deleteJob?job_Id=<%= rs1.getInt(1) %>"> <i class='bx bxs-trash' style="font-size: 50px"></i> </a>
			    </div>
			    <div class="container">
			        <div class="row g-5 align-items-center">
			            <div class="col-lg-6 wow fadeIn" data-wow-delay="0.1s">
			                <div class="row g-0 about-bg rounded overflow-hidden">
			                	<img class="img-fluid" src="getJob?job_Id=<%= rs1.getInt(1) %>" style="width: 100%; height: 500px;">
			                </div>
			            </div>
			            <div class="col-lg-6 wow fadeIn" data-wow-delay="0.5s">
			            	
			                <h1 class="mb-4"><i class="fa fa-star text-primary me-3"></i><%= rs1.getString(4) %></h1>
			                <p><i class="fa fa-map-marker-alt text-primary me-3"></i><%= rs1.getString(5) %> ၊ <%= rs1.getString(6) %></p>
			                <p><i class="far fa-money-bill-alt text-primary me-3"></i>
			                <% 
			                	if(rs1.getString(7).equals("နေ့စား"))
			                	{
			                		%>
			                			နေ့စားခ - <%= rs1.getInt(8) %>
			                		<%
			                	}
			                	
			                	else
			                	{
			                		%>
			            			အခြေခံလစာ - <%= rs1.getInt(8) %>
			            		<%
			                	}
			                %>
			                </p>
                        	<p><i class="text-primary me-3"><img src="./Photo/icon/age-group.jpg" width="20px" height="20px"></i> အသက် <%= rs1.getString(14) %> မှ <%= rs1.getString(15) %> အတွင်း</p>			                
			                <p><i class="fa fa-check text-primary me-3"></i><%= rs1.getString(9) %></p>
			                <p><i class="fa fa-clock text-primary me-3"></i><%= rs1.getString(10) %></p>
			                <p style="color: #00b474; font-size: 20px"> *သင့်လုပ်ငန်း အချက်အလက်များကို လက်ခံရရှိပါသည်။ JobSeeker Admin Team မှ စစ်ဆေးနေဆဲဖြစ်ပါသည်။ </p>
			           </div>
			        </div>
			    </div>
			</div>
			<!-- About End -->
			<%		}
              	}
            			
            		} catch (SQLException e) {
            			// TODO Auto-generated catch block
            			e.printStackTrace();
            		} 
              		
            %>
            <%
	                try {
              			conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/j2ee_job_seeker","root","root");
                        String selectquery="select * from company_account where Com_User_Name=?";
                        
              			PreparedStatement ps=conn.prepareStatement(selectquery);
              			ps.setString(1, comUserName);
              			
              			ResultSet rs=ps.executeQuery();
              			if(rs.next())
              			{
              				comAccId = rs.getInt(1);
              				String selectquery1 = "select * from jobs where Com_Acc_Id=? and acceptance=?";
              				
              				ps = conn.prepareStatement(selectquery1);
              				ps.setInt(1, comAccId);
              				ps.setString(2, "rejected");
              				
              				ResultSet rs1 = ps.executeQuery();
              				while(rs1.next())
              				{
          		
          	%>
			<!-- About Start -->
			<div class="container-xxl py-5">
				<div style="display: flex; float: right;">
			            		<a href="job edit.jsp?job_Id=<%= rs1.getInt(1) %>"><i class='bx bx-edit' style="font-size: 50px"></i></a>
			            		<a href="deleteJob?job_Id=<%= rs1.getInt(1) %>"> <i class='bx bxs-trash' style="font-size: 50px"></i> </a>
			    </div>
			    <div class="container">
			        <div class="row g-5 align-items-center">
			            <div class="col-lg-6 wow fadeIn" data-wow-delay="0.1s">
			                <div class="row g-0 about-bg rounded overflow-hidden">
			                	<img class="img-fluid" src="getJob?job_Id=<%= rs1.getInt(1) %>" style="width: 100%; height: 500px;">
			                </div>
			            </div>
			            <div class="col-lg-6 wow fadeIn" data-wow-delay="0.5s">
			            	
			                <h1 class="mb-4"><i class="fa fa-star text-primary me-3"></i><%= rs1.getString(4) %></h1>
			                <p><i class="fa fa-map-marker-alt text-primary me-3"></i><%= rs1.getString(5) %> ၊ <%= rs1.getString(6) %></p>
			                <p><i class="far fa-money-bill-alt text-primary me-3"></i>
			                <% 
			                	if(rs1.getString(7).equals("နေ့စား"))
			                	{
			                		%>
			                			နေ့စားခ - <%= rs1.getInt(8) %>
			                		<%
			                	}
			                	
			                	else
			                	{
			                		%>
			            			အခြေခံလစာ - <%= rs1.getInt(8) %>
			            		<%
			                	}
			                %>
			                </p>
	                        <p><i class="text-primary me-3"><img src="./Photo/icon/age-group.jpg" width="20px" height="20px"></i> အသက် <%= rs1.getString(14) %> မှ <%= rs1.getString(15) %> အတွင်း</p>	                
			                <p><i class="fa fa-check text-primary me-3"></i><%= rs1.getString(9) %></p>
			                <p><i class="fa fa-clock text-primary me-3"></i><%= rs1.getString(10) %></p>
			                <p style="color: #ff0000; font-size: 20px"> သင့်လုပ်ငန်းအချက်အလက် တစ်စုံတစ်ရာမှားယွင်းနေသည်ဟု JobSeeker Admin Team မှယူဆသောကြေင့် ပယ်ဖျက်လိုက်ပါသည်။ အချက်အလက်များ ပြင်ဆင်ပြီး ထပ်မံတင်ပြနိုင်ပါသည်။ </p>
			           </div>
			        </div>
			    </div>
			</div>
			<!-- About End -->
			<%		}
              	}
            			
            		} catch (SQLException e) {
            			// TODO Auto-generated catch block
            			e.printStackTrace();
            		} 
              		
            %>
        

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