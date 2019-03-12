package com.dj.demo.service.impl;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dj.demo.dao.UserDao;
import com.dj.demo.model.Operator;
import com.dj.demo.model.UsrInfo;
import com.dj.demo.service.UserService;


@Service
public class UserServiceImpl implements UserService {

	@Resource
	private UserDao userDao;
	public List<Operator> findUserService(Operator operator) {
		List<Operator> tt=new ArrayList<Operator>();

			 tt= userDao.findUserDao(operator);
			 System.out.println(tt.size());
			
		return tt;
	}
	


	public boolean addUser(Map<String, Object> map) {
		// TODO Auto-generated method stub
		boolean flag=true;
		try {
			userDao.addUser(map);
		}
		catch(Exception e) {
			flag=false;
		}
		
		if(flag) {
			return true;
		}
		return false;
	}




	public boolean deleteUser(Integer userId) {
		// TODO Auto-generated method stub
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("userId", userId);
		userDao.deleteUser(map);
		int row=(Integer) map.get("row");
		if(row>0) {
			return true;
		}
		else {
			return false;
		}
		
	}


	public boolean batchDelete(String[] id) {
		// TODO Auto-generated method stub
		Map<String, Object> map=new HashMap<String, Object>();
		for(int i=0;i<id.length;i++) {
			map.put("userId", id[i]);
			userDao.deleteUser(map);
		}
		int row=(Integer) map.get("row");
		if(row>0) {
			return true;
		}
		else {
			return false;
		}
	}



	public boolean updateUser(Map<String, Object> map) {
		userDao.updateUserInfo(map);
		int row=(Integer) map.get("row");
		if(row>0) {
			return true;
		}
		return false;
	}




	public void updateUserInfo(UsrInfo usrInfo) {
		// TODO Auto-generated method stub
		userDao.updateUserInfos(usrInfo);
	}


	public int findUserServiceFromUsrInfo(Operator operator) {
		// TODO Auto-generated method stub
		int row=userDao.findUserServiceFromUsrInfo(operator);
		return row;
	}


	public void addUserToUsrInfo(UsrInfo u) {
		// TODO Auto-generated method stub
		userDao.addUserToUsrInfo(u);
	}


	public int findControlAilas(String control) {
		// TODO Auto-generated method stub
		return userDao.findControlAilas(control);
	}



	public int findLines(String line) {
		// TODO Auto-generated method stub
		return userDao.findLines(line);
	}


	public int findPosition(String position) {
		// TODO Auto-generated method stub
		return userDao.findPosition(position);
	}



}
