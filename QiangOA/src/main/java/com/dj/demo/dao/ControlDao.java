package com.dj.demo.dao;

import java.util.List;
import java.util.Map;

import com.dj.demo.model.TB_Control;


public interface ControlDao {

	public List<TB_Control> getControlInfo(Map<String, Object> map);

	public int updateControl(Map<String, Object> map);

	public void addControl(TB_Control tb);

	public void deleteControlById(String[] ids);

	public int findConName(String alias);

	public String getAlias(Integer id);

	public void updateUsrInfoControl(Map split);
}
