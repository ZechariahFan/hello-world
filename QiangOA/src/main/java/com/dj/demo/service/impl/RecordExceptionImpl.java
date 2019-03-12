package com.dj.demo.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dj.demo.dao.RecordExceptionDao;
import com.dj.demo.model.Record_Exception;
import com.dj.demo.model.TB_Control;
import com.dj.demo.service.RecordService;

@Service
public class RecordExceptionImpl implements RecordService {

	@Autowired
	RecordExceptionDao recordExceptionDao;
	public boolean addRecordException(Map<String, Object> map) {
		// TODO Auto-generated method stub
		recordExceptionDao.addExceptionRecord(map);
		Integer res=(Integer)map.get("rows");
//		if(res>0) {
//			return true;
//		}
		return false;
	}
	public List<TB_Control> getExceptionInfo(String id) {
		// TODO Auto-generated method stub
		List<TB_Control> ms=recordExceptionDao.getExceptionInfo(id);
		return ms;
	}
	public String getExceptionId(String operator) {
		// TODO Auto-generated method stub
		String id=recordExceptionDao.getExceptionId(operator);
		return id;
	}
	public boolean isExistSameExceptionTime(String btTime, String edTime) {
		// TODO Auto-generated method stub
		int row=recordExceptionDao.isExistSameExceptionTime(btTime,edTime);
		if(row>0)
		{
			return false;
		}
		return true;
	}

}
