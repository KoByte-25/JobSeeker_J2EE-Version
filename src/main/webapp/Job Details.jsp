<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <title>Job Details</title>
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
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
    
    <style>
    	#textConfig
    	{
    		font-size: 17px;
    	}
    	
    	table
    	{
    		width: 100%;
    	}
    	
    	table tr .col1
    	{
    		width: 40%;
    	}
    	
    	table tr .col2
    	{
    		width: 330px;
    	}
    	
    	table tr th, td
    	{
    		padding: 3% 1%;
    		border-bottom: 1px solid #00b474;	
    	}
    	
    	table tr .col2
    	{
    		border-left: 1px solid #00b474;	
    		border-right: 1px solid #00b474;	
    	}
    	
    	.animate-top{
    position:relative;
    animation:animatetop 0.4s
}
@keyframes animatetop{
    from{top:-300px;opacity:0} 
    to{top:0;opacity:1}
}
.modal {
  display: none;
  position: fixed;
  z-index: 1;
  left: 0;
  top: 0;
  width: 100%;
  height: 100%;
  overflow: auto;
  background-color: rgba(0, 0, 0, 0.275);
  margin-top: 200px;
}

.modal-content {
  margin: 5% auto;
  width: 500px;
  max-width: 90%;
  background-color: #fff;
  border: 1px solid rgba(0, 0, 0, 0.175);
  border-radius: .3rem;
  outline: 0;
}
.modal-header {
    display: -webkit-box;
    display: -ms-flexbox;
    display: flex;
    -webkit-box-align: start;
    -ms-flex-align: start;
    align-items: flex-start;
    -webkit-box-pack: justify;
    -ms-flex-pack: justify;
    justify-content: space-between;
    padding: 1rem;
    border-bottom: 1px solid #e9ecef;
    border-top-left-radius: .3rem;
    border-top-right-radius: .3rem;
}
.modal-title {
    margin-bottom: 0;
    line-height: 1.5;
    margin-top: 0;
    font-size: 1.25rem;
}
.modal-header .close {
    float: right;
    font-size: 1.5rem;
    font-weight: 700;
    line-height: 1;
    color: #000;
    text-shadow: 0 1px 0 #fff;
    opacity: .5;
    padding: 1rem;
    margin: -1rem -1rem -1rem auto;
    background-color: transparent;
    border: 0;
}
.close:not(:disabled):not(.disabled) {
    cursor: pointer;
}

.modal-body {
    flex: 1 1 auto;
    padding: 1rem;
}
.modal-body p {
    margin-top: 0;
    margin-bottom: 1rem;
}
.modal-footer {
    display: -webkit-box;
    display: -ms-flexbox;
    display: flex;
    -webkit-box-align: center;
    -ms-flex-align: center;
    align-items: center;
    -webkit-box-pack: end;
    -ms-flex-pack: end;
    justify-content: flex-end;
    padding: 1rem;
    border-top: 1px solid #e9ecef;
}
.modal-footer>*{
    margin: 5px;
}

