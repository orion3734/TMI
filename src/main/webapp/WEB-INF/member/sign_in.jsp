<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<link
	href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:100,400,700|Raleway:100,400,700,900|Dancing+Script:400,700&display=swap"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<script src="/tmi/js/COMMON.js" type='text/javascript'></script> 
<link href='/tmi/css/COMMON.css' type='text/css' rel='stylesheet' >
<script src='https://www.google.com/recaptcha/api.js'></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<title>로그인</title>

<!-- 1. modal 눌렀을때 나오는 모양 수정  2. 구글로그인 버튼 수정 -->

<script>
	$(document)
			.ready(
					function() {
						
						function animateDivers() {
							$('#logo').css({
								'background-position-x' : '0px'
							});
							$('#logo').animate({
								'background-position-x' : '-1000px'
							}, 4000, animateDivers);
						}

						animateDivers();

						$("#signinSubmit").click(function() {

							$.ajax({

								url : "sign_in_do",
								data : {
									id : $("#signinEmail").val(),
									pwd : $("#signinPassword").val()
								},
								type : "post",

								dataType : "text",
								success : function(res) {
									console.log(res);
									if (res == "true") {
										swal("Good job!", "로그인성공!", "success")
										.then((value) => {
											location.href="home";
										});
										
									} else if (res == "false") {
										swal("Warning", "아이디 비밀번호가 일치하지않습니다",
										"error");
									
									} else if (res == "ip") {
										$("#ipconfirm").click();
									}else{
										location.href=res;
									}
								}

							})

						})

						$("#captchaconfirm")
								.click(
										function() {

											$
													.ajax({
														url : 'sign_in_recaptcha',
														type : 'post',
														data : {
															recaptcha : $(
																	"#g-recaptcha-response")
																	.val(),
															id : $(
																	"#signinEmail")
																	.val()

														},
														dataType : 'text',
														success : function(data) {
															switch (data) {
															case "0":
																swal("Good job!", "로그인성공!", "success")
																.then((value) => {
																	location.href="home";
																});
																break;

															case "1":
																swal("Warning", "자동 가입 방지 봇을 확인 한뒤 진행 해 주세요.",
																"error");
															
																grecaptcha
																		.reset();
																return;
																break;

															default:
																swal("Warning", "자동 가입 방지 봇을 실행 하던 중 오류가 발생 했습니다. [Error bot Code : "
																		+ Number(data)
																		+ "]",
																"error");
															
																break;
															}
														}
													});
										})

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
	height: 385px;
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
	margin-bottom: 5px;
	display: block;
}

#SigninForm input {
	display: block;
	width: 410px;
	border-radius: 5px;
	margin-left: 31px;
	margin-bottom: 5px;
}

.signinText {
	border: 1px solid rgba(5, 5, 5, 0.2);
	height: 48px;
}

#signinSubmit {
	    background: linear-gradient(-120deg, #12c2e9, #c471ed, #f64f59);
    background-size: 150%;
    border: none;
    color: white;
    height: 58px;
    width: 326px !important;
    font-size: 32px;
    font-family: 'Raleway', sans-serif;
    font-weight: 100;
    transition: 0.5s;
    cursor: pointer;
    margin-top: 22px;
    display: inline-block !important;
    margin-right: 18px;
}

#log_submit_div{
margin-top: 40px;}

#signinSubmit:hover {
	background-position-x: 100%;
}

#go_to_signUp {
	margin-top: 24px;
	margin-left: 31px;
	font-family: 'Raleway', sans-serif;
	color: rgba(10, 10, 10);
	font-weight: 400;
	font-size: 18px;
}

#go_to_signUp a {
	text-decoration: none;
	color: #12c2e9;
}

#forgot {
	text-decoration: none;
	font-family: 'Raleway', sans-serif;
	font-size: 14px;
	float: right;
	margin-right: 43px;
	color: rgb(211, 43, 43);
}

.g-recaptcha {
	margin-left: 57px;
	z-index: 1;
}

.modal-content {
		top: 300px;
	    background-color: rgb(255, 255, 255);
}

.modal-title {
	text-align: center;
	font-size: 20px;
	color: white;
}

#google_id_login a img{
	width: 51px;
    height: 51px;
    margin-bottom: 11px;
}

#google_id_login{
    display: inline-block;
}

@media (min-width: 768px){
.modal-dialog{
width: 420px;
}
}

.modal-header{
    padding: 0px;
    border-bottom: none;
}

.modal-body{
padding: 0px;
}

</style>




</head>
<body>
	<div id='bodywrap'>
		<div id='content'>
			<div id='logo' class='center_div no-drag gotoHome' >T.M.info</div>
			<div id='SigninForm' class='center_div'>
				<form action="sign_in_do" method="post">
					<label for="signinEmail">email</label> <input type="text" name="id"
						class='signinText' id='signinEmail'> <label
						for="signinPassword">password</label> <input type="password"
						name="pwd" class='signinText' id='signinPassword'> <a
						href="forgot_pw" id='forgot'>forgot password?</a>

					<div id='log_submit_div'>
						<input type="button" id='signinSubmit' value='Sign in'>
						<div id="google_id_login" style="text-align: center">
							<a href="${google_url}"><img width="300" height="80"
								src="/tmi/resources/memberimg/login_google.png" /></a>
						</div>
					</div>
					<input type="button" id="ipconfirm" data-target="#exampleModal"
						data-toggle="modal" style="display: none" />

				</form>
				<div id='go_to_signUp'>
					<p>
						New to TMI? <a href="sign_up">Create Acount</a>
					</p>
				</div>


			</div>
		</div>
	</div>


	<!-- 모달 div -->
	<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">삐리릭 삐리리릭!</h5>
				</div>
				<div class="modal-body">
					<form>
						<div class="form-group">
							<div id='captcha'>
								<!--여기에 div 추가 -->
								<div class="g-recaptcha" data-theme="light"
									data-sitekey="6Ld6HLYUAAAAAPuk3EckaPrxf46ilVvdnUD3ECrQ"></div>
							</div>
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-primary" id="captchaconfirm">확인하기</button>
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>
	<!-- 모달 div 끝-->
</body>
</html>