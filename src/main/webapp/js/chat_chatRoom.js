var chatwebsocket;
// 연결
// 배포시 아이피 바꿔야함 192.168.30.65이건 내꺼
chatwebsocket = new WebSocket("ws://localhost:8090/tmi/chatting");
chatwebsocket.onopen = onOpen;
chatwebsocket.onmessage = onMessage;
chatwebsocket.onclose = onClose;
// 파일 담을 리스트
var fileList = [];
$(document)
		.ready(
				function() {
					$('.replyMessage').find("input, select, button, textarea").prop("disabled",true);
					// ajax 로딩시 나올 이미지
					$('#loading').hide();
					// 시작 시 채팅영역 스크롤 하단으로 내리기
					$("#chatArea").scrollTop($("#chatArea")[0].scrollHeight);
					var projectId = $('#projectId').val();// 프로젝트 아이디
					var userNick = $('#userNick').val();// 닉네임 또는 아이디
					var myName=$('#myName').val()//유저이름
					var myprofimg = $('#myProfimg').val();// 프로필 이미지 저장
					// ajax시작
					$(window).ajaxStart(function() {
						$('#loading').show();
					})
					// ajax 끝
					$(window).ajaxStop(function() {
						$('#loading').hide();
					});
					// 파일 첨부 모달에서의 취소버튼
					$('#fileInsC').click(function() {
						fileInsModalHide();
					})

					// 파일 첨부 모달에서의 삭제버튼
					$('#fileInsDel').click(function() {
						console.log(fileList);
						var chkbox = $('.notall:checked');
						chkbox.each(function(i, v) {
							var td = $(v).parent();
							var td2 = $(td.next()).html();
							fileList.splice(fileList.indexOf(td2), 1);
						})
						$('.notall:checked').closest('tr').remove();
					})

					// 파일 첨부 모달에서의 파일 전송버튼
					$('#fileInsSend')
							.click(
									function() {
										// 객체 담음
										if (fileList == '') {
											swal ( "Oops" ,  "파일이 없습니다." ,  "error" )
											return false;
										}

										var formData = new FormData();
										formData.append('id', userNick);
										formData.append('pro_id', projectId);
										if (fileList) {
											for ( var index in fileList) {
												formData.append('filename',
														fileList[index]);
											}
										}
										// ajax 시작
										$
												.ajax({
													url : 'chatInsertFile',
													processData : false,
													contentType : false,
													enctype : 'multipart/form-data',
													dateType : 'text',
													data : formData,
													type : 'POST',
													success : function(result) {
														$	.each(	result,function(i,v) {
															var msg={
																	type:"file",
																	file:v,
																	id:userNick,
																	name:myName,
																	myprofimg:myprofimg
															};
															chatwebsocket.send( JSON.stringify(msg));
																		})
														fileInsModalHide();
													}
												});
										// ajax끝
									});
					// 인풋 파일 체인지 발생시
					$('#file').change(
							function() {
								var fileName = $(this).val();
								if(fileName.length>99){
									swal ( "Oops" ,  "파일 이름이 너무 긿어요 100자 이하로 줄여주세요." ,  "error" );
									$(this).val("");
									return false;
								}
								var fileinput=document.getElementById("file");
								var files=fileinput.files;
								fileUpLoad(files);
							});
					// 채팅 전송
					// 엔터로 메세지 발송
					$('#message').keypress(
							function(event) {
								if (event.keyCode == 13) {
									if (!event.shiftKey) {
										event.preventDefault();
										var msg=$('#message').val();
										if(msg.length==0){
											return false;
										}
										if(msg.length>2000){
											swal ( "Oops" ,  "글자수 제한 2000자입니다." ,  "error" );
											$('#message').val('');
											return false;
										}
								//	msg= 	msg.replace( /&/gi, "&amp;");
										msg = 	msg.replace( /</gi, "&lt;");
										msg= 	msg.replace( />/gi, "&gt;");
										msg=msg.replace(/\t/g, "    ");
										msg=msg.replace(/\"/g, "&quot;");
										msg = msg.replace(/(?:\r\n|\r|\n)/g,'<br/>');
										var msgt={
												type:"message",
												text:msg,
												id:userNick,
												name:myName,
												myprofimg:myprofimg
										};
										console.log(msgt);
										chatwebsocket.send( JSON.stringify(msgt));
										// 메시지 입력창 초기화
										$('#message').val('');

									}

								}
							});
					// 브라우저창을 종료, 이탈 웹소켓 종료
					$(window).on('close', function() {
						chatwebsocket.close();
					});
					$('#filelabel').click(function() {
						$('#fileInsModal').css({
							'visibility' : 'visible',
							'z-index' : '10',
							'display' : 'block'
						});
					})
			
							$(document).on('click', '.replyimg', function() {
								$('#fileprPreviewModal').css({
									'visibility' : 'visible',
									'z-index' : '10',
									'display' : 'block'
								});
								$('#filePreviewImgSrc').attr('src',
										$(this).attr('src'));
								/* $(this).attr('src') */
							})
					$('#multiDown').click(
							function() {
								$('.multiDown:checked').each(
										function() {
											var val = $(this).val().split(
													'!park_');
											var a = $("<a>").attr(
													"href",
													"/tmi/chatting/"
															+ $(this).val())
													.attr("download", val[1])
													.appendTo("body");
											a[0].click();
											a.remove();
										})
							})
					$('#fileprPreviewModal').click(function() {
						$('#fileprPreviewModal').css({
							'visibility' : 'hidden',
							'z-index' : '0',
							'display' : 'none'
						});
					})
					// 파일 첨부 모달창에서 파일올라가는 테이블의 전부 체크버튼 처리
					$('#chkall').change(function() {
						if ($('#chkall').is(":checked")) {
							$('.notall').prop("checked", true);
						} else {
							$('.notall').prop("checked", false);
						}
					});
					$(document).on('click', '.notall', function() {
						if ($(this).is(":checked") == false) {
							$('#chkall').prop("checked", false);
						}
					});
					$('#disChk').click(function(){
						$('#eachFileArea input[type=checkbox]').prop('checked', false);
					})
					$(document).on('click', '.eachFile', function() {	
						if($(this).children().children('input').is(":checked")){
							$(this).children().children('input').prop('checked', false);
							var test=$(this).children().children('label');
							test.addClass('active');
							setTimeout(function() {
								test.removeClass('active');
								}, 200);
							
							
						}else{
							$(this).children().children('input').prop('checked', true);
							var test=$(this).children().children('label');
							test.addClass('active');
							setTimeout(function() {
								test.removeClass('active');
								}, 200);
					
						}
						$('#selectfilecnt').text("선택된 갯수 : "+ $(".multiDown:checked").length);
					})
					tippy('#fileprPreviewModal', {
						content: '<strong>클릭 시 종료됩니다.</strong>',
						followCursor: true,
						})
						//드래그 들어왔을때
						$("#fileInsArea").on('dragenter',function(e){
									e.stopPropagation();
											e.preventDefault();
											$("#tablewrap").css('background-color','#E3F2FC');
								});
					//드래그 떠날때
					$("#fileInsArea").on('dragleave',function(e){
				            e.stopPropagation();
				            e.preventDefault();
				            $("#tablewrap").css('background-color','#c4d3f6');
				        });
					$("#fileInsArea").on('dragover',function(e){
				            e.stopPropagation();
				            e.preventDefault();
				        });
						$("#fileInsArea").on('drop',function(e){
							   e.preventDefault();
							   $("#tablewrap").css('background-color','#c4d3f6');
							   fileUpLoad(e.originalEvent.dataTransfer.files);
						})
				});
// 파일첨부 모달 화면에서 지우기 및 내용 삭제
function fileInsModalHide() {
	$('#fileInsModal').css({
		'visibility' : 'hidden',
		'z-index' : '0',
		'display' : 'none'
	});
	$("#filetable tr:not(:first)").remove();
	$('#filepreviewAreaimg img').remove();
	fileList = [];
	$('#file').val('');
}
// 파일 미리보기
function inputPreview(input) {
	for(var i =0; i<input.length; i++){
		var name=input[i].name;
		var type=name.substring(name.lastIndexOf('.')+1,name.length);
		if (type == 'jpg' || type == 'gif' || type == 'png' || type == 'bmp') {
			var reader = new FileReader();
			reader.onload = function(e) {
				$('#filepreviewAreaimg').html("<img src=" + e.target.result + ">");
			}
			reader.readAsDataURL(input[i]);
		}
	}
}
// chatwebsocket이 연결된 경우 호출되는 함수
function onOpen(evt) {
	console.log("웹 소켓에 연결 성공");
}

// chatwebsocket이 연결 해제된 경우 호출되는 함수
function onClose(evt) {
	console.log("웹 소켓에 연결 해제");
}

// 서버에서 메시지가 왔을 때 호출되는 함수
function onMessage(evt) {
	// 서버가 전송한 메시지 가져오기
	var data = JSON.parse(evt.data);
	console.log(data);
	// 날짜관련
	var dateD = new Date();
	var minut = dateD.getMinutes() < 10 ? "0" + dateD.getMinutes() : dateD
			.getMinutes();
	// 나인가
	var itsme = $('#userNick').val();
	// 랜덤이랑 짜름
	var randomfile ="";
	var filetext = "";
	if(data.file){
	randomfile = data.file;
	randomfile=randomfile.split('!park_');
	// 자료형 이미지 파일인지 결정
	if(randomfile[1]){
		var type = typeChk(randomfile[1]);
		if (type == '.jpg' || type == '.gif' || type == '.png' || type == '.bmp') {
			filetext = "<div class='inline' id='time'>"
					+ dateD.getHours()
					+ ":"
					+ minut
					+ "</div><br/><div class='replyMessage'><img class='replyimg' src='/tmi/chatting/"
					+ data.file + "'><a href='/tmi/chatting/" + data.file
					+ "' download='" + randomfile[1] + "'>" + randomfile[1]
					+ "</a></div><br /></div>";
			$('#eachFileArea').prepend("<div class='eachFile'><div class='eachFileImg'><img class='efimg' src='/tmi/chatting/"+data.file+"'></div><div class='eachFileName'><small>"
					+ randomfile[1]
					+ "</small></div><div id='chkbBox'><input type='checkbox' id='"
					+ data.file
					+ "'class='multiDown' value='"
					+ data.file
					+ "'><label for='"
					+ data.file
					+ "'></div></div>");
		} else {
			filetext = "<div class='inline' id='time'>"
					+ dateD.getHours()
					+ ":"
					+ minut
					+ "</div><br/><div class='replyMessage'><img class='replyimg' src='../resources/Chat_img/file.png'><a href='/tmi/chatting/"
					+ data.file + "' download='" + data.file + "'>"
					+ randomfile[1] + "</a></div><br /></div>";
			$('#eachFileArea').prepend("<div class='eachFile'><div class='eachFileImg'><img class='efimg' src='../resources/Chat_img/file.png'></div><div class='eachFileName'><small>"
					+ randomfile[1]
					+ "</small></div><div id='chkbBox'><input type='checkbox' id='"
					+ data.file
					+ "'class='multiDown' value='"
					+ data.file
					+ "'><label for='"
					+ data.file
					+ "'></div></div");
		}
	}
	}
	// 텍스트형
/*	data.text = 	data.text.replace( /&/gi, "&amp;");
	data.text = 	data.text.replace( /</gi, "&lt;");
	data.text = 	data.text.replace( />/gi, "&gt;");*/
	var text = "<div class='inline' id='time'>" + dateD.getHours() + ":"
			+ minut + "</div><br/><div class='replyMessage'>" + data.text
			+ "</div><br /></div>";
	// 메세지 출력
	// 나 자신일때
	if (itsme == data.id) {
		// 자료 송신일때
		if (data.file) {
			$('#chatMessage').append("<div class='mewrap'>" + filetext);
		} else {
			$('#chatMessage').append("<div class='mewrap'>" + text);
		}
		// 상대방일때
	} else {
		var imgStr = "";
		// 프로필이미지 널체크
		if (data.myprofimg== "") {
			imgStr = "<img id='img' src='../resources/memberimg/user.png'>";
		} else {
			imgStr = "<img id='img' src='/tmi/profile_img/" + data.myprofimg
					+ "'>";
		}
		// 자료 송신일때
		if (data.file) {
		$('#chatMessage').append(
					"<div class='opwrap'><div id='img' class='inline'>"
							+ imgStr + "</div><div id='name' class='inline'>"
							+ data.name + "</div>&nbsp;" + filetext);
		$('#eachFileArea').prepend();
		} else {
			$('#chatMessage').append(
					"<div class='opwrap'><div id='img' class='inline'>"
							+ imgStr + "</div><div id='name' class='inline'>"
							+ data.name + "</div>&nbsp;" + text);
		}

	}
	// 채팅영역에 채팅 입력 후 스크롤바 내리기 파일일경우 이미지 불러오는데 시간걸려서 딜레이 걸었음
	setTimeout(function() {
		$("#chatArea").scrollTop($("#chatArea")[0].scrollHeight);
	}, 8);

}
function typeChk(filename) {
	if(filename.length){
		var filepathlength = filename.length;
		var lastdot = filename.lastIndexOf('.');
		var type = filename.substring(lastdot, filepathlength).toLowerCase();
		return type;	
	}
}
function fileUpLoad(files){
	inputPreview(files);
						var file;
						for(var i =0; i<files.length; i++){
							if (fileList.length == 8) {
								swal ( "Oops" ,  "한번에 8개까지 업로드 가능합니다." ,  "error" );
								return false;
							}
							file=files[i];
							$('#filetable').append(
									'<tr class="nothead"><td><input type="checkbox" class="notall"/></td><td>'
											+ file.name + '</td></tr>');
							fileList.push(files[i]);
						}
}