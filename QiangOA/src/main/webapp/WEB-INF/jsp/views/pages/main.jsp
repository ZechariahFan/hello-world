<%@page import="com.dj.demo.model.Operator"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Loss-Reporter后台管理系统</title>
<%@ include file="/common/header.jsp" %>
	<link rel="stylesheet" href="${pageContext.request.contextPath }/static/css/main.css" media="all" />
</head>
<body class="childrenBody">
	<div class="panel_box row">
		<div class="panel col">
			<a href="${pageContext.request.contextPath}/message/enterMessage">
				<div class="panel_icon">
					<i class="layui-icon" data-icon="&#xe613;">&#xe613;</i>
				</div>
				<div class="panel_word newMessage">
					<span></span>
					<cite>员工信息</cite>
				</div>
			</a>
		</div>
		<%Operator op=(Operator)session.getAttribute("user");
			if(op.getOperator().equals("070231")){%>
		<div class="panel col">
			<a   href="${pageContext.request.contextPath}/views/control/list">
				<div class="panel_icon" style="background-color:#FF5722;">
					<i class="iconfont icon-dongtaifensishu" data-icon="icon-dongtaifensishu"></i>
				</div>
				<div class="panel_word userAll">
					<span></span>
					<cite>对应面板</cite>
				</div>
			</a>
		</div>
		<%} %>
		<div class="panel col">
			<a href="${pageContext.request.contextPath}/getExceptionInfo" data-url="page/user/allUsers">
				<div class="panel_icon" style="background-color:#009688;">
					<i class="layui-icon" data-icon="&#xe63a;">&#xe63a;</i>
				</div>
				<div class="panel_word userAll">
					<span></span>
					<cite>损耗记录</cite>
				</div>
			</a>
		</div>
		<%-- <div class="panel col">
			<a href="${pageContext.request.contextPath}/page/gallery" >
				<div class="panel_icon" style="background-color:#5FB878;">
					<i class="layui-icon" data-icon="&#xe64a;">&#xe64a;</i>
				</div>
				<div class="panel_word imgAll">
					<span></span>
					<cite>图片展览</cite>
				</div>
			</a>
		</div>
		<div class="panel col">
			<a href="${pageContext.request.contextPath }/newsList" data-url="">
				<div class="panel_icon" style="background-color:#F7B824;">
					<i class="iconfont icon-wenben" data-icon="icon-wenben"></i>
				</div>
				<div class="panel_word waitNews">
					<span></span>
					<cite>待审核文章</cite>
				</div>
			</a>
		</div>
		<div class="panel col max_panel">
			<a href="javascript:;" data-url="page/news/newsList.html">
				<div class="panel_icon" style="background-color:#2F4056;">
					<i class="iconfont icon-text" data-icon="icon-text"></i>
				</div>
				<div class="panel_word allNews">
					<span></span>
					<em>文章总数</em>
					<cite>文章列表</cite>
				</div>
			</a>
		</div> --%>
	</div>
	
	<div class="row">
		<div class="col">
			<blockquote class="layui-elem-quote title">系统介绍</blockquote>
			<div class="layui-elem-quote layui-quote-nm">
				<p>1. Loss-Reporter管理系统</p>
				<p>2. 该系统主要用来记录发生的异常信息，并对这些异常进行管理</p>
				<br />
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col">
			<blockquote class="layui-elem-quote title">技术架构</blockquote>
			<div class="layui-elem-quote layui-quote-nm">
				<p>前台: Layui,Jquery</p>
				<p>后台: SpringMVC、Mybatis、Spring</p>
				<p>数据库: Oracle</p>
				<p>工具: Eclipse、Maven、Svn</p>
			</div>
		</div>
	</div>
	<div>
	<%@ include file="/common/bottom.jsp" %>
	</div>
	<script type="text/javascript" src="${pageContext.request.contextPath }/static/layui/layui.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/static/js/main.js"></script>
</body>
</html>