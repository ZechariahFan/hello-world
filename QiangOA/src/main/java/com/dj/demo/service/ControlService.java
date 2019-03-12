package com.dj.demo.service;

import java.util.List;
import java.util.Map;

import com.dj.demo.model.TB_Control;

public interface ControlService {

	
	public Map<String, Object> getControlInfo(int page, int limit);

	public int updateControl(Map<String, Object> map);

	public void addControl(TB_Control tb);

	public void deleteControlById(String[] strings);

	public int findConName(String alias);

	public String getAlias(Integer id);

	public void updateUsrInfoControl(Map<String, Object> map);
	
}
