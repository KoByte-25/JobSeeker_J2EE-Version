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
    	
    	.card {
            background: #00b474;
            border-radius: 8px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            padding: 20px;
            width: 500px;
            margin: 1% 30%;
        }

        .form-table {
            width: 100%;
            margin: 0 10px;
        }

        .form-table th,
        .form-table td {
            padding: 10px;
            text-align: left;
        }

        
        .form-table td label {
            font-weight: bold;
            color: black;
			font-size: 18px;
        }

    </style>
</head>
<body>
	<div class="container-xxl bg-white p-0" style="width: 10000px">
        <!-- Spinner Start -->
        <div id="spinner" class="show bg-white position-fixed translate-middle w-100 vh-100 top-50 start-50 d-flex align-items-center justify-content-center">
            <div class="spinner-border text-primary" style="width: 3rem; height: 3rem;" role="status">
                <span class="sr-only">Loading...</span>
            </div>
        </div>
        <!-- Spinner End -->


        <!-- Navbar Start -->
        <nav class="navbar navbar-expand-lg bg-white navbar-light shadow sticky-top p-0" style="height: 150px">
            <a href="users.jsp" class="navbar-brand d-flex align-items-center text-center py-0 px-4 px-lg-5">
                <h1 class="m-0 text-primary"><img src="./Photo/Logo/JobSeeker.jpg" height="100px" width=""></h1>
            </a>
            <button type="button" class="navbar-toggler me-4" data-bs-toggle="collapse" data-bs-target="#navbarCollapse">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarCollapse">
                <div class="navbar-nav ms-auto p-4 p-lg-0">
                    <a href="users.jsp" id="textConfig" class="nav-item nav-link ">users</a>
                    <a href="companies.jsp" id="textConfig" class="nav-item nav-link active">companies</a>
                    <a href="requestedjobs.jsp" id="textConfig" class="nav-item nav-link">Requested Jobs 
                    	<%
                    	try {
                			Class.forName("com.mysql.jdbc.Driver");
                		} catch (ClassNotFoundException e) {
                			// TODO Auto-generated catch block
                			e.printStackTrace();
                		}
                        
                        Connection conn;
                        int i=0;
                        String selectQuery1 = "select * from jobs where acceptance is null";
                                            
                        try {
                			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/j2ee_job_seeker","root","root");
                			
                			PreparedStatement ps = conn.prepareStatement(selectQuery1);
                			
                			ResultSet rs = ps.executeQuery();
                			while(rs.next())
                			{
                				i++;
                			}  	
                        	}
                        catch (SQLException e) 
                        {
                        	e.printStackTrace();
                        }
                        if(i>0)
                        {
                    	%>
                    		<sup> <%= i %></sup>
                    	<%
                        }
                    	%>
                    	
                    </a>
                    <a href="logout" id="textConfig" class="nav-item nav-link">Logout</a>
                </div>
            </div>
        </nav>
        <!-- Navbar End -->
        
        <div style="text-align: center; padding: 2%;"> <h1 style="color: #00b474;"> Companies </h1></div>
        
        <%
        try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        
                            
        try {
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/j2ee_job_seeker","root","root");
			
			String selectQuery = "select * from company_account";
			Statement st = conn.createStatement();
			ResultSet rs = st.executeQuery(selectQuery);
			while(rs.next())
			{
        %>
       <div class="card">
       		<a href="deleteCompany?caid=<%= rs.getInt(1) %>" style="text-align: right; font-size: 50px; color: black;"> <i class='bx bxs-user-x' ></i> </a>
        	<form action="edit" method="post" class="form-table" enctype="multipart/form-data">
        	<table>
        		<tr>
        			<td> <label> company user name: </label> </td>
        			<td style="color: white;"> <%= rs.getString(2) %></td>
        		</tr>
        		<tr>
        			<td> <label> company password:</label> </td>
        			<td style="color: white;"> ******** </td>
        		</tr>
        		<tr>
        			<td> <label> company phone number: </label> </td>
        			<td style="color: white;"> <%= rs.getString(4) %></td>
        		</tr>
        		<tr>
        			<td> <label> company email: </label> </td>
        			<td style="color: white;"> <%= rs.getString(5) %></td>
        		</tr>
        		<tr>
        			<td></td>
        			<td style="color: black; background: white; text-align: center;"> <a href="viewjobs.jsp?caid=<%= rs.getInt(1) %>&comname=<%= rs.getString(2) %>"> View Posted Jobs</a></td>
        		</tr>
        	</table>
        	</form>
        </div>
		<%
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