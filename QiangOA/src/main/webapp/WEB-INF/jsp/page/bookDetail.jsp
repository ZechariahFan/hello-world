<%@page import="com.dj.demo.model.Book"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html class="no-js">
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="description" content="">
  <meta name="keywords" content="">
  <meta name="viewport"
        content="width=device-width, initial-scale=1">
  <title>Hello Amaze UI</title>

  <!-- Set render engine for 360 browser -->
  <meta name="renderer" content="webkit">

  <!-- No Baidu Siteapp-->
  <meta http-equiv="Cache-Control" content="no-siteapp"/>

  <link rel="icon" type="image/png" href="${pageContext.request.contextPath}/static/amazeui-2.7.2/docs/examples/assets/i/favicon.png">
<link rel="stylesheet" href="${pageContext.request.contextPath }/static2/layui/css/layui.css" media="all" />
  <!-- Add to homescreen for Chrome on Android -->
  <meta name="mobile-web-app-capable" content="yes">
  <link rel="icon" sizes="192x192" href="${pageContext.request.contextPath}/static/amazeui-2.7.2/docs/examples/assets/i/app-icon72x72@2x.png">

  <!-- Add to homescreen for Safari on iOS -->
  <meta name="apple-mobile-web-app-capable" content="yes">
  <meta name="apple-mobile-web-app-status-bar-style" content="black">
  <meta name="apple-mobile-web-app-title" content="Amaze UI"/>
  <link rel="apple-touch-icon-precomposed" href="${pageContext.request.contextPath}/static/amazeui-2.7.2/docs/examples/assets/i/app-icon72x72@2x.png">

  <!-- Tile icon for Win8 (144x144 + tile color) -->
  <meta name="msapplication-TileImage" content="${pageContext.request.contextPath}/static/amazeui-2.7.2/docs/examples/assets/i/app-icon72x72@2x.png">
  <meta name="msapplication-TileColor" content="#0e90d2">

  <link rel="stylesheet" href="${pageContext.request.contextPath}/static/amazeui-2.7.2/dist/css/amazeui.min.css"/>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/static/amazeui-2.7.2/docs/examples/assets/css/app.css">
</head>
<body>
	<div data-am-widget="slider" class="am-slider am-slider-d3" data-am-slider='{&quot;controlNav&quot;:&quot;thumbnails&quot;,&quot;directionNav&quot;:false}'>
  <ul class="am-slides">
    <li data-thumb="${pageContext.request.contextPath }/static/images/t1.jpg">
      <img src="${pageContext.request.contextPath }/static/images/t1.jpg">
      <div class="am-slider-desc">
        <h2 class="am-slider-title">远方 有一个地方 那里种有我们的梦想</h2>
        <p>再温柔平和宁静的落雨，也有把人浸透的威力</p>
      </div>
    </li>
    <li data-thumb="${pageContext.request.contextPath }/static/images/t2.jpg">
      <img src="${pageContext.request.contextPath }/static/images/t2.jpg">
      <div class="am-slider-desc">
        <h2 class="am-slider-title">某天 也许会相遇 相遇在这个好地方</h2>
        <p>以清净心看世界，以欢喜心过生活，以平常心生情味，以柔软心除障碍</p>
      </div>
    </li>
    <li data-thumb="${pageContext.request.contextPath }/static/images/t3.jpg">
      <img src="${pageContext.request.contextPath }/static/images/t3.jpg">
      <div class="am-slider-desc">
        <h2 class="am-slider-title">不要太担心 只因为我相信 终会走过这条遥远的道路</h2>
        <p>人生像一张洁白的纸，全凭人生之笔去描绘，玩弄纸笔者，白纸上只能涂成一摊胡乱的墨迹；认真书写者，白纸上才会留下一篇优美的文章</p>
      </div>
    </li>
    <li data-thumb="${pageContext.request.contextPath }/static/images/t4.jpg">
      <img src="${pageContext.request.contextPath }/static/images/t4.jpg">
      <div class="am-slider-desc">
        <h2 class="am-slider-title">OH PARA PARADISE 是否那么重要 你是否那么地遥远</h2>
        <p>有时候，靠单纯的判断并不能确定成功的几率，与其在等待中浪费青春，不如在追求中燃烧生命</p>
      </div>
    </li>
  </ul>
