package controller;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.http.impl.io.HttpResponseParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import dto.ChattingDTO;
import service.ChatService;

@Controller
@RequestMapping("/chat/*")
public class ChatController {
	@Autowired
	private ChatService chatservice;

	// 테스트
	@RequestMapping("/chattingroom")
	public ModelAndView park_chat(ModelAndView mav, HttpSession session) {
		String pro_id = (String) session.getAttribute("pro_id");
		String id = (String) session.getAttribute("id");
		//내 정보 불러오기
		mav.addObject("myImg", chatservice.userInfo(id));
		//채팅리스트
		mav.addObject("chatList", chatservice.chatList(pro_id));
		//날짜
		mav.addObject("dateList", chatservice.dateList(pro_id));
		//오늘인지
		mav.addObject("today", chatservice.today());
		//파일리스트
		mav.addObject("fileList", chatservice.fileList(pro_id));
		mav.setViewName("chat/chatRoom");
		return mav;
	}
@Transactional
	@RequestMapping(value = "/chatInsertFile", produces = "application/json;charset=UTF-8")
	public @ResponseBody List<String> park_chatInsertFile(ChattingDTO dto, HttpServletRequest req) {
		List<MultipartFile> files = dto.getFilename();
		List<String> upload = new ArrayList<String>();
		if (files != null) {
			for (MultipartFile file : files) {
				String fileName = file.getOriginalFilename();
				UUID random = UUID.randomUUID();

				String root = req.getSession().getServletContext().getRealPath("/");
				String saveDirectory = root + "chatting" + File.separator;
				File fe = new File(saveDirectory);
				if (!fe.exists()) {
					fe.mkdir();
				}
				File ff = new File(saveDirectory, random + "!park_" + fileName);
				try {
					FileCopyUtils.copy(file.getInputStream(), new FileOutputStream(ff));
				} catch (FileNotFoundException e) {
					e.printStackTrace();
				} catch (IOException e) {
					e.printStackTrace();
				}
				upload.add(new String(random + "!park_" + fileName));
			}

			dto.setUpload(upload);
		}
		upload = dto.getUpload();
		
		chatservice.chatUpLoadFile(dto);

		return upload;
	}

}
