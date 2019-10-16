<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
     <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%String uid = request.getParameter("uuid");
         if (uid == null)
            uid = "";%>

<!-------------------------------------- 제이쿼리 연결 -------------------------------------->
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>

<!-------------------------------------- js,css연결 -------------------------------------->
<script src="js/member_changePw.js" type='text/javascript'></script>
<link href='css/member_changePw.css' type='text/css' rel='stylesheet' />
<script src="/tmi/js/COMMON.js" type='text/javascript'></script> 
<link href='/tmi/css/COMMON.css' type='text/css' rel='stylesheet' >

<!---------------------------------------- 웹폰트 연결 ---------------------------------------->
<link
   href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:100,400,700|Raleway:100,400,700,900|Dancing+Script:400,700&display=swap"
   rel="stylesheet">

<!---------------------------------------- 헤더 연결 ---------------------------------------->
<%-- <jsp:include page="Header.jsp"></jsp:include> --%>
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
   margin: 0 auto;
   margin-top: 232px;
   width: 480px;
   height: 368px;
   background: rgb(255, 255, 255);
   border-radius: 5px;
   border: 1px solid rgba(5, 5, 5, 0.2);
   box-sizing: border-box;
   padding-top: 13px;
}

label {
   font-size: 16px;
   margin-left: 33px;
   font-family: 'Noto Sans KR', sans-serif;
   margin-bottom: 2px;
   display: block;
   margin-top: 14px;
   color: rgb(10, 10, 10);
}

#ChangeForm input {
   display: block;
   width: 410px;
   border-radius: 5px;
   margin-left: 31px;
   margin-bottom: 5px;
}

#ChangeForm input[type=text] {
   border: 1px solid rgba(5, 5, 5, 0.2);
   height: 48px;
}

#ChangePw_submit {
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
    margin-top: 25px;
    margin-left: 32px !important;
}

#ChangePw_submit:hover {
   background-position-x: 100%;
}

#pwck_text{
	width: 412px;
    height: 50px;
    display: inline-block;
    margin-left: 39px;
}
</style>
<script type="text/javascript">
$(document)
.ready(
		function() {
		
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
			
		})

</script>
</head>

<body>
   <div id="bodywrap">
      <div id='logo' class='center_div'>TMI</div>
      <div id="ChangeForm" class="center_div">
         <form action="change_pwd">
            <input type="hidden" name="uuid" value="<%=uid%>" /> <label
               for="pwd">Password</label><input type="password" name="pwd" id="pwd" />
            <label for="pwdck">Confirm password</label> <input type="password" name="pwdck"
               id="pwdck" /> 
               <span id ='pwck_text'>Make sure it's at least 15 characters OR at least 8 characters including a number and a lowercase letter.</span>
               <input id="ChangePw_submit" type="submit"
               value="Change PassWord" />
         </form>
      </div>
   </div>
</body>
</html>