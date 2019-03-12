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
          <h2>点缀生命的奇迹</h2>
        </a>
          </div>

  <div class="am-list-news-bd">
  <ul class="am-list" id="content">
	<%List<Book> book=(List<Book>)request.getAttribute("books");%>
	<%
		for(int i=0;i<3;i++){%>
			<li class="am-g">
         	 <a href="${pageContext.request.contextPath }/bookList?bookContent=<%=book.get(i).getBookContent() %>&bookName=<%=book.get(i).getBookName() %>&username=<%=book.get(i).getUsername() %>&date=<%=book.get(i).getDate()%>&id=<%=book.get(i).getId()%>" class="am-list-item-hd "><%=book.get(i).getBookName() %><span style="float:right;margin-right:  10px"><%=book.get(i).getDate() %></span></a>
      </li>
	<% 	}
	%>
  </ul>
  </div>

  <!--更多在底部-->
      <div class="am-list-news-ft">
        <button class="am-list-news-more am-btn am-btn-default" id="Seemore">查看更多 &raquo;</button>
      </div>
  </div>
<!--在这里编写你的代码-->

<!--[if (gte IE 9)|!(IE)]><!-->
<!--<![endif]-->
<script src="http://libs.baidu.com/jquery/1.11.3/jquery.min.js"></script>
<script src="http://cdn.staticfile.org/modernizr/2.8.3/modernizr.js"></script>
<script src="${pageContext.request.contextPath}/static/amazeui-2.7.2/dist/js/amazeui.js"></script>

<script type="text/javascript">
$("#Seemore").click(function(){
	var li="<li class='am-g'>";
	//li+="<a href='a.html'>aaaaa</a></li>";
	var li="";
	<c:forEach items="${books }"  var="book">
		
		li+="<li class='am-g'><a href='${pageContext.request.contextPath }/bookList?bookName=${book.bookName}&date=${book.date}&username=${book.username}&bookContent=${book.bookContent}&id=${book.id}'>${book.bookName }<span style='float:right;margin-right:  10px'>${book.date }</span></a></li>";
		//alert("${book.bookContent}");
		</c:forEach>
		
		 $("#content").html(li);
		$("#Seemore").css("display","none"); 
});

</script>
</body>
</html>
