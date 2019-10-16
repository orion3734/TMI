<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>


<!-- 수정사항 -->
<!-- 밑에 id change div에 이메일있으면 있다 없다 표시할껀데 위치조정하든지 ㄲㄲ -->

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<link
	href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:100,400,700|Raleway:100,400,700,900|Dancing+Script:400,700&display=swap"
	rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<title>Document</title>
<script>
	$(document).ready(function() {
		function animateDivers() {
			$('#logo').css({
				'background-position-x' : '0px'
			});
			$('#logo').animate({
				'background-position-x' : '-1000px'
			}, 1000, animateDivers);
		}

		$("#send_email").on('click',function(){
			
		
			$.ajax({

				url : "change_pwd_post?id="+$("#signinEmail").val(),

				type : "get",

				dataType : "text",

				success : function(data) {
				
                   if(data=="true")
                	   {
                	   swal("Good job!", "이메일을 확인해주세요!", "success")
						.then((value) => {
							location.href="home";
						});
                	   }
                   else
                	   {
                	   swal("Warning", "일치하는 Email이 없습니다.",
						"error");
                	   }
				}


			});
		})
		


		animateDivers();
	});
</script>
<style>
* {
	margin: 0;
	padding: 0;
}

#bodywrap {
	width: 100%;
	height: 1000px;
	background: rgb(252, 247, 253);
}

#content {
	
}

.center_div {
	position: absolute;
	left: 50%;
	transform: translate(-50%, 0);
}

#logo {
	width: 550px;
	text-align: center;
	font-size: 135px;
	font-family: 'Dancing Script', cursive;
	color: white;
	font-weight: 700;
	opacity: 0.9;
	background: linear-gradient(-120deg, #12c2e9, #c471ed, #f64f59, #c471ed, #12c2e9);
	-webkit-background-clip: text;
	-webkit-text-fill-color: transparent;
	background-position-x: 0px;
	background-size: 1000px;
	margin-top: 100px;
}

#SigninForm {
	margin: 0 auto;
	padding-top: 15px;
	margin-top: 300px;
	width: 480px;
	height: 288px;
	background: rgb(255, 255, 255);
	border-radius: 5px;
	border: 1px solid rgba(5, 5, 5, 0.2);
	box-sizing: border-box;
	padding-top: 36px;
}

label {
	font-size: 16px;
	margin-left: 33px;
	font-family: 'Noto Sans KR', sans-serif;
	margin-bottom: 15px;
	display: block;
	color: rgb(10, 10, 10);
}

#SigninForm input {
	display: block;
	width: 410px;
	border-radius: 5px;
	margin-left: 31px;
	margin-bottom: 5px;
	padding-left: 10px;
}

.signinText {
	border: 1px solid rgba(5, 5, 5, 0.2);
	height: 48px;
}

#send_email {
	background: linear-gradient(-120deg, #12c2e9, #c471ed, #f64f59);
	background-size: 150%;
	border: none;
	color: white;
	height: 71px;
	font-size: 32px;
	font-family: 'Raleway', sans-serif;
	font-weight: 100;
	transition: 0.5s;
	cursor: pointer;
	margin-top: 19px;
}

#send_email:hover {
	background-position-x: 100%;
}

</style>
</head>
<body>
	<div id='bodywrap'>
		<div id='content'>
			<div id='logo' class='center_div'>T.M.info</div>
			<div id='SigninForm' class='center_div'>
				<form action="change_pwd_post">
					<label for="signinEmail">Enter your email address and we
						will send you a link to reset your password.</label> <input type="text"
						name="id" class='signinText' id='signinEmail'
						placeholder="enter your email address"> <input
						type="button" id='send_email' value='Send E-mail'>
				</form>
				<div id="change"></div>
			</div>
		
		</div>
	</div>
</body>
</html>