<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<link href='../plugin/jquery-ui.min.css' type='text/css'
	rel='stylesheet'>
<style type="text/css">
.group {
	width: 255px;
    height: 700px;
    background: #fefefe;
    margin-right: 25px;
    float: left;
    border-radius: 21px 21px 0px 0px;
    border: 1px solid #d4d4d4;
}

.g_head {
	height: 37px;
    border-radius: 21px 21px 0px 0px;
    color: #fcfcfc;
    text-align: center;
    padding-top: 13px;
    font-size: 20px;
}

.sch_todo {
	height: 16px;
    background: #fefefe;
    overflow: hidden;
    margin: 0 5px 4px 5px;
    padding: 5px;
    font-size: 14px;
    cursor: pointer;
    border-bottom: 1px solid #a9a0a0;
    width: 213px;
    margin: 0 auto;
    margin-top: 8px;
	transition: 0.6s;
}

.ui-sortable-helper {
	cursor: grabbing;
	transition: 0s !important;
}

.clicked {
	height: 140px;
    border: 1px solid #ccc8c8;
    color: #0c0c0c;
    font-size: 14px;
}

#sch_wrap {
	width: 1600px;
	padding-left: 70px;
	margin-top: -50px;
}

#returnBtn {
	width: 105px;
    height: 64px;
    margin-left: -105px;
    float: left;
    margin-top: 321px;
    font-family: 'Noto Sans KR', sans-serif;
    font-weight: 100;
    border: 1px solid rgb(210, 208, 208);
    color: white;
    font-size: 17px;
    cursor: pointer;
    padding: 6px;
}

.ui-draggable-dragging {
	transition: 0s !important;
}

#sortable1, #sortable2, #sortable3, #sortable4 {
	width: 100%;
	height: 100%;
	list-style-type: none;
	margin: 0;
	padding: 5px 0 0 0;
	float: left;
	margin-right: 10px;
	height: 100%;
}

#sch_info {
	width: 420px;
	height: 676px;
    background: white;
    border: 1px solid #d4d4d4;
    float: left;
    font-family: 'Noto Sans KR', sans-serif;
    font-weight: 100;
    text-align: center;
    padding-top: 24px;
}

#sch_info_top >div{
    padding-top: 18px;
    border-bottom: 1px solid #ccc8c8;
    width: 370px;
    margin: 0 auto;
    margin-bottom: 4px;
    padding-bottom: 10px;
}

#sch_info_name{
    font-weight: 400;
    font-size: 21px !important;
}

#sch_info_dis{
}

#sch_info_start{
}

#sch_info_end{
}

#sch_info_mem{
	height: 30px;
    font-size: 22px;
    border-bottom: #ccc8c8 1px dotted;
    padding-bottom: 8px;
    width: 370px;
    margin: 0 auto;
}

#sch_info_top{
height: 317px;
}

.sch_mem_img_wrap{
	margin-top: 30px;
    margin-left: 29px;
    height: 200px;
}

.sch_mem_img{
	width: 90px;
    height: 90px;
    margin-right: 23px;
    margin-top: 10px;
    background: #e0d5d5;
    float: left;
    border-radius: 45px;
}

#sch_info div span{
	color: #1f1e1e;
    float: left;
    margin-left: 3px;
    width: 111px;
    font-weight: 100;
    font-size: 17px;	
}


#sch_info_endBtn{
width: 373px;
    height: 65px;
    border: 1px solid #c7c7c799;
    color: white;
    font-family: 'Noto Sans KR', sans-serif;
    font-weight: 100;
    font-size: 23px;
    cursor: pointer;
    margin-top: 21px;
}

p{
	display: inline-block;
    width: 240px;
    border-left: 1px solid #d4d1d1;
    padding-left: 10px;
}

.sch_todo_name{
	border-bottom: 1px solid #ccc8c8;
    width: 203px;
    display: inline-block;
    padding-bottom: 5px;
    margin-bottom: 18px;
    font-size: 15px;
    font-weight: 400;
}

.sch_todo_label{
	border-right: 1px solid #ccc8c8;
    height: 18px;
    display: inline-block;
    padding-top: 0px;
    padding-right: 4px;
    font-weight: 100;
    margin-right: 5px;
    font-size: 13px;
}

.sch_todo_body{
	border-bottom: 1px solid #ccc8c8;
    padding-bottom: 4px;
    margin-top: 8px;
    width: 203px;
}

.sch_todo_body_end{
	border-bottom: none;
}

