<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<title>Loss-Reporter后台管理系统</title>
	 <%@include file="/common/header.jsp" %> 
</head>
<body class="childrenBody">
	<form class="layui-form form" id="mainForm"   method="post">
				
			<div class="layui-form form" >
			<label class="layui-form-label">面板一</label>
			<div class="layui-input-block">
				<input type="text" class="layui-input"  name="cname1" id="cname1"  lay-verify="required" placeholder="请输入面板一">
			</div>
		</div>
		<div class="layui-form form" >
			<label class="layui-form-label">面板二</label>
			<div class="layui-input-block">
				<input type="text" class="layui-input"  name="cname2" id="cname2"  lay-verify="required" placeholder="请输入面板二">
			</div>
		</div>
		<div class="layui-form form" >
			<label class="layui-form-label">面板三</label>
			<div class="layui-input-block">
				<input type="text" class="layui-input"  name="cname3" id="cname3"  lay-verify="required" placeholder="请输入面板三">
			</div>
		</div>
		<div class="layui-form form" >
			<label class="layui-form-label">面板四</label>
			<div class="layui-input-block">
				<input type="text" class="layui-input"  name="cname4" id="cname4"  lay-verify="required" placeholder="请输入面板四">
			</div>
		</div>
		<div class="layui-form form" >
			<label class="layui-form-label">面板五</label>
			<div class="layui-input-block">
				<input type="text" class="layui-input"  name="cname5" id="cname5"  lay-verify="required" placeholder="请输入面板五">
			</div>
		</div>
		 <div class="layui-form form" >
			<label class="layui-form-label">面板六</label>
			<div class="layui-input-block">
				<input type="text" class="layui-input"  name="cname6" id="cname6"  lay-verify="required" placeholder="请输入面板六">
			</div>
		</div>
				
			<div class="layui-form form" >
			<label class="layui-form-label">面板七</label>
			<div class="layui-input-block">
				<input type="text" class="layui-input"  name="cname7" id="cname7"  lay-verify="required" placeholder="请输入面板七">
			</div>
		</div>
		<div class="layui-form form" >
			<label class="layui-form-label">面板八</label>
			<div class="layui-input-block">
				<input type="text" class="layui-input"  name="cname8" id="cname8"  lay-verify="required" placeholder="请输入面板八">
			</div>
		</div>
		<div class="layui-form form" >
			<label class="layui-form-label">名称</label>
			<div class="layui-input-block">
				<input type="text" class="layui-input"  name="alias" id="alias"  lay-verify="required" placeholder="请输入面板名">
			</div>
		</div>
  <div class="layui-form-item">
    <div class="layui-input-block">
      <button class="layui-btn" lay-submit lay-filter="*">立即提交</button>
      <button type="reset" class="layui-btn layui-btn-primary">重置</button>
    </div>
  </div>
  <!-- 更多表单结构排版请移步文档左侧【页面元素-表单】一项阅览 -->
</form>
	 <%@include file="/common/version.jsp" %>  
	<script type="text/javascript">
	layui.use(['form','layer'], function(){
		var $ = layui.jquery
		,form = layui.form()
		,layer = layui.layer;
		  
		  //各种基于事件的操作，下面会有进一步介绍
		  
		  
		  /* var p1='undefined';
		  form.verify({
			  
		  pass: function(value, item){ //value：表单的值、item：表单的DOM对象
			  p1=value;
			  if(! /^[\S]{6,12}$/.test(value)){
				  return '密码必须6到12位，且不能出现空格';
			  }
		  }, */
		  
		  //我们既支持上述函数式的方式，也支持下述数组的形式
		  //数组的两个值分别代表：[正则匹配、匹配不符时的提示文字]
		  /* cname: function(value, item){
			  if(!new RegExp("^[a-zA-Z0-9_\u4e00-\u9fa5\\s·]+$").test(value)){
			      return '面板不能有特殊字符';
			    }
			    if(/(^\_)|(\__)|(\_+$)/.test(value)){
			      return '面板首尾不能出现下划线\'_\'';
			    }
			    if(/^\d+\d+\d$/.test(value)){
			      return '面板不能全为数字';
			    }
			    
			     if(!/^[\S]{2,6}$/.test(value)){
			    	return '用户名必须2到6位，且不能出现空格';
			    } 
			  
			  
			  
		  },
		  pass2: function(value, item){
			  if(p1!=value){
				  return '密码不一样';
			  }
		  }
		}); */      
		  
		  
		  
		  form.on('submit(*)',function(data){
			  
			  var form = new FormData(document.getElementById("mainForm"));
			  $.ajax({
					url:'${pageContext.request.contextPath}/control/addControl',
					data:$("#mainForm").serialize(),
					type:"post",
					success:function(data){
						if(data=="add error"){
							fail(data);
						}
						else{
							addSuccess(data);
						}
						 
					},
					error:function(data){
						addFailed();
					}
					
				}); 
			  return false;
		  });
		  
		  
		  
		  function addSuccess(data){
			  layer.msg(data, {icon:6, time:3000}, function(index){
		            layer.close(index);
		            window.parent.location.reload();
		            var index = parent.layer.getFrameIndex(window.name);
		            parent.layer.close(index);
		        }); 
		  }
		  
		  function fail(data){
			  layer.msg(data, {icon:5, time:3000}, function(index){
		            layer.close(index);
		            window.parent.location.reload();
		            var index = parent.layer.getFrameIndex(window.name);
		            parent.layer.close(index);
		        });
		  }
		  
		  function addFailed(){
			  layer.msg('服务器内部错误', {icon:5, time:3000}, function(index){
		            layer.close(index);
		            window.parent.location.reload();
		            var index = parent.layer.getFrameIndex(window.name);
		            parent.layer.close(index);
		        });
		  }

		});
	</script>
</body>
</html>