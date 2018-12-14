<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  
<%@taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>   
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<link href="<%=basePath%>resources/system/manage/blue/template.css"  rel="stylesheet" type="text/css"/>
<script src="<%=basePath%>resources/js/jquery-1.8.3.min.js"></script>
<script src="<%=basePath%>resources/js/jquery.shop.common.js"></script>
<script src="<%=basePath%>resources/js/jquery.poshytip.min.js"></script>
<script>
jQuery(document).ready(function(){
  jQuery(".memimg").mouseover(function(){
     jQuery(this).css("cursor","pointer");
	 jQuery(".mem_detail[id^=user_detail_]").hide();
     var id=jQuery(this).attr("id");
	 jQuery("#user_detail_"+id).show();
  });
  jQuery(".mem_detail[id^=user_detail_]").mouseleave(function(){
    jQuery(this).hide();
  });
});
</script>
<body>
  <div class="cont">
    <h1 class="seth1">会员管理</h1>
    <div class="settab"><span class="tab-one"></span> <span class="tabs"> <a href="<%=basePath%>admin/user_list.htm"  class="this">管理</a>
    	&nbsp;| &nbsp;<a href="<%=basePath%>user/user_add.htm" class="this">新增</a>
    	</span> <span class="tab-two"></span></div>
	<form action="<%=basePath%>admin/search.htm" name="search" method="post">
    <div class="allmem_search">
      <ul>
        <li> <span>
          <select name="condition" id="condition">
            <option value="userName" ${condition=="userName"?"selected='selected'":""} >会员名</option>
            <option value="uPhone" ${condition=="uPhone"?"selected='selected'":""} >注册手机号</option>
            <option value="trueName" ${condition=="trueName"?"selected='selected'":""}>真实姓名</option>
          </select>
          </span> <span class="allmen size4">
          <input name="value" type="text" value="${search}" id="value"/>
          </span><span class="btn_search">
          <input name="" type="submit"  value="搜索" style="cursor:pointer;" title="搜索会员"/>
          </span> </li>
      </ul>
    </div>
	</form>
	<FORM name="ListForm" id="ListForm"  action="<%=basePath%>admin/user_list.htm" method="post">
    <div class="allmem_table">
      <table width="98%" border="0" cellspacing="0" cellpadding="0">
        <tr style="background:#2A7AD2;height:30px; color:#FFF">
          <td width="6%" align="left">序号</td>
          <td width="22%" align="left">会员名</td>
          <td width="15%" align="center">公司名称</td>
          <td width="15%" align="center">注册时间</td>
          <td width="15%" align="center">最近登录</td>
          <td width="6%" align="center">登录次数&nbsp;</td>
          <td width="10%" align="center">消费金额</td>
          <td  align="center">操作</td>
        </tr>
        
        <c:forEach items="${data.rows}" var="list" varStatus="status">
        <tr>
          <td  align="left">
          <c:if test="${data.currPageNo==1}">
          			${status.count}
          </c:if>
          
          <c:if test="${data.currPageNo>1}">
	          ${(10*(data.currPageNo-1))+status.count}
          </c:if>
	          </td>
          <td  align="left">
          <span class="memimg">
          <img  src="<%=basePath%>resources/system/manage/blue/images/default_user_photo.gif" width="45" height="49" />
          </span>
           <span class="mem_detail">
		            <ul>
		              <li class="mem_font">${list.uname}<i>(真实姓名：${list.urealname})</i></li>
		              <li class="open">
		                <span class="email" ><img  src="<%=basePath%>resources/system/manage/blue/images/l3.png" width="18" height="18"  style="margin-top: 2px"/></span>
		                <span class="email" ><img <c:if test="${list.uphone!=null&&list.uphone!=''}">title="手机：${list.uphone}"</c:if> src="<%=basePath%>resources/system/manage/blue/images/pho.png" width="21" height="22" /></span>
		              </li>
		            </ul>
            </span>
            </td>
          <td align="center">${list.ucompany}</td>
          <td class="lightred"><fmt:formatDate value="${list.uregistetime}" pattern="yyyy-MM-dd HH:mm:ss"/>  </td>
          <td class="lightred"><fmt:formatDate value="${list.ulastdate}" pattern="yyyy-MM-dd HH:mm:ss"/>  </td>
          <td class="lightred">
             	 <li>${list.ulogincount}</li>
           </td>
          <td class="lightred" align="center">
          		${list.monetary==null?00.0:list.monetary}
          </td>
          <td align="center"  class="blue xiahua">
          		<a href="<%=basePath%>user/user_edit.htm?id=${list.uid}">编辑</a>
          		<a href="<%=basePath%>admin/user_see.htm?id=${list.uid}">查看</a>
          </td>
        </tr>
       </c:forEach>
          <tr style="background:#F2F2F2; height:30px;">
       		 <td colspan="9">
       		 		<div class="fenye3"></div>
          	</td>
     	 </tr>
      </table>
    </div>
    <div class="fenye">
      <input name="userRole" type="hidden" id="userRole" value="BUYER" />
      <input type="hidden" name="currentPage" id="currentPage" value="$!currentPage" />
      <input name="mulitId" type="hidden" id="mulitId" />
			
	 <a href="<%=basePath%>admin/search.htm?currentPage=1&condition=${condition}&value=${search}">首页</a>
	 
	 <c:if test="${data.currPageNo > 1}">
			 <a href="<%=basePath%>admin/search.htm?currentPage=${data.currPageNo-1}&condition=${condition}&value=${search}">上一页</a>
	 </c:if>
	 
	 <c:forEach var="i" begin="${data.firstPage}" end="${data.lastPage>8?data.firstPage+7:data.lastPage}" step="1" >
			<a class="${data.currPageNo==i?'this':''}" href="<%=basePath%>admin/search.htm?currentPage=${i}&condition=${condition}&value=${search}">${i}</a>
	 </c:forEach>
	 	<c:if test="${data.currPageNo!=data.lastPage}">
			<a href="<%=basePath%>admin/search.htm?currentPage=${data.currPageNo+1}&condition=${condition}&value=${search}">下一页</a>
	 	</c:if>
		<a href="<%=basePath%>admin/search.htm?currentPage=${data.lastPage}&condition=${condition}&value=${search}">末页</a>
	</div>
	</FORM>
  </div>
</body>
</html>

