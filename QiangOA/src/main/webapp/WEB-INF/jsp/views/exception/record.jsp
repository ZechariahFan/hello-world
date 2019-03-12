<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<title>Loss-Reporter后台管理系统</title>
	<%@ include file="/common/header.jsp" %>
</head>
<body class="childrenBody">
	<blockquote class="layui-elem-quote news_search">
			<%-- <div class="layui-inline">
				<a class="layui-btn modal-iframe"  data-params='{"content": "${pageContext.request.contextPath }/addUser", "title": "添加用户","full":false,"area":"600px,450px"}'>新增</a>
			</div>
			<div class="layui-inline">
				<a class="layui-btn layui-btn-danger batchDel ajax-all"  id="batchDelete">批量删除</a>
			</div> --%>
			<div class="layui-row">
			<div class="layui-inline">
				异常名称：<div class="layui-input-inline">
			    	<input type="text"  class="layui-input search_input" value="" size="5" id="ename">
			    </div>
			</div>
			
			<div class="layui-inline">
				损耗开始：<div class="layui-input-inline">
			    	<input type="text"  class="layui-input search_input" value="" size="15" id="begin">
			    </div>
		</div>
			<div class="layui-inline">
				损耗结束：<div class="layui-input-inline">
			    			<input type="text"  class="layui-input search_input" value="" size="15" id="end">
			    		</div>
			</div>
			<div class="layui-inline">
				人数：<div class="layui-input-inline">
			    	<input type="text"  class="layui-input search_input" value="${num }" size="3" id="num">
			    </div>人
			</div>
			<div class="layui-inline">
				<button class="layui-btn layui-btn-danger" id="sub">确认提交</button>
			</div>
			<div class="layui-inline">补充说明：
				<div class="layui-input-inline">
			    	<input type="text"  class="layui-input search_input" size="60" id="descp">
			    </div>
			    
			</div>
			</div>
			
			
			
			
			
			<div class="layui-row" style="margin-top: 20px">
			<div class="layui-inline">
				异常名称：<div class="layui-input-inline">
			    	<input type="text"  class="layui-input search_input" value="" size="5" id="ename2">
			    </div>
			</div>
			
			<div class="layui-inline">
				损耗开始：<div class="layui-input-inline">
			    	<input type="text"  class="layui-input search_input" value="" size="15" id="begin2">
			    </div>
		</div>
			<div class="layui-inline">
				损耗结束：<div class="layui-input-inline">
			    			<input type="text"  class="layui-input search_input" value="" size="15" id="end2">
			    		</div>
			</div>
			<div class="layui-inline">
				人数：<div class="layui-input-inline">
			    	<input type="text"  class="layui-input search_input" value="${num }" size="3" id="num2">
			    </div>人
			</div>
			<div class="layui-inline">
				<button class="layui-btn layui-btn-danger" id="sub2">确认提交</button>
			</div>
			<div class="layui-inline">补充说明：
				<div class="layui-input-inline">
			    	<input type="text"  class="layui-input search_input" size="60" id="descp22">
			    </div>
			    
			</div>
			</div>
	</blockquote>
	<c:forEach items="${ecx }"  var="e">
    <div class="layui-row">
    <div class="layui-col-md3" style="margin-right:10px;width:23%">
    	<button class="layui-btn layui-btn-fluid layui-bg-green" style="margin: 10px;height: 200px" id="bc"><font size="16">${e.cname1 }</font></button>
    </div>
    <div class="layui-col-md3" style="margin-right:10px;width:23%">
    	<button class="layui-btn layui-btn-fluid layui-bg-green" style="margin: 10px;height: 200px" id="mo"><font size="16">${e.cname2 }</font></button>
    </div>
    <div class="layui-col-md3" style="margin-right:10px;width:23%">
    	<button class="layui-btn layui-btn-fluid layui-bg-green" style="margin: 10px;height: 200px" id="jh"><font size="16">${e.cname3 }</font></button>
    </div>
    <div class="layui-col-md3" style="margin-right:10px;width:23%">
    	<button class="layui-btn layui-btn-fluid layui-bg-green" style="margin: 10px;height: 200px" id="zy"><font size="16">${e.cname4 }</font></button>
    </div>
  </div>
  
  
  <!-- <div class="layui-row">
    <div class="layui-col-md3" style="margin-right:10px;width:23%">
    	<div class="layui-inline">
				损耗开始：<div class="layui-input-inline">
			    	<input type="text"  class="layui-input search_input" value="" size="15" id="bc_begin">
			    </div>
		</div>
			<div class="layui-inline">
				损耗结束：<div class="layui-input-inline">
			    			<input type="text"  class="layui-input search_input" value="" size="15" id="bc_end">
			    			<input type="checkbox" name="bb"  lay-skin="primary" value="bc" class="selectOne">
			    		</div>
			    		
			</div>
    </div>
    <div class="layui-col-md3" style="margin-right:10px;width:23%">
    	<div class="layui-inline">
				损耗开始：<div class="layui-input-inline">
			    	<input type="text"  class="layui-input search_input" value="" size="15" id="mo_begin">
			    </div>
		</div>
			<div class="layui-inline">
				损耗结束：<div class="layui-input-inline">
			    			<input type="text"  class="layui-input search_input" value="" size="15" id="mo_end">
			    			<input type="checkbox" name="bb" value="mo"  lay-skin="primary" class="selectOne">
			    		</div>
			</div>
    </div>
    <div class="layui-col-md3" style="margin-right:10px;width:23%">
    	<div class="layui-inline">
				损耗开始：<div class="layui-input-inline">
			    	<input type="text"  class="layui-input search_input" value="" size="15" id="jh_begin">
			    </div>
		</div>
			<div class="layui-inline">
				损耗结束：<div class="layui-input-inline">
			    			<input type="text"  class="layui-input search_input" value="" size="15" id="jh_end">
			    			<input type="checkbox" name="bb"  value="jh"  lay-skin="primary" class="selectOne">
			    		</div>
			</div>
    </div>
    <div class="layui-col-md3" style="width:23%">
    	<div class="layui-inline">
				损耗开始：<div class="layui-input-inline">
			    	<input type="text"  class="layui-input search_input" value="" size="15" id="zy_begin">
			    </div>
		</div>
			<div class="layui-inline">
				损耗结束：<div class="layui-input-inline">
			    			<input type="text"  class="layui-input search_input" value="" size="15" id="zy_end">
			    			<input type="checkbox" name="bb" value="zy"  lay-skin="primary" class="selectOne">
			    		</div>
			</div>
    </div>