</div>
  <div data-am-widget="list_news" class="am-list-news am-list-news-default" style="text-align:center ">
  <!--列表标题-->
    <div class="am-list-news-hd am-cf">
       <!--带更多链接-->
        <a href="javascript:void(0)" class="" style="text-align:center ">
          <h2>${bookName }</h2>
        </a>
          </div>
  <div class="am-list-news-bd">
  <%String bookContent=(String)request.getAttribute("books");
  %>
  <ul class="am-list" id="content">
  	<%
  	String m="";
  	for(int i=0;i<bookContent.length();i++) {
  		if(!(bookContent.charAt(i)+"").equals("，")&&!(bookContent.charAt(i)+"").equals("。")&&!(bookContent.charAt(i)+"").equals(",")&&!(bookContent.charAt(i)+"").equals("."))
  		{
  			m+=bookContent.charAt(i);
  		}
  		else{%>
  			<li class="am-g">
			<a href="javascript:void(0)" class="am-list-item-hd"><%= m%></a>
			<%m=""; %>
     		 </li>
  	<% 	}
  	}%>
  	
  	<li class="am-g">
			<a href="javascript:void(0)" class="am-list-item-hd" style="text-align: right;
    margin-right: 100px">——${username }</a>
			<%m=""; %>
     		 </li>
		<li class="am-g">
			<a href="javascript:void(0)" class="am-list-item-hd" style="text-align: right;
    margin-right: 80px">${date }</a>
			<%m=""; %>
     		 </li>
  </ul>
  </div>
<div id="btp" style="margin-top: 50px;">
		<button class="layui-btn layui-btn-normal" id="bt11">审核区域</button>		
	</div>
  
  
  <div id="comm" style="padding: 50px;  background-color: #393D49; color: #fff; font-weight: 300;line-height: 22px;display: none;">
  	<div >该文章的审核结果是……</div>
  	<div id="test1"></div>
  </div>

<!--在这里编写你的代码-->

<!--[if (gte IE 9)|!(IE)]><!-->
<!--<![endif]-->
<script type="text/javascript" src="${pageContext.request.contextPath }/static2/layui/layui.js"></script>
<script src="http://libs.baidu.com/jquery/1.11.3/jquery.min.js"></script>
<script src="http://cdn.staticfile.org/modernizr/2.8.3/modernizr.js"></script>
<script src="${pageContext.request.contextPath}/static/amazeui-2.7.2/dist/js/amazeui.js"></script>

<script type="text/javascript">

function init(){
	try{
		<c:forEach items="${Auditing }"  var="ss">
		<c:if test="${ss.bookId==id}">
			{
			<c:if test="${ss.pass==1}">{
				$("#btp").html("<button class='am-btn am-btn-danger' id='my-popover'>审核已通过</button>");
				throw new Error("EndIterative");
			}
			</c:if>
			<c:if test="${ss.pass!=1}">{
				$("#btp").html("<button class='am-btn am-btn-danger' id='my-popover'>审核未通过</button>");
			}
			</c:if>
		}
	</c:if>
	</c:forEach>	
	}
	catch(e){
		
	}
	
}

init();

	var stars="";
$(function() {
	  $('#my-popover').popover({
	    content: '已经审核过啦'
	  })
	});
	</script>
	  <script>
	  	
	  	
	  	
	  	
	  layui.use(['rate','jquery','layer'], function(){
	    var rate = layui.rate,
	    	$=layui.jquery,
	   		layer=layui.layer;
	    //渲染
	    rate.render({
	  elem: '#test1'
	  ,setText: function(value){
	    var arrs = {
	      '1': '极差'
	      ,'2': '差'
	      ,'3': '中等'
	      ,'4': '好'
	    };
	    stars=arrs[value] || ( value + "星");
	    this.span.text(arrs[value] || ( value + "星"));
	//  document.getElementById("con").innerHTML=arrs[value] || ( value + "星");
	  }
	  ,theme:'#F2F2F2'
	  ,text:'true'
	});

	$("#bt11").click(function(){
		layer.open({
	  type: 1, 
	  title: "正在审核" 
	      ,closeBtn: true
	      ,area: '350px;'
	      ,shade: 0.8
	      ,id: 'LAY_layuipro' //设定一个id，防止重复弹出
	      ,resize: false
	      ,btn: ['审核通过', '残忍拒绝']
	     ,btnAlign: 'c'
	     ,moveType: 1 //拖拽模式，0或者1
	     ,content: $('#comm')
	     ,success: function(layero){
	          var btn = layero.find('.layui-layer-btn');
	             btn.find('.layui-layer-btn0').click(function(){
	             	layer.alert('酷毙了', {icon: 1});
	             	$("#btp").html("<button class='am-btn am-btn-danger' id='my-popover'>审核已通过</button>");
	             		window.open("${pageContext.request.contextPath}/Auditing?BookId=${id}&pass=1&comm="+stars);
	             });
	         var btn1 = layero.find('.layui-layer-btn');
	             btn.find('.layui-layer-btn1').click(function(){
	             	layer.msg('不开心。。', {icon: 5});
	             	$("#btp").html("<button class='am-btn am-btn-danger' id='my-popover'>审核未通过</button>");
	             	window.open("${pageContext.request.contextPath}/Auditing?BookId=${id}&pass=2&comm="+stars);
	         });
	     }
	});
	});
	});
</script>
</body>
</html>
