package com.dj.demo.dao;

import java.util.List;
import java.util.Map;

import com.dj.demo.model.Operator;
import com.dj.demo.model.UsrInfo;

public interface UserDao {
	List<Operator>findUserDao(Operator operator);
	String findUserDao2(Map<String,Object> paramCusKey);
	int addUser(Map<String, Object> map);
	void getUsers(Map<String, Object> map);
	void deleteUser(Map<String, Object> map);
	void getUserInfo(Map<String, Object> map);
	void updateUserInfo(Map<String, Object> map);
	void getUserAndDivide(Map<String, Object> map);
	void updateUserInfos(UsrInfo usrInfo);
	int findUserServiceFromUsrInfo(Operator operator);
	void addUserToUsrInfo(UsrInfo u);
	int findControlAilas(String control);
	int findLines(String line);
	int findPosition(String position);
	
}
