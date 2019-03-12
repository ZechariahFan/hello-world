package com.dj.demo.service;

import java.util.List;
import java.util.Map;

import com.dj.demo.model.Operator;
import com.dj.demo.model.UsrInfo;

public interface UserService{
	List<Operator> findUserService(Operator operator);
	boolean addUser(Map<String, Object> map);
	boolean deleteUser(Integer userId);
	boolean batchDelete(String[] id);
	boolean updateUser(Map<String, Object> map);
	void updateUserInfo(UsrInfo usrInfo);
	int findUserServiceFromUsrInfo(Operator operator);
	void addUserToUsrInfo(UsrInfo u);
	int findControlAilas(String control);
	int findLines(String line);
	int findPosition(String position);
}