package com.dj.demo.dao;

import java.util.List;
import java.util.Map;

import com.dj.demo.model.Tips;

public interface MessageDao {

	public void getMessageDao(Map<String, Object> map);

	public void getReceiveMessageById(Map<String, Object> map);

	public void getReceiveMessages(Map<String, Object> map);

	public void replayMessages(Map<String, Object> map);

	public void getReceiveMessageByIdAndSendId(Map<String, Object> map2);

	public void getSendMessage(Map<String, Object> map);

	public int findControl(String operator);

	public void getMessageDao2(Map<String, Object> map);

	public List<Tips> getTips();

	public List<Tips> getPosition();

	public List<Tips> getLines();

	public List<Tips> getControl();
}
