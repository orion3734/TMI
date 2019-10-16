$(document).ready(function(){
	$.ajax({
		type:"GET",
		dataType:'text',
		data:"where=kanbanboard",
		url:'showWhat',
		success:function(res){
			$('.showWhat').empty();
			$('.showWhat').html(res);
		}
	})
	$('.btn-group button').on('click',function(){
		var where = $(this).attr('id');
		$.ajax({
			type:"GET",
			dataType:'text',
			data:"where="+where,
			url:'showWhat',
			success:function(res){
				$('.showWhat').empty();
				$('.showWhat').html(res);
			}
		})
	})
	
	
})