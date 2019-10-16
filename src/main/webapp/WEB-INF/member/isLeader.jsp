<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head></head>
<body></body>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script type="text/javascript">
		swal("Warning", '리더가 아닙니다',"error").then((value) => {
			window.history.go(-1);
		});
</script>
</html>