.sch_todo_for{
	text-align: center;
    display: inline-block;
    width: 137px;
}

#before .g_head{
background-size: 400%;
}

#progress .g_head{
background-size: 400%;
    background-position-x: 33%;
}

#overtime .g_head{
    background-size: 400%;
    background-position-x: 66%;
}

#after .g_head{
	background-size: 400%;
    background-position-x: 100%;
}
.unsortable{
	opacity: 0.5;
}

#noLi{
	text-align: center;
	position: relative;
    top: 39%;
    font-size: 17px;
    text-decoration: none;
    font-weight: bold;
    opacity: 0.5;
}
</style>
<script>
	
</script>
</head>
<body>
	<button id='returnBtn'class='${sessionScope.theme}'>칸반보드로<br/>돌아가기</button>
	<div id='sch_wrap'>
		<div class='group' id='before'>
			<div class='g_head tmi_skin ${sessionScope.theme}'>시작전</div>
			<ul id="sortable1" class="connectedSortable">
				<c:forEach items="${schOne.todoList }" var="tdDto">
				<c:choose>
					<c:when
						test="${tdDto.t_end>0 && tdDto.t_start>0 && empty tdDto.t_rend}">
						<li class='sch_todo' id="${tdDto.t_id }"><span class = 'sch_todo_name'>${tdDto.t_name}</span><br>
						<div class='sch_todo_body'><span class='sch_todo_label'>담당인원</span><span class='sch_todo_for'>${tdDto.name}	</span></div>						
						<div class='sch_todo_body'><span class='sch_todo_label'>시작까지</span><span class='sch_todo_for'>${fn:substring(tdDto.start_date,0,10)}</span></div>	
						<div class='sch_todo_body sch_todo_body_end'><span class='sch_todo_label'>종료까지</span><span class='sch_todo_for'> ${fn:substring(tdDto.end_date,0,10)}</span></div>	
						<input type="hidden" id="mytodo" value="${tdDto.id }">
						
						</li>
					</c:when>
				</c:choose>
				</c:forEach>
				<div id="noLi">
					
				</div>
			</ul>
		</div>
		<div class='group' id='progress'>
			<div class='g_head tmi_skin ${sessionScope.theme}'>진행중</div>
			<ul id="sortable2" class="connectedSortable">
				<c:forEach items="${schOne.todoList }" var="tdDto">
					<c:choose>
					<c:when
						test="${tdDto.t_end>=0 && tdDto.t_start<=0 && empty tdDto.t_rend}">
						<li class='sch_todo' id="${tdDto.t_id }"><span class = 'sch_todo_name'>${tdDto.t_name}</span><br>
						<div class='sch_todo_body'><span class='sch_todo_label'>담당인원</span><span class='sch_todo_for'>${tdDto.name}</span></div>						
						<div class='sch_todo_body'><span class='sch_todo_label'>시작까지</span><span class='sch_todo_for'>${fn:substring(tdDto.start_date,0,10)}</span></div>	
						<div class='sch_todo_body sch_todo_body_end'><span class='sch_todo_label'>종료까지</span><span class='sch_todo_for'> ${fn:substring(tdDto.end_date,0,10)}</span></div>
						<input type="hidden" id="mytodo" value="${tdDto.id }">	
						</li>
					</c:when>
					</c:choose>
				</c:forEach>
				<div id="noLi">
				
				</div>
			</ul>
		</div>
		<div class='group' id='overtime'>
			<div class='g_head tmi_skin ${sessionScope.theme}'>기한초과</div>
			<ul id="sortable3" class="connectedSortable">
				<c:forEach items="${schOne.todoList }" var="tdDto">
					<c:choose>
					<c:when
						test="${tdDto.t_end<0 && tdDto.t_start<=0 && empty tdDto.t_rend}">
						<li class='sch_todo' id="${tdDto.t_id }"><span class = 'sch_todo_name'>${tdDto.t_name}</span><br>
						<div class='sch_todo_body'><span class='sch_todo_label'>담당인원</span><span class='sch_todo_for'>${tdDto.name}</span></div>						
						<div class='sch_todo_body'><span class='sch_todo_label'>시작까지</span><span class='sch_todo_for'>${fn:substring(tdDto.start_date,0,10)}</span></div>	
						<div class='sch_todo_body sch_todo_body_end'><span class='sch_todo_label'>종료까지</span><span class='sch_todo_for'> ${fn:substring(tdDto.end_date,0,10)}</span></div>	
						<input type="hidden" id="mytodo" value="${tdDto.id }"></li>
					</c:when>
					</c:choose>
				</c:forEach>
				<div id="noLi">
				
				</div>
			</ul>
		</div>
		<div class='group' id='after'>
			<div class='g_head tmi_skin ${sessionScope.theme}'>종료됨</div>
			<ul id="sortable4" class="connectedSortable">
				<c:forEach items="${schOne.todoList }" var="tdDto">
					<c:choose>
					<c:when
					 test="${not empty tdDto.t_rend}">
						<li class='sch_todo' id="${tdDto.t_id }"><span class = 'sch_todo_name'>${tdDto.t_name}</span><br>
						<div class='sch_todo_body'><span class='sch_todo_label'>담당인원</span><span class='sch_todo_for'>${tdDto.name}</span></div>						
						<div class='sch_todo_body'><span class='sch_todo_label'>시작까지</span><span class='sch_todo_for'>${fn:substring(tdDto.start_date,0,10)}</span></div>	
						<div class='sch_todo_body sch_todo_body_end'><span class='sch_todo_label'>종료까지</span><span class='sch_todo_for'> ${fn:substring(tdDto.end_date,0,10)}</span></div>	
						<input type="hidden" id="mytodo" value="${tdDto.id }">
						</li>
					</c:when>
					</c:choose>
				</c:forEach>
				<div id="noLi">
				
				</div>
			</ul>
		</div>
		<div id='sch_info'>
		<div id='sch_info_top'>
			<div id='sch_info_name'>
				<span>스케쥴</span><p>${schOne.sch_name }</p></div>
			<div id='sch_info_dis'>
				<span>설명</span><p>${schOne.sch_info }</p></div>
			<div id='sch_info_start'>
				<span>시작일</span>${fn:substring(schOne.sch_start,0,10) }</div>
				<div id='sch_info_end'>			
				<span>종료예정일</span>${fn:substring(schOne.sch_end,0,10)}</div>
			</div>
		<div id='sch_info_bottom'>
		<div id='sch_info_mem'>
				<div>팀원</div>
				<div class='sch_mem_img_wrap'>
					<c:forEach items="${schOne.stList }" var="mem">
						<input type="hidden" id="memId" value="${mem.id }">
						<input type="hidden" id="memName" value="${mem.name }">
						<input type="hidden" id="memLevel" value="${mem.st_level }">
						<input type="hidden" id="memCntTd" value="${mem.cntTd }">
						<input type="hidden" id="memCntEndTd" value="${mem.cntEndTd }">
						<img class="sch_mem_img" alt="" src="/tmi/profile_img/${mem.profile_img }">
					</c:forEach>
				</div>
							<c:choose>
			<c:when test="${empty schOne.sch_rend }">
			<button id='sch_info_endBtn' class='tmi_skin ${sessionScope.theme}'>스케쥴 끝내기
				<input type="hidden" value="${schOne.sch_id }"/>
			</button>
			</c:when>
			<c:otherwise>
				<div>종료된 스케줄 입니다</div>
			</c:otherwise>
			</c:choose>
		</div>
			</div>
		</div>
	</div>
