<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Loss-Reporter后台管理系统</title>
<%@ include file="/common/header.jsp" %>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/main.css" media="all" />
</head>
<body class="main_body">
	<div class="layui-layout layui-layout-admin">
		<!-- 顶部 -->
		<div class="layui-header header">
			<div class="layui-main">
				<a href="${pageContext.request.contextPath}/views/index" class="logo">Loss-Reporter后台管理系统</a>
			    <!-- 顶部右侧菜单 -->
			    <ul class="layui-nav top_menu">
			    	
			    	<li class="layui-nav-item" mobile>
			    		<a href="${pageContext.request.contextPath }/logout"><i class="iconfont icon-loginout"></i> 退出</a>
			    	</li>
					<li class="layui-nav-item" pc>
						<a href="javascript:;">
							<cite>${user.name }</cite>
						</a>
						<dl class="layui-nav-child">
							<%-- <dd><a href="javascript:;" data-url="${pageCotext.request.contextPath}/page/user/userInfo.html"><i class="iconfont icon-zhanghu" data-icon="icon-zhanghu"></i><cite>个人资料</cite></a></dd>
							<dd><a href="javascript:;" data-url="${pageCotext.request.contextPath}/page/user/changePwd.html"><i class="iconfont icon-shezhi1" data-icon="icon-shezhi1"></i><cite>修改密码</cite></a></dd> --%>
							<dd><a href="${pageContext.request.contextPath }/logout"><i class="iconfont icon-loginout"></i><cite>退出</cite></a></dd>
						</dl>
					</li>
				</ul>
			</div>
		</div>

	<!-- 退出 -->		
			<div class="navBar layui-side-scroll">
				<ul class="layui-nav layui-nav-tree" lay-filter="test">
				</ul>
			</div>
		</div>
		<!-- 右侧内容 -->
		<div class=" layui-form">
			<div class="layui-tab marg0" lay-filter="bodyTab">
				
				<div class="layui-tab-content clildFrame">
					<div class="layui-tab-item layui-show">
						<iframe src="${pageContext.request.contextPath}/views/pages/main"></iframe>
					</div>
				</div>
			</div>
		</div>
		<!-- 底部 -->
		
	</div>
	
	<!-- 移动导航 -->
	<div class="site-tree-mobile layui-hide"><i class="layui-icon">&#xe602;</i></div>
	<div class="site-mobile-shade"></div>

	<script type="text/javascript" src="${pageContext.request.contextPath}/static/layui/layui.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/nav.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/leftNav.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/index.js"></script>
</body>
<script>
//注意：导航 依赖 element 模块，否则无法进行功能性操作
layui.use('element', function(){
  var element = layui.element();
  
  //…
});
</script>
</html>