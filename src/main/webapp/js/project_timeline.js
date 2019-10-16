$(document).ready(function(){	
	
	/////////////////////////////////////쿠키////////////////////////////////////
		var a = $('.timelines');
		a.on('click',function(){
			if($(this).hasClass('time_nonchk')){
				var id = $(this).attr('id');
				console.log(id);
				$.removeCookie(id);
				$.cookie(id, 'time_chk', { expires: 365 });
				$(this).removeClass('time_nonchk');
				
			}
			
			if($(this).find('.time_content').hasClass("time_sch")){
				var sch_id = $(this).children('#type_id').val();
				
				$.ajax({
					url:'schedule',
					data:'sch_id='+sch_id,
					type:'POST',
					success:function(res){
						$('#timeline_wrap').empty();
						$('#timeline_wrap').html(res);
						$('#timeline_wrap').css({'margin-left':'180px','margin-top':'43px'});
					}
				})
			}else if($(this).find('.time_content').hasClass("time_todo")){
				var t_id = $(this).children('#type_id').val();
				$.ajax({
					url:'schedule',
					data:'t_id='+t_id,
					type:'POST',
					success:function(res){
						$('#timeline_wrap').empty();
						$('#timeline_wrap').html(res);
						$('#timeline_wrap').css({'margin-left':'180px','margin-top':'43px'});
					}
								
				})
			}else if($(this).find('.time_content').hasClass("time_file")){
				location.href="/tmi/chat/chattingroom";
			}else if($(this).find('.time_content').hasClass("time_mem")){
				location.href="/tmi/setting/main";
			}
			
		})
		
		for(var i=0;i<a.length;i++){
			var coo = $.cookie('time_0'+(i+1));
			if(coo==undefined){
				$.cookie('time_0'+(i+1), 'time_nonchk', { expires: 365 });
			}else{
				a.eq(i).addClass(coo);
			}
		}	
		/////////////////////////////////////쿠키////////////////////////////////////
		
		//////////////////////////////탐라처리/////////////////////////////////////
		$('.time_todo').append('할일');
		$('.time_sch ').append('스케쥴');
		$('.time_mem ').append('멤버');
		$('.time_file ').append('파일');
		
		$('.time_start').append('생성');
		$('.time_end').append('종료');
		$('.time_add').append('가입');
		$('.time_remove').append('탈퇴');
		$('.time_up').append('업로드');
})