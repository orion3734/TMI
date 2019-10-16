<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-------------------------------------- 제이쿼리 연결 -------------------------------------->
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-cookie/1.4.1/jquery.cookie.js"></script>
<!-------------------------------------- js,css연결 -------------------------------------->
<script src="../js/project_management.js" type='text/javascript'></script>
<link href='../css/project_management.css' type='text/css' rel='stylesheet'>
<script src="../js/COMMON.js" type='text/javascript'></script>
<link href='../css/COMMON.css' type='text/css' rel='stylesheet'>
<link href='../css/project_schedule.css' type='text/css' rel='stylesheet'>
<link href='../css/project_kanbanboard.css' type='text/css' rel='stylesheet'>
<link href='../css/project_timeline.css' type='text/css' rel='stylesheet'>
<!-------------------------------------- 달력 fullcalendar -------------------------------------->
<script src='../plugin/core/main.js'></script>
<script src='../plugin/core/locales/ko.js'></script>
<script src='../plugin/daygrid/main.js'></script>

<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<!---------------------------------------- 헤더 연결 ---------------------------------------->
<jsp:include page="../include/Header.jsp"></jsp:include>
<!---------------------------------------- 어사이드연결 ---------------------------------------->
<jsp:include page="../include/aside.jsp"></jsp:include>

</head>
<body>
	<div class="btn-group no-drag ">	
		<button id="kanbanboard" class=''>Kanban</button>
		<button id="timeline">TimeLine</button>
		<button id="calender">Calendar</button>
	</div>
	<div class="showWhat">
		
	</div>
</body>
</html>