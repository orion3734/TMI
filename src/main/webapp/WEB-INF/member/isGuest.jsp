<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head></head>
<body></body>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script type="text/javascript">
		swal("Warning", '우선 로그인을 해주세요',"error").then((value) => {
			  window.location.href="/tmi/sign_in";
		});
</script>
</html>