</body>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript">
	function tdPlaceHolder(){
	$('.connectedSortable').each(function(i,v){
		$(v).children('#noLi').empty();
		if($(v).children().length<=1){
			if($(v).attr('id')=='sortable1'){
				$(v).children('#noLi').text('시작전 할일 목록입니다');
			}
			if($(v).attr('id')=='sortable2'){
				$(v).children('#noLi').html('진행중 할일 목록입니다<br/>시작전 할일을 끌어다보세요');
			}
			if($(v).attr('id')=='sortable3'){
				
				$(v).children('#noLi').text('초과된 할일 목록입니다');
			}
			if($(v).attr('id')=='sortable4'){
				$(v).children('#noLi').html('종료된 할일 목록입니다 <br/>진행중이거나 초과된 할일을 끌어다보세요');
			}
		}
	})
	}
	tdPlaceHolder();
	
	
	$('.sch_todo').each(function(i,v){
		if($(v).children('#mytodo').val()!=$('#sessionId').val()){
			$(v).addClass('unsortable');
		}
	})
	
	$('.sch_mem_img').each(function(i,v){
		var id = $(v).prevAll('#memId').val();
		var name = $(v).prevAll('#memName').val();
		var level = $(v).prevAll('#memLevel').val();
		var memCntTd = $(v).prevAll('#memCntTd').val();
		var memCntEndTd = $(v).prevAll('#memCntEndTd').val();
		if(level==1){
			level = '리더'
		}else{
			level = '멤버'
		}
		var header = $('<div />', {
	        text: name
	      }).css({
	    	    'font-size': '18px',
	      		'border-bottom': '1px solid',
	      		'padding': '10px',
	      		'font-weight': 'bold'
	      });
		var content = '<table style="text-align: center;"><tr><td>아이디</td><td>'
		+id+'</td></tr><tr><td>등급</td><td>'
		+level+'</td></tr><tr><td>맡은할일 수</td><td>'
		+memCntTd+'개</td></tr><tr><td>끝낸할일 수</td><td>'
		+memCntEndTd+'개</td></tr></table>';
		content = $(content).get(0);
		$(content).children().children().children().css({'padding':'7px'});
		var tag = $('<div />');
		$(tag).append(header);
		$(tag).append(content);
		
		tippy(v, {
			  animation: 'scale',
			  theme: 'light',
			  trigger:'click',
			  //content: '<strong>내용: </strong>'+info.event.extendedProps.description
			  content: tag.get(0)
		})
	})
	
	
	
	$('#sch_info_endBtn').on('click',function(){
		var undoSum = $('#sortable1').children().length+$('#sortable2').children().length+$('#sortable3').children().length;
		var sch_id = $(this).children().val();
		if(undoSum>3){
			swal("Warning", '아직 할일이 남았습니다',"error")
			return;
		}
		$.ajax({
			type:'POST',
			url:"schRend",
			data:'sch_id='+sch_id,
			success:function(res){
				if(res){
					swal("스케줄이 종료되었습니다", {
					      icon: "success",
					    }).then((value) => {
							  window.location.href="/tmi/project/management";
						});
				}else{
					swal("Warning", '스케줄 리더만 종료할 수 있습니다',"error")
				}
				
			}
		})
	})

	$('#returnBtn').click(function() {
		window.location.href = 'management';
	})

	$('.sch_todo').on('click', function() {
		if ($(this).hasClass('clicked')) {
			$(this).removeClass('clicked');
		} else {
			$('.sch_todo').removeClass('clicked');
			$(this).addClass('clicked');
		}
	})

	$(function() {
		$(".group").droppable({
			accept : ".clicked",
			drop : function(event, ui) {
				$(this).css('background', 'white');
			}
		});

		/* $("#sortable1, #sortable2, #sortable3, #sortable4").sortable({
			connectWith : ".connectedSortable",
			change: function(event, ui){
				
			}
		}).disableSelection(); */
		$("#sortable1").sortable({
			connectWith : "#sortable2",
			items: "li:not(.unsortable)"
		}).disableSelection();
		$("#sortable2").sortable({
			connectWith : "#sortable4",
			items: "li:not(.unsortable)",
			receive: function(event, ui){
				swal({
					  title: "할일이 진행중인 상태로 바뀝니다",
					  text: "시작일이 현재날짜로 바뀌며 다시 되돌릴 수 없습니다",
					  icon: "warning",
					  buttons: true,
					  dangerMode: true,
					})
					.then((willDelete) => {
					  if (willDelete) {
					    swal("할일이 진행 중으로 바뀌었습니다", {
					      icon: "success",
					    });
					    $.ajax({
					    	url:'uptTdStart',
					    	data:'t_id='+$(ui.item).attr('id'),
					    	type:'POST'
					    })
					    tdPlaceHolder();
					  } else {
						  $( ".connectedSortable" ).sortable( "cancel" );
					  }
					});
			}
		}).disableSelection();
		$("#sortable3").sortable({
			connectWith : "#sortable4",
			items: "li:not(.unsortable)",
			receive: function(event, ui){
				
			}
		}).disableSelection();
		$("#sortable4").sortable({
			items: 'cancel',
			items: "li:not(.unsortable)",
			receive: function(event, ui){
				swal({
					  title: "할일이 종료됩니다",
					  text: "할일이 종료되며 다시 되돌릴 수 없습니다",
					  icon: "warning",
					  buttons: true,
					  dangerMode: true,
					})
					.then((willDelete) => {
					  if (willDelete) {
					    swal("할일이 종료 되었습니다", {
					      icon: "success",
					    });
					    $.ajax({
					    	url:'uptTdRend',
					    	data:'t_id='+$(ui.item).attr('id'),
					    	type:'POST'
					    })
					    tdPlaceHolder();
					  } else {
						  $( ".connectedSortable" ).sortable( "cancel" );
					  }
					});
			}
		})
	});
</script>
</html>