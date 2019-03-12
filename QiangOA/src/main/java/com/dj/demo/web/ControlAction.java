package com.dj.demo.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dj.demo.model.Operator;
import com.dj.demo.model.TB_Control;
import com.dj.demo.service.ControlService;

import net.sf.json.JSONObject;

@Controller
@RequestMapping("/control")
public class ControlAction {

	@Autowired
	ControlService con;
	
	@ResponseBody
	@RequestMapping("/controlInfo")
	public Map<String,Object> getControlInfo(@RequestParam(defaultValue="1") int page,@RequestParam(defaultValue="5") int limit)
	{
		Map<String,Object> controlList=con.getControlInfo(page,limit);
		return controlList;
	}
	
	@ResponseBody
	@RequestMapping(value="/updateControl",method=RequestMethod.POST)
	public String updateControl(Integer id,HttpSession session)
	{
		JSONObject js=new JSONObject();
		Operator op=(Operator) session.getAttribute("user");
		Map<String,Object> map=new HashMap<String, Object>();
		String alias=con.getAlias(id);
		map.put("alias", alias);
		map.put("operator", op.getOperator());
		int row=con.updateControl(map);
		if(row>0)
		{
			js.put("status", "success");
		}
		else
		{
			js.put("status", "error");
		}
			return js.toString();
	}
	@ResponseBody
	@RequestMapping(value="/addControl",method=RequestMethod.POST)
	public String addControl(TB_Control tb)
	{
		int row=con.findConName(tb.getAlias());
		if(row==0) {
			con.addControl(tb);
			return  "add success";
		}
		else {
			return "add error";
		}
	}
	
	@ResponseBody
	@RequestMapping(value="/batchDelete",method=RequestMethod.POST)
	public String batchDelete(String ids,String name)
	{
		Map<String,Object> map=new HashMap<String, Object>();
		map.put("v", "");
		map.put("ids", name.split(";"));
		con.updateUsrInfoControl(map);
		con.deleteControlById(ids.split(";"));
		System.out.println(ids);
		return "delete success";
	}
		
}
