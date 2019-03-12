package com.dj.demo.service.impl;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.javassist.expr.NewArray;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dj.demo.dao.MessageDao;
import com.dj.demo.model.Tips;
import com.dj.demo.model.UsrInfo;
import com.dj.demo.service.MessageService;

@Service
public class MessageServiceImpl implements MessageService {

	@Autowired
	private MessageDao messageDao;
	public Map<String, Object> getMessageInfos(int page,int limit,String op) {
		// TODO Auto-generated method stub
		List<UsrInfo> messageBoxs=null;
		List<UsrInfo> count=null;
		Map<String, Object> map=new HashMap<String, Object>();
		Map<String, Object> map1=new HashMap<String, Object>();
		
		map.put("tableName", "usrinfo");
		map.put("PAGESIZE", limit);
		map.put("currPage", page);
		map.put("total_record", "");
		map.put("total_page", "");
		map.put("op", op);
		map.put("result", new ArrayList<UsrInfo>());
		messageDao.getMessageDao(map);
		messageBoxs=(ArrayList<UsrInfo>)map.get("result");
		map1.put("code", 0);
		map1.put("msg", "");
		map1.put("count", map.get("total_page"));
		map1.put("data", messageBoxs);
		return map1;
	}
	public void replayMessages(Map<String, Object> map) {
		// TODO Auto-generated method stub
		messageDao.replayMessages(map);
	}
	public void getReceiveMessageByIdAndSendId(Map<String, Object> map2) {
		// TODO Auto-generated method stub
		messageDao.getReceiveMessageByIdAndSendId(map2);
	}
	public int findControl(String operator) {
		// TODO Auto-generated method stub
		int row=messageDao.findControl( operator);
		return row;
	}
	public Map<String, Object> getMessageInfoWithoutControl(int page, int limit, String operator) {
		List<UsrInfo> messageBoxs=null;
		List<UsrInfo> count=null;
		Map<String, Object> map=new HashMap<String, Object>();
		Map<String, Object> map1=new HashMap<String, Object>();
		
		map.put("tableName", "usrinfo");
		map.put("PAGESIZE", limit);
		map.put("currPage", page);
		map.put("total_record", "");
		map.put("total_page", "");
		map.put("op", operator);
		map.put("result", new ArrayList<UsrInfo>());
		messageDao.getMessageDao2(map);
		messageBoxs=(ArrayList<UsrInfo>)map.get("result");
		map1.put("code", 0);
		map1.put("msg", "");
		map1.put("count", map.get("total_page"));
		map1.put("data", messageBoxs);
		return map1;
	}
	public List<Tips> getTips() {
		// TODO Auto-generated method stub
		List<Tips> tips=messageDao.getTips();
		return tips;
	}
	public List<Tips> getPosition() {
		// TODO Auto-generated method stub
		List<Tips> tips=messageDao.getPosition();
		return tips;
	}
	public List<Tips> getLine() {
		// TODO Auto-generated method stub
		List<Tips> tips=messageDao.getLines();
		return tips;
	}
	public List<Tips> getControl() {
		// TODO Auto-generated method stub
		List<Tips> tips=messageDao.getControl();
		return tips;
	}

}
