$(document).ready(function(){	

	$('.gotoHome').on('click',function(){
		location.href="/tmi/home";
	})

	$('input[type="text"]').attr('autocomplete','off');

	var sessionTheme=$("#sessionTheme").val();
	var skin = $('.tmi_skin');
	if(sessionTheme!="")
	{
		for(var i =1; i<21;i++){
			$('.tmi_skin').removeClass('tmi_skin'+i);
		}	
		skin.addClass(sessionTheme);	
	}
})