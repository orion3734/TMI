<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
     <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%> 
<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>


<%

String id=(String)request.getAttribute("id");
String name=(String)request.getAttribute("name");

%>

<meta charset="UTF-8">
<title>프로젝트의 모든 것 Task Management Info</title>
<script> 
$(document).ready(function(){


    var id="<%=id%>";
    var name="<%=name%>";
    
    $.ajax({
       url:"googlelogin?id="+id,
       dataType:"text",
       type:"get",
       success:function(res)
       {
          //있으면 session등록하는거고 
          //없으면 회원가입할꺼냐고 물어보고
          
          res=JSON.parse(res)
          if(res.login=="signin")
             {
        	  swal("Good job!", "로그인 성공!", "success")
				.then((value) => {
					 window.location.href = res.returnUri;
				});
						
            
             }
          else
             {
        	  swal({
        		  title: "회원 가입",
        		  text: "확인을 누르면, TMI의 회원으로 가입되며, 회원 가입시 TMI 이용약관과 개인정보 처리방침에 따라 정보가 관리 됩니다.!",
        		  icon: "info",
        		  buttons: true,
        		  dangerMode: true,
        		})
        		.then((willDelete) => {
        		  if (willDelete) {
        			  
        			  $.ajax({
                          url:"google_sign_up?id="+id+"&name="+name,
                          dataType:"text",
                          type:"get",
                          success:function(res){
                        	  swal("Good job!", "가입성공!", "success")
								.then((value) => {
									 window.location.href = res;
								});
                           
                            
                          }
                            
                            
                         })
        		   
        		  } else {
        			  swal("Warning", "회원 가입 취소!","error");
                      window.location.href = 'home';
        		  }
        		});
            
          
              /*   window.location.href = 'https://accounts.google.com/Logout?continue=https%3A%2F%2Faccounts.google.com%2FServiceLogin%3Fsacu%3D1&il=true&zx=icxpgruz0yao';
               window.location.href = 'main'; */
             /*   window.location.href="https://accounts.google.com/Logout?&continue=http://localhost:8090/finalproject/main" */
                }
                
            
             
       }
    })
    
    
    



    
    
    
      
	
	
	
})
</script>
<meta name="google-signin-client_id" content="671834931461-oho886cp17h30uvureqappjn4q2ul6j1.apps.googleusercontent.com">
<script src="https://apis.google.com/js/platform.js" async defer></script>
</head>
<body>


<a href="#" id="logout" style="display:none" onclick="signOut();">Sign out</a>
         <script>
         function signOut() {
        	/*  alert("asdf");
             var auth2 = gapi.auth2.getAuthInstance();
             console.log(auth2);
             auth2.signOut().then(function() {
                console.log('User signed out.');
             }); */
             /* var child=window.open("https://accounts.google.com/Logout?continue=https%3A%2F%2Faccounts.google.com%2FServiceLogin%3Fsacu%3D1&il=true&zx=icxpgruz0yao","popup","z-lock=yes,width=600,height=400"); */
            /*  child.close(); 
             location.href="https://accounts.google.com/Logout?continue=https%3A%2F%2Faccounts.google.com%2FServiceLogin%3Fsacu%3D1&il=true&zx=icxpgruz0yao"; */
             window.location.href = 'https://accounts.google.com/Logout?continue=https%3A%2F%2Faccounts.google.com%2FServiceLogin%3Fsacu%3D1&il=true&zx=icxpgruz0yao';
          }
         </script>   
            
</body>
</html>