<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<head>
	<%@ include file="/common/header2.jsp" %>
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
	<div style="padding: 20px; background-color: #F2F2F2;">
      <div class="layui-row layui-col-space15">
        <div class="layui-col-md6" id="chart1">
          <div class="layui-card" >
          </div>
        </div>
        <div class="layui-col-md6" id="chart2">
          <div class="layui-card" >

          </div>
        </div>
      </div>
    </div>
    
    <form style="display: none;" id="mainForm" action="javascript:void(0)">
    	<div><textarea id="demo" name="messageContent"></textarea></div>
    	<div style="text-align: right;"><button class="layui-btn layui-btn-warm" id="send">发送</button></div>
    </form>
	</body>
	
	<%@ include file="/common/version2.jsp" %>
	<script type="text/javascript">
	var index='';
	var receiveId='';
	var close='';
	
		layui.use(['layedit','jquery'], function(){
	  	var layedit = layui.layedit
	  	,$=layui.jquery;
	  	
	  	
	  
	  	
			
			
			layedit.set({
				  uploadImage: {
				    url: 'uploadImage' //接口url
				    ,type: 'post' //默认post
				  }
				});

			$(document).on("click","[id = replay]",function(){
				receiveId=$(this).attr("value");
				close=layer.open({
			  type: 1, 
			  title:'留言板',
			  area: '500px',
			  content: $('#mainForm')//这里content是一个普通的String
			});
	  		index=layedit.build('demo');
	  	});
			
			
			
			
			
			 $("#send").click(function(){
				 var form = new FormData(document.getElementById("mainForm"));
				  form.append("messageContent",layedit.getContent(index));
				  form.append("sendId","${user.id}");
				  form.append("smailId","${title.id}");
				  form.append("receiveId",receiveId);
				  layer.close(close);
				     $.ajax({
						url:'${pageContext.request.contextPath}/message/replayMessage',
						data:form,
						type:"post",
						contentType: false,
						processData: false,
						cache: false,
						success:function(data){
							 
						},
						error:function(data){
						}
						
					}); 
				  return false; 
			});   
			
			
			
			
			
			//别人的来信
			
		  	  		/* var h1="<div class='layui-card' id='${title.sendId}'> <div class='layui-card-header'>${title.username}的来信</div><div class='layui-card-body'>${title.messageContent}</div><div class='layui-card-body' style='text-align: right;'> 时间：${title.sendTime} </div><div class='layui-card-body' style='text-align: right;color: #01AAED'><a href='javascript:void(0)' style='color: #01AAED' id='replay' value='${title.sendId}'>回复</a></div></div>";
			$("#chart1").html(h1);   */
			var flag=1;
		  	<c:forEach items="${receiveEmails }"  var="receive">
		  	var d=document.getElementById("chart1");
			var s=d.getElementsByTagName("div");
					for(var j=0;j<s.length;j++){
							if(s.length==1){
								 var h1="<div class='layui-card' id='${receive.sendId}'> <div class='layui-card-header'>${receive.username}的来信</div><div class='layui-card-body'>${receive.messageContent}</div><div class='layui-card-body' style='text-align: right;'> 时间：${receive.sendTime} </div><div class='layui-card-body' style='text-align: right;color: #01AAED'><a href='javascript:void(0)' style='color: #01AAED' id='replay' value='${receive.sendId}'>回复</a></div></div>";
									$("#chart1").html(h1);
									break;
							}
							else{
								for(var t=j;t<s.length;t++){
									if(${receive.sendId}==s[t].getAttribute("id")){
										var h2="<div class='layui-card-body'>${receive.messageContent}</div><div class='layui-card-body' style='text-align: right;'> 时间：${receive.sendTime} </div><div class='layui-card-body' style='text-align: right;color: #01AAED'><a href='javascript:void(0)' style='color: #01AAED' id='replay' value='${receive.sendId}'>回复</a></div>";
										$("#"+s[t].getAttribute("id")).append(h2);
										flag=2;
										break;
								}
									
								}
								if(flag==2){
									break;
								}
								else{
									var h1="<div class='layui-card' id='${receive.sendId}'> <div class='layui-card-header'>${receive.username}的来信</div><div class='layui-card-body'>${receive.messageContent}</div><div class='layui-card-body' style='text-align: right;'> 时间：${receive.sendTime} </div><div class='layui-card-body' style='text-align: right;color: #01AAED'><a href='javascript:void(0)' style='color: #01AAED' id='replay' value='${receive.sendId}'>回复</a></div></div>";
									$("#chart1").append(h1);
									
									break;
								}
							}
						
				}
				</c:forEach>
				
				
				
				//发送回复给其他人的代码
				var flags=1;
			  	<c:forEach items="${author }"  var="authorReceive">
			  	var d=document.getElementById("chart1");
			  	var s=d.getElementsByTagName("div");
			  	var d2=document.getElementById("chart2");
			  	var s2=d2.getElementsByTagName("div");
			  	for(var j=0;j<s2.length;j++){
					for(var i=0;i<s.length;i++){
						if(s2.length==1){
							var h2="<div class='layui-card' id='${authorReceive.sendId}'> <div class='layui-card-header'>回复${authorReceive.username}的来信</div><div class='layui-card-body'>${authorReceive.messageContent}</div><div class='layui-card-body' style='text-align: right;'> 时间：${authorReceive.sendTime} </div><div class='layui-card-body' style='text-align: right;color: #01AAED'></div></div>";
							$("#chart2").html(h2);
							break;
						}
						else{
							for(var t=j;t<s2.length;t++){
								for(var m=0;m<s.length;m++){
								if(${authorReceive.sendId}==s2[j].getAttribute("id")){
									$("#"+s2[0].getAttribute("id")).append(h2);
									flag=2;
									break;
								}
								}
							}
						}
						if(flag==2){
							break;
						}
						else{
							var h1="<div class='layui-card' id='${authorReceive.sendId}'> <div class='layui-card-header'>回复${authorReceive.username}的来信</div><div class='layui-card-body'>${authorReceive.messageContent}</div><div class='layui-card-body' style='text-align: right;'> 时间：${authorReceive.sendTime} </div><div class='layui-card-body' style='text-align: right;color: #01AAED'></div></div>";
							$("#chart2").append(h1);
							break;
						}
					
				}
					}
					</c:forEach>
			
});
	</script>

</html>