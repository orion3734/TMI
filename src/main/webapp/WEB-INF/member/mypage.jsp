<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<!-------------------------------------- 제이쿼리 연결 -------------------------------------->
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>

<!-------------------------------------- js,css연결 -------------------------------------->


<!---------------------------------------- 웹폰트 연결 ---------------------------------------->
<link
	href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:100,400,700|Raleway:100,400,700,900|Dancing+Script:400,700&display=swap"
	rel="stylesheet">

<!---------------------------------------- 헤더 연결 ---------------------------------------->
<jsp:include page="../include/Header.jsp"></jsp:include>
<meta charset="UTF-8">
<style type="text/css">
@charset "UTF-8";

* {
	margin: 0;
	padding: 0;
}

#bodywrap {
	width: 100%;
	height: 1000px;
	background: rgb(252, 247, 253);
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
	margin-top: 62px;
}

#ChangeForm {
	width: 480px;
	height: 364px;
	background: rgb(255, 255, 255);
	border-radius: 5px;
	border: 1px solid rgba(5, 5, 5, 0.2);
	box-sizing: border-box;
	padding-top: 13px;
	margin: 0 auto;
	display: none;
}

#ChangeForm span {
	width: 438px;
	display: inline-block;
	margin-left: 32px;
}

label {
	font-size: 16px;
	font-family: 'Noto Sans KR', sans-serif;
	margin-bottom: 2px;
	display: block;
	margin-top: 14px;
	color: rgb(10, 10, 10);
	text-align: center;
}

#ChangeForm input {
	display: block;
	width: 410px;
	border-radius: 5px;
	margin-left: 31px;
	margin-bottom: 5px;
}

#ChangeForm input[type=text],#ChangeForm input[type=password] {
	border: 1px solid rgba(5, 5, 5, 0.2);
	height: 48px;
}

#ChangePw_submit {
	background-size: 150%;
	border: none;
	color: white;
	height: 71px;
	font-size: 32px;
	font-family: 'Raleway', sans-serif;
	font-weight: 100;
	transition: 0.5s;
	cursor: pointer;
	margin-top: 31px;
}

#ChangePw_submit:hover {
	background-position-x: 100%;
	    opacity: 0.8;
}
</style>
<script type="text/javascript">
	$(document).ready(			
			function() {
				<%String session_id=session.getAttribute("id").toString();
				     String id_sp[]= session_id.split("_");
				     String iid="";
				     if(id_sp.length==2)
				     {
				    	 iid=id_sp[1];
				     }
				     
				     %>
				     
				var id="<%=iid%>";
				
				if(id!="")
					{
					 $("#ChangeFormb").css("display","none");
					}
				
				$("#ChangePw_submit").click(function(){
					//비밀번호
					var regex = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,16}$/;
					if($("#pwdck").val()!=$("#pwd").val())
						{
						swal("Warning", "비밀번호가 서로 일치 하지 않습니다.",
						"error");
						return false;
						}
					
					else if(!regex.test($("#pwd").val()))
						{
						swal("Warning", "비밀번호 형식이 맞지않습니다.",
						"error");
						return false;
						}
				})
			    /* 프로젝트 완료목록 클릭시 이동하는거  */
				$(".mypage_projectName ").click(function(){
					 var form = document.createElement("form");
			    	  form.setAttribute("method", "POST"); // Get 또는 Post 입력
			    	  form.setAttribute("action", "project/management");
			    	  $(form).append($(this).prev('#pro_id_success'));
			    	  $(form).append($(this).prevAll('#isEnd'));
			    	  document.body.appendChild(form);
			    	  form.submit();
				})
				
				
				$(".mypage_projectDelete").click(function(){
				
					  var pro_mgr=$(this).prevAll("#pro_mgr").val();
					  var form = document.createElement("form");
			    	  form.setAttribute("method", "POST"); // Get 또는 Post 입력
			    	  form.setAttribute("action", "deleteProject");
			    	  $(form).append($(this).prevAll('#pro_id_success'));
				  if($("#sessionId").val()==pro_mgr)
					  {
					  
					  swal({
						  title: "프로젝트 삭제",
						  text: "프로젝트가 삭제됩니다",
						  icon: "warning",
						  buttons: true,
						  dangerMode: true,
						})
						.then((willDelete) => {
						  if (willDelete) {
					    	
							  
						 
							swal("Good job!", "삭제 성공!", "success")
							.then((value) => {
								var tf = $('<input type="hidden" value="true" name="tf">');
								$(form).append(tf);
								document.body.appendChild(form);
								
								  form.submit();
							});
						 
						    
						    
						    
						    
						  } else {
							  swal("Warning", "취소 되었습니다.",
								"error");
						  }
						});
					 
					    
					  }
				  else
					  {
					  swal({
						  title: "프로젝트 탈퇴",
						  text: "프로젝트에서 탈퇴됩니다",
						  icon: "warning",
						  buttons: true,
						  dangerMode: true,
						})
						.then((willDelete) => {
						  if (willDelete) {
							  
							  
							  swal("Good job!", "탈퇴 성공!", "success")
								.then((value) => {
									var tf = $('<input type="hidden" value="false" name="tf">');
									$(form).append(tf);
									document.body.appendChild(form);
									  form.submit();
								});
							 
						  } else {
							  swal("Warning", "취소 되었습니다.",
								"error");
						  }
						});
					  }
					
					
				})
				
				
				var skin;				
				$('.theme').on('click',function(){
					for(var i =1; i<21;i++){
						$('.tmi_skin').removeClass('tmi_skin'+i);
					}					
					 	skin = $(this).children().val();
					 	$('.tmi_skin').addClass(skin);
					 	$("input[name='theme']").val(skin);
				});
				
				$("#imgfile").click(function() {

					$("#file").click();
				})
				//실제 파일 인풋
				$('#file').change(
						function() {
                           
							var filename = $('#file').val();
							filename = filename.split("\\");
							var filetype = filename[2];
							filetype = filetype.split('.');
							if (filetype[1] == 'jpg' || filetype[1] == 'png'
									|| filetype[1] == 'gif') {
								inputPreview(this);

							}else
	                        {
		                        swal("Warning", "이미지 형식이 아닙니다!",
		                        "error");
		                        }

						});

				function inputPreview(input) {
					if (input.files && input.files[0]) {
						var reader = new FileReader();
						reader.onload = function(e) {
							$("#img").attr("src", e.target.result);
						}
						reader.readAsDataURL(input.files[0]);
					}
				}

			})
