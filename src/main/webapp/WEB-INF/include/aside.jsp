<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
#aside {
	min-height:878px;
	position:relative;
    float: left;
    background-color: rgb(255, 255, 255);
    border: 1px solid rgb(210, 210, 210);
    width: 50px;
}

#aside .list .interval{
width: 24px;
    height: 24px;
}

#aside .list .interval:hover{
	opacity: 0.6;
}

.list{
}

.list a{
border-bottom: 1px solid #d4d4d4;
    padding-bottom: 0px;
    margin-left: 5px;
    width: 33px;
    height: 30px;
    display: block;
    padding-left: 7px;
        margin-top: 9px;
}
</style>
<script type="text/javascript">
$(document).ready(function(){
	
	var asideH=document.body.scrollHeight;
	$('#aside').css('height',asideH-55);
	
	$('.interval').each(function(i,v){
		tippy($(v).get(0), {
			  content: $(v).attr('name'),
			  animateFill: false,
			  animation: 'scale',
			  placement: 'right',
		})	
	})
	
	

})
</script>
</head>
<body>
	<div id="aside" >
	<div class="list">
	<a href="/tmi/DashBoard/DashMain"><img src="../resources/asideimg/chart.png" class="interval" name="대시보드" id="das"></a>
	<a href="/tmi/project/management"><img src="../resources/asideimg/folder.png" class="interval" name="프로젝트 관리" id="man"></a>
	<a href="/tmi/setting/main"><img src="../resources/asideimg/group.png" class="interval" name="프로젝트 설정" id="mai"></a>
	<a href="/tmi/chat/chattingroom"><img src="../resources/asideimg/chat.png" class="interval" name="채팅" id="cha"></a>
	</div>
	<div id="proMember">
	
	</div>
	</div>
</body>
</html>
