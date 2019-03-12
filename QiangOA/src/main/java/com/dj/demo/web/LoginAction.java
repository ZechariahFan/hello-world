package com.dj.demo.web;

import java.io.UnsupportedEncodingException;
import java.text.SimpleDateFormat;
import java.util.Arrays;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.codec.binary.Base64;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.config.authentication.UserServiceBeanDefinitionParser;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.dj.demo.model.Operator;
import com.dj.demo.model.UsrInfo;
import com.dj.demo.service.UserService;
import com.dj.demo.service.impl.UserServiceImpl;

import net.sf.json.JSONObject;

@Controller
public class LoginAction {
	
	@Autowired
	UserService userService=new UserServiceImpl();
	
	@RequestMapping("/{loginIn}")
	public String loginIn(@PathVariable("loginIn") String loginIn) {
		return loginIn;
	}
	

	@RequestMapping(value="/loginCheck",method=RequestMethod.POST)
	@ResponseBody
	public Map<String, String> checkLogin(HttpSession session,Operator operator){
		final Base64 base64 = new Base64();
		Map<String, String> map=new HashMap<String, String>();
		JSONObject result = new JSONObject();
		String password=null;
		if(operator.getOperator().equals("070231")) {
		try {
			// password=new String(base64.encodeToString(operator.getPassword().getBytes("utf-8")));
			 operator.setPassword(password);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		}
		operator.setPassword(password);
		List<Operator> oo= userService.findUserService(operator);
		String mess="";
		if(oo.size()>0) {
			
			SimpleDateFormat format1 = new SimpleDateFormat("HH:mm:ss");           
			int row=userService.findUserServiceFromUsrInfo(operator);
			if(row==0) {
				String s=(format1.format(new Date()));
				String t1 = s.substring(0, s.indexOf(":"));
				int time1=Integer.parseInt(t1);
				UsrInfo u=new UsrInfo();
				u.setOperator(oo.get(0).getOperator());
				u.setName(oo.get(0).getName());
					if(time1<18) {
						u.setShift("D");
					}
					else {
						u.setShift("N");
					}
					userService.addUserToUsrInfo(u);
			}
			
			
			mess="登陆成功";
			result.put("status", 200);
			result.put("msg", mess);
			map.put("msg", mess);
			map.put("status", "200");
			session.setAttribute("user", oo.get(0));
			session.setMaxInactiveInterval(0);
		}
		else {
			mess="用户名或密码出错";
			result.put("msg", mess);
			result.put("status", 404);
			map.put("msg", mess);
			map.put("status", "404");
		}
		return map;
	}
	
	
	
	
	
	
	@RequestMapping("/{loginIn}/{page}")
	public String loginIn2(@PathVariable("loginIn") String loginIn,@PathVariable("page") String page) {
		return loginIn+"/"+page;
	}
	
	@RequestMapping("/addUser")
	public String getUser() {
		System.out.println("进来了");
		return "views/user/add";
	}
	@RequestMapping("/{loginIn}/{page}/{page2}")
	public String loginIn3(@PathVariable("loginIn") String loginIn,@PathVariable("page") String page,@PathVariable("page2") String page2) {
		
		return loginIn+"/"+page+"/"+page2;
	}
	
	
	@RequestMapping("/toLogin")
	public String toMessage(HttpSession session)
	{
		session.setAttribute("f", "f");
		return "page/message";
	}
	
}