</script>
<%-- <%
String root=application.getRealPath("/")+"profie_img\\";
System.out.println("test.jsp"+root);
%> --%>
<style type="text/css">
body{
	background: #fcf7fd;
}
#img {
	width: 80px;
	height: 80px;
	border-radius: 123px;
	-moz-border-radius: 123px;
	-khtml-border-radius: 123px;
	-webkit-border-radius: 123px;
	margin: 0 auto;
	display: block;
	margin-top: 27px;
}

#my_wrap {
	width: 100%;
}

#imgfile {
	border: 1px solid #a59fa7;
	width: 70px !important;
	height: 27px;
	background: #fcf7fd;
	font-family: 'Noto Sans KR', sans-serif;
	font-weight: 100;
	border-radius: 16px !important;
	cursor: pointer;
	margin: 0 auto !important;
	margin-top: 9px !important;
}

.theme {
	width: 41px;
	height: 41px;
	float: left;
	margin-left: 6px;
	cursor: pointer;
	margin-top: 5px;
}

#my_theme {
	width: 470px;
	height: 120px;
	margin: 0 auto;
	margin-top: 14px;
}

#mypage_left {
	width: 1000px;
	margin: 0 auto;
	padding-top: 59px;
}

#mypage_right {
	width: 1000px;
	margin: 0 auto;
	margin-top: 100px;
}

#설정 {
	width: 557px;
	height: 579px;
	background: rgb(255, 255, 255);
	border-radius: 5px;
	border: 1px solid rgba(5, 5, 5, 0.2);
	box-sizing: border-box;
	margin: 0 auto;
	margin-bottom: 45px;
}

#설정 input {
	display: block;
	width: 410px;
	border-radius: 5px;
	margin-bottom: 5px;
	margin: 0 auto;
}

#설정 input[type=text] {
	border: 1px solid rgba(5, 5, 5, 0.2);
	height: 48px;
}

#option_submit {
	background-size: 150%;
	border: none;
	color: white;
	height: 71px;
	font-size: 32px;
	font-family: 'Raleway', sans-serif;
	font-weight: 100;
	transition: 0.5s;
	cursor: pointer;
	margin-top: 31px !important;
}

#my_theme p {
	text-align: center;
	margin-bottom: initial;
	font-family: 'Noto Sans KR', sans-serif;
	font-weight: 400;
	font-size: 15px;
}

#option_submit:hover {
	background-position-x: 100%;
	    opacity: 0.8;
}

.mypage_title {
	margin: 0 auto;
	display: block;
	background: #fcf7fd;
	margin-top: -13px;
	text-align: center;
	margin-bottom: 10px;
	font-family: 'Noto Sans KR', sans-serif;
	width: 120px;
}

.mayege_projects {
	color: red;
}

#endProject{
	display: none;
}

.project_success {
border-bottom: 1px solid #1b1b1b;
    padding-bottom: 1px;
    padding-left: 11px;
    font-family: 'Noto Sans KR', sans-serif;
    font-weight: 100;
    height: 40px;
    margin: 0 auto;
    margin-top: 15px;
}

