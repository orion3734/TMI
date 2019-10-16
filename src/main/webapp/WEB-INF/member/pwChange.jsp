<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<script type="text/javascript">	
<%String uid = request.getParameter("uid");
			if (uid == null)
				uid = "";%>
</script>


<!-------------------------------------- 제이쿼리 연결 -------------------------------------->
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>

<!-------------------------------------- js,css연결 -------------------------------------->
<script src="js/member_changePw.js" type='text/javascript'></script>
<link href='css/member_changePw.css' type='text/css' rel='stylesheet' />

<!---------------------------------------- 웹폰트 연결 ---------------------------------------->
<link
	href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:100,400,700|Raleway:100,400,700,900|Dancing+Script:400,700&display=swap"
	rel="stylesheet">

<!---------------------------------------- 헤더 연결 ---------------------------------------->
<jsp:include page="../include/Header.jsp"></jsp:include>

</head>

<body>
	<div id="bodywrap">
		<div id='logo' class='center_div'>TMI</div>
		<div id="ChangeForm" class="center_div">
			<form action="change_pwd.do">
				<input type="hidden" name="uid" value="<%=uid%>" /> <label
					for="pwd">Password</label><input type="text" name="pwd" id="pwd" />
				<label for="pwdck">Confirm password</label> <input type="text" name="pwdck"
					id="pwdck" /> 
					<span>Make sure it's at least 15 characters OR at least 8 characters including a number and a lowercase letter.</<span>>
					<input id="ChangePw_submit" type="submit"
					value="Change PassWord" />
			</form>
		</div>
	</div>
</body>
</html>