<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Loss-Reporter后台管理系统</title>
<%@include file="/common/header.jsp" %>
	<link rel="stylesheet" href="${pageContext.request.contextPath }/static/css/login.css" media="all" />
	<style type="text/css">
		html {background-color: #eee;}
		html,body{overflow-x: hidden;overflow-y: auto;}
		html body{margin-top: 80px;}
		body{line-height:24px;}
	</style>
</head>
<body class="main_body" id="k">
<div class="layui-header login-header header">
		<div class="layui-main" >
			<div class="login-logo" style="text-align: center;padding-top: 15px">
				<a class="logo" href="/">
			        	Loss-Reporter管理系统
			    </a>
			</div>
		</div>
	</div>
	<div class="login-main layui-clear">
		<div class="login-panel login-panel-user">
			<div class="layui-tab layui-tab-brief">
				<ul class="layui-tab-title" style="text-align: center;">
					<li class="layui-this">登录</li>
				</ul>
				<div class="layui-form layui-tab-content" style="padding: 20px 0;">
					<div class="layui-tab-item layui-show" >
						<div class="layui-form layui-form-pane" >
							<form class="layui-form"  style="text-align: center;" id="mainForm">
								<div class="layui-form-item" style=" margin-left: 350px;">
									<label for="J_username" class="layui-form-label" >用户名</label>
									<div class="layui-input-inline" >
										<input type="text" id="user" name="operator" required=""
											lay-verify="required" autocomplete="off" class="layui-input" >
									</div>
								</div>
								<div class="layui-form-item" style=" margin-left: 350px;" id="p">
									<label for="J_password" class="layui-form-label">密码</label>
									<div class="layui-input-inline">
										<input type="password" id="pwd" name="password" required=""
											lay-verify="required" autocomplete="off" class="layui-input" >
									</div>
								</div>
								
								<div>
									<div class="layui-form-item">
									    <div class="layui-input-block">
									      <input type="radio" name="aa" value="1" title="管理员" lay-filter="filter" checked>
									      <input type="radio" name="aa" value="0" title="普通用户"  lay-filter="filter">
									    </div>
  									</div>
								</div>
								
								<div class="layui-form-item">
									<button class="layui-btn" type="button" lay-filter="login" lay-submit >立即登录</button>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript" src="${pageContext.request.contextPath }/static/layui/layui.js"></script>
	<script type="text/javascript">

	
	
	layui.use(['layer','form'], function(){
		var $ = layui.jquery
		,form = layui.form()
		,layer = layui.layer;
		
		function loginSuccess($btnLogin) {
			layer.msg("登录成功", {icon:6, time:2000}, function(index){
	            layer.close(index);
	            $btnLogin.removeClass('layui-btn-disabled').text('立即登录');
	            window.location.href = '${pageContext.request.contextPath}/toLogin';
	        });
		}
		
		form.on('radio(filter)', function(data){
			  if(data.value!=1){
				  $("#p").css("display","none");
				  $("#pwd").attr("lay-verify","");
			  }
			  else{
				  $("#p").css("display","block");
				  $("#pwd").attr("lay-verify","required");
			  }
			});  
		function loginError($btnLogin,msg) {
			layer.msg(msg, {icon:5, time:2000}, function(index){
				//$("#J_validateCode").attr('src', '/servlet/validateCodeServlet?width=110&height=38&'+Math.random());
	            layer.close(index);
	            $btnLogin.removeClass('layui-btn-disabled').text('立即登录');
	        });
		}
		
		$("#k").keypress(function(){
			if(event.keyCode ==13){
				var $btnLogin = $("button[lay-filter='login']");
		  		$btnLogin.addClass('layui-btn-disabled').text('登录中...');
				var form = new FormData(document.getElementById("mainForm"));
				$.ajax({
					
					url:'${pageContext.request.contextPath}/loginCheck',
					type:'post',
					data:$("#mainForm").serialize(),
					success:function(data){
						if(data.status==200){
			  				
			  				loginSuccess($btnLogin);
			  			}else{
			  				 loginError($btnLogin,data.msg);
			  			}
					},
					error:function(data){
						loginError($btnLogin,data.msg);
					}
				});
			}
			
		});
		//监听提交
	  	form.on('submit(login)', function(data){
	  		
	  		var $btnLogin = $("button[lay-filter='login']");
	  		$btnLogin.addClass('layui-btn-disabled').text('登录中...');
	  		$.post('/QiangOA/loginCheck',data.field, function(ret) {
	  			//alert(ret.status);
	  			if(ret.status==200){
	  				
	  				loginSuccess($btnLogin);
	  			}else{
	  				 loginError($btnLogin,ret.msg);
	  			}
	  		});
	    	return false;
	  	});
	});
	</script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/static/jquery/jquery-1.11.3.min.js"></script>
	<script type="text/javascript">

</script>
</body>
</html>