.mypage_projectName {
display: inline-block;
    width: 199px;
    text-align: center;
    padding-top: 1px;
    height: 29px;
    color: white;
    background-size: 200%;
    transition: 0.6s;
    cursor: pointer;
}

.mypage_projectName:hover{
	    background-position: 50%;
	    opacity: 0.8;
}

.pro_mgr {
    display: inline-block;
    padding: 0 5px;
    width: 455px;
}

.mypage_projectEnd {
	color: red
}

.mypage_projectDelete {
	border: none;
    margin-left: 19px;
    width: 48px;
    height: 26px;
    color: rgb(0, 53, 150);
    background: rgba(1,1,1,0);
    font-size: 14px;
    cursor: pointer;
}

.mypage_projectDelete:hover {
	text-decoration: underline;
}

.pro_mgrt{
    display: inline-block;
    margin-left: 23px;
    border-right: 1px solid #b7b7b7;
    padding-right: 5px;
    height: 26px;
    padding-top: 3px;
    margin-top: 6px;
}
.mypage_projectEndt{
display: inline-block;
    margin-left: 19px;
    border-right: 1px solid #b7b7b7;
    padding-right: 5px;
    height: 26px;
    padding-top: 3px;
}
.btn-group{
    text-align: center;
    margin-top: 0;
    background: rgb(254,254,254);
    height: 30px;
    padding: 8px 0px;
    border-bottom: 1px solid rgb(228, 228, 228);
}
.btn-group button {
    border: none;
    padding: 2px 5px;
    cursor: pointer;
    border-radius: 20px;
    background: rgba(252,252,252,0);
    color: rgb(25, 92, 162);
    font-family: 'Noto Sans KR', sans-serif;
    font-weight: 100;
    font-size: 19px;
}

