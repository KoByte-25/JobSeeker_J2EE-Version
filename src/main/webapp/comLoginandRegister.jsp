<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="IE-edge">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css" integrity="sha384-DyZ88mC6Up2uqS4h/KRgHuoeGwBcD4Ng9SiP4dIRy0EXTlnuz47vAwmeGwVChigm" crossorigin="anonymous"/>
    <title>Company login-register</title>
    <link href="img/favicon.ico" rel="icon">
    <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
    <style>
    *{
	margin: 0;
	padding: 0;
	box-sizing:border-box;
	font-family: 'Poppins' , sans=serif;
}
body{
	display: flex;
	align-items: center;
	justify-content: center;
	min-height: 100vh;
	background: (0,1,1);
}
.container{
	position: relative;
	width: 80vw;
	height: 80vh;
	border-radius: 15px;
	box-shadow: 0 4px 20px 0px rgba(0,0,0,0.3),0 6px 20px 0 rgba(0,0,0,0.3);
   overflow: hidden;

}
.container::before{
	content: "";
	position: absolute;
	top:0;
    left:-50%;
	width: 100%;
	height: 100%;
	background: linear-gradient(45deg,#9af1d4,#555);
	z-index: 6;
	transform: translateX(100%);
    transition: 1s ease-in-out;
}
.login-register{
	position: absolute;
	left:0;
	top:0;
	width:100%;
	height: 100%;
	display: flex;
	align-items: center;
	justify-content: space-around;
	z-index: 5;
}
form{
	display: flex;
	align-items: center;
	justify-content: center;
	flex-direction: column;
	width: 40%;
	min-width: 238px;
	padding:0 10px;

  
}
form.login-form{
	opacity:1;
	transition: 0.5s ease-in-out;
	transition-delay: 1s;
}
form.register-form{
	opacity:1;
	transition: 0.5s ease-in-out;
	transition-delay: 1s;
}
.title{
	font-size: 35px;
	color:#555f00;
	margin-bottom: 10px;
}
.input-field{
	width:90%;
	height: 45px;
	background: #f0f0f0;
	margin:10px 0;
	border:1px solid #85bbbd;
	border-radius: 0px;
	display: flex;
	align-items: center;
    cursor: pointer;
}
.input-field i{
	flex:1;
	text-align: center;
	color:#666;
	font-size: 20px;
	
    padding-top:13px;
    padding-bottom: 12px;
	
	background: linear-gradient(45deg,#9af1d4,#555);
;
    

	



}
.input-field input{
	flex: 5;
    background: none;
    border:none;
    outline:none;
    width:100%;
    height: 45px;
    font-size: 15px;
    font-weight: 400;
    color:#85bbbd;
    text-indent: 10px;
}
::placeholder
{
	color: #00b474;
}

.select{
	width:100%;
	height: 45px;
	background: #f0f0f0;
	font-size: 16px;
    font-weight: 400;
    padding:auto;
	border:1px solid #85bbbd;
	border-radius: 0px;
	display: flex;
	
	
}

.select1{
	width:100%;
	height: 45px;
	background: #f0f0f0;
    font-size: 16px;
    font-weight: 400;
	border:1px solid #85bbbd;
	border-radius: 0px;
	display: flex;

	
}
.btn{
	width:150px;
	height: 50px;
	border:none;
	border-radius: 50px;
	box-shadow: 5px 5px 10px #000000;
	background: linear-gradient(45deg,#9af1d4,#555);
	color:#fff;
	font-weight: 600;
	margin:5px 0;
	text-transform: uppercase;
	cursor: pointer;
}
.btn:hover{
	background: #df4adf;
}
.social-media{
	display: flex;
	justify-content: center;
}
.social-icon{
	height: 45px;
	width: 45px;
	display: flex;
	align-items: center;
	justify-content: center;
	color:skyblue;
	border:1px solid black;
	border-radius: 50px;
	margin:0 5px;
}
.text{
	width:100%;
	height: 50px;
	background: #f0f0f0;
	border:1px solid #85bbbd;
	border-radius: 0px;
	align-items: center;


}
a{
	text-decoration:none;

}
.social-icon:hover{
	color:skybue;
	border-color: #df4adf;
}
.panels-container{
	position: absolute;
	top:0;
	left: 0;
	width: 100%;
	height: 100%;
	display: flex;
	align-items: center;
	justify-content:space-around;
}

.panel{
	display: flex;
	flex-direction:column;
	align-items:center;
	justify-content: space-around;
	width:100%;
	margin:100px;
	padding:0 20px;
	text-align: center;
	z-index: 6;

}

.panel h3{
	font-size: 24px;
	padding:10px;
}
.panel p{
	font-size: 15px;
	font-weight: 10px;
}
.content{
	color:white;
	transition: 1.1s ease-in-out;
	transition-delay: 0.5s;
}
.image{
	width:200%;
	
	transition: 1.1s ease-in-out;
	transition-delay: 0.4s;
}
.left-panel{
	pointer-events: none;

}
.left-panel .image,
.left-panel  .content{
	transform: translateX(-200%);
}
.right-panel .image,
.right-panel .content{
	transform: translateX(0);
}

.container.register-mode::before{
    transform: translateX(0);
}
.container.register-mode .right-panel .image,
.container.register-mode .right-panel .content{
	transform: translateX(200%);
}
.container.register-mode .left-panel .image,
.container.register-mode .left-panel .content{
	transform: translateX(0);
}
.container.register-mode form.login-form{
	opacity: 0;
}
.container.register-mode form.register-form{
	opacity: 1;
}
.container.register-mode .right-panel{
	pointer-events: none;
}
.container.register-mode .left-panel{
	pointer-events: all;}
    </style>
</head>
<body>
<div class="container">
       <div class="login-register">
              <form action="companyLogin" class="login-form" method="post">
                 <h2 class="title">ကုမ္ပဏီအကောင့်ဖြင့်ဝင်ရောက်ပါ</h2>
                 <p id="loginfailmessage" style="color: red;"></p>
                   <div class="input-field">
                      <i class="fas fa-user"></i>
                      <input type="text" placeholder="အသုံးပြုသူအမည်" name="name" required>
                   </div>
                   <div class="input-field">
                      <i class="fas fa-lock"></i>
                      <input type="password" placeholder="လျှို့ဝှက်နံပါတ်" name="pwd" required>
                  </div>
                      <input type="submit" value="အကောင့်၀င်မည်" class="btn">
              <p class="social-text"></p>
              </form>
             


              <form action="companyRegister" class="register-form" method="post">
                 <h2 class="title">ကုမ္ပဏီ ပရိုဖိုင်ဖန်တီးရန် ခုပဲ မှတ်ပုံတင်လိုက်ပါ</h2>
                 <p id="registerfailmessage" style="color: red;"></p>
                   <div class="input-field">
                     <i class="fas fa-user"></i>
                     <input type="text" placeholder="အသုံးပြုသူအမည်" name="username" required>
                   </div>
                   <div class="input-field">
                     <i class="fas fa-lock"></i>
                     <input type="password" placeholder="လျှို့ဝှက်နံပါတ်" name="pwd" required>
                   </div>
                   <div class="input-field">
                     <i class="fas fa-phone"></i>
                     <input type="text" placeholder="ဆက်သွယ်ရန် ဖုန်းနံပါတ်" name="phNo" required>
                   </div>
                   <div class="input-field">
                     <i class="fas fa-envelope"></i>
                     <input type="text" placeholder="ဆက်သွယ်ရန် အီးမေး" name="email" required>
                   </div>
                     <input type="submit" value="မှတ်ပုံတင်မည်" class="btn">
           
        </form>
    </div>
    <div class="panels-container">
      <div class="panel left-panel">
        <div class="content">
          <h3>အကောင့်ရှိပြီးသားလား?</h3>
          <p>ဒီမှာဝင်ပါ။</p>
          <button class="btn" id="login-btn">အကောင့်၀င်မည်</button>
        </div>
        <img src="" alt="" class="image">
      </div>
      <div class="panel right-panel">
        <div class="content">
          <h3>အကောင့်မရှိသေးဘူးလား?</h3>
          <p>အခုပဲ အကောင့်မှတ်ပုံတင်လိုက်ပါ။</p>
          <button class="btn" id="register-btn">အကောင့်ဖွင့်မည်</button>
        </div>
        <img src="" alt="" class="image">
      </div>
    </div>
    </div>
    
    <!-- js plugins -->
    <script>
    const login_btn=document.querySelector("#login-btn");
    const register_btn=document.querySelector("#register-btn");
    const container=document.querySelector(".container");

    register_btn.addEventListener("click", () => {
    	 container.classList.add("register-mode");
    });
    login_btn.addEventListener("click", () => {
    	 container.classList.remove("register-mode");
    });
    </script>
</body>
</html>