package chat;

import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

import dto.ChattingDTO;
import service.ChatService;

public class ChatEchoHandler extends TextWebSocketHandler {
	@Autowired
	private ChatService chatservice;
	ChattingDTO dto = new ChattingDTO();
	/*
	 * private List<WebSocketSession> usersInfo = new ArrayList<>();// 유저정보 넣는 리스트
	 * private Map<String, WebSocketSession> usersInfo2 = new HashMap<>();//테스트중
	 */ private Map<WebSocketSession, String> roomList = new HashMap<>();// 방정보 받는 리스트
	private String roomNumber = "";
	private String userId = "";


	@Override
	// 연결시
	// 테스트
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		/* usersInfo.add(session); */

		Map<String, Object> httpSession = session.getAttributes();
		roomNumber = (String) httpSession.get("pro_id");
		userId = (String) httpSession.get("id");

		roomList.put(session, roomNumber);
	}

	@Override
	// jsp send시
	public void handleMessage(WebSocketSession session, WebSocketMessage<?> message) throws Exception {
		// 전송된 메시지를 모든 클라이언트에게 전송
		String msg = (String) message.getPayload();
		JsonParser jsonparser = new JsonParser();
		JsonObject object=(JsonObject) jsonparser.parse(msg);

		if(object.get("text")!=null) {
			dto.setId(object.get("id").toString().substring(1,object.get("id").toString().length()-1));
			String content=object.get("text").toString().substring(1, object.get("text").toString().length()-1);
			dto.setChat_content(content);
			dto.setPro_id(roomList.get(session));
			chatservice.insertchat(dto);
		}
		Iterator<Map.Entry<WebSocketSession, String>> test = roomList.entrySet().iterator();
		while (test.hasNext()) {
			Map.Entry<WebSocketSession, String> entry = (Map.Entry<WebSocketSession, String>) test.next();
			String roomnumber = entry.getValue();
			if (roomList.get(session).equals(roomnumber)) {
				entry.getKey().sendMessage(new TextMessage(msg));
			}
		}
	}

	@Override
	// 연결종료시
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		/* usersInfo.remove(session); */
		roomList.remove(session);
	}
	@Override
	public void handleTransportError(WebSocketSession session, Throwable exception) throws Exception {
		  System.err.println("transport error =" + session +", exception =" + exception);
	}

}
