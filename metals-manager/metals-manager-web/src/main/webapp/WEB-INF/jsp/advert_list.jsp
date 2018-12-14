<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  
  <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
  <%@taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>

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
</head>
<body>
<c:set var="nowDate" value="<%=new Date()%>"></c:set>
<div class="cont">
  <h1 class="seth1">广告管理</h1>
  <div class="settab"><span class="tab-one"></span> <span class="tabs"> <a href="<%=basePath%>/admin/advert_list.htm" class="this">所有广告</a>  | <a href="<%=basePath%>/admin/advert/advert_add.htm">新增广告</a></span></div>
  <form method="post" id="queryForm">
  <div class="orders">
    <ul>
      <li><span>广告名称</span> <span class="allmen size6">
        <input name="ad_title" type="text" id="ad_title" />
        </span><span class="btn_search">
        <input name="" type="submit"  value="搜索" style="cursor:pointer;" />
        </span></li>
    </ul>
  </div>
  </form>
  <form method="post" id="ListForm">
  <div class="allshop_table">
    <table width="100%" border="0" cellspacing="0" cellpadding="0" class="yhj_table">
      <tr style="background:#2A7AD2; height:30px; color:#FFF">
        <td width="6%" align="left">序号</td>
        <td width="18%" align="center">广告名称</td>
        <td  width="25%" align="center">开始时间</td>
        <td  width="25%" align="center">结束时间</td>
        <td  width="7%" align="center">播放序号</td>
        <td  width="7%" align="center">广告状态</td>
        <td  align="center">操作</td>
      </tr>
        <c:forEach items="${data.rows}" var="list" varStatus="status">
      <tr>
        <td align="left">
        <c:if test="${data.currPageNo==1}">
          			${status.count}
          </c:if>
          
          <c:if test="${data.currPageNo>1}">
	          ${(10*(data.currPageNo-1))+status.count}
          </c:if>
        </td>
        <td align="center">${list.name}</td>
        <td align="center"><fmt:formatDate value="${list.starttime}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
        <td align="center"><fmt:formatDate value="${list.endtime}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
        <td align="center">${list.sortOrder}</td>
        <td align="center">
        	<c:if test="${nowDate>list.endtime}">
        			停止
        	</c:if>
        	<c:if test="${nowDate<list.endtime}">
        			运行
        	</c:if>
        </td>
        <td  align="center" class="aoprater"><a href="<%=basePath%>admin/advert/advert_edit.htm?id=${list.id}" class="blue">编辑</a>|<a href="javascript:void(0);" onclick="if(confirm('删除后不可恢复，是否继续?'))window.location.href='<%=basePath%>admin/advert/advert_del.htm?mulitId=${list.id}'" class="blue">删除</a></td>
     
      </tr>
     	</c:forEach>
      <tr style="background:#F2F2F2; height:30px;">
        <td colspan="9"><div class="fenye3">
                
 
        
          </div></td>
      </tr>
    </table>
  </div>
     <div class="fenye">
           	 <a href="<%=basePath%>admin/advert/advert_list.htm?currentPage=1">首页</a>
	 
	 <c:if test="${data.currPageNo > 1}">
			 <a href="<%=basePath%>admin/advert/advert_list.htm?currentPage=${data.currPageNo-1}">上一页</a>
	 </c:if>
	 
	 <c:forEach var="i"  begin="${data.firstPage}" end="${data.lastPage>8?data.firstPage+7:data.lastPage}" step="1" >
			<a class="${data.currPageNo==i?'this':''}" href="<%=basePath%>admin/advert/advert_list.htm?currentPage=${i}">${i}</a>
	 </c:forEach>
	 	<c:if test="${data.currPageNo!=data.lastPage}">
			<a href="<%=basePath%>admin/advert/advert_list.htm?currentPage=${data.currPageNo+1}">下一页</a>
	 	</c:if>
		<a href="<%=basePath%>admin/advert/advert_list.htm?currentPage=${data.lastPage}">末页</a>
    </div>
  </form>
</div>

</body>
</html>