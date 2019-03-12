package com.dj.demo.service;

import java.util.List;
import java.util.Map;

import com.dj.demo.model.Operator;
import com.dj.demo.model.Tips;

public interface MessageService
{
	public Map<String, Object> getMessageInfos(int page,int limit, String op);
	public void replayMessages(Map<String, Object> map);
	public void getReceiveMessageByIdAndSendId(Map<String, Object> map2);
	public int findControl(String operator);
	public Map<String, Object> getMessageInfoWithoutControl(int page, int limit, String operator);
	public List<Tips> getTips();
	public List<Tips> getPosition();
	public List<Tips> getLine();
	public List<Tips> getControl();
}