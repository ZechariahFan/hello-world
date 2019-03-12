<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<title>Loss-Reporter后台管理系统</title>
	<%@ include file="/common/header.jsp" %>
</head>
<body class="childrenBody">
	<blockquote class="layui-elem-quote news_search">
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
			</div>
	</blockquote>
	<div class="layui-form">
	  	<table class="layui-table" id="demo" style="text-align: center;">
		    <colgroup>
				<col width="50">
				<col width="100">
				<col>
				<col>
				<col>
				<col>
				<col width="13%">
		    </colgroup>
		    <thead>
				<tr>
					<th><input type="checkbox" lay-skin="primary" name="" id="checkAll" lay-filter="allChoose"> </th>
					<th>日期</th>
					<th>shift</th>
					<th>班别</th>
					<th>线别</th>
					<th>岗位</th>
					<th>填报人员工号</th>
					<th>填报人姓名</th>
					<th>对应人数</th>
					<th>对应面板</th>
					<th>修改</th>
				</tr> 
		    </thead>
		    <tbody id="list"></tbody>
		</table>
	</div>
	<div id="page" style="text-align:center; width:100%;height:100%;margin:0px; "></div>
	
    
	<%@ include file="/common/version.jsp" %>
	 <script type="text/javascript">
	 var $="";
		layui.use(['list','form', 'element','laypage','layer'],function(){
			var $=layui.jquery,
			form = layui.form()
			,element = layui.element,
			laypage = layui.laypage
			 ,layer = layui.layer;
			
			
			$("#findUser").click(function(){
				$.ajax({
					
					url:'${pageContext.request.contextPath}/userList',
					data:{'aname':$("#u").val()},
					type:"post",
					cache: false,
					success:function(data){
						var d=data[2];
						laypage({
						    cont: 'page'
						    ,pages: data[2]
						    ,groups: 3 //连续显示分页数
						    ,jump: function(obj, first){
						    //得到了当前页，用于向服务端请求对应数据
						    
						    	 
								    		
								    		$("#list").html("");
								    		var tr="";
											var td="";
											var us=data[0];
											for(var i=0;i<us.length;i++){
												td="<td> <input type='checkbox' lay-filter='itemChoose' lay-skin='primary' value="+us[i].userid+" name='selectOne'> </td>";
												td=td+"<td><img src='${pageContext.request.contextPath}/"+us[i].pic+"' width='40px' height='40px'</td>";  
												td=td+"<td>"+us[i].username+"</td>";
												 td=td+"<td>"+us[i].password+"</td>";
												td=td+"<td>"+us[i].descp+"</td>";
												td=td+"<td>"+us[i].status+"</td>";
												td=td+"<td>"+us[i].roleName+"</td>";
												td=td+"<td><i class='layui-icon' style='cursor: pointer;' onclick='deleteUser("+us[i].userid+")'>&#xe640;</i></td>";
												td=td+"<td><i class='layui-icon' style='cursor: pointer;' onclick='updateUser("+us[i].userid+")'>&#xe642;</i></td>";
												tr=tr+"<tr>"+td+"</tr>";
											}
											$("#list").append(tr);
											form.render();
								    		
								    	
						    }
			});
						}
						});
					});
			
			
			 $.ajax({
				url:'${pageContext.request.contextPath}/userList',
				type:'post',
				cache:'false',
				success:function(data){
					var d=data[2];
					laypage({
					    cont: 'page'
					    ,pages: data[2]
					    ,groups: 3 //连续显示分页数
					    ,jump: function(obj, first){
					    //得到了当前页，用于向服务端请求对应数据
					    
					    	 $.ajax({
							    	url:'${pageContext.request.contextPath}/userList',
							    	type:'post',
							    	dataType:'JSON',
							    	data:{'currentPage':obj.curr},
							    	success:function(data){
							    		
							    		$("#list").html("");
							    		var tr="";
										var td="";
										var us=data[0];
										for(var i=0;i<us.length;i++){
											td="<td> <input type='checkbox' lay-filter='itemChoose' lay-skin='primary' value="+us[i].userid+" name='selectOne'> </td>";
											td=td+"<td><img src='${pageContext.request.contextPath}/"+us[i].pic+"' width='40px' height='40px'</td>";  
											td=td+"<td>"+us[i].username+"</td>";
											 td=td+"<td>"+us[i].password+"</td>";
											td=td+"<td>"+us[i].descp+"</td>";
											td=td+"<td>"+us[i].status+"</td>";
											td=td+"<td>"+us[i].roleName+"</td>";
											td=td+"<td><i class='layui-icon' style='cursor: pointer;' onclick='deleteUser("+us[i].userid+")'>&#xe640;</i></td>";
											td=td+"<td><i class='layui-icon' style='cursor: pointer;' onclick='updateUser("+us[i].userid+")'>&#xe642;</i></td>";
											tr=tr+"<tr>"+td+"</tr>";
										}
										$("#list").append(tr);
										form.render();
							    		
							    	},
							    	error:function(data){
										alert("服务器内部错误");
									}
							    	
							    });
					    
					   
					  }
					});  
					var tr="";
					var td="";
					var us=data[0];
					for(var i=0;i<us.length;i++){
						td="<td> <input type='checkbox' lay-filter='itemChoose' lay-skin='primary' value="+us[i].userid+" name='selectOne'> </td>";
						td=td+"<td><img src='${pageContext.request.contextPath}/"+us[i].pic+"' width='40px' height='40px'</td>";  
						td=td+"<td>"+us[i].username+"</td>";
						 td=td+"<td>"+us[i].password+"</td>";
						td=td+"<td>"+us[i].descp+"</td>";
						td=td+"<td>"+us[i].status+"</td>";
						td=td+"<td>"+us[i].roleName+"</td>";
						td=td+"<td><i class='layui-icon' style='cursor: pointer;' onclick='deleteUser("+us[i].userid+")'>&#xe640;</i></td>";
						td=td+"<td><i class='layui-icon' style='cursor: pointer;' onclick='updateUser("+us[i].userid+")'>&#xe642;</i></td>";
						tr=tr+"<tr>"+td+"</tr>";
					}
					$("#list").append(tr);
					form.render();
					 
				},
				error:function(data){
					alert("服务器内部错误");
				}
			});
			
			
			
			form.on('checkbox(allChoose)', function(data){
			    var child = $(data.elem).parents('table').find('tbody input[type="checkbox"]');
			    child.each(function(index, item){
			        item.checked = data.elem.checked;
			    });
			    form.render('checkbox');
			});
			
			
			form.on('checkbox(itemChoose)',function(data){
			    var sib = $(data.elem).parents('table').find('tbody input[type="checkbox"]:checked').length;
			    var total = $(data.elem).parents('table').find('tbody input[type="checkbox"]').length;
			    if(sib == total){
			        $(data.elem).parents('table').find('thead input[type="checkbox"]').prop("checked",true);
			        form.render();
			    }else{
			        $(data.elem).parents('table').find('thead input[type="checkbox"]').prop("checked",false);
			        form.render();
			    }
			}); 
			
			
			
			$("#batchDelete").click(function(){
				var str="";
				var ck = $("input:checked[name='selectOne']");
	            if(ck.length == 0){
	                alert("请选择,然后进行删除");
	                return;
	            }
	            for(var i = 0; i < ck.length; i++){
	                //ck[i].parentNode.parentNode.remove();
	            	str+=ck[i].value;
	            	str+=",";
	            }
	            layer.confirm('确认删除?', {icon: 3, title:'提示'}, function(index){
	            	  //do something
	            	  
	            	  layer.close(index);
	            	  $.ajax({
	            		  url:'${pageContext.request.contextPath}/batchDelete',
	            		  type:'POST',
	            		  data:{'ids':str},
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
			
			
			
		});
			 

		
		
	</script> 
	<script type="text/javascript" src="${pageContext.request.contextPath }/static/jquery/jquery-1.4.4.min.js"></script>
	<script type="text/javascript">
	
	 function deleteUser(id){
		 
		$.ajax({
			url:'${pageContext.request.contextPath}/deleteUser',
			type:'post',
			cache:'false',
			//data:JSON.stringify(id),
			data:{'UserId':id},
			dataType:"json",
			//contentType: "application/json; charset=utf-8",
			success:function(data){
				deleteSuccess(data);
			},
			error:function(data){
				alert("服务器内部错误");
			}
		});
		
	}
	 
	 function deleteSuccess(data){
		 layer.msg(data, {icon:6, time:3000}, function(index){
	         layer.close(index);
	         window.location.reload();
	         var index = parent.layer.getFrameIndex(window.name);
	         parent.layer.close(index);
	     }); 
	 }
	 
	 
	 function updateUser(userId){
		 alert(userId);
		 var url = "${pageContext.request.contextPath}/UserInfo?userId="+userId;
		 layer.open({
			type:2,
			skin: 'layui-layer-lan',  
            title: '编辑页面',  
            fix: false,  
            shadeClose: false,  
            maxmin: true,
			area:['380px','390px'],
			content:url
		 });
	 }
	</script>
</body>
</html>