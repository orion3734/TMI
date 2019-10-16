$(document).ready(function(){	
	var id=$('#sessionId').val();	
	if(id==null || id=="")
       {
		  $('#header_sign_in_out').html('sign in');
		  $('#header_sign_up_mypage').html('sign up');
		  $('#header_sign_in_out').addClass('header_singIn');
		  $('#header_sign_up_mypage').addClass('header_singUp');
		  $('#header_sign_in_out').removeClass('header_signOut');
		  $('#header_sign_up_mypage').removeClass('header_mypage');
		  
		  $('#header_notification').hide();
		  $('#header_notiCount').hide();
		  $('#header_notiNum').hide();
       }
	else
		{
		  $('#header_sign_in_out').html('sign out');
		  $('#header_sign_up_mypage').html('mypage');
		  $('#header_sign_up_mypage').addClass('header_mypage');
		  $('#header_sign_in_out').addClass('header_signOut');
		  $('#header_sign_in_out').removeClass('header_singIn');
		  $('#header_sign_up_mypage').removeClass('header_singUp');
		  
		  $('#header_notification').show();
		  $('#header_notiCount').show();
		  $('#header_notiNum').hide();
		}
	
	  $('#header_notification, #header_notiCount').on('click',function(){
		  if($("#header_notiNum").css("display") == "none"){
			    $("#header_notiNum").show();
			} else {
			    $("#header_notiNum").hide();
			}
	  })
	  
	  $('.header_singIn').on('click',function(){
        $(location).attr("href", "sign_in.do");
    });
    $('.header_singUp').on('click',function(){
        $(location).attr("href", "sign_up.do");
    });
    $('.header_mypage').on('click',function(){
        $(location).attr("href", "home");
    });
    $('.header_signOut').on('click',function(){
        $(location).attr("href", "sign_out");
    });
    
    $(".header_mypage").click(function(){
    	
    	location.href="/tmi/mypage";
    	
    })
    //select 디자인 및 동작********************************************
	$(".custom-select").each(function() {
		  var classes = $(this).attr("class"),
		      id      = $(this).attr("id"),
		      name    = $(this).attr("name");
		  var template =  '<div class="' + classes + '">';
		      template += '<span class="custom-select-trigger">' + $(this).children('.selected').text() + '</span>';
		      template += '<div class="custom-options">';
		      $(this).find("option").each(function() {
		        template += '<span class="custom-option ' + $(this).attr("class") + '" data-value="' + $(this).attr("value") + '">' + $(this).html() + '</span>';
		      });
		  template += '</div></div>';
		  
		  $(this).wrap('<div class="custom-select-wrapper"></div>');
		  $(this).hide();
		  $(this).after(template);
		});
		$(".custom-option:first-of-type").hover(function() {
		  $(this).parents(".custom-options").addClass("option-hover");
		}, function() {
		  $(this).parents(".custom-options").removeClass("option-hover");
		});
		$(".custom-select-trigger").on("click", function() {
		  $('html').one('click',function() {
		    $(".custom-select").removeClass("opened");
		  });
		  $(this).parents(".custom-select").toggleClass("opened");
		  event.stopPropagation();
		});
		$(".custom-option").on("click", function() {
		  $(this).parents(".custom-select-wrapper").find("select").val($(this).data("value"));
		  $(this).parents(".custom-options").find(".custom-option").removeClass("selection");
		  $(this).addClass("selection");
		  $(this).parents(".custom-select").removeClass("opened");
		  $(this).parents(".custom-select").find(".custom-select-trigger").text($(this).text());
		  var pro_id = $(this).attr('data-value');
		  location.replace("?proIdChange=true&chg_pro_id="+pro_id);
	});
})
