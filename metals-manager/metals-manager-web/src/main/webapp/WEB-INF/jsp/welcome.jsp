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
<title>wemall商城系统后台管理</title>
</head>
<link href="<%=basePath%>resources/system/manage/blue/template.css"  rel="stylesheet" type="text/css"/>
<script src="<%=basePath%>resources/js/jquery-1.8.3.min.js"></script>
<body>
      <div class="cont">
        <h1 class="seth1">欢迎页面</h1>
        <div class="welcome"><strong>您好,<span style="color:#06F"> ${userName} </span> 欢迎使用<span style="color:#F60"> Metals </span>商城系统. 您上次登录的时间：<fmt:formatDate value="${lastLoginDate}" pattern="yyyy-MM-dd HH:mm:ss"/>,&nbsp;&nbsp;登录IP:${lastLoginIp}</strong></div>

          <div class="wela">
            <h2>一周动态[本次统计时间：<fmt:formatDate value="${WThistime}" pattern="yyyy-MM-dd HH:mm:00"/>,下次统计时间：<fmt:formatDate value="${WNexttime}" pattern="yyyy-MM-dd HH:mm:00"/>]</h2>
            <ul>
              <li>新增会员数：    ${WnewUserCount}个</li>
              <li>新增商品数：    ${WnewGoodsCount}件</li>
              <li>新增订单数：    ${WnewOrderCount}单</li>
            </ul>
          </div>
              <div class="wela">
            <h2>统计信息[本次统计时间：<fmt:formatDate value="${HThistime}" pattern="yyyy-MM-dd HH:mm:00"/>,下次统计时间：<fmt:formatDate value="${HNexttime}" pattern="yyyy-MM-dd HH:mm:00"/>]</h2>
            <ul>
              <li>会员总数： ${HnewUserCount}个</li>
              <li>商品总数：${HnewGoodsCount}件</li>
              <li>订单总数：${HnewOrderCount}单</li>
            </ul>
          </div>
          
          
       <div class="wela">
            <h2>订单统计信息[本次统计时间：<fmt:formatDate value="${OThistime}" pattern="yyyy-MM-dd HH:mm:00"/>,下次统计时间：<fmt:formatDate value="${ONexttime}" pattern="yyyy-MM-dd HH:mm:00"/>]</h2>
            <ul>
              <li style="width: 23%" >待处理： ${OpendingCount}个</li>
              <li style="width: 24%">待发货：${OconsignmentCount}件</li>
              <li style="width: 24%">发货中：${OshippingCount}单</li>
              <li style="width: 23%">已接收：${OreceivedCount}单</li>
            </ul>
          </div>


          <div class="wela">
            <h2>系统信息</h2>
            <ul>
              <li>服务器操作系统：${os}</li>
              <li>JAVA版本：${java_version}</li>
              <li>数据库版本信息：${database_version}</li>
              <li>Web服务器：${web_server_version}</li>
              <li>Metals版本号：${shop_version}</li>
            </ul>
          </div>

      </div>
</body>
</html>