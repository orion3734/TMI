<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<link href='../plugin/core/main.css' rel='stylesheet' />
<link href='../plugin/daygrid/main.css' rel='stylesheet' />


<!-------------------------------------- js,css연결 -------------------------------------->
<script src="../js/project_calender.js" type='text/javascript'></script>
<link href='../css/project_calender.css' type='text/css'
	rel='stylesheet'>

<!---------------------------------------- 웹폰트 연결 ---------------------------------------->
<link
	href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:100,400,700|Raleway:100,400,700,900|Dancing+Script:400,700&display=swap"
	rel="stylesheet">

<div class='filterBox' style="display: none;">

	<label class="container">프로젝트 <input type="checkbox"
		class="filterType" value="p" checked="checked"> <span
		class="checkmark"></span>
	</label><span class="filterColor" id="pColor">&nbsp;</span> 
	<label class="container">스케줄 <input type="checkbox"
		class="filterType" value="s" checked="checked"> <span
		class="checkmark" ></span>
	</label> <span class="filterColor" id="sColor">&nbsp;</span>
	<label class="container">할일 <input type="checkbox"
		class="filterType" value="t" checked="checked"> <span
		class="checkmark"></span>
	</label><span class="filterColor" id="tColor">&nbsp;</span>
	<select class="isMe">
		<option value="all">전체</option>
		<option value="person">개인</option>
	</select>
</div>
<div id='calendar'>
</div>

