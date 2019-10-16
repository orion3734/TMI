<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!--추가  --> 
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<link rel="stylesheet" href="../css/Dash_dashMain.css">
<link rel="stylesheet" href="../css/Dash_style.css">
<link rel="stylesheet" href="../css/Dash_an-skill-bar.css">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://www.w3schools.com/lib/w3-theme-indigo.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
<link rel="stylesheet" href="../css/Dash_jQuery.verticalCarousel.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<!-- <script src="../js/Dash_jquery.tooltip.js"></script> tooltip -->
<script src="//cdnjs.cloudflare.com/ajax/libs/snap.svg/0.3.0/snap.svg-min.js"></script> <!-- 도넛그래프  -->
<link href="https://fonts.googleapis.com/css?family=Hi+Melody&display=swap" rel="stylesheet">
<!-- <link rel="stylesheet" href="../css/morris.css"> 
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.9.0/jquery.min.js"></script>-->
<script src="//cdnjs.cloudflare.com/ajax/libs/raphael/2.1.0/raphael-min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/morris.js/0.5.1/morris.min.js"></script>

<style type="text/css">
	.w3-modal {
    	z-index: 60;
    }
</style>



<script type="text/javascript">

$(document).ready(function(){
	
	
	/* 배경화면 처리 */
   $('.bgstyle').click(function(){
	   $('.bgstyle').css('border','');
	   $('.bgstyle').removeAttr('id','');
	   //$('.bgstyle').removeAttr('name','');
	   $(this).css('border','3px solid lightgreen');
	   $(this).attr('id','bgsel');
	   //$(this).attr('name','bgsel'); 
   }) 
   

	$('#bgok').click(function(){
		var bgsel = $('#bgsel').attr('style').substring(48,52);
		console.log(bgsel + " asd");
		window.location.href="/tmi/DashBoard/DashChange?bgsel="+bgsel;
	})
	
	$('#bgcancel').click(function(){
		var bgsel ="";
		window.location.href="/tmi/DashBoard/DashChange?bgsel="+bgsel;
	})
	
   /* 배경화면 처리 */
	
   


	
	
   /* 도넛 그래프 */
	var sum = parseInt($('#donut_comp').val())+ parseInt($('#donut_haveto').val())+ parseInt($('#donut_bfdead').val())+parseInt($('#donut_afdead').val());
	var deter = new Date(); 
	var year = deter.getFullYear(); 
	var month = new String(deter.getMonth()+1); 
	var day = new String(deter.getDate()); 
	
	// 한자리수일 경우 0을 채워준다. 
	if(month.length == 1){ 
	  month = "0" + month; 
	} 
	if(day.length == 1){ 
	  day = "0" + day; 
	} 

	/* 	$('#donut_haveto').val()+value: $('#donut_bfdead').val() + value: $('#donut_afdead').val()); */
    new Morris.Donut({  
        element: 'dashDonut',
        data: [        
                {label: "완료된 일", value: Math.floor(parseInt($('#donut_comp').val())/sum*100)},
                {label: "시작전 일", value: Math.floor(parseInt($('#donut_haveto').val())/sum*100)},
                {label: "진행중 일", value: Math.floor(parseInt($('#donut_bfdead').val())/sum*100)},
                {label: "마감지남", value: Math.floor(parseInt($('#donut_afdead').val())/sum*100)}
              ],
          colors: ["#5A5AFF", "#C1FF6B","#FF1493","#46AAFF"], //그래프 color를 지정해줍니다.
          formatter: function (y) { return (y) + "%" } 
    })  
	
    /* 도넛 그래프 */
	//graph test start
    var sum1 = parseInt($('#wk1').val())+ parseInt($('#wk2').val())+ parseInt($('#wk3').val())+parseInt($('#wk4').val());     
    /* var sum2 = parseInt($('#wk11').val())+ parseInt($('#wk21').val())+ parseInt($('#wk31').val())+parseInt($('#wk41').val()); */
    
    var dataArr = new Array();
    $('.date').each(function(i,v){
    	var dateObj = {value:$(v).next().val(), date:$(v).val()};
    	dataArr.push(dateObj);
    })
    
	 var data= [{ 
		  name:"project",
		  data:dataArr
			  } 
		  ];
    
		 // Multiple lines
	     options={
	       height: 150,
	       width: 700,
	     };
	  
	   $("#multi").pista(data, options);
   	
	//graph test end
	
	 $(".sch_name").click(function(){
		 /* var a= $(this).prev().val(); */
		
	        var form = document.createElement("form");
			form.setAttribute("method", "POST"); // Get 또는 Post 입력
			form.setAttribute("action", "/tmi/project/management");
			$(form).append($(this).prev('#pro_id'));
			document.body.appendChild(form);
			form.submit(); 
	 })
	 $(".reList_sch_name").click(function(){
		 var form = document.createElement("form");
			form.setAttribute("method", "POST"); // Get 또는 Post 입력
			form.setAttribute("action", "/tmi/project/management");
			$(form).append($(this).prev('#pro_id'));
			document.body.appendChild(form);
			form.submit(); 
	 })
	 $(".timeline_sch").click(function(){
		
		var type=$(this).prev().prev().val();
		 var form = document.createElement("form");
	
	 	if(type=="스케쥴" || type=="할일")
			{
			
				form.setAttribute("method", "POST"); // Get 또는 Post 입력
				form.setAttribute("action", "/tmi/project/management");
				$(form).append($(this).prev('#pro_id'));
				document.body.appendChild(form);
				form.submit(); 
			}
	 	//채팅으로감
		else if(type=="파일")
			{
			 location.href="/tmi/chat/chattingroom";
			}
	 	//멤버관리
		else {
			
			 location.href="/tmi/setting/main";
		} 
		
	 })
	
	
	   tippy('#board1', {
		   content: "자신이 속해 있는 프로젝트의 수 입니다."
		 });
	   tippy('#board2', {
		   content: "해당 프로젝트 스케줄 수 입니다."
		 });
	   tippy('#board3', {
		   content: "자신이 속해 있는 프로젝트의 남은 스케줄 수 입니다."
		 });
	   tippy('#board4', {
		   content: "자신이 속해 있는 프로젝트의 완료된 스게줄 수 입니다."
		 });
	   tippy('#board5', {
		   content: "현재 프로젝트의 진행률 입니다."
		 });
	   tippy('#board6', {
		   content: "해당 프로젝트에서 기여도가 높은 팀원 top5"
		 });
	   tippy('#board7', {
		   content: "스케줄에서 3일 내로 가장 가까운 일정을 알려줍니다."
		 });
	   tippy('#board8', {
		   content: "스케줄에서 정해진 할 일들을 그래프로 보여줍니다.<br/>"+
			   "마감지남: 종료일이 지났으나 완료가 되지 않은 일들.<br/>"+
			   "시작전 일: 앞으로 계획된 할 일들<br/>"+
			   "진행중 일: 진행중인 할 일들<br/>"+
			   "완료된 일: 종료된 할일들."
		 });
	   tippy('#board9', {
		   content: "모든 스케줄의 일정을 알려줍니다."
		 });
	   tippy('#board10', {
		   content: "타임라인을 알려줍니다."
		 });
});
</script>
<style type="text/css">
.sch_name{
cursor:pointer;
}
.reList_sch_name
{
cursor:pointer;
}
.timeline_sch
{
cursor:pointer;
}

