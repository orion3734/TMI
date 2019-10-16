$(document).ready(function(){
	var width=216*($('.schedules').length+1);
	$('#schedules_wrap').css('width',width+'px');
	
	$('#kanban_right').on('mouseover',function(){
		  var _scrollX = $('#kanban_wrap').scrollLeft()+20;
		  $('#kanban_wrap').scrollLeft(_scrollX);
		  $(this).animate({'width':'0px'},10,function(){
			  $(this).animate({'width':'100px'},10);
		  });
	});
	
	$('#kanban_left').on('mouseover',function(){
		  var _scrollX = $('#kanban_wrap').scrollLeft()-20;
		  $('#kanban_wrap').scrollLeft(_scrollX);
		  $(this).animate({'width':'0px'},10,function(){
			  $(this).animate({'width':'100px'},10);
		  });
	});
	
	
	//스케줄 시작일 종료일****************************************
    var sch_start =  $('#sch-form #sch_start').get(0);
	var sch_end = $('#sch-form #sch_end').get(0);
	$.ajax({
		url : 'proSelect',
		method : "POST",
		success : function(res) {
			const schPicker = new Lightpick({
				field: sch_start,
			    secondField: sch_end,
				singleDate: false,
				format:'YY/MM/DD',
				repick: true,
				minDate: new Date(res.pro_start),
			    maxDate: new Date(res.pro_end),
				onSelect: function(start, end){
					
				}
			});
		}
	})
	
	$('.insertModal').on('click',function(e){
		if($(this).attr('href')!='#sch-form'){
			var sch_id = $(this).attr('href').replace('#','');
			var thisForm = document.getElementById(sch_id);
			var min = $(this).children('#sch_start').val();
			var max = $(this).children('#sch_end').val();
			const schPicker = new Lightpick({
				field: $(thisForm).children('#t_start').get(0),
			    secondField: $(thisForm).children('#t_end').get(0),
				singleDate: false,
				format:'YY/MM/DD',
				repick: true,
				minDate: new Date(min),
			    maxDate: new Date(max),
				onSelect: function(start, end){
					
				}
			});
		}
		e.preventDefault();
		this.blur;
		if(!$.modal.isActive()){
			$('.modal input').each(function(i,v){
				if($(v).attr('type')=='text')
					$(v).val('');
			})
		}
		$($(this).attr('href')).modal({
			escapeClose: false,
			clickClose: false
		});
	})
	
	//스케줄/할일유저추가*****************************************
	$(document).on('click', '.team-list-item', function(){
		width+=216;
		$('#schedules_wrap').css('width',width+'px');
		var result = false;
		var input = $(this).text();
		var teamList = $(this).parent();
		var tableList = $(teamList).prevAll('.table-list').first();
		var level = $(teamList).prevAll('.teamExp').first();
		var levText = $(level).attr('id');
		$(tableList).each(function(i,v){
			if($(v).attr('id')==input){
				result = true;
				return false;
			}
		})
		if(result){
			swal("Warning", "유저가 이미 팀에 속해있습니다","error");
			return;
		}
		if(levText==undefined){
			levText='';
		}
		if(levText=='leader'){
			$(tableList).prepend('<li class="table-list-item" id="'+input+'"><span class="table-list-cell">'+input+'</span>'+
					'<span class="table-list-cell"></span><span class="table-list-cell" id="level">'+levText+'</span><span class="table-list-cell" id="remove-item">x</span>'+
					'<input type="hidden" name="'+$(tableList).attr('id')+'" value="'+input+'"/></li>');
		}else{
			$(tableList).append('<li class="table-list-item" id="'+input+'"><span class="table-list-cell">'+input+'</span>'+
					'<span class="table-list-cell"></span><span class="table-list-cell" id="level">'+levText+'</span><span class="table-list-cell" id="remove-item">x</span>'+
					'<input type="hidden" name="'+$(tableList).attr('id')+'" value="'+input+'"/></li>');
		}
		
		
		if($(this).parent().attr('id')=='stList'){
			$(this).parent().hide();
		}		
		$(this).remove();
		setSchLevel(tableList,level,teamList);
		
	})
	
	//스케줄/할일유저제거****************************************
	$(document).on('click','#remove-item', function(){
		var input = $(this).parent().attr('id');
		var tableList = $(this).parents('.table-list');
		var teamList = $(tableList).nextAll('.team-list').first();
		var level = $(teamList).prevAll('.teamExp').first();
		if($(teamList).attr('id')=='stList'){
			$(teamList).show();
		}
		$(teamList).append('<li class="team-list-item">'+input+'</li>');
		
		$(this).parent().remove();
		setSchLevel(tableList,level,teamList)
	})
	
	function setSchLevel(tableList, level,teamList){
		
		if($(tableList).find('#level').text()=='leader'){
			$(level).attr('id','member')
			$(level).text('스케줄 멤버를 정해주세요')
		}else{
			$(level).attr('id','leader')
			$(level).text('스케줄 리더를 정해주세요')
		}
		if($(teamList).children().length<1){
			$(level).text('추가할 인원이 없습니다')
		}		
	}
	
	$('.modal').submit(function(){
		if($(this).children('.table-list').children().length<1){
			swal("Warning", "인원을 배치해주세요","error");
			return false;
		}
		if($(this).children('.start').val()=='' || $(this).children('.end').val()==''){
			swal("Warning", "날짜를 지정해주세요","error");
			return false;
		}
		if($('.teamExp').attr('id')=='leader'&& $(this).attr('id')=='sch-form'){
			swal("Warning", "리더를 지정해주세요","error");
			return false;
		}
	})
})