.btn-group button:hover {   
	font-weight: 400;
    font-size: 18px;
}
</style>
</head>
<body>
	<div class="btn-group no-drag ">
		<button id="설정b" class="mpCate">개인정보</button>
		<button id="ChangeFormb" class="mpCate">비밀번호 변경</button>
		<button id="endProjectb" class="mpCate">종료된 프로젝트</button>
	</div>
	<div id='my_wrap'>
		<div id='mypage_left'>

			<hr>
			<span class='mypage_title'>개인정보</span>
			<div id='설정' class="cate">
				<form name="frm" method="post" action="mypage_update"
					enctype="multipart/form-data">
					<div>
						<c:set var="profile_img" value="${dto.profile_img}" />
						<c:choose>
							<c:when test="${not empty dto.profile_img}">
								<img src="/tmi/profile_img/${dto.profile_img}" id="img" />
							</c:when>
							<c:otherwise>

								<img src="/tmi/resources/memberimg/user.png" id="img" />
							</c:otherwise>
						</c:choose>
						<input type="button" id="imgfile" value="사진 변경" /> <input
							type="file" id="file" name="file" value="이미지 변경"
							style="display: none;" />
					</div>

					<div id='my_theme'>
						<c:choose>
							<c:when test="${empty dto.theme}">
								<input type="hidden" name="theme" value="tmi_skin1" />
							</c:when>
							<c:otherwise>
								<input type="hidden" name="theme" value='${dto.theme}' />
							</c:otherwise>
						</c:choose>
						<p>테마 변경</p>
						<div class='theme tmi_skin1' id='theme01'>
							<input type="hidden" value="tmi_skin1">
						</div>
						<div class='theme tmi_skin2' id='theme02'>
							<input type="hidden" value="tmi_skin2">
						</div>
						<div class='theme tmi_skin3' id='theme03'>
							<input type="hidden" value="tmi_skin3">
						</div>
						<div class='theme tmi_skin4' id='theme04'>
							<input type="hidden" value="tmi_skin4">
						</div>
						<div class='theme tmi_skin5' id='theme05'>
							<input type="hidden" value="tmi_skin5">
						</div>
						<div class='theme tmi_skin6' id='theme06'>
							<input type="hidden" value="tmi_skin6">
						</div>
						<div class='theme tmi_skin7' id='theme07'>
							<input type="hidden" value="tmi_skin7">
						</div>
						<div class='theme tmi_skin8' id='theme08'>
							<input type="hidden" value="tmi_skin8">
						</div>
						<div class='theme tmi_skin9' id='theme09'>
							<input type="hidden" value="tmi_skin9">
						</div>
						<div class='theme tmi_skin10' id='theme10'>
							<input type="hidden" value="tmi_skin10">
						</div>
						<br>
						<div class='theme tmi_skin11' id='theme11'>
							<input type="hidden" value="tmi_skin11">
						</div>
						<div class='theme tmi_skin12' id='theme12'>
							<input type="hidden" value="tmi_skin12">
						</div>
						<div class='theme tmi_skin13' id='theme13'>
							<input type="hidden" value="tmi_skin13">
						</div>
						<div class='theme tmi_skin14' id='theme14'>
							<input type="hidden" value="tmi_skin14">
						</div>
						<div class='theme tmi_skin15' id='theme15'>
							<input type="hidden" value="tmi_skin15">
						</div>
						<div class='theme tmi_skin16' id='theme16'>
							<input type="hidden" value="tmi_skin16">
						</div>
						<div class='theme tmi_skin17' id='theme17'>
							<input type="hidden" value="tmi_skin17">
						</div>
						<div class='theme tmi_skin18' id='theme18'>
							<input type="hidden" value="tmi_skin18">
						</div>
						<div class='theme tmi_skin19' id='theme19'>
							<input type="hidden" value="tmi_skin19">
						</div>
						<div class='theme tmi_skin20' id='theme20'>
							<input type="hidden" value="tmi_skin20">
						</div>
					</div>
					<div>
						<label for='id'>아이디</label> <input type="text" name="id"
							value="${dto.id}" readonly />
					</div>
					<div>
						<label for='name'>이름</label><input type="text" name="name"
							value="${dto.name}" />
					</div>
					<!-- // -->
					<c:choose>
						<c:when test="${empty sessionScope.theme}">
							<input type="submit" value="Change" id='option_submit'
								class='tmi_skin tmi_skin1'>
						</c:when>
						<c:otherwise>
							<input type="submit" value="Change" id='option_submit'
								class='tmi_skin ${sessionScope.theme}'>
						</c:otherwise>
					</c:choose>
					<!-- // -->
				</form>
			</div>

			<!-- <hr>
			<span class='mypage_title'>비밀번호 변경</span> -->

			<div id="ChangeForm" class="cate">
				<form action="mypage_change_pwd">
					<label for="pwd">Password</label><input type="password" name="pwd"
						id="pwd" /> <label for="pwdck">Confirm password</label> <input
						type="password" name="pwdck" id="pwdck" /> <span>Make sure
						it's at least 15 characters OR at least 8 characters including a
						number and a lowercase letter.</span>
					<c:choose>
						<c:when test="${empty sessionScope.theme}">
							<input id="ChangePw_submit" type="submit" value="Change PassWord"
								class='tmi_skin tmi_skin1' />
						</c:when>
						<c:otherwise>
							<input id="ChangePw_submit" type="submit" value="Change PassWord"
								class='tmi_skin ${sessionScope.theme}' />
						</c:otherwise>
					</c:choose>
				</form>
			</div>
		</div>

		<div id='mypage_right'>
			<div id="endProject" class="cate">
				<!-- <hr>
				<span class='mypage_title'>종료된 프로젝트</span> -->
				<c:choose>
					<c:when test="${empty pdto}">
					<div style="font-size: 26px;font-weight: bold;text-align: center;">프로젝트 완료 목록이없습니다.</div>
					<div style="text-align: center;">어서 프로젝트를 완료해주세요!</div>
	</c:when>
					<c:otherwise>
						<div id='mayege_projects'>
							<c:forEach items="${pdto}" var="pdto">
								<div class="project_success">
									<input type="hidden" id="isEnd" name="isEnd" value="true">
									<input type="hidden" id="pro_id_success" name="pro_id"
										value="${pdto.pro_id}">


									<c:choose>
										<c:when test="${empty sessionScope.theme}">
											<span class='mypage_projectName tmi_skin tmi_skin1'>${pdto.pro_name }</span>
										</c:when>
										<c:otherwise>
											<span
												class='mypage_projectName tmi_skin  ${sessionScope.theme}'>${pdto.pro_name }</span>
										</c:otherwise>
									</c:choose>
									<span class='pro_mgrt'>매니저</span>
									<input type="hidden" id="pro_mgr" value="${pdto.pro_mgr }">
									<span class="pro_mgr">${pdto.name }</span>
									<span
										class='mypage_projectEndt'>종료일</span>
									<span
										class='mypage_projectEnd'>${pdto.pro_rend}</span> 
									<input type="button" class="mypage_projectDelete" value="삭제" />
								</div>
							</c:forEach>
						</div>
					</c:otherwise>
				</c:choose>




			</div>
		</div>


	</div>
</body>
<script type="text/javascript">
	$('.mpCate').click(function(){
		var choose = $(this).text();
		var id = $(this).attr('id').replace('b','');
		$('.cate').each(function(i,v){
			if($.trim($(v).attr('id'))==id){
				$(v).show();
				$('.mypage_title').text(choose);
			}else{
				$(v).hide();	
			}
		})
	})
</script>
</html>