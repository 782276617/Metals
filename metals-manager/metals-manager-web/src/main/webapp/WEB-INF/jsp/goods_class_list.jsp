<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  
  <%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
  <%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

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
function addorsubtract(obj,id){
 var cls=jQuery(obj).attr("cls");
 var level=jQuery(obj).attr("level");
  if(cls=="jian"){
  jQuery.ajax({type:'POST',
		       url:'<%=basePath%>admin/category/goods_class_data.htm',
		        data:{"pid":id,"currentPage":"${data.currPageNo}"},
				success:function(data){
	                jQuery("#"+id).after(data);
					jQuery(obj).attr("src","<%=basePath%>resources/system/manage/blue/images/add.jpg");
					jQuery(obj).attr("cls","add");
					tipStyle();
              }
  });
  }else{
       if(level=="0_"+id){
	    jQuery("tr[level=child_"+id+"]").remove();
	   }else
	   jQuery("tr[parent="+id+"]").remove();
	   jQuery(obj).attr("src","<%=basePath%>resources/system/manage/blue/images/jian.jpg");
	   jQuery(obj).attr("cls","jian");
  }
  //
}
function ajax_update(id,fieldName,obj){
   var val=jQuery(obj).val();
    jQuery.ajax({type:'POST',
	              url:'<%=basePath%>admin/category/goods_class_ajax.htm',
				  data:{"id":id,"fieldName":fieldName,"value":val},
				beforeSend:function(){
				  
				},
			   success:function(data){
	             if(val==""){
				   jQuery(obj).attr("src","<%=basePath%>resources/system/manage/blue/images/"+data+".png");
				 }else{
				   jQuery(obj).val(val);
				 }      
              }
	    });
}
jQuery(document).ready(function(){
 
});
</script>
<body>
<div class="cont">
  <h1 class="seth1">商品分类</h1>
  <div class="settab"><span class="tab-one"></span> <span class="tabs"> <a href="<%=basePath%>admin/category/goods_class_list.htm"  class="this">管理</a> | <a href="<%=basePath%>admin/category/goods_class_add.htm">新增</a></span> <span class="tab-two"></span></div>
  <div class="classtable">
  <FORM name="ListForm" id="ListForm"  action="<%=basePath%>admin/goods_class_list.htm" method="post">
    <table width="100%" border="0" cellspacing="0" cellpadding="0" class="class_table">
      <tr style="background:#2A7AD2;height:30px; color:#FFF">
     	<td width="8%">序号</td>
        <td width="1.5%"></td>
        <td width="30%" align="left">分类名称</td>
        <td width="10%" align="center">最近操作时间</td>
        <td width="15%" align="center">显示</td>
        <td width="8%" align="left">操作</td>
      </tr>
    
    <c:forEach items="${data.rows}" var="list" varStatus="status">
      <tr id="${list.id}">
	    <td align="left" width="1px"><c:if test="${data.currPageNo==1}">${status.count}</c:if><c:if test="${data.currPageNo>1}">${(10*(data.currPageNo-1))+status.count}</c:if>
        </td>
        <td colspan="2" align="center">
        <ul class="addclass">
          <li class="ac1">
            <input name="addorsubtract_${list.id}" id="addorsubtract_${list.id}" type="hidden" value="true" />
            <img src="<%=basePath%>resources/system/manage/blue/images/jian.jpg" cls="jian" level="${list.id}" width="14" height="14" id="${list.id}" onclick="addorsubtract(this,${list.id});" style="cursor:pointer;"/> </li>
          <li class="ac2"><span class="num">
            <input type="text" name="$!obj.sequence" id=""  value="${list.sortOrder}"  onblur="ajax_update('${list.id}','sequence',this)" title="可编辑"/>
          </span></li>
          <li class="ac3"><span class="classies">
            <input type="text" name="${list.id}" id="${list.id}" value="${list.name}" onblur="ajax_update('${list.id}','className',this)" title="可编辑"/>
          	</span> <span class="newclass"><a href="<%=basePath%>admin/category/goods_class_add.htm?pid=${list.id}">新增下级</a></span></li>
        </ul>
        </td>
        <td align="center"><fmt:formatDate value="${list.updated}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
        <td align="center"><img  src="<%=basePath%>resources/system/manage/blue/images/${list.isDisplay==1?'true.png':'false.png'}" width="21" height="23" onclick="ajax_update('${list.id}','display',this)" style="cursor:pointer;" title="可编辑"/></td>
        <td align="left" class="ac8"><a href="<%=basePath%>admin/category/goods_class_edit.htm?id=${list.id}">编辑</a>|<a href="javascript:void(0);" onclick="if(confirm('删除分类会同时删除该分类的所有下级，是否继续?'))window.location.href='<%=basePath%>admin/category/goods_class_del.htm?mulitId=${list.id}'">删除</a></td>
      </tr>
    </c:forEach>
       	<tr style="background:#F2F2F2; height:30px;">
       		 <td colspan="9">
       		 		<div class="fenye3"></div>
          	</td>
     	</tr>
    </table>
         <div class="fenye">
     <a href="<%=basePath%>admin/category/goods_class_list.htm?currentPage=1">首页</a>
	 
	 <c:if test="${data.currPageNo > 1}">
			 <a href="<%=basePath%>admin/category/goods_class_list.htm?currentPage=${data.currPageNo-1}">上一页</a>
	 </c:if>
	 
	 <c:forEach var="i"  begin="${data.firstPage}" end="${data.lastPage>8?data.firstPage+7:data.lastPage}" step="1" >
			<a class="${data.currPageNo==i?'this':''}" href="<%=basePath%>admin/category/goods_class_list.htm?currentPage=${i}">${i}</a>
	 </c:forEach>
	 	<c:if test="${data.currPageNo!=data.lastPage}">
			<a href="<%=basePath%>admin/category/goods_class_list.htm?currentPage=${data.currPageNo+1}">下一页</a>
	 	</c:if>
		<a href="<%=basePath%>admin/category/goods_class_list.htm?currentPage=${data.lastPage}">末页</a>
   	</div>
   </FORM>
  </div>  
</div>
</body>
</html>