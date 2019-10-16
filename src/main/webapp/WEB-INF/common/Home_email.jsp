<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
     <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%> 
<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<!--  수정사항 -->
<!-- header 만있고 밑에 이메일인증해주세요 text? 있어야할듯 -->

<meta charset="UTF-8">
<jsp:include page="../include/Header.jsp"></jsp:include>
<style type="text/css">
 #ex{
 	font-size: 30px;
    font-weight: bold;
    margin: 15px 0px;
 }
 .bx-wrapper{
 	margin: auto;
 }
</style>
</head>
<body>
<div style="font-size: 28px; text-align: center; margin: 30px">이메일 인증해주세요</div><hr>
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