</style>
</head>
<body style="background-image:url(${bg});">
<%@include file="../include/Header.jsp"%>
<%@include file="../include/aside.jsp"%>
<c:forEach var="te" items="${donut}">
 <input type="hidden" id="donut_comp" value="${te.donut_comp}" />
 <input type="hidden" id="donut_haveto" value="${te.donut_haveto}" />
 <input type="hidden" id="donut_bfdead" value="${te.donut_bfdead}" />
 <input type="hidden" id="donut_afdead" value="${te.donut_afdead}" />
</c:forEach>

<c:forEach var="te" items="${graphlist}">
	<input type="hidden" class="date" value="${te.date}" />
	<input type="hidden" class="value" value="${te.value}" />
</c:forEach>      
      <!--  modal 버튼  -->

 
      <button onclick="document.getElementById('id01').style.display='block'" class="w3-button w3-small" style="width: 3%;float: right; margin-right: 0.2%;" >
      <img src="../resources/Dash_images/changebg.png" style="width: 20px;">
      </button>
       
       
    <div id="id01" class="w3-modal" >
     <div class="w3-modal-content w3-animate-top w3-card-4" style="width: 31%" >
      <header class="w3-container w3-teal"> 
        <span onclick="document.getElementById('id01').style.display='none'" 
        class="w3-button w3-display-topright">&times;</span>
        <h2 style="font-family: 'Hi Melody', cursive;">배경화면 바꾸기</h2>
      </header>
      <!--  이미지 사진 --> 
      <div class="w3-container" style="z-index:60;"> 
	     <div class="bgstyle" style="background-image:url('../resources/Dash_images/bg01.jpg');"></div>
	     <div class="bgstyle" style="background-image:url('../resources/Dash_images/bg02.jpg');"></div>
	     <div class="bgstyle" style="background-image:url('../resources/Dash_images/bg03.jpg');"></div>
	     <div class="bgstyle" style="background-image:url('../resources/Dash_images/bg04.jpg');"></div> 
	     <br />
	     <div class="bgstyle" style="background-image:url('../resources/Dash_images/bg17.jpg');"></div> 
	     <div class="bgstyle" style="background-image:url('../resources/Dash_images/bg18.jpg');"></div>     
	     <div class="bgstyle" style="background-image:url('../resources/Dash_images/bg19.jpg');"></div>
	     <div class="bgstyle" style="background-image:url('../resources/Dash_images/bg20.jpg');"></div>
	     <br />
	     
	     <div class="bgstyle" style="background-image:url('../resources/Dash_images/bg05.jpg');"></div> 
	     <div class="bgstyle" style="background-image:url('../resources/Dash_images/bg06.jpg');"></div> 
	     <div class="bgstyle" style="background-image:url('../resources/Dash_images/bg07.jpg');"></div> 
	     <div class="bgstyle" style="background-image:url('../resources/Dash_images/bg08.jpg');"></div> 
	 	 <br />
	     <div class="bgstyle" style="background-image:url('../resources/Dash_images/bg13.jpg');"></div>
	     <div class="bgstyle" style="background-image:url('../resources/Dash_images/bg14.jpg');"></div>     
	     <div class="bgstyle" style="background-image:url('../resources/Dash_images/bg15.jpg');"></div>
	     <div class="bgstyle" style="background-image:url('../resources/Dash_images/bg16.jpg');"></div>
	     <br />
      </div>
      
      <footer class="w3-container w3-teal" style="margin-top: 1%;">
        <input type="button" class="w3-teal" id="bgcancel"style="font-family: 'Hi Melody', cursive; border: 0; outline: 0; cursor: pointer;" value="초기화" />
        <input type="button" class="w3-teal" id="bgok" style="font-family: 'Hi Melody', cursive; float:right; border:0; outline:0; cursor: pointer;" value="적용" /> 
      </footer>
    </div>
   </div>


   <!--  전체 틀-->
   <div class="grid_container">
      <!--  첫번째 틀-->
     <!--  첫번째 틀-->
      <div class="board_first">
         <div class="board1">


            <div class="w3-panel w3-pale-white w3-leftbar w3-border-black" style="height: 110%">
          
            <div class="con-tooltip bottom">
                <p class="text-uppercase mar-btm text-sm w3-xlarge" id="board1">프로젝트 </p>
                <!-- <div class="tooltip"> 
                <p>자신이 속해 있는 프로젝트의 수 입니다.</p>  
                  </div> -->
      </div>
             <!--   <i class="fa fa-users fa-5x"></i> -->
               <hr>
               <p class="h2 text-thin"><a href="#"><c:out value="${pjcnt}" /></a></p>
            </div>
         </div>

         <div class="board2">
            
            <div class="w3-panel w3-pale-white w3-leftbar w3-border-yellow"
               style="height: 90%">
                <div class="con-tooltip bottom">
               <p class="text-uppercase mar-btm text-sm w3-xlarge" id="board2">전체 일정</p>
               <!-- <div class="tooltip ">
                <p>해당 프로젝트 스케줄 수 입니다.</p>
                  </div> -->
   			   </div>
              <!--  <i class="fa fa-comment fa-5x"></i> -->
               <hr>
               <p class="h2 text-thin"><a href="#"><c:out value="${alltodocnt}" /> </a></p>
            </div>
         </div>

         <div class="board3">
            

            <div class="w3-panel w3-pale-white w3-leftbar w3-border-purple" 
               style="height: 90%">
               <div class="con-tooltip bottom">
               <p class="text-uppercase mar-btm text-sm w3-xlarge" id="board3">남은 업무</p>
