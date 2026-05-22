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
     input[type=submit]{ background: green;color:white;
  }
    	.card {
            background: linear-gradient(-45deg, #00b474, #ffffff);;
            border-radius: 8px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            padding: 20px;
            width: 600px;
            margin: 5% 30%;
        }
        
        .pdflink{
    color:black;
  }
  
#table2 a{
color:green;}
#table2{
width:300px;}
        .form-table {
            width: 100%;
            margin: 0 10px;
        }

        .form-table .form-header
        {
            text-align: center;
            padding: 2% 0 3% 0;
            font-weight: bold;
            font-size: 20px;
            background: transparent;
            border: none;
        }

        .form-table th,
        .form-table td {
            padding: 10px;
            text-align: left;
        }

        .form-table td input {
            width: 100px;
            padding: 5px;
            border-radius: 4px;
            border: 1px solid #ccc;
            box-sizing: border-box;
        }
        
        .form-table td textarea, select
        {
        	width: 250px;
            padding: 5px;
            border-radius: 4px;
            border: 1px solid #ccc;
            box-sizing: border-box;
        }

        .form-table td:last-child input {
            width: 100%;
        }

		
        .form-table td label {
            font-weight: bold;
            color: black;
			font-size: 18px;
        }

        .form-table td:first-child {
            width: 40%;
        }

        .form-table td:nth-child(2) {
            width: 60%;
        }

        .form-table td:last-child {
            width: 100%;
        }

        .form-table td input[type="submit"] {
            background: #01F3B1;
            font-weight:bold;
            color: black;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            padding: 10px 20px;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            font-size: 16px;
        }
    	 
    	 #textConfig
    	{
    		font-size: 17px;
    	}
    	.rounded-button-01 {
  width: 160px;
  height: 50px;
  border-radius: 5px;
  background-color: #4285f4;
}
.button {
  margin: 10px 0;
  border: none;
  box-shadow: 0px 0px 16px -6px rgba(0, 0, 0, .5);
  color: #fff;
  font-size: 1.25rem;
  letter-spacing: 1px;
  outline: none;
  cursor: pointer;
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
                    <a href="contact.jsp"  id="textConfig" class="nav-item nav-link">ဆက်သွယ်ရန်</a>
                    <% 
                    	String cusUserName = (String) session.getAttribute("cusUserName");
                    
                    	if(cusUserName==null)
                    	{
                    		%>
                    			<div class="nav-item dropdown">
			                        <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">အကောင့်ဝင်မည်</a>
			                        <div class="dropdown-menu rounded-0 m-0">
			                            <a href="customerLoginandRegister.jsp" id="textConfig" class="dropdown-item">အလုပ်ရှာသူ</a>
			                            <a href="comLoginandRegister.jsp" id="textConfig" class="dropdown-item">အလုပ်ရှင်များ </a>
			                        </div>
			                    </div>
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
                <%
                	if(cusUserName==null)
            		{
            		
                %>
                <a href="profile.jsp" class="btn btn-primary rounded-0 py-4 px-lg-5 d-none d-lg-block">ကိုယ်ရေးအချက်အလက်<i class="fa fa-arrow-right ms-3"></i></a>
            	<%
            		}
                	else
                	{
            	%>
            	<a href="profile.jsp" class="btn btn-primary rounded-0 py-4 px-lg-5 d-none d-lg-block"><%= cusUserName %><i class="fa fa-arrow-right ms-3"></i></a>
            	<%
                	}
            	%>
            </div>
        </nav>
        <!-- Navbar End -->
        
        
        	<%
        	
        	int id=0;
        	if(request.getParameter("id")!=null)
        	 {id = Integer.parseInt(request.getParameter("id"));
        	 session.setAttribute("id", id);
        	 }
        	 
        	else
        	{
        		String strid=session.getAttribute("id").toString();
        		id=Integer.parseInt((strid));
        	
        	}
        	try {
    			Class.forName("com.mysql.jdbc.Driver");
    		} catch (ClassNotFoundException e) {
    			// TODO Auto-generated catch block
    			e.printStackTrace();
    		}
            
            Connection conn;
                                
            try {
    			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/j2ee_job_seeker","root","root");
    			
    			String selectQuery = "select * from customer where Cus_Id=?";
    			
    			PreparedStatement ps = conn.prepareStatement(selectQuery);
    			ps.setInt(1, id);
    			ResultSet rs = ps.executeQuery();
    			while(rs.next())
    			{
        	%>
        	<div class="card">
        	<form action="edit" method="post" class="form-table" enctype="multipart/form-data">
        	<h1 style="text-align: center; padding: 3%;"> အချက်အလက် များပြင်ဆင်ပါ </h1>
        	<table>
        		<tr>
        			<td> <label> အမည်: </label> </td>
        			<td> <input type="text" name="name" value="<%= rs.getString(4) %>"/></td>
        		</tr>
        		<tr>
        			<td> <label>ဖုန်းနံပါတ်:</label> </td>
        			<td> <input type="text" name="phNo" value="<%= rs.getString(7) %>"/></td>
        		</tr>
        		<tr>
        			<td> <label>အီးမေးလ်:</label> </td>
        			<td> <input type="text" name="email" value="<%= rs.getString(8) %>"/></td>
        		</tr>
        		<tr>
        			<td> <label>ပညာအရည်အချင်း:</label> </td>
        			<td> 
        				<select name="education">
        					<option value="<%= rs.getString(9) %>"> <%= rs.getString(9) %> </option>
        					<option value="အထက်တန်းအောက်">အထက်တန်းအောက်</option>
							<option value="အထက်တန်းနှင့်အထက်">အထက်တန်းနှင့်အထက်</option>
							<option value="တက္ကသိုလ်/ကောလိပ် တက်ဆဲ">တက္ကသိုလ်/ကောလိပ် တက်ဆဲ</option>
		                    <option value="ဘွဲ့ရ">ဘွဲ့ရ</option>
        				</select>
        			</td>
        		</tr>
        		<tr>
        			<td> <label>ကွန်ပျူတာတက်ကျွမ်းမှုအဆင့်:</label> </td>
        			<td> 
        				<select name="computer">
        					<option value="<%= rs.getString(10) %>"> <%= rs.getString(10) %> </option>
        					<option value="မရှိပါ">မရှိပါ</option>
							<option value="အခြေခံ">အခြေခံ</option>
							<option value="ကောင်း">ကောင်း</option>
		                    <option value="အဆင့်မြင့်">အဆင့်မြင့်</option>
        				</select>
        			</td>
        		</tr>
        		<tr>
        			<td> <label>မျှော်မှန်းလစာ:</label> </td>
        			<td> <input type="text" name="salary" value="<%= rs.getString(11) %>"/></td>
        		</tr>
        		<tr>
        			<td> <label>အရင်တုန်းက လုပ်ဖူးသောအလုပ်များ:</label> </td>
        			<td> <textarea name="prevJobs"> <%= rs.getString(12) %> </textarea>
        			</td>
        		</tr>
        		<tr>
        			<td> <label>ပရိုဖိုင် ဓာတ်ပုံ</label> </td>
        			<td> <input type="file" name="profileImage"/> </td>
        		</tr>
        		<tr>
        		<td></td>	<td> <input type="hidden" name="id" value=<%=id%> /><input type="submit" class="button rounded-button-01" value="ပြင်မည်" /></td>
        		</tr>
        	</table>
        	</form>
        	
        	<%
	            }
	        } catch (SQLException e) {
	    			// TODO Auto-generated catch block
	    			e.printStackTrace();
	    		}
        	%>
        	<%
        	try {
    			Class.forName("com.mysql.jdbc.Driver");
    		} catch (ClassNotFoundException e) {
    			// TODO Auto-generated catch block
    			e.printStackTrace();
    		}
            
            
                                
            try {
    			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/j2ee_job_seeker","root","root");
    			
    			String selectQuery = "select distinct(filename) from userDocumentation where cusUserName=?";
    			
    			PreparedStatement ps = conn.prepareStatement(selectQuery);
    			ps.setString(1, cusUserName);
    			ResultSet rs = ps.executeQuery();
    			int countdoc=0;
    			while(rs.next())
    			{countdoc++;
        	%>
        	<%
	            }
    			if (countdoc==0)
    			{
    				out.print("<span style='color:black;font-weight:bold'>အခြားစာရွက်စာတမ်းများအား ထပ်မံပူးတွဲတင်ပြထားခြင်းမရှိသေးပါ</span>");   			}
    			else
    			{
    				out.print("<span style='color:black;font-weight:bold'><br>ထပ်မံပူးတွဲတင်ပြထားသော အခြားစာရွက်စာတမ်းများ</span>"); 
    				PreparedStatement ps3 = conn.prepareStatement(selectQuery);
        			ps3.setString(1, cusUserName);
        			ResultSet rs3 = ps3.executeQuery();
        			out.print("<table id=table2>");
        			while(rs3.next())
        			{
        				String str=rs3.getString(1);
          				String[] user=str.split("\\\\");
          				int i=user.length;
          				String filename=user[i-1];
          				
          
             %>
 <table>  <tr>    <td>  <a  href="download.jsp?name=<%=filename%>" target="_blank" class=pdflink><%=filename%></a>&nbsp;&nbsp;&nbsp;<a style="color:blue" href="deleteFile?name=<%=filename %>&id=<%=id%>">X</a></td></tr>
           <%

        			}
    				
    			}
    			
	        } catch (SQLException e) {
	    			// TODO Auto-generated catch block
	    			e.printStackTrace();
	    		}
          
        	%>
        	<tr><td colspan=2><br><br><span style='color:black;font-weight:bold'>အခြားစာရွက်စာတမ်းများအား ထပ်မံပူးတွဲတင်ပြရန်</span><br><br></td>
			        		</tr>
			        		<tr><td colspan=2>
			        		<form action="insertfile" method="post" enctype="multipart/form-data">
			        		
                        <input type="file" name="file" size="50" accept=".pdf" /><input type="submit" value="တင်မည်" /></form>
                      <br><br>  </td>

			        		</tr></table>
        	</div>
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