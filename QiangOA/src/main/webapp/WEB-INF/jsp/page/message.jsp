<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
		<meta charset="UTF-8">
		<title>Loss-Reporter后台管理系统</title>
		 <link rel="stylesheet" href="${pageContext.request.contextPath}/static2/layui/css/layui.css" media="all" />
		<%@ include file="/common/header.jsp" %>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/main.css" media="all" />	
<script type="text/javascript" src="${pageContext.request.contextPath}/static2/layui/layui.js"></script> 
<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/nav.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/leftNav.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/index.js"></script>
	</head>
	<body class="main_body">
	<input type="hidden" id="invalid" value="${a }">
	<% 
		String f=(String)session.getAttribute("f");
		if(f!="" &&f!=null&& f!="undefined")
		{%>
			<div class="layui-layout layui-layout-admin">
		<!-- 顶部 -->
		<div class="layui-header header">
			<div class="layui-main">
				<a href="${pageContext.request.contextPath}/toIndex?ff=2" class="logo">Loss-Reporter后台管理系统</a>
			    <!-- 顶部右侧菜单 -->
			    <ul class="layui-nav top_menu">
			    	
			    	<li class="layui-nav-item" mobile>
			    		<a href="#"><i class="iconfont icon-loginout"></i> 退出</a>
			    	</li>
					<li class="layui-nav-item" pc>
						<a href="javascript:;">
							<cite>${user.name }</cite>
						</a>
						<dl class="layui-nav-child">
<%-- 							<dd><a href="javascript:;" data-url="${pageCotext.request.contextPath}/page/user/userInfo.html"><i class="iconfont icon-zhanghu" data-icon="icon-zhanghu"></i><cite>个人资料</cite></a></dd>
							<dd><a href="javascript:;" data-url="${pageCotext.request.contextPath}/page/user/changePwd.html"><i class="iconfont icon-shezhi1" data-icon="icon-shezhi1"></i><cite>修改密码</cite></a></dd>
 --%>							<dd><a href="#"><i class="iconfont icon-loginout"></i><cite>退出</cite></a></dd>
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
		<% }%>
	
	
	
	
		 <%-- <blockquote class="layui-elem-quote news_search">
			<div class="layui-inline">
				<a class="layui-btn modal-iframe"  data-params='{"content": "${pageContext.request.contextPath }/addUser", "title": "添加用户","full":false,"area":"600px,450px"}'>新增</a>
			</div>
			<div class="layui-inline">
				<a class="layui-btn layui-btn-danger batchDel ajax-all"  id="batchDelete">批量删除</a>
			</div>
			<div class="layui-inline">
			    <div class="layui-input-inline">
			    	<input type="text" name="users" id="u"  placeholder="用户名" class="layui-input search_input">
			    </div>
			     <button lay-submit class="layui-btn"  id="findUser">查找</button>
			     <!-- <button lay-submit class="layui-btn layui-btn-normal"  id="emotions">我们的点点滴滴</button> -->
			</div>
	</blockquote> --%>
		<table id="demo" lay-filter="test"></table>
		<%-- ${count_recieve } --%>
		
		
		<table class="layui-table">
  <colgroup>
    <col >
    <col >
    <col>
  </colgroup>
  <thead>
  <tr style="text-align: center;">
      <th colspan="3"><h1>温馨提示(岗位/线别/面板/请从以下内容中选用),班别请用甲乙</h1></th>
    </tr> 
    <tr>
      <th><h2>岗位</h2></th>
      <th><h2>线别</h2></th>
      <th><h2>面板</h2></th>
    </tr> 
  </thead>
  <tbody id="tb">
  </tbody>
