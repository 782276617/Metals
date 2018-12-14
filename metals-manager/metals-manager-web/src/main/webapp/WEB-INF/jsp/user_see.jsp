<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
</head>
<link href="<%=basePath%>resources/system/manage/blue/template.css"  rel="stylesheet" type="text/css"/>
<script src="<%=basePath%>resources/js/jquery-1.8.3.min.js"></script>
<script src="<%=basePath%>resources/js/jquery.poshytip.min.js"></script>
<script src="<%=basePath%>resources/js/jquery.shop.common.js"></script>
<script src="<%=basePath%>resources/js/jquery.validate.min.js"></script>

<body>
<div class="cont">
  <h1 class="seth1">会员管理</h1>
  <div class="settab"><span class="tab-one"></span>
      <span class="tabs">
       <a href="<%=basePath%>admin/user_list.htm">管理</a> |
	   <a href="javascript:void(0);" class="this">查看</a>
	   </span>
      <span class="tab-two"></span>
      </div>
 <form name="theForm" id="theForm" action="<%=basePath%>admin/user_save.htm" method="post">
 <input name="id" type="hidden" id="id" value="$!obj.id" />
  <input name="currentPage" type="hidden" id="currentPage" value="$!currentPage" />
  <input name="list_url" type="hidden" id="list_url" value="<%=basePath%>admin/user_list.htm" />
  <input name="add_url" type="hidden" id="add_url" value="<%=basePath%>admin/user_add.htm" />
  <div class="setcont" align="center">
    <!--鼠标经过样式-->
    <table width="82%" border="0" cellspacing="0" cellpadding="0">
    	<tr class="set1">
    		<td width="23%">用户名：${data.uname}</td>
    		<td width="23%">真实姓名：${data.urealname}</td>
    		<td width="23%">性别：${data.usex}</td>
    	</tr>
    	 <tr height="28px">
    	</tr>
    	<tr class="set1">
    		<td width="23%">公司名称：${data.ucompany}</td>
    		<td width="23%">电话：${data.uphone}</td>
 			<td width="23%">微信号：${data.uweixin}</td>	
    	</tr>
    	 <tr height="28px">
    	</tr>
    	<tr class="set1">
    	    <td width="23%">注册时间：<fmt:formatDate value="${data.uregistetime}" pattern="yyyy-MM-dd hh:mm:ss"/></td>
 			<td width="23%">下单次数：${money}</td>	
    		<td width="23%">总消费：${data.monetary==null?0:data.monetary}</td>
    	</tr>
    	 <tr height="28px">
    	</tr>
    	<tr class="set1">
    		<td width="23%">最近登录时间：<fmt:formatDate value="${data.ulastdate}" pattern="yyyy-MM-dd hh:mm:ss"/></td>
    		<td width="23%">登录次数：${data.ulogincount}</td>
    	</tr>
    	
    </table>
    </div>
  </form>
  <div class="submit">
    <input name="save" type="button" value="返回" onclick="javascript:window.history.back(-1);" />
  </div>
</div>
</body>
</html>