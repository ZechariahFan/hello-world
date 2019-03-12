<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<script type="text/javascript" src="${pageContext.request.contextPath }/static/jquery/jquery-1.11.3.min.js"></script>
<body>
	<button id="bt1">提交</button>
</body>
<script>

$("#bt1").click(function(){
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
});
</script>

</html>