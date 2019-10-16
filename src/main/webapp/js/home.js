$(document).ready(function(){	
	var p = $('.project');
	p.css('margin-top','-80px');

	$('#pro_div').on('mouseover',function(){
		p.css('margin-top','0px');


		if(p.length>6)
			$('#pro_div').css({'margin-top':'50px','padding-top':'0px'});
		else{
			$('#pro_div').css({'margin-top':400-p.length*40+'px','padding-top':'50px'});
		}
		$('#projects').hide();		
	}).on('mouseleave',function(){
		p.css('margin-top','-80px');
		$('#pro_div').css({'margin-top':'350px','transition':'1.2s','width':'500px','padding-top':'100px','height':'auto'});
		$('#projects').show();
	});

	$('.project').on('mouseover',function(){
		if(p.length>6){
			if($('#pro_div').css('padding-top').split('p')[0]<50) {
				$('#pro_div').css({'width':'1200px','transition':'0s'});
				$(this).css('width', '1170px');
			}
		}else{
				$('#pro_div').css({'width':'1200px','transition':'0s'});
				$(this).css('width', '1170px');
				if($('#pro_div').css('padding-top').split('p')[0]<40*(6-p.length)) {
			}
		}

	}).on('mouseleave',function(){
		$(this).css('width', '320px');
	})


	var num=1;
	$('#header_sign_in_out').on('click',function(){
		$(location).attr("href", "sign_in.do");
	});
	$('#header_sign_up').on('click',function(){
		$(location).attr("href", "sign_up.do");
	});

	$(".project").click(function(){
		var form = document.createElement("form");
		form.setAttribute("method", "POST"); // Get 또는 Post 입력
		form.setAttribute("action", "project/management");
		$(form).append($(this).children('#pro_id'));
		document.body.appendChild(form);
		form.submit();
	})

	$('input#pro_name').on('keyup',function(){
		var input = $(this).val();
		var overlap = false;
		$('div.pro_name').each(function(i,v){
			if($.trim($(v).text())==input){
				overlap = true;
				return;
			}
		})
		if(overlap){
			$('#overlap').show();
		}else{
			$('#overlap').hide();
		}
      })
      
      
      $("#pro-form_btn").click(function(){
    	  	if($('#overlap').is(':visible')){
    	  		$('input#pro_name').focus();
    	  		return false;
    	  	}
    	  	if($(this).prevAll('#pro_name').val()=='' || $(this).prevAll('#pro_info').val()==''){
    	  		swal("Warning", "입력칸을 작성해주세요","error");
    	  		return false;
    	  	}
    		if($(this).prevAll('#pro_start').val()=='' || $(this).prevAll('#pro_end').val()==''){
    			swal("Warning", "날짜를 지정해주세요","error");
    			return false;
    		}
    		var pro_team_list_array=new Array();
    		if($("input[name='pro_team_list']").val()!=null)
    			{
    			$("input[name='pro_team_list']").each(function(i,v){
    				pro_team_list_array.push($(v).val());
    		})
    			}
    		$.ajax({
    		    url: "project/insertProject", 
    		    traditional : true,
    		    data: { "pro_name": $("#pro_name").val(),
    		            	"pro_info":$("#pro_info").val(),
    		            	"pro_start":$("#pro_start").val(),
    		            	"pro_end":$("#pro_end").val(),
    		            	"pro_team_list":pro_team_list_array
    		    },
    		    type: "post",     
    		    dataType: "text",
    		    success:function(res)
    		    {
    		    	swal("Good job!", "프로젝트 추가 성공!", "success")
    				.then((value) => {
    					if($("input[name='pro_team_list']").val()!=null)
    						{
    						$("input[name='pro_team_list']").each(function(i,v){
    				    		socket.send("invite,"+$(v).val()+","+res);
    				    })
    						}
    					location.href="home";
    				});
    		    	
    		    	/* var res=sessionUId+","; */
    	         }

    			})
    		})
    	
     
      
    //프로젝트 시작일 종료일****************************************
    var pro_start =  document.getElementById('pro_start');
	var pro_end = document.getElementById("pro_end");
	const myPicker = new Lightpick({
		field: pro_start,
		secondField: pro_end,
		singleDate: false,
		format:'YY/MM/DD',
		repick:true,
		onSelect: function(start, end){

		}
	});

	//검색****************************************
	$('#pro-form #search_id').on({
		focus:function(){
			$('#pro-form #search_result').show();
		},
		blur:function(){
			if($('#pro-form #search_result').val()=='' || $('#pro-form #search_result').val()==null)
				return;
			$('#pro-form #search_result').hide();
		},
		keyup:function(){
			$('#pro-form #search_result').empty();
			var id = $(this).val();
			if(id == null || id == '')
				return;
			$.ajax({
				url:'project/searchId',
				type:'POST',
				data:'id='+id,
				success:function(res){
					$('#pro-form #search_result').empty();
					$(res).each(function(i,v){						
						$('#pro-form #search_result').append('<li class="autocomplete-item">'+v+'</li>')
					})
				}
			})
		}
	})

	//유저추가*****************************************
	$(document).on('click', '.autocomplete-item', function(){
		var input = $(this).text();
		var result = false;
		
		if($('.table-list-item').length>5){
			swal("Warning", "최대 인원은 본인포함 6명입니다.","error");
			return;
		}
		
		$('.table-list-item').each(function(i,v){
			if($(v).attr('id')==input){
				result = true;
				return false;
			}
		})
		$('#pro-form #search_id').val('');
		$('#pro-form #search_result').empty();
		if(input==$('#sessionId').val()){
			swal("Warning", "본인은 추가할 수 없습니다.","error");
			return;
		}
		if(result){
			swal("Warning", "유저가 이미 팀에 속해있습니다","error");
			return;
		}
		$('#pro_team_list').append('<li class="table-list-item" id="'+input+'"><span class="table-list-cell">'+input+'</span>'+
				'<span class="table-list-cell"></span><span class="table-list-cell"></span><span class="table-list-cell" id="remove-item">x</span>'+
				'<input type="hidden" name="pro_team_list" value="'+input+'"/></li>')

	})



	//유저제거****************************************
	$(document).on('click','#remove-item', function(){
		$(this).parent().remove();
	})

	$('.btn').click(function(e){
		e.preventDefault();
		this.blur();
		if(!$.modal.isActive()){
			$('.modal input').each(function(i,v){
				if($(v).attr('type')=='text')
					$(v).val('');
			})
		}
		$('.modal').modal({
			escapeClose: false,
			clickClose: false
		});
	})

})