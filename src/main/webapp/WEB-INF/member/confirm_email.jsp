<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<!--  수정사항 -->
<!-------------------------------------- js,css연결 -------------------------------------->
<link href='/tmi/css/COMMON.css' type='text/css' rel='stylesheet'>
<script src="/tmi/js/COMMON.js" type='text/javascript'></script>
<!---------------------------------------- 웹폰트 연결 ---------------------------------------->
<link
	href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:100,400,700|Raleway:100,400,700,900|Dancing+Script:400,700&display=swap"
	rel="stylesheet">
<!---------------------------------------- 헤더 연결 ---------------------------------------->
<jsp:include page="../include/Header.jsp"></jsp:include>

<script type="text/javascript">
$(document).ready(function(){
	function animateDivers() {
		$('#cfe_logo').css({
			'background-position-x' : '0px'
		});
		$('#cfe_logo').animate({
			'background-position-x' : '-1000px'
		}, 1000, animateDivers);
	}
	animateDivers();
	
})
</script>
<meta charset="UTF-8">

<style type="text/css">
#cfe_bodywrap {
	width: 100%;
    height: 1000px;
    background: rgb(252, 247, 253);
}

#cfe_logo{
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
    margin-top: 41px;
}

#confirm{
margin-top: 204px;
    font-family: 'Noto Sans KR', sans-serif;
    font-weight: 100;
    font-size: 24px;
    text-align: center;
    padding-top: 10px;
}

a{
	text-decoration: none;
    font-weight: 400;
    font-size: 18px;
}

a:hover{
	color:red;
}
</style>
</head>
<body>
<div id='cfe_bodywrap'>
	<div id="cfe_logo"class='center_box  no-drag gotoHome'>TMI</div>	
	<div id='confirm' class='center_box'>
		이메일 인증완료<br> <a  href="home">MAIN으로 가기</a>
	</div>
</div>
</body>
</html>