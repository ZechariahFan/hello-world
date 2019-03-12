package com.dj.demo.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dj.demo.dao.ControlDao;
import com.dj.demo.model.TB_Control;
import com.dj.demo.model.UsrInfo;
import com.dj.demo.service.ControlService;

@Service
public class ControlServiceImpl implements ControlService {

	@Autowired
	ControlDao control;
	
	public Map<String, Object> getControlInfo(int page,int limit) {
		// TODO Auto-generated method stub
		
		List<TB_Control> con=null;
		List<TB_Control> count=null;
		Map<String, Object> map=new HashMap<String, Object>();
		Map<String, Object> map1=new HashMap<String, Object>();
		
		map.put("tableName", "tb_control");
		map.put("PAGESIZE", limit);
		map.put("currPage", page);
		map.put("total_record", "");
		map.put("total_page", "");
		map.put("result", new ArrayList<TB_Control>());
		control.getControlInfo(map);
		con=(ArrayList<TB_Control>)map.get("result");
		map1.put("code", 0);
		map1.put("msg", "");
		map1.put("count", map.get("total_page"));
		map1.put("data", con);
		
		
		return map1;
	}

	public int updateControl(Map<String, Object> map) {
		// TODO Auto-generated method stub
		int row=control.updateControl(map);
		if(row>0)
		{
			return 1;
		}
		return 0;
	}

	public void addControl(TB_Control tb) {
		// TODO Auto-generated method stub
		control.addControl(tb);
	}

	public void deleteControlById(String[] ids) {
		// TODO Auto-generated method stub
		control.deleteControlById(ids);
	}

	public int findConName(String alias) {
		// TODO Auto-generated method stub
		return control.findConName(alias);
	}

	public String getAlias(Integer id) {
		// TODO Auto-generated method stub
		return control.getAlias(id);
	}

	public void updateUsrInfoControl(Map split) {
		// TODO Auto-generated method stub
		 control.updateUsrInfoControl(split);
	}

}
