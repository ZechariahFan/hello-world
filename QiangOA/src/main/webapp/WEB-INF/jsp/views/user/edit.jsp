<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<title>Loss-Reporter后台管理系统</title>
	<%@ include file="/common/header.jsp" %>
</head>
<body class="childrenBody">
	<form class="layui-form form" id="form1" method="post"  enctype="multipart/form-data">
		<input type="hidden" name="userid" value="${user.userid}">
		<div class="layui-form-item">
			<label class="layui-form-label">用户名</label>
			<div class="layui-input-block">
				<input type="text" class="layui-input" readonly="readonly" name="username" value="${user.username}"   lay-verify="username"   placeholder="请输入用户名">
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">密码</label>
			<div class="layui-input-block">
				<input type="password" class="layui-input" name="password" value="${user.password}" lay-verify="pass"   placeholder="请输入密码">
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">确认密码</label>
			<div class="layui-input-block">
				<input type="password" class="layui-input" name="password2" value="${user.password}" lay-verify="pass2"   placeholder="请再输入密码">
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">描述</label>
			<div class="layui-input-block">
				<textarea placeholder="请输入描述" name="descp" class="layui-textarea">${user.descp}</textarea>
			</div>
		</div>
		 <div class="layui-form-item">
			<label class="layui-form-label">状态</label>
			<div class="layui-input-block">
			<c:choose>
				<c:when test="${user.status==1}">
				<input type="radio" name="status" value="1" title="启用" checked="checked">
					<input type="radio" name="status" value="0" title="禁止" >
				</c:when>
				<c:otherwise>
					<input type="radio" name="status" value="1" title="启用" >
					<input type="radio" name="status" value="0" title="禁止" checked="checked">
			</c:otherwise>
			</c:choose>
				
			</div>
		</div>
		   <div class="layui-form-item">
		    <label class="layui-form-label">权限</label>
		    <div class="layui-input-block">
		      <c:choose>
				<c:when test="${user.role==1}">
				<input type="radio" name="role" value="1" title="管理员" checked="checked">
					<input type="radio" name="role" value="3" title="会员" >
				</c:when>
				<c:otherwise>
					<input type="radio" name="role" value="1" title="管理员" >
					<input type="radio" name="role" value="3" title="会员" checked="checked">
			</c:otherwise>
			</c:choose>
		    </div>
		  </div>
		<div class="layui-form-item">
			<label class="layui-form-label">头像</label>
			<div class="layui-input-block">
				<input type="file" name="file" >
				 <input type="hidden" name="file" value="${user.pic}" >
			</div>
		</div>  
		<div class="layui-form-item">
			<div class="layui-input-block">
				<button class="layui-btn" lay-submit lay-filter="*">立即提交</button>
      			<button type="reset" class="layui-btn layui-btn-primary">重置</button>
		    </div>
		</div>
	</form>
	<%@ include file="/common/version.jsp" %>
	<script type="text/javascript">
	layui.use(['form','layer','myform'], function(){
		var $ = layui.jquery
		,form = layui.form()
		,layer = layui.layer;
		  
		  //各种基于事件的操作，下面会有进一步介绍
		  
		  
		  var p1='undefined';
		  form.verify({
			  
		  pass: function(value, item){ //value：表单的值、item：表单的DOM对象
			  p1=value;
			  if(! /^[\S]{6,12}$/.test(value)){
				  return '密码必须6到12位，且不能出现空格';
			  }
		  },
		  
		  //我们既支持上述函数式的方式，也支持下述数组的形式
		  //数组的两个值分别代表：[正则匹配、匹配不符时的提示文字]
		  username: function(value, item){
			  if(!new RegExp("^[a-zA-Z0-9_\u4e00-\u9fa5\\s·]+$").test(value)){
			      return '用户名不能有特殊字符';
			    }
			    if(/(^\_)|(\__)|(\_+$)/.test(value)){
			      return '用户名首尾不能出现下划线\'_\'';
			    }
			    if(/^\d+\d+\d$/.test(value)){
			      return '用户名不能全为数字';
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
		});      
		  
		  
		  
		  form.on('submit(*)',function(data){
			  var form = new FormData(document.getElementById("form1"));
			  $.ajax({
					
					url:'${pageContext.request.contextPath}/doEdit',
					data:form,
					type:'post',
					contentType: false,
					processData: false,
					cache: false,
					success:function(data){
						updateSuccess(data);
						 
					},
					error:function(data){
						updateFailed();
					}
					
				}); 
			  return false;
		  });
		  
		  
		  function updateSuccess(data){
			  layer.msg(data, {icon:6, time:3000}, function(index){
		            layer.close(index);
		            window.parent.location.reload();
		            var index = parent.layer.getFrameIndex(window.name);
		            parent.layer.close(index);
		        }); 
		  }
		  
		  function updateFailed(){
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