</table>
	</body>
	
	<div class="site-tree-mobile layui-hide"><i class="layui-icon">&#xe602;</i></div>
	<div class="site-mobile-shade"></div>
	
	<script type="text/html" id="barDemo">
	

  {{#  if(d.totalReceive!=''){ }}
    <a class="layui-btn layui-btn-xs" lay-event="detail" >查看<span class="layui-badge layui-bg-gray">
	{{d.totalReceive}}
	</span></a>
  {{#  }else{ }}
    <a class="layui-btn layui-btn-xs" lay-event="detail" >查看</a>
  {{#  } }}
  <a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
  <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
  

</script>
	
	
	<script>
	

layui.use(['table','jquery'], function(){
  var table = layui.table,
  $=layui.jquery;
  //第一个实例
  table.render({
    elem: '#demo'
    ,height: 315
    ,url: '/QiangOA/message/MessageInfo/' //数据接口
    ,page: true //开启分页
    ,cols: [[ //表头
    /* 	{title:'全选',  type:'checkbox'}
 */      {field: 'operator', title: '填报人员工号', sort: true, align: 'center',unresize:true}
      ,{field: 'name', title: '填报人姓名',unresize:true, align: 'center'}
      ,{field: 'position', title: '岗位', unresize:true, align: 'center',edit: 'text'}
      ,{field: 'line', title: '线别', align: 'center',unresize:true,edit: 'text'}
      ,{field: 'classify', title: '班别', align: 'center',unresize:true,edit: 'text'}
      ,{field: 'num', title: '对应人数',unresize:true,edit: 'text'} 
      ,{field: 'sj', title: '日期',unresize:true} 
      ,{field: 'shift', title: '白班/晚班',unresize:true} 
      ,{field: 'jdsc', title: '稼动时长',unresize:true,edit: 'text'}
      ,{field: 'control', title: '面板',unresize:true,edit: 'text'}
      /* ,{title:'操作',  align:'center', toolbar: '#barDemo',unresize:true} */
    ]]
  });
  
  init();
  getTips();
  function init(){
	  var cv=$("#invalid").val();
	  if(cv=='line'){
		  layer.msg('请输入合法的线别！', {icon:5, time:1000}, function(index){
	            layer.close(index);
		  }); 
	  }
	  else if(cv=='position'){
		  layer.msg('请输入合法的岗位！', {icon:5, time:1000}, function(index){
	            layer.close(index);
		  }); 
	  }
	  else if(cv=='jdsc'){
		  layer.msg('请输入合法的稼动时长！', {icon:5, time:1000}, function(index){
	            layer.close(index);
		  }); 
	  }
	  else if(cv=='alias'){
		  layer.msg('请输入合法的面板！', {icon:5, time:1000}, function(index){
	            layer.close(index);
		  }); 
	  }
	  else if(cv=='no'){
		  layer.msg('请输入面板后再试！', {icon:5, time:1000}, function(index){
	            layer.close(index);
		  }); 
	  }
  }
  
  
  function getTips(){
	  $.ajax({
		  url:'${pageContext.request.contextPath}/message/getTips',
		  type:'post',
		  success:function(data){
			  var tr="";
			  var td="";
			  var total_tr="";
			  for(var i=0;i<data.length;i++){
				  
				  td="<td><h2>"+data[i].position+"</h2></td><td><h2>"
				  +data[i].lines+"</h2></td><td><h2>"+data[i].alias+"</h2></td>";
				  tr+="<tr>"+td+"</tr>";
				  
			  }
			  $("#tb").html(tr);
		  }
	  });
  }
  
  //表格的监听事件
  table.on('tool(test)', function(obj){
	  var layEvent = obj.event;
	  var id=obj.data.id;
	  var sendName=obj.data.username;
	  var messageContent=obj.data.messageContent;
	  var date=obj.data.sendTime;
	  var sendId=obj.data.sendId;
	  if(layEvent=='detail'){
		  location.href="${pageContext.request.contextPath}/message/sendMessage?id="+id+"&messageContent="+messageContent+"&username="+sendName+"&sendTime="+date+"&sendId="+sendId;
	  }
	  else if(layEvent=='edit'){
		  
	  }
	  else{
		  
	  }
	});
  
  table.on('edit(test)', function(obj){ //注：edit是固定事件名，test是table原始容器的属性 lay-filter="对应的值"
	  var v1= obj.field;
  	  var value=obj.value;
  	  var ovalue=obj.data.operator;
	  location.href="${pageContext.request.contextPath}/updateUsrInfo?"+obj.field+"="+encodeURI(encodeURI(obj.value))+"&operator="+encodeURI(encodeURI(obj.data.operator));
	});
  
  
  
  $("#emotions").click(function(){
	  location.href="${pageContext.request.contextPath}/message/memoryMessages?id="+sendId;
  });
  
  
  clearCookie ()
	
	function clearCookie () {
		  var keys = document.cookie.match(/[^ =;]+(?=\=)/g)
		  if (keys) {
		    for (var i = keys.length; i--;) {
		      document.cookie = keys[i] + '=0;expires=' + new Date(0).toUTCString()
		    }
		  }
		}
  
  
});
</script> 
</html>