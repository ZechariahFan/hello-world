<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
		<meta charset="UTF-8">
		<title>Loss-Reporter后台管理系统</title>
		 <link rel="stylesheet" href="${pageContext.request.contextPath}/static3/layui/css/layui.css" media="all" />

<script type="text/javascript" src="${pageContext.request.contextPath}/static3/layui/layui.js"></script> 
	</head>
	<body>
		 <blockquote class="layui-elem-quote news_search">
			<div class="layui-inline">
				<a class="layui-btn modal-iframe"  id="add">新增</a>
			</div>
			<div class="layui-inline">
				<a class="layui-btn layui-btn-danger batchDel ajax-all"  id="batchDelete">批量删除</a>
			</div>
			<!-- <div class="layui-inline">
			    <div class="layui-input-inline">
			    	<input type="text" name="users" id="u"  placeholder="用户名" class="layui-input search_input">
			    </div>
			     <button lay-submit class="layui-btn"  id="findUser">查找</button>
			     
			     <button class="layui-btn layui-btn-danger">提交</button>
			     <button lay-submit class="layui-btn layui-btn-normal"  id="emotions">我们的点点滴滴</button>
			</div> -->
	</blockquote>
		<table id="demo" lay-filter="test"></table>
		${count_recieve }
	</body>
	
	
	
	<script type="text/html" id="barDemo">
	

  
  <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="sub">提交</a>
  

</script>
	
	
	<script>
layui.use(['table','jquery'], function(){
  var table = layui.table,
  $=layui.jquery;
  //第一个实例
  table.render({
    elem: '#demo'
    ,height: 315
    ,url: '/QiangOA/control/controlInfo/' //数据接口
    ,page: true //开启分页
    ,cols: [[ //表头
    	{title:'全选',  type:'checkbox',fixed: 'left'}
    	,{field: 'id', title: 'ID', sort: true, align: 'center',unresize:true}
      ,{field: 'cname1', title: '面板1',unresize:true, align: 'center'}
      ,{field: 'cname2', title: '面板2', unresize:true, align: 'center'}
      ,{field: 'cname3', title: '面板3', align: 'center',unresize:true,edit: 'text'}
      ,{field: 'cname4', title: '面板4',unresize:true,edit: 'text'} 
      ,{field: 'cname5', title: '面板5',unresize:true} 
      ,{field: 'cname6', title: '面板6',unresize:true} 
      ,{field: 'cname7', title: '面板7',unresize:true}
      ,{field: 'cname8', title: '面板8',unresize:true}
      ,{field: 'alias', title: '名称',unresize:true}
       ,{title:'操作',  align:'center', toolbar: '#barDemo',unresize:true} 
    ]]
  });
  
  
  //添加弹出层
  $("#add").click(function(){
	  layer.open({
		  type: 2,
		  area: ['600px', '400px'],
		  content: '${pageContext.request.contextPath}/addUser',
		  success: function(layero, index){
		    var body = layer.getChildFrame('body', index);
		    var iframeWin = window[layero.find('iframe')[0]['name']]; //得到iframe页的窗口对象，执行iframe页的方法：iframeWin.method();
		    console.log(body.html()) //得到iframe页的body内容
		    //body.find('input').val('Hi，我是从父页来的')
		  },
		  
		});  
  });
  
  //表格的监听事件
  table.on('tool(test)', function(obj){
	  var layEvent = obj.event;
	  var ids=obj.data.id;
	  if(layEvent=='sub'){
		   $.ajax({
			  url:'${pageContext.request.contextPath}/control/updateControl',
			  type:'post',
			  data:{id:ids},
			  success:function(data){
				  if(eval("("+data+")").status=='success'){
					  
					  layer.alert('更新成功', {icon: 1});
				  }
				  else{
					  layer.alert('更新失败', {icon: 5});
				  }
				   
			  },
			  error:function(data){
				  layer.alert('服务器内部错误', {icon: 5}); 
			  }
		  });
	  }
	});
  
  
  $("#emotions").click(function(){
	  location.href="${pageContext.request.contextPath}/message/memoryMessages?id="+sendId;
  });
  
  var str="";
  
  
  $("#batchDelete").click(function(){
	  var  s="";
	  var name="";
	  var checkStatus = table.checkStatus('demo');
      str = checkStatus.data;
      if (str.length > 0) {
    	  for (var i = 0; i < str.length; i++) {
    		  s += str[i].id + ';';
    		  name+=str[i].alias+';';
    	  }
      }
      data = checkStatus.data;
	     layer.confirm('确认删除?', {icon: 3, title:'提示'}, function(index){
	    	  layer.close(index);
	    	  $.ajax({
	    		  url:'${pageContext.request.contextPath}/control/batchDelete',
	    		  type:'POST',
	    		  data:{'ids':s,'name':name},
	    		  dataType:'JSON',
	    		  success:function(data){
	    			  deleteSuccess(data);
	    		  },
	    		  error:function(data){
	    			  alert("服务器内部错误");
	    		  }
	    	  });
	    	}); 
  
});


  function deleteSuccess(data){
	  layer.msg(data, {icon:6, time:3000}, function(index){
            layer.close(index);
            window.location.reload();
        }); 
  }
    
});



</script> 
</html>