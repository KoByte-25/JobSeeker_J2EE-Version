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
	<!-- Basic Icons -->
	<link href="https://cdn.boxicons.com/3.0.8/fonts/basic/boxicons.min.css" rel="stylesheet">
	<!-- Filled Icons -->
	<link href="https://cdn.boxicons.com/3.0.8/fonts/filled/boxicons-filled.min.css" rel="stylesheet">
	<!-- Brand Icons -->
	<link href="https://cdn.boxicons.com/3.0.8/fonts/brands/boxicons-brands.min.css" rel="stylesheet">
	
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
        
        .profile-info .nextA
        {
        	border-radius: 50px;
        	box-shadow: 5px 5px 10px #000;
        	background: #fff;
        	color: black;
        	padding: 10px;
        	float: right;
        }
        
        .profile-info .finished
        {
        	border-radius: 50px;
        	box-shadow: 5px 5px 10px #000;
        	background: #fff;
        	color: black;
        	padding: 10px;
        	float: left;
        }
        
/* Modal background */
#modal {
    display: none;               /* hidden by default */
    position: fixed;
    inset: 0;                    /* top, right, bottom, left = 0 */
    background: rgba(0, 0, 0, 0.6); /* semi-transparent dark overlay */
    z-index: 9999;
    display: none;
    align-items: center;
    justify-content: center;
}

/* Modal content box */
.modal-box {
    background-color: #fff;
    width: 400px;                /* can adjust width */
    max-width: 90%;              /* responsive */
    padding: 25px 30px;
    border-radius: 12px;
    box-shadow: 0 8px 25px rgba(0, 0, 0, 0.3);
    position: relative;
    animation: slideDown 0.3s ease-out;
}

/* Close button */
.close {
    position: absolute;
    top: 12px;
    right: 15px;
    font-size: 24px;
    font-weight: bold;
    color: #333;
    cursor: pointer;
    transition: color 0.2s;
}

.close:hover {
    color: #ff4d4f;
}

/* Modal header */
.modal-box h2 {
    margin-top: 0;
    margin-bottom: 20px;
    font-size: 20px;
    text-align: center;
    color: #111;
}

/* Form inside modal */
#interviewForm label {
    display: block;
    font-weight: bold;
    margin-bottom: 5px;
    margin-top: 10px;
}

#interviewForm input[type="text"],
#interviewForm input[type="date"],
#interviewForm input[type="time"],
#interviewForm textarea {
    width: 100%;
    padding: 8px 10px;
    margin-bottom: 10px;
    border: 1px solid #ccc;
    border-radius: 6px;
    font-size: 14px;
    box-sizing: border-box;
}

/* Radio buttons */
#interviewForm input[type="radio"] {
    margin-right: 8px;
}

/* Submit button */
#interviewForm button[type="submit"] {
    width: 100%;
    padding: 10px;
    margin-top: 15px;
    background-color: #00b074;
    color: #fff;
    font-size: 16px;
    border: none;
    border-radius: 8px;
    cursor: pointer;
    transition: background 0.2s;
}

#interviewForm button[type="submit"]:hover {
    background-color: #00995e;
}

