<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  
<%@taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c" %>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
<link href="<%=basePath%>resources/system/manage/blue/template.css"  rel="stylesheet" type="text/css"/>
</head>
<body>
<div class="cont">
  <h1 class="seth1">系统消息</h1>
  <div class="bigok">
    <div class="bigokimg"><img src="<%=basePath%>resources/system/manage/blue/images/sys.jpg" /></div>
    <div class="bigleft">
      <ul>
        <li>${op_title}</li>
        <li class="hui">自动为您跳转到刚才的页面！</li>
        <li class="successbtn">
        	<c:if test="${!empty list_url}"><a href="${list_url}">返回上一页</a></c:if>
        	<c:if test="${!empty add_url}"><a href="${add_url}">继续新增</a></c:if>
        	</li>		
      </ul>
    </div>
	<c:if test="${!empty list_url}">
		<script>
		  var count=4;
		  window.setInterval(go,1000);
		  function go(){
		    count--;
		    if(count==0) window.location.href="${list_url}";
		  }
		</script>
	</c:if>
  </div>
</div>
</body>
</html>