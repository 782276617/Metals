<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
<script src="<%=basePath%>resources/js/jquery.shop.common.js"></script>
<script src="<%=basePath%>resources/js/jquery.poshytip.min.js"></script>
<script>
function ajax_update(id,fieldName,obj){
   var val=jQuery(obj).val();
   jQuery.ajax({type:'POST',
	              url:'<%=basePath%>admin/goods_spec_ajax.htm',
				  data:{"id":id,"fieldName":fieldName,"value":val},
				beforeSend:function(){
				  
				},
			   success:function(data){
	             if(val==""){
				   jQuery(obj).attr("src","<%=basePath%>resources/style/system/manage/blue/images/"+data+".png");
				 }else{
				   jQuery(obj).val(val);
				 }      
              }
	    });
}
</script>
<body>
<div class="cont">
  <h1 class="seth1">规格管理</h1>
  <div class="settab"> <span class="tab-one"></span> <span class="tabs"> <a href="<%=basePath%>admin/spec/goods_spec_list.htm"  class="this">管理</a> | <a href="<%=basePath%>admin/spec/goods_spec_add.htm">新增</a></span> <span class="tab-two"></span></div>
  <form name="ListForm" id="ListForm" action="<%=basePath%>admin/goods_spec_list.htm" method="post">
  <div id="list">
    <div class="typemanager">
      <table width="100%" border="0" cellspacing="0" cellpadding="0" class="specific_table">
        <tr style="background: #2A7AD2; height:30px; color:#FFF">
          <td width="17%">序号</td>
          <td width="30%">规格名称</td>
          <td width="35%">规格值</td>
          <td align="center">操作</td>
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
          <td><span class="pxnum size7"><span class="pxnum size5">
          			${list.name}
          </span></span></td>
          <td>${list.spec}</td>
          <td align="center" class="ac8"><a href="<%=basePath%>admin/spec/goods_spec_edit.htm?id=${list.id}">编辑</a>|<a href="javascript:voud(0);" onclick="if(confirm('删除后不可恢复，是否继续?'))window.location.href='<%=basePath%>admin/spec/goods_spec_del.htm?mulitId=${list.id}'">删除</a></td>
        </tr>
        </c:forEach>
            <tr style="background:#F2F2F2; height:30px;">
        <td colspan="9"><div class="fenye3">
                

        
          </div></td>
      </tr>
      </table>
    </div>
    <div class="fenye">
		      <input name="currentPage" type="hidden" id="currentPage" value="$!currentPage" />
			  <input name="mulitId" type="hidden" id="mulitId" />
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
  </div>
</form>
</div>
</body>
</html>