/* buttons */
.btn {
    display: inline-block;
    font-weight: 400;
    text-align: center;
    white-space: nowrap;
    vertical-align: middle;
    border: 1px solid transparent;
    padding: .375rem .75rem;
    font-size: 1rem;
    line-height: 1.5;
    border-radius: .25rem;
    cursor: pointer;
}
.btn:focus, .btn:hover {
    text-decoration: none;
}
.btn-primary {
    color: #fff;
    background-color: #00b474;
}
.btn-primary:hover {
    color: #fff;
    background-color: #43b88f;
}
.btn-secondary {
    color: #fff;
    background-color: #00b474;
}
.btn-secondary:hover {
    color: #fff;
    background-color: #43b88f;
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
                    	String cusUserName = (String) session.getAttribute("cusUserName");
                    
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
						int job_Id = Integer.parseInt(request.getParameter("job_Id"));
						
	                        try {
	                  			Class.forName("com.mysql.jdbc.Driver");
	                  		} catch (ClassNotFoundException e) {
	                  			// TODO Auto-generated catch block
	                  			e.printStackTrace();
	                  		} 
	                  		Connection conn;
	                  		try {
	                  			conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/j2ee_job_seeker","root","root");
		                        String selectquery="select * from jobs where Job_Id=?";
		                        
	                  			PreparedStatement ps=conn.prepareStatement(selectquery);
	                  			ps.setInt(1, job_Id);
	                  			
	                  			ResultSet rs=ps.executeQuery();
	                  			while(rs.next()){
                  		
                  	%>
        <!-- Header End -->
        <div class="container-xxl py-5 bg-dark page-header mb-5" style="background: url(./Photo/background/bg1.jpg) center center no-repeat; background-size: cover;">
            <div class="container my-5 pt-5 pb-4">
                <h1 class="display-3 text-black mb-3 animated slideInDown"><%= rs.getString(2) %></h1>
                <nav aria-label="breadcrumb">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item" ><a href="index.jsp" style="color: black; font-size: 20px;">ပင်မ</a></li>
                        <li class="breadcrumb-item"><a href="index.jsp" style="color: black; font-size: 20px;">ကဏ္ဍများ</a></li>
                        <li class="breadcrumb-item text-white active" aria-current="page">
                        <%
                        if(rs.getString(3).equals("ဆိုင်များ"))
                        {
                        	%>
                        	<a href="index.jsp" style="color: black; font-size: 20px;">ဆိုင်များ</a>
                        	<%
                        }
                        else if(rs.getString(3).equals("စက်ရုံများ"))
                        {
                        	%>
                        	<a href="factory.jsp" style="color: black; font-size: 20px;">စက်ရုံများ</a>
                        	<%
                        }
                        else if(rs.getString(3).equals("ဘဏ်"))
                        {
                        	%>
                        	<a href="bank.jsp" style="color: black; font-size: 20px;">ဘဏ်</a>
                        	<%
                        }
                        else if(rs.getString(3).equals("အစိုးရရုံးများ"))
                        {
                        	%>
                        	<a href="goverment.jsp" style="color: black; font-size: 20px;">အစိုးရရုံးများ</a>
                        	<%
                        }
                        else if(rs.getString(3).equals("ပုဂ္ဂလိကရုံးများ"))
                        {
                        	%>
                        	<a href="private.jsp" style="color: black; font-size: 20px;">ပုဂ္ဂလိကရုံးများ</a>
                        	<%
                        }
                        %>
                        
                        </li>
                    </ol>
                </nav>
            </div>
        </div>
        <!-- Header End -->


        <!-- About Start -->
        <div class="container-xxl py-5">
            <div class="container">
                <div class="row g-5 align-items-center">
                    <div class="col-lg-6 wow fadeIn" data-wow-delay="0.1s">
                        <div class="row g-0 about-bg rounded overflow-hidden">
                        	<img class="img-fluid" src="getJob?job_Id=<%= rs.getInt(1) %>" style="width: 100%; height: 500px;">
                        </div>
                    </div>
                    <div class="col-lg-6 wow fadeIn" data-wow-delay="0.5s">
                        <h1 class="mb-4"><%= rs.getString(2) %></h1>
                        <p><i class="fa fa-star text-primary me-3"></i><%= rs.getString(4) %></p>
                        <p><i class="fa fa-map-marker-alt text-primary me-3"></i><%= rs.getString(5) %> ၊ <%= rs.getString(6) %></p>
                        <p><i class="far fa-money-bill-alt text-primary me-3"></i>
                        <% 
                        	if(rs.getString(7).equals("နေ့စား"))
                        	{
                        		%>
                        			နေ့စား လုပ်အားခ - <%= rs.getInt(8) %> ကျပ်
                        		<%
                        	}
                        	
                        	else
                        	{
                        		%>
                    			အခြေခံ လစာ - <%= rs.getInt(8) %> ကျပ်
                    		<%
                        	}
                        %>
                        </p>
                        <p><i class="text-primary me-3"><img src="./Photo/icon/age-group.jpg" width="20px" height="20px"></i> အသက် <%= rs.getString(14) %> မှ <%= rs.getString(15) %> အတွင်း</p>                    
                        <p><i class="fa fa-check text-primary me-3"></i><%= rs.getString(9) %></p>
                        <p><i class="fa fa-clock text-primary me-3"></i><%= rs.getString(10) %></p>
                        	<form action="apply" method="post">
                        		<i class="fa fa-question text-primary me-3"></i>လုပ်ငန်းအတွေ့အကြုံ
                        		<input type="radio" name="experience" value="ရှိပါသည်"> ရှိပါသည်
                        		<input type="radio" name="experience" value="မရှိပါ"> မရှိပါ
                        		<br>
                        		<%
                        try {
                			Class.forName("com.mysql.jdbc.Driver");
                		} catch (ClassNotFoundException e) {
                			// TODO Auto-generated catch block
                			e.printStackTrace();
                		}
                                                                    
                        try {
                			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/j2ee_job_seeker","root","root");
                			
                			int count=0;
                			String selectQuery = "select * from recommend where job_id=?";
                			                			
                			PreparedStatement ps1 = conn.prepareStatement(selectQuery);
                			ps1.setInt(1, rs.getInt(1));
                			ResultSet rs1 = ps1.executeQuery();
                			while(rs1.next())
                			{
                				count++;
                			}
                			if(count>0)
                			{
                		%>
                				<table>
                				<tr>
                					<th colspan="3"> <i class="fa fa-thumbs-up text-primary me-3"></i>ယခုအလုပ်အတွက် တက်ရောက်ထားရန် အကြံပြုလိုသော သင်တန်းများ </th>
                				</tr>
                		<%
                				rs1 = ps1.executeQuery();
                				while(rs1.next())
                				{
                		%>
                				
                					<tr>
                						<td class="col1"> <%= rs1.getString(2) %> </td>
                						<td class="col2"> <%= rs1.getString(3) %> </td>
                						<td class="col3"> <div style="border-radius: 30%; border: 1px solid #00b474; height: 40px; width: auto; text-align:center;"><a href="<%= rs1.getString(4)%>"><i class="fab fa-facebook-f" style="font-size: 30px; padding-top:15%;"></i></a></div></td>
                					</tr>
                				
                				
                		<%
                				}
                		%>
                			</table>
                		<%
                        	}
                			else
                			{
                		%>
                			
                		<%
                			}
				        } catch (SQLException e) {
				           // TODO Auto-generated catch block
				           e.printStackTrace();
				        }
                        %>
                        		<input type="hidden" name="job_Id" value="<%= rs.getString(1)%>"/>
                        		<input type="hidden" name="comName" value="<%= rs.getString(2)%>"/>
	                       		<input type="hidden" name="pos" value="<%= rs.getString(4)%>"/>
	                       		<%
	                       			int cid = 0, count=0;
	                       		
	                       			String selectQuery = "select cus_id from customer where cususername=?";
	                       			PreparedStatement ps1 = conn.prepareStatement(selectQuery);
	                       			ps1.setString(1, cusUserName);
	                       			ResultSet rs1 = ps1.executeQuery();
	                       			while(rs1.next())
	                       			{
	                       				cid = rs1.getInt(1);
	                       			}
	                       			selectQuery = "select * from apply where job_id=? and cus_id=?";
	                       			ps1 = conn.prepareStatement(selectQuery);
	                       			ps1.setInt(1, job_Id);
	                       			ps1.setInt(2, cid);
	                       			rs1 = ps1.executeQuery();
	                       			while(rs1.next())
	                       			{
	                       				count++;
	                       			}
	                       			if(count>0)
	                       			{
	                       		
	                       		%>
	                       			<p style="color: #00b474; padding-top: 10%; font-size: 20px;"> သင်အခုအလုပ်ကို လျှောက်ထားပြီး ဖြစ်ပါသည်။</p>
	                       		<%
	                       			}
	                       			else{
	                       		%>
                        		<!-- Button to trigger modal -->
                        		<p></p>
                        	<p id="errorMessage" style="color: red; font-weight: bold;">  </p>                        		
							<button type=button id="mbtn" class="btn btn-primary py-3 px-5 mt-3">လျှောက်ရန်</button>
                        		<!--  <input class="btn btn-primary py-3 px-5 mt-3" type="submit" value="လျှောက်ရန်">-->
                        		<%
	                       			}
                        		%>
                        		
                        		<div id="modalDialog" class="modal">
    <div class="modal-content animate-top">
        <div class="modal-header">
            <h5 class="modal-title">သင် ဒီအလုပ်ကို အမှန်တကယ်လျှောက်လိုပါသလား? </h5>
            <button type="button" class="close">
                <span aria-hidden="true">x</span>
            </button>
        </div>
        
        <div class="modal-footer">
            <button type="button" class="btn btn-secondary close">မလျှောက်တော့ပါ</button>
            <button type="submit" class="btn btn-primary">လျှောက်မည်</button>
        </div>
    </div>
</div>
                        	</form>
                    </div>
                </div>
            </div>
        </div>
        <!-- About End -->
					<%}
	                			
	                		} catch (SQLException e) {
	                			// TODO Auto-generated catch block
	                			e.printStackTrace();
	                		} 
	                %>

        <!-- Footer Start -->
        <div class="container-fluid bg-dark text-white-50 footer pt-5 mt-5 wow fadeIn" data-wow-delay="0.1s" id="here">
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
 // Get the modal
    var modal = $('#modalDialog');

    // Get the button that opens the modal
    var btn = $("#mbtn");

    // Get the <span> element that closes the modal
    var span = $(".close");

    $(document).ready(function(){
        // When the user clicks the button, open the modal 
        btn.on('click', function() {
            modal.show();
        });
        
        // When the user clicks on <span> (x), close the modal
        span.on('click', function() {
            modal.fadeOut();
        });
    });

    // When the user clicks anywhere outside of the modal, close it
    $('body').bind('click', function(e){
        if($(e.target).hasClass("modal")){
            modal.fadeOut();
        }
    });
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