package com.dj.demo.service;

import java.util.List;
import java.util.Map;

import com.dj.demo.model.Record_Exception;
import com.dj.demo.model.TB_Control;

public interface RecordService {

	public boolean addRecordException(Map<String, Object> map);

	public List<TB_Control> getExceptionInfo(String id);

	public String getExceptionId(String operator);

	public boolean isExistSameExceptionTime(String btTime, String edTime);
}
