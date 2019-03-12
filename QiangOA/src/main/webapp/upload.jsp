<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>layui.form小例子</title>
<script type="text/javascript" src="${pageContext.request.contextPath }/static/jquery/jquery-1.11.3.min.js"></script>
</head>
<body>
<form  id="mainForm" > <!-- 提示：如果你不想用form，你可以换成div等任何一个普通元素 -->
 <div  >
			<label >用户名</label>
			<div >
				<input type="text"   name="username"  placeholder="请输入用户名">
			</div>
		</div>
		<div >
			<label >密码</label>
			<div >
				<input type="password" name="password"   placeholder="请输入密码">
			</div>
		</div>
		<div>
			<label >确认密码</label>
			<div >
				<input type="password"  name="password2"  placeholder="请再输入密码">
			</div>
		</div>
		<div >
			<label >描述</label>
			<div >
				<textarea placeholder="请输入描述" name="descp"></textarea>
			</div>
		</div>
		<div >
			<label >状态</label>
			<div >
				<input type="radio" name="status" value="1" title="启用" checked="checked">
				<input type="radio" name="status" value="0" title="禁止" >
			</div>
		</div>
		 <div >
		    <label>权限</label>
		    <div >
		      <input type="radio" name="role" value="1" title="管理员" checked="checked">
				<input type="radio" name=""role"" value="0" title="普通会员" >
		    </div>
		  </div>
				
			<div >
			<label >头像</label>
			<div >
				<input type="file" name="file" id="file1">
			</div>
		</div>
  <div >
    <div >
      <button  id="e">立即提交</button>
      <button type="reset">重置</button>
    </div>
  </div>
  <!-- 更多表单结构排版请移步文档左侧【页面元素-表单】一项阅览 -->
</form>
<script>



  $("#e").click(function(){
	  var form = new FormData(document.getElementById("mainForm"));
	  //form.append("username","zxj");
	  $.ajax({
			
			url:'${pageContext.request.contextPath}/testMe',
			
			data:form,
			type:"post",
			contentType: false,
			processData: false,
			cache: false,
			success:function(data){
				
				layer.msg('hello', {icon:5, time:2000}, function(index){
					//$("#J_validateCode").attr('src', '/servlet/validateCodeServlet?width=110&height=38&'+Math.random());
		            layer.close(index);
		        });
			},
			error:function(data){
				alert("嘿嘿");
			}
			
		});
	  return false;
  });
	  
	  
  



/* function sb_mit(){
		alert(11);
		 $.ajax({
			
			url:'${pageContext.request.contextPath}/testMe',
			success:function(data){
				alert(data);
			},
			error:function(data){
				alert("嘿嘿");
			}
			
		}); 
	} */
	
	
	
</script>
</html>
