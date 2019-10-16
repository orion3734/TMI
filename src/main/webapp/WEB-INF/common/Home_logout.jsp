<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-------------------------------------- 제이쿼리 연결 -------------------------------------->
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>

<!-------------------------------------- js,css연결 -------------------------------------->

<script src="/tmi/js/home.js" type='text/javascript'></script>
<script src="/tmi/js/COMMON.js" type='text/javascript'></script>
<link href='/tmi/css/homeLogout.css' type='text/css' rel='stylesheet'>
<link href='/tmi/css/COMMON.css' type='text/css' rel='stylesheet'>

<!---------------------------------------- 웹폰트 연결 ---------------------------------------->
<link
	href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:100,400,700|Raleway:100,400,700,900|Dancing+Script:400,700&display=swap"
	rel="stylesheet">
	
<!---------------------------------------- 헤더 연결 ---------------------------------------->
<jsp:include page="../include/Header.jsp"></jsp:include>

<!-------------------------------------- bxslider 연결 -------------------------------------->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
<script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>
<link rel="stylesheet" type="text/css" href="/tmi/css/simptip.css" />

 <style type="text/css">
 .aaa{
 	    margin-top: -30px;
    display: block;
    margin-bottom: 30px;
 }
 .bx-wrapper{
 	margin: auto;
 }
 #ex{
 	font-size: 30px;
    font-weight: bold;
    margin: 15px 0px;
 }
 
 </style>
</head>
<body>
	<div class="section" id='bodywrap'>
		<div id="signUpArea">
			<div id="content" class='center_box'>
				<div id='textArea'>
					<h1 class='no-drag tmi_skin tmi_skin1'>
						Task <br>Management<br>Info
					</h1>
					<h3 class='no-drag tmi_skin tmi_skin1'>TMI is a project management tool
						inspired by minimalism. From university team projects to business,
						simple tasks make it easy and fast to control and manage projects.</h3>
				</div>
				<div id='signForm'>
				 <form action="sign_up" method="post">
				 <label for="signUp_email">Email</label>
                            <input type="text" name="id" id="signUp_email" 
                            class="signIn" autocomplete="off">
                            
                            <label for="signUp_username">Username</label>
                            <input type="text" name="name" id="signUp_username" class="signIn" autocomplete="off">
                            
                            <label for="signUp_password">Password</label>
                            <input type="password" name="pwd" id="signUp_password" class="signIn" autocomplete="off">
						<div id="signUpSubmitArea">
							<input type="submit" name="" id="signUpSubmit"
								value="Sign up for TMI" class='tmi_skin tmi_skin1'>
							<a href="${google_url}"><img width="300" height="80"
								src="/tmi/resources/memberimg/login_google.png" /></a>
						</div>
						<div id="signInfo">By clicking “Sign up for TMI”, you
							agree to our Terms of Service and Privacy Statement. We’ll
							occasionally send you account related emails.</div>
					</form>
				</div>
			</div>
		</div>
		<div id='info' class='tmi_skin tmi_skin1'></div>
		</div>
		<div class="section" style="text-align: center;">
		<div id="ex">왜 TMI인가요?</div>
		<div id='youtube'>
			<img alt="" src="/tmi/resources/tutoImg/tuto1.png" >
			<img alt="" src="/tmi/resources/tutoImg/tuto2.png" >
			<img alt="" src="/tmi/resources/tutoImg/tuto3.png" >
			<img alt="" src="/tmi/resources/tutoImg/tuto4.png" >
			<img alt="" src="/tmi/resources/tutoImg/tuto5.png" >
		</div>
	</div>
</body>
<script type="text/javascript">

  $('#youtube').bxSlider({
	  slideWidth:'1500'
  });
	
</script>
</html>