</div> -->
  
  
  <div class="layui-row">
    <div class="layui-col-md3" style="margin-right:10px;width:23%">
    	<button class="layui-btn layui-btn-fluid layui-bg-green" style="margin: 10px;height: 200px" id="pz"><font size="16">${e.cname5 }</font></button>
    </div>
    <div class="layui-col-md3" style="margin-right:10px;width:23%">
    	<button class="layui-btn layui-btn-fluid layui-bg-green" style="margin: 10px;height: 200px" id="sb"><font size="16">${e.cname6 }</font></button>
    </div>
    <div class="layui-col-md3" style="margin-right:10px;width:23%">
    	<button class="layui-btn layui-btn-fluid layui-bg-green" style="margin: 10px;height: 200px" id="xt"><font size="16">${e.cname7 }</font></button>
    </div>
    <div class="layui-col-md3" style="margin-right:10px;width:23%">
    	<button class="layui-btn layui-btn-fluid layui-bg-green" style="margin: 10px;height: 200px" id="qt"><font size="16">${e.cname8 }</font></button>
    </div>
  </div>
  
  
   </c:forEach>
   
	<%@ include file="/common/version.jsp" %>
	 <script type="text/javascript">
	 
	 function getCommonTime()
	 {
		 var myDate = new Date();
		 var year=myDate.getFullYear();
			//获取当前月
			var month=myDate.getMonth()+1;
			//获取当前日
			var date=myDate.getDate(); 
			var h=myDate.getHours();       //获取当前小时数(0-23)
			var m=myDate.getMinutes();     //获取当前分钟数(0-59)
			var s=myDate.getSeconds();  
			var t=p(year)+"-"+p(month)+"-"+p(date)+" "+p(h)+":"+p(m)+":"+p(s);
		return t; 
		 
	 }
	 
	 
	 function getTime(color)
	 {
		 var myDate = new Date();
		 var year=myDate.getFullYear();
			//获取当前月
			var month=myDate.getMonth()+1;
			//获取当前日
			var date=myDate.getDate(); 
			var h=myDate.getHours();       //获取当前小时数(0-23)
			var m=myDate.getMinutes();     //获取当前分钟数(0-59)
			var s=myDate.getSeconds();  
			 if(color=='g'){
				if(s<50){
					s=s-0+10;
				}
				else{
					if(m==59){
						s=s-0+10;
						m=0;
						s=60-0-s;
					}
					else{
						s=s-0+10;
						m=m-0+1;
						s=s-60;
					}
					
				}
			}else{
				if(s>=20){
					s=s-0-20;
				}
				else{
					if(m>0){
						s=20-0-s;
						m=m-0-1;
						s=60-0-s;
					}
					else{
						s=20-0-s;
						m=60-1;
						s=60-0-s;
						h=h-0-1;
					}
				}
			}
			var t=p(year)+"-"+p(month)+"-"+p(date)+" "+p(h)+":"+p(m)+":"+p(s);
		return t; 
	 }
		
		
	function p(s) 
	{
   		return s < 10 ? '0' + s: s;
	}
	 
	 
	 
	 
	 
	 var $="";
		layui.use(['list','form', 'element','laypage','layer'],function(){
			var $=layui.jquery,
			form = layui.form()
			,element = layui.element,
			laypage = layui.laypage
			 ,layer = layui.layer;
			
			var bctime='';
			var bctime1='';
			var motime='';
			var motime1='';
			var jhtime='';
			var jhtime1='';
			var zytime='';
			var zytime1='';
			var pztime='';
			var pztime1='';
			var sbtime='';
			var sbtime1='';
			var xttime='';
			var xttime1='';
			var qttime='';
			var qttime1='';
			//部材异常
			$("#bc").click(function(){
				var str=new String();
				var arr=new Array();
				str=$("#bc").attr("name");
				if($("#end").val()==''||$("#end").val()=='undefined'||$("#end2").val()==''||$("#end2").val()=='undefined'&&str=='f'){
				//arr=str.split(' ');
				if(str!='f'){
					
					 if($("#ename").val()==$("#bc").text()){
						$("#begin").val(getTime("r"));
						$("#end").val("");
						$("#ename").val($("#bc").text());
						time= setInterval(function(){
							$("#bc").attr("class","layui-btn layui-btn-fluid layui-bg-green"); 
					      },500);
						 time1 = setInterval(function(){
							$("#bc").attr("class","layui-btn layui-btn-fluid layui-bg-red"); 
					      },1000); 
						$("#bc").attr("name","f");
						$("#bc").removeAttr("n");
					}
					else if($("#ename2").val()==$("#bc").text()){
						$("#begin2").val(getTime("r"));
						$("#end2").val("");
						$("#ename2").val($("#bc").text());
						time= setInterval(function(){
							$("#bc").attr("class","layui-btn layui-btn-fluid layui-bg-green"); 
					      },500);
						 time1 = setInterval(function(){
							$("#bc").attr("class","layui-btn layui-btn-fluid layui-bg-red"); 
					      },1000); 
						$("#bc").attr("name","f");
						$("#bc").removeAttr("n");
					}
					else if(($("#ename").val()==''||$("#ename").val()=='undefined')){
						$("#begin").val(getTime("r"));
						$("#end").val("");
						$("#ename").val($("#bc").text());
						time= setInterval(function(){
							$("#bc").attr("class","layui-btn layui-btn-fluid layui-bg-green"); 
					      },500);
						 time1 = setInterval(function(){
							$("#bc").attr("class","layui-btn layui-btn-fluid layui-bg-red"); 
					      },1000); 
						$("#bc").attr("name","f");
						$("#bc").removeAttr("n");
					}
					else if(($("#ename2").val()==''||$("#ename2").val()=='undefined')){
						$("#begin2").val(getTime("r"));
						$("#end2").val("");
						$("#ename2").val($("#bc").text());
						time= setInterval(function(){
							$("#bc").attr("class","layui-btn layui-btn-fluid layui-bg-green"); 
					      },500);
						 time1 = setInterval(function(){
							$("#bc").attr("class","layui-btn layui-btn-fluid layui-bg-red"); 
					      },1000); 
						$("#bc").attr("name","f");
						$("#bc").removeAttr("n");
					}
					else{
						layer.alert('当前异常未提交，请提交后再试！', {icon: 5}); 
						layer.close(index);
					}
					  
					
				}
				else{
					
					 if($("#ename").val()==$("#bc").text()){
						$("#end").val(getTime("g"));
						$("ename").val($("#bc").text());
						$("#bc").attr("n","q");
						 clearInterval(time);
						clearInterval(time1); 
						$("#bc").removeAttr("name");
						$("#bc").attr("class","layui-btn layui-btn-fluid layui-bg-green");
					}
					else if($("#ename2").val()==$("#bc").text()){
						$("#end2").val(getTime("g"));
						$("ename2").val($("#bc").text());
						$("#bc").attr("n","q");
						 clearInterval(time);
						clearInterval(time1); 
						$("#bc").removeAttr("name");
						$("#bc").attr("class","layui-btn layui-btn-fluid layui-bg-green");
					}
					else if($("#ename2").val()==''||$("#ename2").val()=='undefined'){
						$("#end2").val(getTime("g"));
						$("ename2").val($("#bc").text());
						$("#bc").attr("n","q");
						 clearInterval(time);
						clearInterval(time1); 
						$("#bc").removeAttr("name");
						$("#bc").attr("class","layui-btn layui-btn-fluid layui-bg-green");
					}
					else if($("#ename").val()==''||$("#ename").val()=='undefined'){
						$("#end").val(getTime("g"));
						$("ename").val($("#bc").text());
						$("#bc").attr("n","q");
						 clearInterval(time);
						clearInterval(time1); 
						$("#bc").removeAttr("name");
						$("#bc").attr("class","layui-btn layui-btn-fluid layui-bg-green");
					}
					else{
						layer.alert('当前异常未提交，请提交后再试！', {icon: 5}); 
						layer.close(index);
					}
					
				}
				}
				else{
					layer.alert('当前异常未提交，请提交后再试！', {icon: 5}); 
					layer.close(index);
				}
				
			});
			
			
			//MO切换
			$("#mo").click(function(){
				var str=new String();
				var arr=new Array();
				str=$("#mo").attr("name");
				if($("#end").val()==''||$("#end").val()=='undefined'||$("#end2").val()==''||$("#end2").val()=='undefined'&&str=='f'){
					if(str!='f'){
						 if($("#ename").val()==$("#mo").text()){
							$("#begin").val(getTime("r"));
							$("#end").val("");
							$("#ename").val($("#mo").text());
							motime= setInterval(function(){
								$("#mo").attr("class","layui-btn layui-btn-fluid layui-bg-green"); 
						      },500);
							 motime1 = setInterval(function(){
								$("#mo").attr("class","layui-btn layui-btn-fluid layui-bg-red"); 
						      },1000);
							$("#mo").attr("name","f");
							$("#mo").removeAttr("n");
						}
						else if($("#ename2").val()==$("#mo").text()){
							$("#begin2").val(getTime("r"));
							$("#end2").val("");
							$("#ename2").val($("#mo").text());
							motime= setInterval(function(){
								$("#mo").attr("class","layui-btn layui-btn-fluid layui-bg-green"); 
						      },500);
							 motime1 = setInterval(function(){
								$("#mo").attr("class","layui-btn layui-btn-fluid layui-bg-red"); 
						      },1000);
							$("#mo").attr("name","f");
							$("#mo").removeAttr("n");
						}
						else if($("#ename").val()==''||$("#ename").val()=='undefined'){
								
								$("#begin").val(getTime("r"));
								$("#end").val("");
								$("#ename").val($("#mo").text());
								motime= setInterval(function(){
									$("#mo").attr("class","layui-btn layui-btn-fluid layui-bg-green"); 
							      },500);
								 motime1 = setInterval(function(){
									$("#mo").attr("class","layui-btn layui-btn-fluid layui-bg-red"); 
							      },1000);
								$("#mo").attr("name","f");
								$("#mo").removeAttr("n");
							}
						else if($("#ename2").val()==''||$("#ename2").val()=='undefined'){
							
							$("#begin2").val(getTime("r"));
							$("#end2").val("");
							$("#ename2").val($("#mo").text());
							motime= setInterval(function(){
								$("#mo").attr("class","layui-btn layui-btn-fluid layui-bg-green"); 
						      },500);
							 motime1 = setInterval(function(){
								$("#mo").attr("class","layui-btn layui-btn-fluid layui-bg-red"); 
						      },1000);
							$("#mo").attr("name","f");
							$("#mo").removeAttr("n");
						}
						else{
							layer.alert('当前异常未提交，请提交后再试！', {icon: 5}); 
							layer.close(index);
						}
						
					}
					else{
						 if($("#ename").val()==$("#mo").text()){
							$("#end").val(getTime("g"));
							$("#ename").val($("#mo").text());
							clearInterval(motime);
							clearInterval(motime1);
							$("#mo").removeAttr("name");
							$("#mo").attr("class","layui-btn layui-btn-fluid layui-bg-green");
							$("#mo").attr("n","q");
						}
						else if($("#ename2").val()==$("#mo").text()){
							$("#end2").val(getTime("g"));
							$("#ename2").val($("#mo").text());
							clearInterval(motime);
							clearInterval(motime1);
							$("#mo").removeAttr("name");
							$("#mo").attr("class","layui-btn layui-btn-fluid layui-bg-green");
							$("#mo").attr("n","q");
						}else if($("#ename").val()==''||$("#ename").val()=='undefined'){
							$("#end").val(getTime("g"));
							$("#ename").val($("#mo").text());
							clearInterval(motime);
							clearInterval(motime1);
							$("#mo").removeAttr("name");
							$("#mo").attr("class","layui-btn layui-btn-fluid layui-bg-green");
							$("#mo").attr("n","q");
						}
						else if($("#ename2").val()==''||$("#ename2").val()=='undefined'){
							$("#end2").val(getTime("g"));
							$("#ename2").val($("#mo").text());
							clearInterval(motime);
							clearInterval(motime1);
							$("#mo").removeAttr("name");
							$("#mo").attr("class","layui-btn layui-btn-fluid layui-bg-green");
							$("#mo").attr("n","q");
						}
						else{
							layer.alert('当前异常未提交，请提交后再试！', {icon: 5}); 
							layer.close(index);
						}
						
					}
				}
				else{
					layer.alert('当前异常未提交，请提交后再试！', {icon: 5}); 
					layer.close(index);
				}
				
			});
			
			
			//计划停止
			 $("#jh").click(function(){
				 var str=new String();
					var arr=new Array();
					str=$("#jh").attr("name");
				 if($("#end").val()==''||$("#end").val()=='undefined'||$("#end2").val()==''||$("#end2").val()=='undefined'&&str=='f'){
				 
					 if(str!='f'){
						 if($("#ename").val()==$("#jh").text()){
							$("#begin").val(getTime("r"));
							$("#end").val("");
							$("#ename").val($("#jh").text());
							jhtime= setInterval(function(){
								$("#jh").attr("class","layui-btn layui-btn-fluid layui-bg-green"); 
						      },500);
							jhtime1 = setInterval(function(){
								$("#jh").attr("class","layui-btn layui-btn-fluid layui-bg-red"); 
						      },1000);
							$("#jh").attr("name","f");
							$("#jh").removeAttr("n");
						}
						else if($("#ename2").val()==$("#jh").text()){
							$("#begin2").val(getTime("r"));
							$("#end2").val("");
							$("#ename2").val($("#jh").text());
							jhtime= setInterval(function(){
								$("#jh").attr("class","layui-btn layui-btn-fluid layui-bg-green"); 
						      },500);
							jhtime1 = setInterval(function(){
								$("#jh").attr("class","layui-btn layui-btn-fluid layui-bg-red"); 
						      },1000);
							$("#jh").attr("name","f");
							$("#jh").removeAttr("n");
						}
						else if($("#ename").val()==''||$("#ename").val()=='undefined'){
								
								$("#begin").val(getTime("r"));
								$("#end").val("");
								$("#ename").val($("#jh").text());
								motime= setInterval(function(){
									$("#jh").attr("class","layui-btn layui-btn-fluid layui-bg-green"); 
							      },500);
								jhtime1 = setInterval(function(){
									$("#jh").attr("class","layui-btn layui-btn-fluid layui-bg-red"); 
							      },1000);
								$("#jh").attr("name","f");
								$("#jh").removeAttr("n");
							}
						else if($("#ename2").val()==''||$("#ename2").val()=='undefined'){
							
							$("#begin2").val(getTime("r"));
							$("#end2").val("");
							$("#ename2").val($("#jh").text());
							jhtime= setInterval(function(){
								$("#jh").attr("class","layui-btn layui-btn-fluid layui-bg-green"); 
						      },500);
							jhtime1 = setInterval(function(){
								$("#jh").attr("class","layui-btn layui-btn-fluid layui-bg-red"); 
						      },1000);
							$("#jh").attr("name","f");
							$("#jh").removeAttr("n");
						}
						else{
							layer.alert('当前异常未提交，请提交后再试！', {icon: 5}); 
							layer.close(index);
						}
						
					}
					else{
						 if($("#ename").val()==$("#jh").text()){
							$("#end").val(getTime("g"));
							$("#ename").val($("#jh").text());
							clearInterval(jhtime);
							clearInterval(jhtime1);
							$("#jh").removeAttr("name");
							$("#jh").attr("class","layui-btn layui-btn-fluid layui-bg-green");
							$("#jh").attr("n","q");
						}
						else if($("#ename2").val()==$("#jh").text()){
							$("#end2").val(getTime("g"));
							$("#ename2").val($("#jh").text());
							clearInterval(jhtime);
							clearInterval(jhtime1);
							$("#jh").removeAttr("name");
							$("#jh").attr("class","layui-btn layui-btn-fluid layui-bg-green");
							$("#jh").attr("n","q");
						}else if($("#ename").val()==''||$("#ename").val()=='undefined'){
							$("#end").val(getTime("g"));
							$("#ename").val($("#jh").text());
							clearInterval(jhtime);
							clearInterval(jhtime1);
							$("#jh").removeAttr("name");
							$("#jh").attr("class","layui-btn layui-btn-fluid layui-bg-green");
							$("#jh").attr("n","q");
						}
						else if($("#ename2").val()==''||$("#ename2").val()=='undefined'){
							$("#end2").val(getTime("g"));
							$("#ename2").val($("#jh").text());
							clearInterval(jhtime);
							clearInterval(jhtime1);
							$("#jh").removeAttr("name");
							$("#jh").attr("class","layui-btn layui-btn-fluid layui-bg-green");
							$("#jh").attr("n","q");
						}
						else{
							layer.alert('当前异常未提交，请提交后再试！', {icon: 5}); 
							layer.close(index);
						}
						
					}
				}
				else{
					layer.alert('当前异常未提交，请提交后再试！', {icon: 5}); 
					layer.close(index);
				}
			});
			
			
			//作业指导
			$("#zy").click(function(){
				var str=new String();
				var arr=new Array();
				str=$("#zy").attr("name");
				if($("#end").val()==''||$("#end").val()=='undefined'||$("#end2").val()==''||$("#end2").val()=='undefined'&&str=='f'){
				
				if(str!='f'){
					
					if($("#ename").val()==$("#zy").text()){
						$("#begin").val(getTime("r"));
						$("#end").val("");
						$("#ename").val($("#zy").text());
						zytime= setInterval(function(){
							$("#zy").attr("class","layui-btn layui-btn-fluid layui-bg-green"); 
					      },500);
						zytime1 = setInterval(function(){
							$("#zy").attr("class","layui-btn layui-btn-fluid layui-bg-red"); 
					      },1000);
						$("#zy").attr("name","f");
						$("#zy").removeAttr("n");
					}
					else if($("#ename2").val()==$("#zy").text()){
						$("#begin2").val(getTime("r"));
						$("#end2").val("");
						$("#ename2").val($("#zy").text());
						zytime= setInterval(function(){
							$("#zy").attr("class","layui-btn layui-btn-fluid layui-bg-green"); 
					      },500);
						zytime1 = setInterval(function(){
							$("#zy").attr("class","layui-btn layui-btn-fluid layui-bg-red"); 
					      },1000);
						$("#zy").attr("name","f");
						$("#zy").removeAttr("n");
					}
					else if($("#ename").val()==''||$("#ename").val()=='undefined'){
							
							$("#begin").val(getTime("r"));
							$("#end").val("");
							$("#ename").val($("#zy").text());
							zytime= setInterval(function(){
								$("#zy").attr("class","layui-btn layui-btn-fluid layui-bg-green"); 
						      },500);
							zytime1 = setInterval(function(){
								$("#zy").attr("class","layui-btn layui-btn-fluid layui-bg-red"); 
						      },1000);
							$("#zy").attr("name","f");
							$("#zy").removeAttr("n");
						}
					else if($("#ename2").val()==''||$("#ename2").val()=='undefined'){
						
						$("#begin2").val(getTime("r"));
						$("#end2").val("");
						$("#ename2").val($("#zy").text());
						zytime= setInterval(function(){
							$("#zy").attr("class","layui-btn layui-btn-fluid layui-bg-green"); 
					      },500);
						zytime1 = setInterval(function(){
							$("#zy").attr("class","layui-btn layui-btn-fluid layui-bg-red"); 
					      },1000);
						$("#zy").attr("name","f");
						$("#zy").removeAttr("n");
					}
					else{
						layer.alert('当前异常未提交，请提交后再试！', {icon: 5}); 
						layer.close(index);
					}
					
				}
				else{
					 if($("#ename").val()==$("#zy").text()){
						$("#end").val(getTime("g"));
						$("#ename").val($("#zy").text());
						clearInterval(zytime);
						clearInterval(zytime1);
						$("#zy").removeAttr("name");
						$("#zy").attr("class","layui-btn layui-btn-fluid layui-bg-green");
						$("#zy").attr("n","q");
					}
					else if($("#ename2").val()==$("#zy").text()){
						$("#end2").val(getTime("g"));
						$("#ename2").val($("#zy").text());
						clearInterval(zytime);
						clearInterval(zytime1);
						$("#zy").removeAttr("name");
						$("#zy").attr("class","layui-btn layui-btn-fluid layui-bg-green");
						$("#zy").attr("n","q");
					}else if($("#ename").val()==''||$("#ename").val()=='undefined'){
						$("#end").val(getTime("g"));
						$("#ename").val($("#zy").text());
						clearInterval(zytime);
						clearInterval(zytime1);
						$("#zy").removeAttr("name");
						$("#zy").attr("class","layui-btn layui-btn-fluid layui-bg-green");
						$("#zy").attr("n","q");
					}
					else if($("#ename2").val()==''||$("#ename2").val()=='undefined'){
						$("#end2").val(getTime("g"));
						$("#ename2").val($("#zy").text());
						clearInterval(zytime);
						clearInterval(zytime1);
						$("#jh").removeAttr("name");
						$("#jh").attr("class","layui-btn layui-btn-fluid layui-bg-green");
						$("#zy").attr("n","q");
					}
					else{
						layer.alert('当前异常未提交，请提交后再试！', {icon: 5}); 
						layer.close(index);
					}
					
				}
			}
			else{
				layer.alert('当前异常未提交，请提交后再试！', {icon: 5}); 
				layer.close(index);
			}
			});
			
			//品质异常
			$("#pz").click(function(){
				var str=new String();
				var arr=new Array();
				str=$("#pz").attr("name");
				if($("#end").val()==''||$("#end").val()=='undefined'||$("#end2").val()==''||$("#end2").val()=='undefined'&&str=='f'){
				
				if(str!='f'){
					if($("#ename").val()==$("#pz").text()){
						$("#begin").val(getTime("r"));
						$("#end").val("");
						$("#ename").val($("#pz").text());
						pztime= setInterval(function(){
							$("#pz").attr("class","layui-btn layui-btn-fluid layui-bg-green"); 
					      },500);
						pztime1 = setInterval(function(){
							$("#pz").attr("class","layui-btn layui-btn-fluid layui-bg-red"); 
					      },1000);
						$("#pz").attr("name","f");
						$("#pz").removeAttr("n");
					}
					else if($("#ename2").val()==$("#pz").text()){
						$("#begin2").val(getTime("r"));
						$("#end2").val("");
						$("#ename2").val($("#pz").text());
						pztime= setInterval(function(){
							$("#pz").attr("class","layui-btn layui-btn-fluid layui-bg-green"); 
					      },500);
						pztime1 = setInterval(function(){
							$("#pz").attr("class","layui-btn layui-btn-fluid layui-bg-red"); 
					      },1000);
						$("#pz").attr("name","f");
						$("#pz").removeAttr("n");
					}
					else if($("#ename").val()==''||$("#ename").val()=='undefined'){
							
							$("#begin").val(getTime("r"));
							$("#end").val("");
							$("#ename").val($("#pz").text());
							pztime= setInterval(function(){
								$("#pz").attr("class","layui-btn layui-btn-fluid layui-bg-green"); 
						      },500);
							pztime1 = setInterval(function(){
								$("#pz").attr("class","layui-btn layui-btn-fluid layui-bg-red"); 
						      },1000);
							$("#pz").attr("name","f");
							$("#pz").removeAttr("n");
						}
					else if($("#ename2").val()==''||$("#ename2").val()=='undefined'){
						
						$("#begin2").val(getTime("r"));
						$("#end2").val("");
						$("#ename2").val($("#pz").text());
						pztime= setInterval(function(){
							$("#pz").attr("class","layui-btn layui-btn-fluid layui-bg-green"); 
					      },500);
						pztime1 = setInterval(function(){
							$("#pz").attr("class","layui-btn layui-btn-fluid layui-bg-red"); 
					      },1000);
						$("#pz").attr("name","f");
						$("#pz").removeAttr("n");
					}
					else{
						layer.alert('当前异常未提交，请提交后再试！', {icon: 5}); 
						layer.close(index);
					}
					
				}
				else{
					 if($("#ename").val()==$("#pz").text()){
						$("#end").val(getTime("g"));
						$("#ename").val($("#pz").text());
						clearInterval(pztime);
						clearInterval(pztime1);
						$("#pz").removeAttr("name");
						$("#pz").attr("class","layui-btn layui-btn-fluid layui-bg-green");
						$("#pz").attr("n","q");
					}
					else if($("#ename2").val()==$("#pz").text()){
						$("#end2").val(getTime("g"));
						$("#ename2").val($("#pz").text());
						clearInterval(pztime);
						clearInterval(pztime1);
						$("#pz").removeAttr("name");
						$("#pz").attr("class","layui-btn layui-btn-fluid layui-bg-green");
					}else if($("#ename").val()==''||$("#ename").val()=='undefined'){
						$("#end").val(getTime("g"));
						$("#ename").val($("#pz").text());
						clearInterval(pztime);
						clearInterval(pztime1);
						$("#pz").removeAttr("name");
						$("#pz").attr("class","layui-btn layui-btn-fluid layui-bg-green");
						$("#pz").attr("n","q");
					}
					else if($("#ename2").val()==''||$("#ename2").val()=='undefined'){
						$("#end2").val(getTime("g"));
						$("#ename2").val($("#pz").text());
						clearInterval(pztime);
						clearInterval(pztime1);
						$("#pz").removeAttr("name");
						$("#pz").attr("class","layui-btn layui-btn-fluid layui-bg-green");
					}
					else if($("#ename").val()==''||$("#ename").val()=='undefined'){
						$("#end").val(getTime("g"));
						$("ename").val($("#bc").text());
						$("#pz").attr("n","q");
						 clearInterval(time);
						clearInterval(time1); 
						$("#pz").removeAttr("name");
						$("#pz").attr("class","layui-btn layui-btn-fluid layui-bg-green");
					}
					else{
						layer.alert('当前异常未提交，请提交后再试！', {icon: 5}); 
						layer.close(index);
					}
					
				}
			}
			else{
				layer.alert('当前异常未提交，请提交后再试！', {icon: 5}); 
				layer.close(index);
			}
			});
			
			//设备异常
			$("#sb").click(function(){
				var str=new String();
				var arr=new Array();
				str=$("#sb").attr("name");
				if($("#end").val()==''||$("#end").val()=='undefined'||$("#end2").val()==''||$("#end2").val()=='undefined'&&str=='f'){
				if(str!='f'){
					if($("#ename").val()==$("#sb").text()){
						$("#begin").val(getTime("r"));
						$("#end").val("");
						$("#ename").val($("#sb").text());
						sbtime= setInterval(function(){
							$("#sb").attr("class","layui-btn layui-btn-fluid layui-bg-green"); 
					      },500);
						sbtime1 = setInterval(function(){
							$("#sb").attr("class","layui-btn layui-btn-fluid layui-bg-red"); 
					      },1000);
						$("#sb").attr("name","f");
						$("#sb").removeAttr("n");
					}
					else if($("#ename2").val()==$("#sb").text()){
						$("#begin2").val(getTime("r"));
						$("#end2").val("");
						$("#ename2").val($("#sb").text());
						sbtime= setInterval(function(){
							$("#sb").attr("class","layui-btn layui-btn-fluid layui-bg-green"); 
					      },500);
						sbtime1 = setInterval(function(){
							$("#sb").attr("class","layui-btn layui-btn-fluid layui-bg-red"); 
					      },1000);
						$("#sb").attr("name","f");
						$("#sb").removeAttr("n");
					}
					else if($("#ename").val()==''||$("#ename").val()=='undefined'){
							
							$("#begin").val(getTime("r"));
							$("#end").val("");
							$("#ename").val($("#sb").text());
							sbtime= setInterval(function(){
								$("#sb").attr("class","layui-btn layui-btn-fluid layui-bg-green"); 
						      },500);
							sbtime1 = setInterval(function(){
								$("#sb").attr("class","layui-btn layui-btn-fluid layui-bg-red"); 
						      },1000);
							$("#sb").attr("name","f");
							$("#sb").removeAttr("n");
						}
					else if($("#ename2").val()==''||$("#ename2").val()=='undefined'){
						
						$("#begin2").val(getTime("r"));
						$("#end2").val("");
						$("#ename2").val($("#sb").text());
						sbtime= setInterval(function(){
							$("#sb").attr("class","layui-btn layui-btn-fluid layui-bg-green"); 
					      },500);
						sbtime1 = setInterval(function(){
							$("#sb").attr("class","layui-btn layui-btn-fluid layui-bg-red"); 
					      },1000);
						$("#sb").attr("name","f");
						$("#sb").removeAttr("n");
					}
					else{
						layer.alert('当前异常未提交，请提交后再试！', {icon: 5}); 
						layer.close(index);
					}
					
				}
				else{
					 if($("#ename").val()==$("#sb").text()){
						$("#end").val(getTime("g"));
						$("#ename").val($("#sb").text());
						clearInterval(sbtime);
						clearInterval(sbtime1);
						$("#sb").removeAttr("name");
						$("#sb").attr("class","layui-btn layui-btn-fluid layui-bg-green");
						$("#sb").attr("n","q");
					}
					else if($("#ename2").val()==$("#sb").text()){
						$("#end2").val(getTime("g"));
						$("#ename2").val($("#sb").text());
						clearInterval(sbtime);
						clearInterval(sbtime1);
						$("#sb").removeAttr("name");
						$("#sb").attr("class","layui-btn layui-btn-fluid layui-bg-green");
						$("#sb").attr("n","q");
					}else if($("#ename").val()==''||$("#ename").val()=='undefined'){
						$("#end").val(getTime("g"));
						$("#ename").val($("#sb").text());
						clearInterval(sbtime);
						clearInterval(sbtime1);
						$("#sb").removeAttr("name");
						$("#sb").attr("class","layui-btn layui-btn-fluid layui-bg-green");
						$("#sb").attr("n","q");
					}
					else if($("#ename2").val()==''||$("#ename2").val()=='undefined'){
						$("#end2").val(getTime("g"));
						$("#ename2").val($("#sb").text());
						clearInterval(sbtime);
						clearInterval(sbtime1);
						$("#sb").removeAttr("name");
						$("#sb").attr("class","layui-btn layui-btn-fluid layui-bg-green");
						$("#sb").attr("n","q");
					}
					else{
						layer.alert('当前异常未提交，请提交后再试！', {icon: 5}); 
						layer.close(index);
					}
					
				}
			}
			else{
				layer.alert('当前异常未提交，请提交后再试！', {icon: 5}); 
				layer.close(index);
			}
			});
			
			//系统问题
			$("#xt").click(function(){
				var str=new String();
				var arr=new Array();
				str=$("#xt").attr("name");
				if($("#end").val()==''||$("#end").val()=='undefined'||$("#end2").val()==''||$("#end2").val()=='undefined'&&str=='f'){
				
				if(str!='f'){
					 
					
					if($("#ename").val()==$("#xt").text()){
						$("#begin").val(getTime("r"));
						$("#end").val("");
						$("#ename").val($("#xt").text());
						xttime= setInterval(function(){
							$("#xt").attr("class","layui-btn layui-btn-fluid layui-bg-green"); 
					      },500);
						xttime1 = setInterval(function(){
							$("#xt").attr("class","layui-btn layui-btn-fluid layui-bg-red"); 
					      },1000);
						$("#xt").attr("name","f");
						$("#xt").removeAttr("n");
					}
					else if($("#ename2").val()==$("#xt").text()){
						$("#begin2").val(getTime("r"));
						$("#end2").val("");
						$("#ename2").val($("#xt").text());
						xttime= setInterval(function(){
							$("#xt").attr("class","layui-btn layui-btn-fluid layui-bg-green"); 
					      },500);
						xttime1 = setInterval(function(){
							$("#xt").attr("class","layui-btn layui-btn-fluid layui-bg-red"); 
					      },1000);
						$("#xt").attr("name","f");
						$("#xt").removeAttr("n");
					}
					else if($("#ename").val()==''||$("#ename").val()=='undefined'){
							
							$("#begin").val(getTime("r"));
							$("#end").val("");
							$("#ename").val($("#xt").text());
							xttime= setInterval(function(){
								$("#xt").attr("class","layui-btn layui-btn-fluid layui-bg-green"); 
						      },500);
							xttime1 = setInterval(function(){
								$("#xt").attr("class","layui-btn layui-btn-fluid layui-bg-red"); 
						      },1000);
							$("#xt").attr("name","f");
							$("#xt").removeAttr("n");
						}
					else if($("#ename2").val()==''||$("#ename2").val()=='undefined'){
						
						$("#begin2").val(getTime("r"));
						$("#end2").val("");
						$("#ename2").val($("#xt").text());
						xttime= setInterval(function(){
							$("#xt").attr("class","layui-btn layui-btn-fluid layui-bg-green"); 
					      },500);
						xttime1 = setInterval(function(){
							$("#xt").attr("class","layui-btn layui-btn-fluid layui-bg-red"); 
					      },1000);
						$("#xt").attr("name","f");
						$("#xt").removeAttr("n");
					}
					else{
						layer.alert('当前异常未提交，请提交后再试！', {icon: 5}); 
						layer.close(index);
					}
					
				}
				else{
					 if($("#ename").val()==$("#xt").text()){
						$("#end").val(getTime("g"));
						$("#ename").val($("#xt").text());
						clearInterval(xttime);
						clearInterval(xttime1);
						$("#xt").removeAttr("name");
						$("#xt").attr("class","layui-btn layui-btn-fluid layui-bg-green");
						$("#xt").attr("n","q");
					}
					else if($("#ename2").val()==$("#xt").text()){
						$("#end2").val(getTime("g"));
						$("#ename2").val($("#xt").text());
						clearInterval(xttime);
						clearInterval(xttime1);
						$("#xt").removeAttr("name");
						$("#xt").attr("class","layui-btn layui-btn-fluid layui-bg-green");
						$("#xt").attr("n","q");
					}else if($("#ename").val()==''||$("#ename").val()=='undefined'){
						$("#end").val(getTime("g"));
						$("#ename").val($("#xt").text());
						clearInterval(xttime);
						clearInterval(xttime1);
						$("#xt").removeAttr("name");
						$("#xt").attr("class","layui-btn layui-btn-fluid layui-bg-green");
						$("#xt").attr("n","q");
					}
					else if($("#ename2").val()==''||$("#ename2").val()=='undefined'){
						$("#end2").val(getTime("g"));
						$("#ename2").val($("#xt").text());
						clearInterval(xttime);
						clearInterval(xttime1);
						$("#xt").removeAttr("name");
						$("#xt").attr("class","layui-btn layui-btn-fluid layui-bg-green");
						$("#xt").attr("n","q");
					}
					else{
						layer.alert('当前异常未提交，请提交后再试！', {icon: 5}); 
						layer.close(index);
					}
					
				}
			}
			else{
				layer.alert('当前异常未提交，请提交后再试！', {icon: 5}); 
				layer.close(index);
			}
			});
			
			
			//其他
			
			$("#qt").click(function(){
				var str=new String();
				var arr=new Array();
				str=$("#qt").attr("name");
				if($("#end").val()==''||$("#end").val()=='undefined'||$("#end2").val()==''||$("#end2").val()=='undefined'&&str=='f'){
				
				if(str!='f'){
					 
					if($("#ename").val()==$("#qt").text()){
						$("#begin").val(getTime("r"));
						$("#end").val("");
						$("#ename").val($("#qt").text());
						qttime= setInterval(function(){
							$("#qt").attr("class","layui-btn layui-btn-fluid layui-bg-green"); 
					      },500);
						qttime1 = setInterval(function(){
							$("#qt").attr("class","layui-btn layui-btn-fluid layui-bg-red"); 
					      },1000);
						$("#qt").attr("name","f");
						$("#qt").removeAttr("n");
					}
					else if($("#ename2").val()==$("#qt").text()){
						$("#begin2").val(getTime("r"));
						$("#end2").val("");
						$("#ename2").val($("#qt").text());
						qttime= setInterval(function(){
							$("#qt").attr("class","layui-btn layui-btn-fluid layui-bg-green"); 
					      },500);
						qttime1 = setInterval(function(){
							$("#qt").attr("class","layui-btn layui-btn-fluid layui-bg-red"); 
					      },1000);
						$("#qt").attr("name","f");
						$("#qt").removeAttr("n");
					}
					else if($("#ename").val()==''||$("#ename").val()=='undefined'){
							
							$("#begin").val(getTime("r"));
							$("#end").val("");
							$("#ename").val($("#qt").text());
							qttime= setInterval(function(){
								$("#qt").attr("class","layui-btn layui-btn-fluid layui-bg-green"); 
						      },500);
							qttime1 = setInterval(function(){
								$("#qt").attr("class","layui-btn layui-btn-fluid layui-bg-red"); 
						      },1000);
							$("#qt").attr("name","f");
							$("#qt").removeAttr("n");
						}
					else if($("#ename2").val()==''||$("#ename2").val()=='undefined'){
						
						$("#begin2").val(getTime("r"));
						$("#end2").val("");
						$("#ename2").val($("#qt").text());
						qttime= setInterval(function(){
							$("#xt").attr("class","layui-btn layui-btn-fluid layui-bg-green"); 
					      },500);
						qttime1 = setInterval(function(){
							$("#qt").attr("class","layui-btn layui-btn-fluid layui-bg-red"); 
					      },1000);
						$("#qt").attr("name","f");
						$("#qt").removeAttr("n");
					}
					else{
						layer.alert('当前异常未提交，请提交后再试！', {icon: 5}); 
						layer.close(index);
					}
					
				}
				else{
					 if($("#ename").val()==$("#qt").text()){
						$("#end").val(getTime("g"));
						$("#ename").val($("#qt").text());
						clearInterval(qttime);
						clearInterval(qttime1);
						$("#qt").removeAttr("name");
						$("#qt").attr("class","layui-btn layui-btn-fluid layui-bg-green");
						$("#qt").attr("n","q");
					}
					else if($("#ename2").val()==$("#qt").text()){
						$("#end2").val(getTime("g"));
						$("#ename2").val($("#qt").text());
						clearInterval(qttime);
						clearInterval(qttime1);
						$("#qt").removeAttr("name");
						$("#qt").attr("class","layui-btn layui-btn-fluid layui-bg-green");
						$("#qt").attr("n","q");
					}else if($("#ename").val()==''||$("#ename").val()=='undefined'){
						$("#end").val(getTime("g"));
						$("#ename").val($("#qt").text());
						clearInterval(qttime);
						clearInterval(qttime1);
						$("#qt").removeAttr("name");
						$("#qt").attr("class","layui-btn layui-btn-fluid layui-bg-green");
						$("#qt").attr("n","q");
					}
					else if($("#ename2").val()==''||$("#ename2").val()=='undefined'){
						$("#end2").val(getTime("g"));
						$("#ename2").val($("#qt").text());
						clearInterval(qttime);
						clearInterval(qttime1);
						$("#qt").removeAttr("name");
						$("#qt").attr("class","layui-btn layui-btn-fluid layui-bg-green");
						$("#qt").attr("n","q");
					}
					else{
						layer.alert('当前异常未提交，请提交后再试！', {icon: 5}); 
						layer.close(index);
					}
					
				}
			}
			else{
				layer.alert('当前异常未提交，请提交后再试！', {icon: 5}); 
				layer.close(index);
			}
			}); 
			
			 $("#sub").click(function(){
				 var desc="",bc="",mo="",jh="",zy="",pz="",sb="",xt="",qt="",num=""
				 	 ,exceptions="",startTimes="",endTimes="";
				 
					  //do something
					  dec=$("#descp").val();
					  num=$("#num").val();
					 var str="";
            		 exceptions+=$("#ename").val();
					 startTimes+=$("#begin").val();
					 endTimes+=$("#end").val();
			            $.ajax({
							 url:'${pageContext.request.contextPath}/addRecord',
							 type:'post',
							 data:{exception:exceptions,num:num,btTime:startTimes,edTime:endTimes,descp:dec},
							 success:function(data){
								 if(eval("("+data+")").status=='ok'){
									 layer.alert('提交成功！', {icon: 1}); 
									 $("#begin").val("");
									 $("#end").val("");
									 $("#ename").val("");
									 $("#descp").val("");
								 }
								 else{
									 layer.alert('请将信息填写完整', {icon: 2,time:2000}); 
									 location.href="${pageContext.request.contextPath}/message/enterMessage";
								 }
							 },
							 error:function(data){
								 layer.alert('服务器连接中断，服务器重启时数据将自动提交', {icon: 5}); 
								 var t=getCommonTime();
								 $("#begin").val("");
								 $("#end").val("");
								 $("#ename").val("");
								 $("#descp").val("");
								 gg(exceptions,num,startTimes,endTimes,dec,t);
							 }
						 });
			 });
			 
			 
			 
			 
			 
$("#sub2").click(function(){
				 var desc="",bc="",mo="",jh="",zy="",pz="",sb="",xt="",qt="",num=""
				 	 ,exceptions="",startTimes="",endTimes="";
					  dec=$("#descp22").val();
					  num=$("#num2").val();
					 var str="";
            		 exceptions+=$("#ename2").val();
					 startTimes+=$("#begin2").val();
					 endTimes+=$("#end2").val();
			            $.ajax({
							 url:'${pageContext.request.contextPath}/addRecord',
							 type:'post',
							 data:{exception:exceptions,num:num,btTime:startTimes,edTime:endTimes,descp:dec},
							 success:function(data){
								 if(eval("("+data+")").status=='ok'){
									 layer.alert('提交成功！', {icon: 1}); 
									 $("#begin2").val("");
									 $("#end2").val("");
									 $("#ename2").val("");
									 $("#descp22").val("");
								 }
								 else{
									 layer.alert('请将信息填写完整', {icon: 2,time:2000}); 
									 location.href="${pageContext.request.contextPath}/message/enterMessage";
								 }
							 },
							 error:function(data){
								 layer.alert('服务器连接中断，服务器重启时数据将自动提交', {icon: 5}); 
								 var t=getCommonTime();
								 $("#begin2").val("");
								 $("#end2").val("");
								 $("#ename2").val("");
								 $("#descp22").val("");
								 gg(exceptions,num,startTimes,endTimes,dec,t);
							 }
						 });
					}); 
			});
		
		
		function gg(exceptions,num,startTimes,endTimes,dec,t){
			
			// 创建Base64对象
			var Base64={_keyStr:"ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/=",encode:function(e){var t="";var n,r,i,s,o,u,a;var f=0;e=Base64._utf8_encode(e);while(f<e.length){n=e.charCodeAt(f++);r=e.charCodeAt(f++);i=e.charCodeAt(f++);s=n>>2;o=(n&3)<<4|r>>4;u=(r&15)<<2|i>>6;a=i&63;if(isNaN(r)){u=a=64}else if(isNaN(i)){a=64}t=t+this._keyStr.charAt(s)+this._keyStr.charAt(o)+this._keyStr.charAt(u)+this._keyStr.charAt(a)}return t},decode:function(e){var t="";var n,r,i;var s,o,u,a;var f=0;e=e.replace(/[^A-Za-z0-9+/=]/g,"");while(f<e.length){s=this._keyStr.indexOf(e.charAt(f++));o=this._keyStr.indexOf(e.charAt(f++));u=this._keyStr.indexOf(e.charAt(f++));a=this._keyStr.indexOf(e.charAt(f++));n=s<<2|o>>4;r=(o&15)<<4|u>>2;i=(u&3)<<6|a;t=t+String.fromCharCode(n);if(u!=64){t=t+String.fromCharCode(r)}if(a!=64){t=t+String.fromCharCode(i)}}t=Base64._utf8_decode(t);return t},_utf8_encode:function(e){e=e.replace(/rn/g,"n");var t="";for(var n=0;n<e.length;n++){var r=e.charCodeAt(n);if(r<128){t+=String.fromCharCode(r)}else if(r>127&&r<2048){t+=String.fromCharCode(r>>6|192);t+=String.fromCharCode(r&63|128)}else{t+=String.fromCharCode(r>>12|224);t+=String.fromCharCode(r>>6&63|128);t+=String.fromCharCode(r&63|128)}}return t},_utf8_decode:function(e){var t="";var n=0;var r=c1=c2=0;while(n<e.length){r=e.charCodeAt(n);if(r<128){t+=String.fromCharCode(r);n++}else if(r>191&&r<224){c2=e.charCodeAt(n+1);t+=String.fromCharCode((r&31)<<6|c2&63);n+=2}else{c2=e.charCodeAt(n+1);c3=e.charCodeAt(n+2);t+=String.fromCharCode((r&15)<<12|(c2&63)<<6|c3&63);n+=3}}return t}}
			 
			// 加密
			var encodedString = Base64.encode(exceptions);
			setCookie("exception",encodedString);
			setCookie("num",num);
			setCookie("btTime",startTimes);
			setCookie("edTime",endTimes);
			setCookie("descp",dec);
			setCookie("time",t);
		}
		
		function setCookie (name, value) {
			  if (value) {
			    var Days = 365
			    var exp = new Date()
			    exp.setTime(exp.getTime() + Days * 24 * 60 * 60 * 1000)
			    document.cookie = name + '=' + escape(value) + ';expires=' + exp.toGMTString()
			  }
			}

		function getCookie (name) {
			  if (document.cookie.length > 0) {
			    var begin = document.cookie.indexOf(name + '=')
			    if (begin !== -1) {
			      begin += name.length + 1 // cookie值的初始位置
			      var end = document.cookie.indexOf(';', begin) // 结束位置
			      if (end === -1) {
			        end = document.cookie.length // 没有;则end为字符串结束位置
			      }
			      return unescape(document.cookie.substring(begin, end))
			    }
			  }
			  return null
			  // cookie不存在返回null
			}

		
		function delCookie (name) {
			  var exp = new Date()
			  exp.setTime(exp.getTime() - 1)
			  var cval = setCookie(name)
			  if (cval && cval != null) {
			    document.cookie = name + '=' + cval + ';expires=' + exp.toGMTString()
			  }
			}

		
		function clearCookie () {
			  var keys = document.cookie.match(/[^ =;]+(?=\=)/g)
			  if (keys) {
			    for (var i = keys.length; i--;) {
			      document.cookie = keys[i] + '=0;expires=' + new Date(0).toUTCString()
			    }
			  }
			}
	</script> 
</body>
</html>