<!--                <div class="tooltip ">
                <p>자신이 속해 있는 프로젝트의 남은 프로젝트의 수 입니다.</p>
                  </div>
 -->   			   </div>
               <!-- <i class="fa fa-shopping-cart fa-5x"></i> -->
               <hr>
               <p class="h2 text-thin"><a href="#"><c:out value="${recnt}" /></a></p>
            </div>


         </div>

         <div class="board4">
              <div class="w3-panel w3-pale-sand w3-leftbar w3-border-dark-grey" style="height: 90%">
                <div class="con-tooltip bottom">
                 <p class="text-uppercase mar-btm text-sm w3-xlarge" id="board4">완료업무</p>
                   <!-- <div class="tooltip ">
                <p>자신이 속해 있는 프로젝트의  완료된 프로젝트 수 입니다.</p>
                  </div> -->
   			   </div>
                       <!-- <i class="fa fa-dollar fa-5x"></i> -->
                       <hr>
                       <p class="h2 text-thin"><a href="#"><c:out value="${comcnt}" /></a></p>
              </div>
         </div>
         

      </div>
      
      <!--두번째 틀  -->
      <div class="board_second">
         <!--  두번째 안에 6개 -->
         <div class="secondBoardinner" >
          <div class="verticalCarouselHeader " id="board5">
          <div class="con">
          <div class="con-tooltip right">
            <div class="w3-container w3-theme w3-large">
                            프로젝트 진행률
          </div>
           <!-- <div class="tooltip ">
                <p>현재 프로젝트의 진행률 입니다.</p>
                  </div> -->
   			   </div>
          </div>
