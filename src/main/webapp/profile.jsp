<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@ page import="java.sql.*" %>
    <%@ page import="java.text.SimpleDateFormat, java.util.Date" %>
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
    .pdflink{
    color:black;
  }
  input[type=submit]{ background: green;color:white;
  }
  .pdflink:hover{
  color:green;}
    	#textConfig
    	{
    		font-size: 17px;
    	}
    	
    	.profile-container {
            max-width: 600px;
            height: auto;
            margin: 20px auto;
            background: #8deac9;
            padding: 20px;
            border: none;
            border-radius: 8px;
            box-shadow: 5px 5px 20px #00b074;
        }
        .profile-picture {
            width: 150px;
            height: 150px;
            border-radius: 50%;
            margin: 0 auto 20px;
            display: block;
            border: 5px solid #fff;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        .profile-name {
            text-align: center;
            font-size: 24px;
            margin-bottom: 10px;
        }
        .profile-info {
            padding: 0 20px;
            font-weight: bold;
            color: #000;
        }
        .profile-info .table1 tr {
            margin: 10px 0;
            height: 35px;
        }
        
        .profile-info .table1 tr td
        {
        	padding: 0 10px;
        }
        
        .profile-info .profilelink
        {
        	border-radius: 50px;
        	box-shadow: 5px 5px 10px #000;
        	background: #fff;
        	color: black;
        	padding: 10px;
        	float: right;
        }
        
        
    	.table2
    	{
    		margin-left: 5%;
    		width: 90%;
    	}
    	
    	.table2 tr .topleft
    	{
    		border-top-left-radius: 10px;
    	}
    	
    	.table2 tr .topright
    	{
    		border-top-right-radius: 10px;
    	}
    	
    	.table2 tr th
    	{
    		max-width: 100px;
    		text-align: center;
    		background-color: #8deac9;
    		font-weight: bold;
    	}
    	
    	.table2 tr td
    	{
    		text-align: center;
    		border-bottom: 3px solid #8deac9;
    	}
    	
    	.table2 tr th, .table2 tr td
    	{
    		height: 50px;
    		font-size: 20px;
    		padding: 10px 30px;
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
        
        <%
        if(cusUserName==null)
		{
        %>
		<!-- Testimonial Start -->
        <div class="container-xxl py-5 wow fadeInUp" data-wow-delay="0.1s">
            <div class="container">
                    <div class="testimonial-item bg-light rounded p-4">
                        <i class="fa fa-quote-left fa-2x text-primary mb-3"></i>
                        <i class="fa fa-quote-right fa-2x text-primary mb-3" style="float: right;"></i>
                        <p style="text-align: center;"> ပရိုဖိုင်း ကြည့်ရန် အကောင့်အရင်ဝင်ထားဖို့လိုအပ်သည်။ </p>
                  	</div>
            </div>
        </div>
        <!-- Testimonial End -->
        <%
		}
        else
        {
        %>
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
    			
    			String selectQuery = "select * from customer where cusUserName=?";
    			
    			PreparedStatement ps = conn.prepareStatement(selectQuery);
    			ps.setString(1, cusUserName);
    			ResultSet rs = ps.executeQuery();
    			while(rs.next())
    			{
        	%>
	        	<div class="profile-container">
			        <img class="profile-picture" src="profileimage?cusid=<%= rs.getInt(1) %>" alt="Profile Picture">
			        
			         <%
			        if(rs.getInt("reported")==1)
			        {
			        %>
			        <h2 class="profile-name" style="color: red;"><%= rs.getString(4) %></h2>
			        	<span style="color: red;">သင်၏ ကိုယ်ရေးအချက်အလက်များ မှားယွင်းနေသည်ဟု တိုင်ကြားခံထားရပါသည်။ ကျေးဇူးပြု၍ မှန်ကန်သော ကိုယ်ရေး အချက်အလက်များ ထည့်သွင်းပေးပါ။</span>
			        <%
			        }
			        else
			        {
			        %>
			        <h2 class="profile-name"><%= rs.getString(4) %></h2>			        
			        <%
			        }
			        %>
			        
			        <div class="profile-info">
			           <table class="table1">
			        		<tr>
			        			<td> မွေးသက္ကရာဇ်: </td>
			        			<td> <%= rs.getString(5) %> </td>
			        		</tr>
			        		<tr>
			        			<td> မှတ်ပုံတင်အမှတ်: </td>
			        			<td> <%= rs.getString(6) %> </td>
			        		</tr>
			        		<tr>
			        			<td> ဖုန်းနံပါတ်: </td>
			        			<td> <%= rs.getString(7) %></td>
			        		</tr>
			        		<tr>
			        			<td> အီးမေးလ်: </td>
			        			<td> <%= rs.getString(8) %></td>
			        		</tr>
			        		<tr>
			        			<td> ပညာအရည်အချင်း: </td>
			        			<td> <%= rs.getString(9) %></td>
			        		</tr>
			        		<tr>
			        			<td> ကွန်ပျူတာတက်ကျွမ်းမှုအဆင့်: </td>
			        			<td> <%= rs.getString(10) %></td>
			        		</tr>
			        		<tr>
			        			<td> မျှော်မှန်းလစာ: </td>
			        			<td> <%= rs.getString(11) %></td>
			        		</tr>
			        		<tr>
			        			<td> အရင်တုန်းက လုပ်ဖူးသောအလုပ်များ: </td>
			        			<td> <%= rs.getString(12) %></td>
			        		</tr>
			        		
		        		
		     <%   		  try {
    			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/j2ee_job_seeker","root","root");
    			
    			String selectQuery1 = "select distinct(filename) from userDocumentation where cusUserName=?";
    			
    			PreparedStatement ps1 = conn.prepareStatement(selectQuery1);
    			ps1.setString(1, cusUserName);
    			ResultSet rs1 = ps1.executeQuery();
    			int countdoc=0;
    			while(rs1.next())
    			{countdoc++;
        	%>
        	<%
	            }
    			if (countdoc==0)
    			{
    				out.print("<tr><td colspan=2>အခြားစာရွက်စာတမ်းများအား ထပ်မံပူးတွဲတင်ပြထားခြင်းမရှိသေးပါ</td></tr>");   			}
    			else
    			{
    				out.print("<tr><td colspan=2>ထပ်မံပူးတွဲတင်ပြထားသော အခြားစာရွက်စာတမ်းများ</td></tr>"); 
    				PreparedStatement ps3 = conn.prepareStatement(selectQuery1);
        			ps3.setString(1, cusUserName);
        			ResultSet rs3 = ps3.executeQuery();
        			out.print("<td colspan=2><table id=table2>");
        			while(rs3.next())
        			{
        				String str=rs3.getString(1);
          				String[] user=str.split("\\\\");
          				int i=user.length;
          				String filename=user[i-1];
          				
          
             %>
   <tr>    <td colspan=2>  <a class="pdflink"  href="download.jsp?name=<%=filename%>" target="_blank"><%=filename%></a></td></tr>
           <%

        			}
    				
    			}
    			
	        } catch (SQLException e) {
	    			// TODO Auto-generated catch block
	    			e.printStackTrace();
	    		}
            out.print("</table></td></tr>");
            %>
		        		
		        		</table>
			        	<a class="profilelink" href="userEdit.jsp?id=<%= rs.getInt(1) %>"> အချက်အလက်များ ပြင်မည် </a>
			        	<br>
			        	
			      </div>
	    	</div>
        	<br>
        	<%
	            }
	        } catch (SQLException e) {
	    			// TODO Auto-generated catch block
	    			e.printStackTrace();
	    		}
        	%>
        		
        	<%
        	          
            try {
    			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/j2ee_job_seeker","root","root");
    			
    			int cusId = 0;
    			String selectQuery = "select * from customer where cusUserName=?";
    			
    			PreparedStatement ps = conn.prepareStatement(selectQuery);
    			ps.setString(1, cusUserName);
    			ResultSet rs = ps.executeQuery();
    			
    			while(rs.next())
    			{
    				cusId = rs.getInt(1);
    			}
    			
    			selectQuery = "select jobs.company_name, jobs.position, apply.Apply_Id, jobs.job_id from apply, jobs where apply.job_id=jobs.job_id and cus_id=?";
    			
    			ps = conn.prepareStatement(selectQuery);
    			ps.setInt(1, cusId);
    			rs = ps.executeQuery();
    			
    			int len = 0;
    			
    			while(rs.next())
    			{
    				len++;
    			}
    			
    			if(len>0)
    			{
    		%>
    			<br>
        		<table class="table2">
        			<tr>
        				<th colspan="2" class="topleft"> <%= cusUserName %> လျှောက်ထားသောအလုပ်များ </th>
        				<th colspan="2" class="topright"></th>
        			</tr>
        		 	<tr>
        		 		<th> ဆိုင်နာမည် (သို့) ကုမ္ပဏီနာမည် </th>
        		 		<th> အလုပ်နေရာ </th>
        		 		<th style="width: 20%"></th>
        		 		<th style="width: 30%"></th>
        		 	</tr>
    		<%
		    		ps = conn.prepareStatement(selectQuery);
					ps.setInt(1, cusId);
					rs = ps.executeQuery();
					
	    			while(rs.next())
	    			{
        	%>
	        		<tr>
	        		 	<td> <%= rs.getString(1) %> </td>
	        		 	<td> <%= rs.getString(2) %> </td>
	       	<%
	       				int jobid = rs.getInt(4);
				       	selectQuery = "select jobs.company_name, jobs.position from jobs, interview where jobs.job_id=interview.job_id and cus_id=? and jobs.job_id=?";
						PreparedStatement ps1 = conn.prepareStatement(selectQuery);
						ps1.setInt(1, cusId);
						ps1.setInt(2, jobid);
						ResultSet rs1 = ps1.executeQuery();
						
						int count=0;
						while(rs1.next())
						{
							count++;
						}
						if(count>0)
						{
							selectQuery = "select jobs.company_name, jobs.position, company_account.phNo, interview.date as idate, interview.time as itime, place, type, others from jobs, interview, company_account where jobs.job_id=interview.job_id and jobs.com_acc_id=company_account.com_acc_id and cus_id=? and jobs.job_id=?";
							ps1 = conn.prepareStatement(selectQuery);
							ps1.setInt(1, cusId);
							ps1.setInt(2, jobid);
							rs1 = ps1.executeQuery();
							String formattedDate = null;
							String formattedTime = null;
							while(rs1.next())
							{
								String dString = rs1.getString("idate");
								SimpleDateFormat originalFormat = new SimpleDateFormat("yyyy-MM-dd");
								SimpleDateFormat targetFormat = new SimpleDateFormat("dd MMM, yyyy");
								Date originalDate = originalFormat.parse(dString);
								formattedDate = targetFormat.format(originalDate);
								
								java.sql.Time interviewTime = rs1.getTime("itime");
						    	SimpleDateFormat timeFormat = new SimpleDateFormat("hh : mm a");
						    	formattedTime = timeFormat.format(interviewTime); 
								
	       	%>
	       				
	       				<td colspan=2 style="font-size: 20px; font-weight: bold;color: #00b074;">အင်တာဗျူးခေါ်ထားပါသည်။
	       				<p style="font-size: 15px;"> <label> နေ့ရက်: &nbsp; </label><%= formattedDate %> </p>
	       				<p style="font-size: 15px;"> <label> အချိန်: &nbsp; </label><%= formattedTime %> </p>
	       			<%
	       				if(rs1.getString("place") == null)
	       				{
	       			%>
	       				<p style="font-size: 15px;"> <label> <%= rs1.getString("type") %>'s Link: </label> <br><%= rs1.getString("others") %> </p>
	       			<%
	       				}
	       				else
	       				{
	       			%>
	       				<p style="font-size: 15px;"> <label> နေရာ &nbsp; </label><%= rs1.getString("place") %> </p>
	       				
	       			<%
	       				}
	       			%>
	       				<p style="font-size: 15px;"> ထပ်မံသိရှိလိုသည်များကို လုပ်ငန်းရှင်၏ ဖုန်းနံပါတ် <%= rs1.getString(3) %> ကိုခေါ်ဆို၍ ဆက်သွယ်မေးမြန်းနိုင်ပါသည်။ </p>
	       				</td>
	       	<%
							}
	    				}
						else
	    				{
	       	%>
	       				<td> <a href="deleteapply?applyId=<%= rs.getInt(3) %>"> ဖျက်ရန်</a></td>	       				
	       				<td> အင်တာဗျူးမခေါ်ထားသေးပါ။ </td>
	        		
        	<%
    					}
    		
    				}
	    	%>
    			</tr>
    			</table>
    		<%
    			}
    			else
    			{
    		%>
    			<p style="font-size: 20px; font-weight: bold; text-align: center; margin-top: 10px; color: #00b074;"> သင်လျှောက်ထားသော အလုပ်များမရှိသေးပါ။ အခုပဲ အလုပ်လျှောက်လိုက်ပါ။ </p>
    		<%
    			}
	        } catch (SQLException e) {
	    			// TODO Auto-generated catch block
	    			e.printStackTrace();
	    		}
        	%>
        <%
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