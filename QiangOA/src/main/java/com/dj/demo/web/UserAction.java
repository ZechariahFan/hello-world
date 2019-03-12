package com.dj.demo.web;

import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.request;

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.sound.midi.Transmitter;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.dj.demo.model.UsrInfo;
import com.dj.demo.service.UserService;

@Controller
public class UserAction {

	@Autowired
	private UserService userService;
	
	@ResponseBody
	@RequestMapping(value="/deleteUser")
	public String deleteUser( Integer UserId) {
		System.out.println("ÓÃ»§id==="+UserId);
		boolean res=userService.deleteUser(UserId);
		System.out.println(res);
		if(res) {
			return "deleteSuccess";
		}
		else {
			return "deleteError";
		}
	}
	
	@ResponseBody
	@RequestMapping(value="/batchDelete",method=RequestMethod.POST)
	public String batchDelete(String ids) {
		String[] id = ids.split(",");
		boolean res=userService.batchDelete(id);
		if(res) {
			return "deleteSuccess";
		}
		else {
			return "deleteError";
		}
	}
	
	
	
	
	@RequestMapping("/logout")
	public String logout(HttpSession session,HttpServletRequest req) {
		session.removeAttribute("user");
		session.removeAttribute("flag");
		if(req.getParameter("ff")!=null &&req.getParameter("ff")!="" )
		{
			session.removeAttribute("f");
		}
		return "views/login";
	}
	
	@RequestMapping("/toIndex")
	public String toIndex(HttpSession session,HttpServletRequest req) {
		if(req.getParameter("ff")!=null &&req.getParameter("ff")!="" )
		{
			session.removeAttribute("f");
		}
		return "views/index";
	}
	@RequestMapping(value="/updateUsrInfo")
	public String updateUsrInfo(HttpServletRequest req) {
		req.setAttribute("d", "21");
		UsrInfo usr=new UsrInfo();
		int row=1;
		try {
			req.setCharacterEncoding("utf-8");
			String po=req.getParameter("position");
			String line=req.getParameter("line");
			String num=req.getParameter("num");
			String operator=req.getParameter("operator");
			String control=req.getParameter("control");
			String jdsc=req.getParameter("jdsc");
			
			
			
			
			
			if(line!=null&&line!="")
			{
				line=URLDecoder.decode(line,"UTF-8");
				 row=userService.findLines(line);
				usr.setLine(line);
				if(row==0)
				{
					req.setAttribute("a", "line");
				}
			}
			if(jdsc!=null&&jdsc!="")
			{
				usr.setJdsc(jdsc);
			}
			if(po!=null&&po!="")
			{
				po=URLDecoder.decode(po,"UTF-8");
				usr.setPosition(po);
				row=userService.findPosition(po);
				if(row==0)
				{
					req.setAttribute("a", "position");
				}
			}
			
			if(control!=null&&control!="")
			{
				control=URLDecoder.decode(control,"UTF-8");
				usr.setControl(control);
				if(control!=null&&control!="") {
					 row=userService.findControlAilas(control);
					 if(row==0)
						{
							req.setAttribute("a", "alias");
						}
					 }
				
			}
			
			String classify=req.getParameter("classify");
			
			if(classify!=null&&classify!="")
			{
				
				//String classifys=new String(classify.getBytes("iso-8859-1"),"utf8");
				classify=URLDecoder.decode(classify,"UTF-8");
				usr.setClassify(classify);
			}
			
			usr.setNum(num);
			usr.setOperator(operator);}
			catch (UnsupportedEncodingException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		if(row>0) {
			try {
				userService.updateUserInfo(usr);
			}
			catch(Exception e)
			{
				req.setAttribute("a", "jdsc");
			}
		}
		return "page/message";
	}
}
