package com.dj.demo.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.dj.demo.model.Record_Exception;
import com.dj.demo.model.TB_Control;

public interface RecordExceptionDao {

	public void addExceptionRecord(Map<String, Object> map);

	public List<TB_Control> getExceptionInfo(String id);

	public String getExceptionId(String operator);

	public int isExistSameExceptionTime(@Param("btTime") String btTime, @Param("edTime") String edTime);
}
