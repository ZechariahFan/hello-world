package com.dj.demo.web;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Calendar;
import java.util.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Properties;
import java.util.UUID;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.codec.binary.Base64;
import org.apache.http.HttpResponse;
import org.apache.http.HttpServerConnection;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;

import com.dj.demo.model.Operator;
import com.dj.demo.model.Record_Exception;
import com.dj.demo.model.Tips;
import com.dj.demo.model.UsrInfo;
import com.dj.demo.service.MessageService;
import com.dj.demo.service.RecordService;

@Controller
@RequestMapping("/message")
public class MessageAction {

	@Autowired
	private MessageService messageService;
	
	@Autowired
	private RecordService recordService;
	
	@RequestMapping("/enterMessage")
	public String enterMessage(HttpSession session) {
		
		session.setAttribute("flag", "1");
		return "page/message";
	}
	
	
	@ResponseBody
	@RequestMapping("/MessageInfo")
	public Map<String, Object> getMessageInfos(@RequestParam(defaultValue="1") int page,@RequestParam(defaultValue="5") int limit,HttpSession session,HttpServletRequest req,HttpServletResponse response) {
		final int  STARTWORKHOUR=8;
		final int  ENDTWORKHOUR=20;
		final int  STARTWORKMINUTE=30;
		final int  ENDWORKMINUTE=30;
		Operator op=(Operator)session.getAttribute("user");
		//如果row>0则表示面板存在
		int row=messageService.findControl(op.getOperator());
		Map<String, Object> messageInfos=new HashMap<String, Object>();
		if(row>0)
		{
			messageInfos= messageService.getMessageInfos(page,limit,op.getOperator());
		}
		else
		{
			messageInfos= messageService.getMessageInfoWithoutControl(page,limit,op.getOperator());
		}
		
		Record_Exception rec=new Record_Exception();
		List<UsrInfo> messageBoxs=(ArrayList<UsrInfo>)messageInfos.get("data");
		SimpleDateFormat format1 = new SimpleDateFormat("HH:mm:ss");     
		SimpleDateFormat format2 = new SimpleDateFormat("YYYY-MM-dd"); 
		
		String s=(format1.format(new Date()));
		String t=format2.format(new Date());
		Date date=new Date();
		int hour=date.getHours();
		int mins=date.getMinutes();
		String t1 = s.substring(0, s.indexOf(":"));
		int time1=Integer.parseInt(t1);
		String num="";
		String jdch="";
		String lines="";
		for(UsrInfo us:messageBoxs) {
			num=us.getNum();
			jdch=us.getJdsc();
			rec.setLine_actual(us.getLine());
			rec.setProcess(us.getPosition());
			rec.setShift(us.getShift());
			if(us.getJdsc()==null)
			{
				rec.setJdsc1(0);
			}
			else
			{
				rec.setJdsc1(Integer.parseInt(us.getJdsc()));
			}
			lines=us.getClassify();
			if((hour>=0&&hour<8)||(hour==8&&mins<30))
			{
				Calendar calendar=Calendar.getInstance();
				calendar.add(Calendar.DAY_OF_MONTH, -1);
				date=calendar.getTime();
				us.setSj(format2.format(date));
				us.setShift("N");
				rec.setShift("N");
				rec.setKaoQinDay(format2.format(date));
				if(us.getClassify()!=null) {
					if(us.getClassify().equals("甲"))
					{
						rec.setReport_id(format2.format(date)+"."+us.getLine()+".A.1");
					}
					else {
						rec.setReport_id(format2.format(date)+"."+us.getLine()+".B.1");
					}
				}
			}
			else
			{
				us.setSj(t);
				us.setShift("D");
				rec.setShift("D");
				rec.setKaoQinDay(t);
				if(us.getClassify()!=null) {
				if(us.getClassify().equals("甲")) {
					rec.setReport_id(t+"."+us.getLine()+".A.1");
				}
				else {
					rec.setReport_id(t+"."+us.getLine()+".B.1");
				}
				}
			}
		}
		
		
		//将缓存中的数据提交到数据库中
		/*Cookie[] cook=req.getCookies();
		final Base64 base64 = new Base64();
		boolean flag=false;
		String exception = null,nums = null,btTime = null,edTime = null,descp =null,time =null;
		if(cook!=null)
		{
			for (Cookie cookie : cook) {
				String name = cookie.getName();
				if(name.equals("exception")) {
					flag=true;
					 try {
						exception = URLDecoder.decode(cookie.getValue(), "UTF-8");
						exception=new String(Base64.decodeBase64(exception),"utf-8");
					} catch (UnsupportedEncodingException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				}
				else if(name.equals("num")) {
						flag=true;
						nums=cookie.getValue();
						cookie.setMaxAge(0);
						 cookie.setPath("/");
						 response.addCookie(cookie);
				}
				else if(name.equals("btTime")) {
					try {
						flag=true;
						btTime=URLDecoder.decode(cookie.getValue(), "UTF-8");
					} catch (UnsupportedEncodingException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
					cookie.setMaxAge(0);
					 cookie.setPath("/");
					 response.addCookie(cookie);
				}
				else if(name.equals("edTime")) {
					try {
						flag=true;
						edTime=URLDecoder.decode(cookie.getValue(), "UTF-8");
					} catch (UnsupportedEncodingException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				}
				else if(name.equals("descp")) {
					try {
						flag=true;
						descp=URLDecoder.decode(cookie.getValue(), "UTF-8");
					} catch (UnsupportedEncodingException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				}
				else if(name.equals("time")) {
					try {
						flag=true;
						time=URLDecoder.decode(cookie.getValue(), "UTF-8");
					} catch (UnsupportedEncodingException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				}
			}
			
			
		}
		
		if(flag) {
			SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			Date d1 = null;
			Date d2 = null;
			String[] tt=rec.getReport_id().split("\\.");
			System.out.println(tt[0]);
			String tm[]=tt[0].split("-");
			String rp1=tm[0]+""+tm[1]+""+tm[2]+"."+tt[1]+"."+tt[2]+".1";
			try {
				d1 = sdf.parse(btTime);
				d2 = sdf.parse(edTime);
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			Long startLong = d1.getTime();
			Long endLong = d2.getTime();
			//计算时间差,单位毫秒
			Long ms = endLong-startLong;
			//时间差转换为 \天\时\分\秒  
			String time2 = longTimeToDay(ms);
			Map<String,Object> map=new HashMap<String, Object>();
			map.put("exception", exception);
			map.put("descp",descp);
			map.put("num",nums);
			map.put("btTime", btTime);
			map.put("edTime", edTime);
			map.put("name",op.getName());
			map.put("currentTime",time);
			map.put("operator", op.getOperator());
			map.put("report_id",rp1);
			map.put("work_time_minute",time2);
			map.put("line_actual",rec.getLine_actual());
			map.put("process",rec.getProcess());
			map.put("rest_time",rec.getRest_time());
			map.put("realminute",rec.getRealminute());
			map.put("jdsc",rec.getJdsc());
			map.put("rows",0);
			map.put("classify", lines);
			additional_Recording(map);
			Boolean flags=recordService.isExistSameExceptionTime(btTime,edTime);
			if(flags) {
				recordService.addRecordException(map);
				
			}
		}*/
		
		session.setAttribute("classify",lines);
		session.setAttribute("rec", rec);
		session.setAttribute("num", num);
		session.setAttribute("jdsc", jdch);
		return messageInfos;
	}
	
	
	private void additional_Recording(Map<String, Object> map) {
		// TODO Auto-generated method stub
		
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
	
	
	@ResponseBody
	@RequestMapping(value="/uploadImage",method=RequestMethod.POST)
	public Map<String,Object> echoImage(HttpServletRequest request,@RequestParam("file") MultipartFile file) throws IOException
	{
		System.out.println("图片的名称为"+file.getOriginalFilename());
		//生成随机数用来标识图片的名称
		String id = UUID.randomUUID().toString().replace("-", "");
		Map<String,Object> map=new HashMap<String, Object>();
		Map<String, Object> data=new HashMap<String, Object>();
		String realPath=request.getSession().getServletContext().getRealPath("upload/");
		System.out.println("图片的路径"+realPath+"/"+id+file.getOriginalFilename());
		File transferFile=new File(realPath+"/"+id+file.getOriginalFilename());
		file.transferTo(transferFile);
		map.put("code", 0);
		map.put("msg", "显示成功");
		data.put("src", "/QiangOA/upload/"+id+file.getOriginalFilename());
		
		data.put("title", file.getOriginalFilename());
		map.put("data", data);
		return map;
		
	}
	
	@ResponseBody
	@RequestMapping(value="/getTips",method=RequestMethod.POST)
	public List<Tips> getTips()
	{
		List<Tips> po=messageService.getPosition();
		List<Tips> line=messageService.getLine();
		List<Tips> con=messageService.getControl();
		
		List<Tips> tip=new ArrayList<Tips>();
		
		int max=0;
	if(po.size()>=line.size())
	{
		if(po.size()>=con.size())
		{
			max=po.size();
		}
		else {
			max=con.size();
		}
	}
	else
	{
		if(line.size()>=con.size())
		{
			max=line.size();
		}
		else
		{
			max=con.size();
		}
	}
	
	for(int i=0;i<max;i++)
	{
		Tips tt=new Tips();
		if(i+1<=po.size())
		{
			if(po.get(i).getPosition()!=null)
			{
				tt.setPosition(po.get(i).getPosition());
			}
			else
			{
				tt.setPosition("");
			}
			
		}
		else
		{
			tt.setPosition("");
		}
		if(i+1<=line.size())
		{
			if(line.get(i).getLines()!=null)
			{
				tt.setLines(line.get(i).getLines());
			}
			else
			{
				tt.setLines("");
			}
			
		}
		else
		{
			tt.setLines("");
		}
		
		
		if(i+1<=con.size())
		{
			if(con.get(i).getAlias()!=null)
			{
				tt.setAlias(con.get(i).getAlias());
			}
			else
			{
				tt.setAlias("");
			}
			
		}
		else
		{
			tt.setAlias("");
		}
		
		tip.add(tt);
	}
	
	for(Tips t: tip)
	{
		System.out.println("66"+t);
	}
	
		return tip;
	}
}