</div>

           <c:set var = "gptotal" value="0" />
           
		  <c:if test="${empty graphlist}"><img src="../resources/Dash_images/result_null.png" alt="nullimg" width="100%" height="100%"></c:if>
          <c:if test="${not empty graphlist}">
          <div id="multi"></div> 
          </c:if>
         </div>
         
         <div class="secondBoardinner">
          <div class="verticalCarouselHeader " id="board6">
              <div class="con-tooltip right">
            <div class="w3-container w3-theme  w3-large">
                           팀원별 기여도
          </div>
                 <!-- <div class="tooltip ">
                <p>해당 프로젝트에서 기여도가 높은 팀원 top5</p>
                  </div> -->
   			   </div>
          </div>
         
            <div class="container" >
               <div id="skill">
               <c:set var = "total" value="0" />
               <c:set var="numset" />  
               <c:forEach var="sum" items="${topList}" varStatus="st">
               	<c:set var ="total" value="${total + sum.total}" />      	   
	               <c:set var="numset" value="${st.count}" />
               </c:forEach>
               
               <c:if test="${numset < 2}" ><img src="../resources/Dash_images/result_null.png" alt="nullimg" width="100%" height="100%"></c:if>
               <c:if test="${numset >= 2}">
                <c:forEach var="toplist" items="${topList}" end="4">
                     <div class="skillbar" style="height:5%;">
                       <div class="filled" data-width="${toplist.total/total*100}%"></div>
                       <span class="title w3-small">${toplist.id}</span>
                       <span class="percent w3-small">
                      <%--  <fmt:formatNumber value="${toplist.total/total*100}" type="percent" maxFractionDigits="2" pattern="0.0%" /> --%>
                       <fmt:parseNumber value="${toplist.total/total*100}" integerOnly="true" />%
                       </span>           
                     </div>
                 </c:forEach>
               </c:if>
               <!-- css js php sass -->
                 </div>  <!--  skill div end -->
              </div>    

         </div>
         
         <!----차트3 다가올 일정 ---->
         <div class="secondBoardinner">
	            <div class="verticalCarousel1">
	            <div class="verticalCarouselHeader " id="board7">
	             <div class="con-tooltip right">
	                <div class="w3-container w3-theme  w3-large"> 다가올 일정 </div>
 				<!-- <div class="tooltip ">
                <p>스케줄에서 3일 내로 가장 가까운 일정을 알려줍니다.</p>
                  </div> -->
                  </div>
	                <a href="#" class="vc_goDown"><i class="fa fa-fw fa-angle-down"></i></a>
	                <a href="#" class="vc_goUp"><i class="fa fa-fw fa-angle-up"></i></a>
	            </div>
	                 
	            <c:if test="${empty comlist}"><img src="../resources/Dash_images/result_null.png" alt="nullimg" width="100%" height="100%"></c:if>
	            <c:if test="${!empty comlist}">
	            <ul class="verticalCarouselGroup vc_list">
	           		<c:forEach var="comlist" items="${comlist}">
	               	 <li>
	                    <p class="w3-small" style="font-weight: bold;">
	                    <input type="hidden" id="pro_id" name="pro_id" value="${comlist.pro_id}">
	                    <span class="sch_name">${comlist.sch_name}</span>
	                     <span class="datediv w3-small" >&nbsp;&nbsp;&nbsp; ${comlist.sch_start} ~ ${comlist.sch_end}
	                    </span>
	                    </p>       	
	                </li>
	                </c:forEach>
	            </ul>
	            </c:if>
	             
	       		</div>
	        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
	        <script src="../js/Dash_jQuery.verticalCarousel.js"></script>
	        <script>
	            $(".verticalCarousel1").verticalCarousel({
	                currentItem: 1,
	                showItems: 4,
	            });
	        </script>
        </div>
            
            
            <!--차트 6 도넛 그래프   -->
         <div class="secondBoardinner">
          <div class="verticalCarouselHeader " id="board8" style="z-index: 50;
    position: relative;">
           <div class="con-tooltip bottom"> 
            <div class="w3-container w3-theme w3-large">
               	    나의 배정 업무  
          </div>
          
 			<!-- <div class="tooltip ">
                <p>스케줄에서 정해진 할 일들을 그래프로 보여줍니다.<br/>
				마감지남: 종료일이 지났으나 완료가 되지 않은 일들.<br/>
				계획된 일: 앞으로 계획된 할 일들<br/>
				마감임박: 3일 내로 끝내야 할 일들<br/>
				완료된 일: 종료된 할일들.</p>
                  </div> -->
   			   </div>
          </div>
           <!--  <svg id="svg" style="height: 80%;"></svg> -->
           <c:set var = "dntotal" value="0" />
           <c:forEach var="sum" items="${donut}" >
	       <c:set var ="dntotal" value="${dntotal + sum.donut_comp + sum.donut_haveto + sum.donut_bfdead + sum.donut_afdead}" />
           </c:forEach> 
		   <c:if test="${dntotal == 0 }"><img src="../resources/Dash_images/result_null.png" alt="nullimg" width="100%" height="100%"></c:if>
           <c:if test="${dntotal != 0}">
            <div class="boxsize">  
            <div id="dashDonut" style=" z-index:10; width: 90%;height: 80%; position: static; float: left; margin-top: 20px;"></div>
         	</div> 
         	<br /><br /><br />
         	<div class="circle1"></div><p class="w3-large">&nbsp;&nbsp;&nbsp;마감지남</p>
         	<div class="circle2"></div><p class="w3-large">&nbsp;&nbsp;&nbsp;진행중 일</p>
         	<div class="circle3"></div><p class="w3-large">&nbsp;&nbsp;&nbsp;시작전 일</p>
         	<div class="circle4"></div><p class="w3-large">&nbsp;&nbsp;&nbsp;완료된 일</p>
         	</c:if>
         </div>
         <!---- 차트 4 최근 일정 목록---->
         
         <div class="secondBoardinner">
	            <div class="verticalCarousel2">
	            <div class="verticalCarouselHeader " id="board9" style="z-index: 50;
    position: relative;">
	              <div class="con-tooltip top">
	               <div class="w3-container w3-theme w3-large"> 최근(등록)일정 목록</div>
	                
 			<!-- <div class="tooltip ">
                <p>모든 스케줄의 일정을 알려줍니다.</p>
                  </div> -->
   			   </div>
	                <a href="#" class="vc_goDown"><i class="fa fa-fw fa-angle-down"></i></a>
	                <a href="#" class="vc_goUp"><i class="fa fa-fw fa-angle-up"></i></a>
	            </div>
	            
	            <c:if test="${empty relist}"><img src="../resources/Dash_images/result_null.png" alt="nullimg" width="100%" height="100%"></c:if>
	            <c:if test="${!empty relist}">
	            <ul class="verticalCarouselGroup vc_list">
	           		<c:forEach var="reList" items="${relist}">
	                <li>
	                    <p class="w3-small" style="font-weight: bold;">
	                    <input type="hidden" name="pro_id" id="pro_id" value="${reList.pro_id}"/>
                   <span class="reList_sch_name">${reList.sch_name}</span>
	                     <span class="datediv w3-small">${reList.sch_start} ~ ${reList.sch_end}</span>
	                   </p>
	                     <span class="w3-small" style="color: gray;">${reList.name}</span>
	                </li>
					</c:forEach>
	            </ul> 
	            </c:if>
	       		</div>
		        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
		        <script src="../js/Dash_jQuery.verticalCarousel.js"></script>
		        <script>
		            $(".verticalCarousel2").verticalCarousel({
		                currentItem: 1,
		                showItems: 4,
		            });
		        </script>
         </div>
            
            <!--  차트5 타임라인-->
           <div class="secondBoardinner">
            <div class="verticalCarousel3">
            <div class="verticalCarouselHeader " id="board10"  style="z-index: 50;
    position: relative;">
            <div class="con-tooltip top">
                <div class="w3-container w3-theme  w3-large"> 타임라인</div>
                <!-- <div class="tooltip ">
                <p>타임라인을 알려줍니다.</p>
                  </div> -->
   			   </div>
   			   
                <a href="#" class="vc_goDown"><i class="fa fa-fw fa-angle-down"></i></a>
                <a href="#" class="vc_goUp"><i class="fa fa-fw fa-angle-up"></i></a>
            </div>
            
            <c:if test="${empty timelist}"><img src="../resources/Dash_images/result_null.png" alt="nullimg" width="100%" height="100%"></c:if>
            <c:if test="${!empty timelist}">
            <ul class="verticalCarouselGroup vc_list">
                <c:forEach var="tmList" items="${timelist}">
                <li>
                     <p class="w3-small" style="font-weight: bold;"><input type="hidden" value="${tmList.tl_id}" />
                     <input type="hidden" value="${tmList.tl_type}"/>
                     <input type="hidden" name="pro_id" id="pro_id" value="${tmList.pro_id}"/>
                     <span class="timeline_sch"><span class="w3-small w3-tag w3-blue" style="float:left"> ${tmList.tl_type}${tmList.tl_info}</span>
                    <c:choose>
                    <c:when test="${tmList.tl_type eq '파일'}">
                    <c:set var="checks" value="${tmList.tl_content}"/>
                    <c:set var="check_array" value="${fn:substringAfter(checks, '!park_')}"/>
                    ${tmList.tl_type} ${check_array}가 ${tmList.tl_info} 되었습니다.
                    </c:when>
                    <c:otherwise>
                     ${tmList.tl_type} ${tmList.tl_content}가 ${tmList.tl_info} 되었습니다.
                    </c:otherwise>
                    </c:choose>
                    </span>
                  
                   <%-- <span class="w3-small" style="color: gray; float:right;" > ${tmList.id} </span> --%>
                </li>
                </c:forEach>
            </ul>
            </c:if>
       	    </div>
	        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
	        <script src="../js/Dash_jQuery.verticalCarousel.js"></script>
	        <script>
	            $(".verticalCarousel3").verticalCarousel({
	                currentItem: 1,
	                showItems: 3,
	            });
	        </script>   
            </div>         
        <!--  modal 버튼 -->
                             
        </div><!--두번째틀 끝 -->    
      </div> <!--  전체틀 끝 -->
      
<script src="../js/Dash_jquery.pista.min.js"></script> <!-- 곡선그래프 -->
<script src="//cdnjs.cloudflare.com/ajax/libs/modernizr/2.8.3/modernizr.min.js"></script>
<script src="../js/Dash_an-skill-bar.js"></script>
<script src="../js/Dash_DashMainGraph.js"></script>
<div id="parkclear" style="clear:both"></div>
</body>
</html>