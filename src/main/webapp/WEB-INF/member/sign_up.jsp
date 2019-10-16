<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>회원가입</title>
<link
	href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:100,400,700|Raleway:100,400,700,900|Dancing+Script:400,700&display=swap"
	rel="stylesheet">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src='https://www.google.com/recaptcha/api.js'></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script src="/tmi/js/COMMON.js" type='text/javascript'></script>
<link href='/tmi/css/COMMON.css' type='text/css' rel='stylesheet'>

<link rel="stylesheet" type="text/css" href="/tmi/css/simptip.css" />
<!--수정사항  -->
<!-- 캡차 추가되서 밑에밀림 실행해서 보면알꺼임  -->
<!-- 아이디중복검사 이메일 중복검사 말풍선 추가해야됨 지금 alert  -->

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
							}, 1000, animateDivers);
						}
						animateDivers();
						var id = false;
						var id_email=false;
						//비밀번호
						var regex = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,16}$/;
					    //이메일
					    var regExp = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
					    $("#tooltip_email").css('display','none');
					    $("#tooltip_pawd").css('display','none');
					
						if ($("#signUpEmail").val() != "") {
							var test=$("#signUpEmail").val();
							console.log("emailtest"+test);
						 if(!regExp.test(test)) {
						        //경고
						       //비밀번호 형식에 맞지않음
						       	$('#tooltip_email').attr('data-tooltip','이메일 형식에 맞지않습니다');
						       	$("#tooltip_email").css('display','inline');
						       	
						    

						    } 
						
						else{
									id_email=true;
									$.ajax({

										url : "id_test?id="
												+ $("#signUpEmail").val(),
										type : "get",
										async : false,
										success : function(res) {
											if (res == 1) {
												id = false;
												$("#tooltip_email").css('display','inline');
												$('#tooltip_email').attr('data-tooltip','아이디가 중복되었습니다');
											} else {
												id = true;
												$("#tooltip_email").css('display','none');
												
											}
										}

									})
								
						}
					}
						var pawd_test=false;
				 if($("#signUpPassword").val()!="")
						   {
						   var test1=$("#signUpPassword").val();
						 console.log("paswtest"+test1);
			    if(!regex.test(test1)) {
					        //경고
					       //비밀번호 형식에 맞지않음
					         $("#tooltip_pawd").css('display','inline');
					     

					    } 
			    else
			    	{
			    	$("#tooltip_pawd").css('display','none');
			    	pawd_test=true;
			    	}
						   }
				 $("#signUpPassword").on("keyup",function(){
					
					 if($("#signUpPassword").val()!="")
					   {
					   var test1=$("#signUpPassword").val();
					 console.log("paswtest"+test1);
		    if(!regex.test(test1)) {
				        //경고
				       //비밀번호 형식에 맞지않음
				         $("#tooltip_pawd").css('display','inline');
				     

				    } 
		    else
		    	{
		    	$("#tooltip_pawd").css('display','none');
		    	pawd_test=true;
		    	}
					   }
				 })
							
						
						$("#signUpEmail").on(
								"keyup",
								function() {

								
									if ($("#signUpEmail").val() != "") {
										var test=$("#signUpEmail").val();
										console.log("emailtest"+test);
									 if(!regExp.test(test)) {
									        //경고
									       //비밀번호 형식에 맞지않음
									       	$('#tooltip_email').attr('data-tooltip','이메일 형식에 맞지않습니다');
									       	$("#tooltip_email").css('display','inline');
									       	
									    

									    } 
									
									else{
												id_email=true;
												$.ajax({

													url : "id_test?id="
															+ $("#signUpEmail").val(),
													type : "get",
													async : false,
													success : function(res) {
														if (res == 1) {
															id = false;
															$("#tooltip_email").css('display','inline');
															$('#tooltip_email').attr('data-tooltip','아이디가 중복되었습니다');
														} else {
															id = true;
															$("#tooltip_email").css('display','none');
															
														}
													}

												})
											
									}
								}
					

								})
								
								
								$("#signUpSubmit").click(
										function() {
											if ($("#signUpEmail").val() == "") {
												swal("Warning", "아이디를 입  력해주세요!",
														"error");
											
												return false;

											} else if ($("#signUpUserName").val() == "") {
												swal("Warning", "이름을 입력해주세요!",
												"error");
												return false;
											} else if ($("#signUpPassword")
													.val() == "") {
												swal("Warning", "비밀번호를 입력해주세요!",
												"error");
												return false;
											} else if (id == false &&id_email ==false) {
												swal("Warning", "이메일을 확인해주세요!",
												"error");
												return false;
											} 
											else if(pawd_test==false)
												{
												swal("Warning", "비밀번호를 확인해주세요!",
												"error");
												return false;
												}
											
											else {
												$
														.ajax({
															url : 'UserInsert',
															type : 'post',
															data : {
																recaptcha : $(
																		"#g-recaptcha-response")
																		.val(),
																name : $(
																		"#signUpUserName")
																		.val(),
																pwd : $(
																		"#signUpPassword")
																		.val(),
																id : $(
																		"#signUpEmail")
																		.val()

															},
															success : function(
																	data) {
																switch (data) {
																case "0":			
												swal("Good job!", "가입성공!", "success")
												.then((value) => {
													location.href="home";
												});
															
																	break;

																case "1":
																	swal("Warning", "자동 가입 방지 봇을 확인 한뒤 진행 해 주세요!",
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
											}

										});
					
						
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

#signUpForm {
	margin: 0 auto;
	padding-top: 15px;
	margin-top: 300px;
	width: 480px;
	height: 578px;
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

#signUpForm input {
	display: block;
	width: 410px;
	border-radius: 5px;
	margin-left: 31px;
	margin-bottom: 5px;
}

.signUpText {
	border: 1px solid rgba(5, 5, 5, 0.2);
	height: 48px;
}

#signUpSubmit {
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
	margin-top: 17px;
}

#signUpSubmit:hover {
	background-position-x: 100%;
}

.swicthtext {
	margin-left: 33px;
	font-family: 'Noto Sans KR', sans-serif;
	color: rgb(153, 153, 153);
}

.g-recaptcha {
	margin-left: 84px;
	margin-top: 28px;
}

.aaa{
margin-left: -8px;
    float: right;
    margin-right: 152px;
}
</style>

</head>
<div id='bodywrap'>
	<div id='content'>
		<div id='logo' class='center_div no-drag gotoHome'>T.M.info</div>
		<div id='signUpForm' class='center_div '>
			<form action="UserInsert" method="post">
				<label for="signUpEmail">Email</label> <input type="text"
					class='signUpText' name="id" id='signUpEmail' value="${dto.id }">
					
                            <span class="aaa simptip-position-bottom" id="tooltip_email"    data-tooltip="이메일 형식이 맞지 않습니다."></span>
					
				<small class="swicthtext">이메일 형식에 맞게 입력해주세요.</small> <label
					for="signUpUserName">UserName</label> <input type="text"
					class='signUpText' name="name" id='signUpUserName'
					value="${dto.name}">					
					 <small class="swicthtext">이름을 입력해주세요</small>
					  <label for="signUpPassword">Password</label> <input
					type="password" class='signUpText' name="pwd" id='signUpPassword'
					value="${dto.pwd }">
					
                            <span class="aaa simptip-position-bottom"  id="tooltip_pawd" data-tooltip="8~15자리 영문,숫자,특수문자를 포함해주세요"></span>
					 <small class="swicthtext">8~15자리 영문,숫자,특수문자를 포함해주세요</small>
				<div id='captcha'>
					<div class="g-recaptcha"
						data-sitekey="6Ld6HLYUAAAAAPuk3EckaPrxf46ilVvdnUD3ECrQ"></div>
				</div>
				<input type="button" id='signUpSubmit' value='Sign Up'>

			</form>


		</div>
	</div>
</div>

</body>
</html>