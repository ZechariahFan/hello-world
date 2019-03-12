package com.dj.demo.web;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.Duration;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dj.demo.model.Operator;
import com.dj.demo.model.Record_Exception;
import com.dj.demo.model.TB_Control;
import com.dj.demo.model.UsrInfo;
import com.dj.demo.service.RecordService;

import net.sf.json.JSONObject;

@Controller
public class RecordExceptionAction {

	@Autowired
	private RecordService recordService;
	@ResponseBody
	@RequestMapping(value="/addRecord",method=RequestMethod.POST)
	public String addRecord(Record_Exception record_Exception,HttpSession session)
	{
		JSONObject jsonObject=new JSONObject();
		
		if(session.getAttribute("classify")==null||session.getAttribute("rec")==null) {
			jsonObject.put("status", "error");
			return jsonObject.toString();
		}
		String t,e1;
		String rp;
		int duration,startTime,endTime;
		Record_Exception rec=(Record_Exception)session.getAttribute("rec");
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date ddate = new Date();
		String sdate=sdf.format(ddate);
		Operator u=(Operator)session.getAttribute("user");
		t=record_Exception.getBtTime();
		e1=record_Exception.getEdTime();
		Date d1 = null;
		Date d2 = null;
		rp=rec.getReport_id();
		String[] tt=rec.getReport_id().split("\\.");
		System.out.println(tt[0]);
		String tm[]=tt[0].split("-");
		String rp1=tm[0]+""+tm[1]+""+tm[2]+"."+tt[1]+"."+tt[2]+".1";
		try {
			d1 = sdf.parse(t);
			d2 = sdf.parse(e1);;
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		Long startLong = d1.getTime();
		Long endLong = d2.getTime();
		//计算时间差,单位毫秒
		double ms = (endLong-startLong)/1000.0/60.0;
		//时间差转换为 \天\时\分\秒  
		//String time = longTimeToDay(ms);
		rec.setBtTime(record_Exception.getBtTime());
		rec.setEdTime(record_Exception.getEdTime());
		rec.setIntervalTime(ms);
		//插入时间
		rec.setCurrentTime(sdate);
		//描述
		rec.setDescp(record_Exception.getDescp());
		//异常名称
		rec.setException(record_Exception.getException());
		rec.setJdsc1(Integer.parseInt((String)session.getAttribute("jdsc")));
		rec.setName(u.getName());
		rec.setNum(record_Exception.getNum());
		rec.setOperator(u.getOperator());
		Map<String,Object> map=new HashMap<String, Object>();
		map.put("operator", rec.getOperator());
		map.put("name",rec.getName());
		map.put("exception",rec.getException());
		map.put("descp",rec.getDescp());
		map.put("num",rec.getNum());
		map.put("btTime", rec.getBtTime());
		map.put("edTime", rec.getEdTime());
		map.put("currentTime",rec.getCurrentTime());
		map.put("report_id",rp1);
		map.put("intervalTime",rec.getIntervalTime());
		map.put("line_actual",rec.getLine_actual());
		map.put("process",rec.getProcess());
		map.put("rest_time",rec.getRest_time());
		map.put("repeatTime",rec.getRepeatTime());
		map.put("jdsc1",rec.getJdsc1());
		map.put("kaoQinDay",rec.getKaoQinDay());
		map.put("shift", rec.getShift());
		map.put("rows",0);
		map.put("classify", (String)session.getAttribute("classify"));
		//在插入数据前进行匹配，看数据库是否存在相同时间的异常，如果存在则不插入
		Boolean flags=recordService.isExistSameExceptionTime(rec.getBtTime(),rec.getEdTime());
		if(flags) {
			Boolean flag=recordService.addRecordException(map);
			
		}
			
		jsonObject.put("status", "ok");
		return jsonObject.toString();
		
	}
	
	private String longTimeToDay(Long ms) {
		Integer ss = 1000;  
        Integer mi = ss * 60;  
        Integer hh = mi * 60;  
        Integer dd = hh * 24;  

        Long day = ms / dd;  
        Long hour = (ms - day * dd) / hh;  
        Long minute = (ms - day * dd - hour * hh) / mi;  
        Long second = (ms - day * dd - hour * hh - minute * mi) / ss;  
        Long milliSecond = ms - day * dd - hour * hh - minute * mi - second * ss;  

        double t=0.0;
        StringBuffer sb = new StringBuffer();  
        
        if(day > 0) {  
            sb.append(day+"天");  
        }  
        if(hour > 0) {  
        	t=hour/60;
        }  
        if(minute > 0) {  
        	t+=minute;
        }  
        if(second > 0) { 
        	t+=(second*1.0)/60;
        }  
        if(milliSecond > 0) {  
            sb.append(milliSecond+"毫秒");  
        }  
        System.out.println("实际=="+t+"");
        sb.append(t+"");
        return sb.toString();   
	}

	@RequestMapping("/getExceptionInfo")
	public String getExceptionInfo(HttpSession session,Model v)
	{
		List<TB_Control> ls=new ArrayList<TB_Control>(); 
		Operator op=(Operator)session.getAttribute("user");
		String id=recordService.getExceptionId(op.getOperator());
		if(id==null) {
			v.addAttribute("a", "no");
			return "page/message";
		}
		ls=recordService.getExceptionInfo(id);
		
		v.addAttribute("ecx", ls);
		return "views/exception/record";
	}
}