/* Slide down animation */
@keyframes slideDown {
    from {
        transform: translateY(-50px);
        opacity: 0;
    }
    to {
        transform: translateY(0);
        opacity: 1;
    }
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
                <a href="postAjob.jsp" id="textConfig" class="btn btn-primary rounded-0 py-4 px-lg-5 d-none d-lg-block">အလုပ်အသစ်တင်ရန်<i class="fa fa-arrow-right ms-3"></i></a>
            </div>
        </nav>
        <!-- Navbar End -->
        
        <div class="container-xxl py-5">
        
        <%
        	String comName = request.getParameter("comName");
        	String pos = request.getParameter("pos");
        	int jobId = Integer.parseInt(request.getParameter("jobId"));
        
        	try {
    			Class.forName("com.mysql.jdbc.Driver");
    		} catch (ClassNotFoundException e) {
    			// TODO Auto-generated catch block
    			e.printStackTrace();
    		}
            
            Connection conn;
                                
            try {
    			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/j2ee_job_seeker","root","root");
    			
    			String selectQuery = "select customer.fullname, customer.dob, customer.nrc, customer.phoneNo, customer.email, customer.education, customer.computer, customer.salary, customer.prevJobs, apply.experience from customer, apply where customer.cus_id=apply.cus_id and job_id=?";
    			
    			PreparedStatement ps = conn.prepareStatement(selectQuery);
    			ps.setInt(1, jobId);
    			ResultSet rs = ps.executeQuery();
    			
    			int len=0;
    			while(rs.next())
    			{
    				len++;
    			}
    			if(len>0)
    			{
    		%>
    				<h1 style="text-indent: 10px"> <%= comName %> ၏ <%= pos %> နေရာကို လျှောက်ထားသူများ</h1>
    				<div style="display: flex; flex-wrap: wrap; flex-direction: rows; width: auto; height: auto;">
    		<%
        			selectQuery = "select customer.fullname, customer.dob, customer.nrc, customer.phoneNo, customer.email, customer.education, customer.computer, customer.salary, customer.prevJobs, customer.cus_Id, customer.cusUserName, apply.experience, customer.reported as cusRP from customer, apply where customer.cus_id=apply.cus_id and job_id=?";

    				ps = conn.prepareStatement(selectQuery);
					ps.setInt(1, jobId);
					rs = ps.executeQuery();
					
	    			while(rs.next())
	    			{
    		%>
    				<div class="profile-container">
    				<a href="reportUser?cusid=<%= rs.getInt(10) %>" style="float: right; font-size: 50px;"> <i class='bx bx-alert-octagon' style="color: red;"></i> </a>
			        <img class="profile-picture" src="profileimage?cusid=<%= rs.getInt(10) %>" alt="Profile Picture">
			        
			        <%
			        if(rs.getInt("cusRP")==1)
			        {
			        %>
			        <h2 class="profile-name" style="color: red;"><%= rs.getString(1) %></h2>
			        <%
			        }
			        else
			        {
			        %>
			        <h2 class="profile-name"><%= rs.getString(1) %></h2>			        
			        <%
			        }
			        %>
			        
			        <div class="profile-info">
			           <table class="table1">
			        		<tr>
			        			<td> မွေးသက္ကရာဇ်: </td>
			        			<td> <%= rs.getString(2) %> </td>
			        		</tr>
			        		<tr>
			        			<td> မှတ်ပုံတင်အမှတ်: </td>
			        			<td> <%= rs.getString(3) %> </td>
			        		</tr>
			        		<tr>
			        			<td> ဖုန်းနံပါတ်: </td>
			        			<td> <%= rs.getString(4) %></td>
			        		</tr>
			        		<tr>
			        			<td> အီးမေးလ်: </td>
			        			<td> <%= rs.getString(5) %></td>
			        		</tr>
			        		<tr>
			        			<td> ပညာအရည်အချင်း: </td>
			        			<td> <%= rs.getString(6) %></td>
			        		</tr>
			        		<tr>
			        			<td> ကွန်ပျူတာတက်ကျွမ်းမှုအဆင့်: </td>
			        			<td> <%= rs.getString(7) %></td>
			        		</tr>
			        		<tr>
			        			<td> မျှော်မှန်းလစာ: </td>
			        			<td> <%= rs.getInt(8) %></td>
			        		</tr>
			        		<tr>
			        			<td> အရင်တုန်းက လုပ်ဖူးသောအလုပ်များ: </td>
			        			<td> <%= rs.getString(9) %></td>
			        		</tr>
			        		<tr>
			        			<td>  လုပ်ငန်း အတွေ့အကြုံ : </td>
			        			<td> <%= rs.getString(12) %></td>
			        		</tr>
			        		<tr>
			        		<%   		  try {
    			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/j2ee_job_seeker","root","root");
    			
    			String selectQuery1 = "select distinct(filename) from userDocumentation where cusUserName=?";
    			
    			PreparedStatement ps1 = conn.prepareStatement(selectQuery1);
    			ps1.setString(1, rs.getString(11));
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
        			ps3.setString(1, rs.getString(11));
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
		        		<br>
		        		
			        	<%
			        		int cusid = rs.getInt(10);
			        		int count = 0;
			        		
			        		String selectQuery1 = "select * from interview where job_id=? and cus_id=?";
			        		PreparedStatement ps1 = conn.prepareStatement(selectQuery1);
			        		ps1.setInt(1, jobId);
			        		ps1.setInt(2, cusid);
			        		ResultSet rs1 = ps1.executeQuery();
			        		while(rs1.next())
			        		{
			        			count++;
			        		}
			        		if(count>0)
			        		{
			        	%>
			        			<span style="color: white; font-size: 20px; font-weight: bold;"> အင်တာဗျူးခေါ်ထားပါသည် </span>
			        			<a class="nextA" href="deleteInterview?job_id=<%= jobId %>&cus_id=<%= rs.getInt(10) %>"> မခေါ်တော့ပါ </a>
			        	<%
			        		}
			        		else
			        		{
			        	%>
<%-- 							<a class="nextA" href="interview?job_id=<%= jobId %>&cus_id=<%= rs.getInt(10) %>"> အင်တာဗျူးခေါ်မည်</a> --%>
								<a href="#" class="nextA openModalBtn" data-jobid="<%= jobId %>" data-cusid="<%= rs.getInt(10) %>" > အင်တာဗျူးခေါ်မည် </a>	
																			
			        	<%
			        		}	
			        	%>
			      </div>
	    		</div>
    		<%		
    				}
	    	%>
	        <%
    			}
    			else
    			{
    		%>
    			</div>
    			<h1> <%= comName %> ၏ <%= pos %> နေရာကို လျှောက်ထားသူများ မရှိပါ။</h1>
    		
    		<%
    			}
    		
	        } catch (SQLException e) {
	    			// TODO Auto-generated catch block
	    			e.printStackTrace();
	    		}
        	%>
        	
        	<div id="modal" class="modal">
									  <div class="modal-box">
									    <span id="closeModal" class="close">&times;	</span>
									    <h2>အင်တာဗျူး အချက်အလက်များ ဖြည့်ပါ  </h2>
									    <form action="interview" method="post" id="interviewForm">
									        <input type="hidden" name="job_id" id="modalJobId">
									    	<input type="hidden" name="cus_id" id="modalCusId">
									      <label> နေ့ရက် </label> <input type="date" placeholder="နေ့ရက်"  name="startDate" required>
									      
									      <label> အချိန် </label> <input type="time" placeholder="အချိန်" name="startTime" required>
									      
									      
									        <label>
									            <input type="radio" name="source" value="online" onclick="toggleFields()">
									            အွန်လိုင်းမှ တစ်ဆင့် အင်တာဗျူးမည်
									        </label>
									
									        <label>
									            <input type="radio" name="source" value="offline" onclick="toggleFields()">
									            အပြင်မှာ အင်တာဗျူးမည်
									        </label>
									
									        
									
									        <!-- Online fields -->
									        <div id="onlineFields" style="display:none;">
									            <label> Application အမျိုးအစား  </label><input type="text" name="website" placeholder="Zoom/Google Meet"><br>
									            <label> Link </label><textarea name="refId" placeholder="Reference ID" rows="4" cols="30"></textarea><br>
									        </div>
									
									        <!-- Offline field -->
									        <div id="offlineFields" style="display:none;">
									            <label> နေရာ </label><input type="text" name="location" placeholder="Location"><br>
									        </div>
									
									
									      <button type="submit">အင်တာဗျူး ခေါ်မည်</button>
									    </form>
									  </div>
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
    	
    <script>
  const modal = document.getElementById("modal");
  const close = document.getElementById("closeModal");

  document.querySelectorAll(".openModalBtn").forEach(btn => {
      btn.addEventListener("click", e => {
          e.preventDefault();
          document.getElementById("modalJobId").value = btn.dataset.jobid;
          document.getElementById("modalCusId").value = btn.dataset.cusid;
          modal.style.display = "flex";
      });
  });

  close.onclick = () => {
	  modal.style.display = "none";
	  document.getElementById("interviewForm").reset();
	  document.getElementById("onlineFields").style.display = "none";
	  document.getElementById("offlineFields").style.display = "none";
	};
  modal.onclick = e => { if(e.target === modal) modal.style.display = "none"; };

  
  function toggleFields() {
  const source = document.querySelector('input[name="source"]:checked').value;

  document.getElementById("onlineFields").style.display =
    source === "online" ? "block" : "none";

  document.getElementById("offlineFields").style.display =
    source === "offline" ? "block" : "none";
}
</script>	
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