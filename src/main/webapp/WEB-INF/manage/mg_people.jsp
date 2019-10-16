<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@include file="../include/Header.jsp"%>
<%@include file="../include/aside.jsp"%>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<!-- sweetalert -->
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

<!-- css -->
<link rel="stylesheet" href="/tmi/css/manage_people.css" type="text/css">
<!-- js -->
<script src="/tmi/js/manage.js"></script>

</head>
<body>
	<c:forEach items="${people}" var="dto">
		<input type="hidden" value="${dto.pro_id }" id="pro_id">
	</c:forEach>
	<!--***************** 멤버창 *****************-->
	<div id="pj_set">
		<!--***************** 매니저 변경 *****************-->
		<div id="manager_form">
			<h1>프로젝트 매니저</h1>
			<div class="form-group">
				<label for="selectBox">매니저 선택:</label> <select class="form-control"
					id="selectBox">
					<c:forEach items="${people }" var="people">
						<option value="${people.id }" id="manager">${people.id }</option>
					</c:forEach>
				</select>
			</div>

			<input type="submit" class="button" id="manegerSet" value="변경">
		</div>
		<!--***************** 멤버추가 제거 *****************-->
		<div id="member_set">
			<h1>팀원 수정</h1>
			<div id="addDel">
				<a href="#search-bar" class="btn" rel="modal:open" id="Abutton">추가</a>
				<input type="submit" class="button" id="memDel" value="제거">
			</div>

			<br>
			<div>
				<c:forEach items="${people }" var="people">
					<c:choose>
						<c:when test="${people.pt_level==1 }">
							<div class="checks etrans">
								<input type="checkbox" id="${people.id }id" class="chkbox"
									value=${people.id } disabled="disabled"> <label
									for="${people.id }id">${people.id }</label>
							</div>
						</c:when>
						<c:otherwise>
							<div class="checks etrans">
								<input type="checkbox" id="${people.id }id" class="chkbox"
									value=${people.id }> <label for="${people.id }id">${people.id }</label>
							</div>
						</c:otherwise>
					</c:choose>
				</c:forEach>
			</div>
		</div>
		<input type="submit" class="button-back" id="backMain" value="뒤로">
	</div>

	<!--***************** 멤버 추가 검색창 *****************-->
	<form id="search-bar" class="modal" action="addMember" onkeydown="return ReturnKey(event)">
		<label for="search_id">아이디를 검색하세요</label>
		<ul class="table-list" id="pro_team_list">

		</ul>
		<input type="text" id="search_id">
		<ul id="search_result" hidden="" class="results">
		</ul>

		<input type="button" id="addMember" value="추가">
		
	</form>


</body>