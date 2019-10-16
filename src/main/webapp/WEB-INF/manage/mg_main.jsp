<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@include file="../include/Header.jsp"%>
<%@include file="../include/aside.jsp"%>

<!-- <link
	href="https://cdnjs.cloudflare.com/ajax/libs/gentelella/1.4.0/css/custom.min.css"
	rel="stylesheet"> -->

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<!-- css -->
<link rel="stylesheet" href="/tmi/css/manage.css" type="text/css">
<!-- js -->
<script src="/tmi/js/manage.js"></script>


</head>
<body>
	<input type="hidden" value="<c:out value="${content.pro_id }"/>"
		id="pro_id">
	<!--*********** 전체 폼 ***********-->
	<div id="allForm">

		<!--*********** 버튼바 ***********-->
		<c:if test="${empty sessionScope.isEnd }">
		<div id="buttonMenu">
			<input class="pj_setting" type="submit" value="프로젝트 수정"> <input
				class="pj_people" type="submit" value="멤버 관리">
		</div>
		</c:if>

		<c:set value="${content }" var="content" />
		
		

		<!--*********** 프로젝트 정보창 ***********-->
		<div class="pj_contentForm">
			<!--*********** 프로젝트 제목 ***********-->
			<div class="pj_name">
				<c:out value="${content.pro_name }" />
			</div>

			<!--*********** 프로젝트 기간 ***********-->
			<div id="infoMenu">
				<table id="customers">
					<tr>
						<th>프로젝트 시작일</th>
						<th>프로젝트 종료일</th>
					</tr>
					<tr>
						<td><c:out value="${content.pro_start }" /></td>
						<td><c:out value="${content.pro_end }" /></td>
					</tr>
				</table>
				<div>
					<c:choose>
						<c:when test="${content.pro_rend == null }">
							<input type="submit" id="SetRend" value="프로젝트 종료">
						</c:when>
						<c:otherwise>
							<div id="rend_date">
								<c:out value="${content.pro_rend }" />
								종료됨
							</div>
						</c:otherwise>
					</c:choose>
				</div>
			</div>

			<!--*********** 프로젝트 정보 ***********-->
			<div id="pj_info">
				<c:out value="${content.pro_info }" />
			</div>

			<!--*********** 프로젝트 멤버 정보 ***********-->
			<div id="memberlist">
				<div class="pj_name">프로젝트 팀원</div>
				<table id="customers">
					<tr>
						<th>아이디</th>
						<th>관리 등급</th>
					</tr>
					<c:forEach items="${people }" var="people">

						<tr>
							<td>${people.id }</td>
							<c:choose>
								<c:when test="${people.pt_level==1 }">
									<td>관리자</td>
								</c:when>
								<c:otherwise>
									<td>일반팀원</td>
								</c:otherwise>
							</c:choose>
						</tr>

					</c:forEach>
				</table>
			</div>
		</div>

	</div>

	<!-- <form id="search-bar" class="modal" action="rendSet">
				<label for="search_id">실제 종료 날짜를 선택해주세요</label>
				<input type="date" id="search_id" name="rendSetting">				
				<input type="submit" value="종료일 추가">
	</form> -->

</body>
</html>