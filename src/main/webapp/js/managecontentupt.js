
$(document).ready(function(){
	// 프로젝트 정보 수정
	$('#update').on('click', function(){		
		
		var start = $('#pro_start').val();
		var startArr = start.split('-');
		
		var end = $('#pro_end').val();
		var endArr = end.split('-');
				
		var startCompare = new Date(startArr[0], parseInt(startArr[1])-1, startArr[2]);
	    var endCompare = new Date(endArr[0], parseInt(endArr[1])-1, endArr[2]);
	    
	    if(startCompare.getTime() > endCompare.getTime()){
	    	swal("다시 설정해주세요","시작일이 종료일보다 큽니다","error");
	    	return false;
	    }	    
	    
	    if(!(startCompare.getTime() > endCompare.getTime() ) ){
	    	$("#set_form").attr("action", "contentUpt");
	    }	    		

	});
	
	// 뒤로가기
	$('#back').on('click', function(){
		//location.href="main";
		$("#set_form").attr("action", "main");
		//$(location).attr("href", "main");
	});
});	
