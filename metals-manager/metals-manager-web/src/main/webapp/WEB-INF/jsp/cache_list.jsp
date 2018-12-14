<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="<%=basePath%>resources/system/manage/blue/template.css"  rel="stylesheet" type="text/css"/>
<script src="<%=basePath%>resources/js/jquery-1.8.3.min.js"></script>
<script src="<%=basePath%>resources/js/jquery.shop.common.js"></script>
<script src="<%=basePath%>resources/js/jquery.validate.min.js"></script>
<script src="<%=basePath%>resources/js/jquery.poshytip.min.js"></script>
<script>
function saveForm(){
  jQuery("#theForm").submit();
}
</script>
</head>
<body>
<div class="cont">
  <h1 class="seth1">缓存管理</h1>
  <form name="theForm" id="theForm" action="<%=basePath%>admin/update_cache.htm" method="post">
    <div class="setcont">
      <ul class="set1">
        <li>数据缓存:$!{data_cache_size}</li>
        <li>页面缓存：$!{page_cache_size}</li>
        <li>缓存占用内存：$!CommUtil.div($!{cache_memory_size},1024) M</li>
      </ul>
      <ul class="set1">
        <li>数据缓存</li>
        <li><span class="webname">
          <input name="data_cache" type="checkbox" id="data_cache"  style="border:none; width:20px; height:20px;" title="选择" value="true"/>
          </span><span id="nothis"><strong class="q"></strong><strong class="w">数据缓存清空后系统将会即时同步数据库</strong><strong class="c"></strong></span></li>
      </ul>
      <ul class="set1">
        <li>页面缓存</li>
        <li><span class="webname">
          <input name="page_cache" type="checkbox" id="page_cache"  style="border:none; width:20px; height:20px;" title="选择" value="true"/>
          </span><span id="nothis"><strong class="q"></strong><strong class="w">页面缓存清空后系统将会即时加载最新页面</strong><strong class="c"></strong></span></li>
      </ul>
    </div>
    <div class="submit">
      <input name="save" type="button" value="更新缓存" onclick="saveForm()" />
    </div>
  </form>
</div>
</body>
</html>