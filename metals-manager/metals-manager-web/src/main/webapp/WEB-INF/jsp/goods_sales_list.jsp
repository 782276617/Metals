<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"  %>
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
<script src="<%=basePath%>resources/js/jquery.poshytip.min.js"></script>
<script>

function ajax_update(id,fieldName,obj){
             	jQuery.ajax({
   		   		  type:'POST',
	              url:'<%=basePath%>admin/goods/goods_ajax.htm',
				  data:{"id":id,"fieldName":fieldName},
				  success:function(data){
					 	data = JSON.parse(data); 
		           	  if(fieldName=="store_recommend"){
		            	 	jQuery(obj).attr("src","<%=basePath%>resources/system/manage/blue/images/"+data.data+".png");
		           	  }else if(fieldName=="goods_status"){
							 jQuery(obj.parentNode.parentNode).remove();
					  }
             	 }
	    });
}

$(function(){
	
	 setTimeout(function(){
		 	$("#goods_class option[value='${goods_class}']").prop('selected',true);
		 },50);
})
</script>
</head>
<body scroll="yes">
<div class="cont">
  <h1 class="seth1">商品管理</h1>
  <div class="settab"> 
	<span class="tab-one"></span> <span class="tabs"> 
	<a href="<%=basePath%>admin/goods/goods_list.htm" class="this">所有商品</a>
	&nbsp;| &nbsp;<a href="<%=basePath%>admin/goods/goods_add.htm" class="this">添加商品</a>
	</span> 
	<span class="tab-two"></span>	</div>
	<form name="queryForm" id="queryForm" action="<%=basePath%>admin/goods/goods_sales_list.htm" method="post">
    <div class="allmem_search">
      <ul>
        <li> <span>商品名称</span> <span class="allmen size4">
        
          <input name="goods_name" type="text"  value="${goods_name}" id="goods_name" />
          </span> 
          <span>类别</span>
          <select name="goods_class" id="goods_class">
          <option value="">所有分类</option>
           ${categoryHtml}
          </select>
          <span>特别推荐</span>
          <select name="store_recommend" id="store_recommend" >
            <option value="">是否特别推荐</option>
            <option value="true"  ${store_recommend=="true"?"selected='selecte'":""}>是</option>
            <option value="false" ${store_recommend=="false"?"selected='selecte'":""}>否</option>
</select>
          <span class="btn_search">
          <input name="" type="submit"  value="搜索" style="cursor:pointer;"/>
        </span> </li>
      </ul>
    </div>
  </form>
  <form name="ListForm" id="ListForm" action="" method="post">
    <div class="brandtable">
      <table width="100%" border="0" cellspacing="0" cellpadding="0" class="brand_table">
        <tr style="background:#2A7AD2;height:30px; color:#FFF">
          <td width="7%">排行</td>
          <td width="22%">商品名称</td>
          <td width="10%">根分类</td>
          <td width="10%">所属分类</td>
          <td width="7%">商品状态</td>
          <td width="7%" align="center">库存量</td>
          <td width="7%" align="center">下单次数</td>
          <td width="7%" align="center">查看次数</td>
          <td  align="center">操作</td>
        </tr>
      	<c:forEach items="${data}" var="list" varStatus="status">
        <tr>
         <td align="left" style="font-size: 22px">
                  <c:if test="${curr==1}">
          			${status.count}
          </c:if>
          
          <c:if test="${curr>1}">
	          ${(10*(curr-1))+status.count}
          </c:if>
          
          </td>
          <td>
          <label>
            ${list.name}
          </label>
          </td>
          <td>${list.leafName}</td>
          <td>${list.parentName}</td>
          <td>
          	<c:if test="${list.status==1}">
          		正常
          	</c:if>
          	<c:if test="${list.status==2}">
          		下架
          	</c:if>
          	<c:if test="${list.status==3}">
          		已删除
          	</c:if>
          	
          </td>
          <c:if test="${list.stockn<=0}">
	          <td align="center" style="color: red;">无库存</td>
          </c:if>
          <c:if test="${list.stockn>0}">
	          <td align="center">${list.stockn}</td>
          </c:if>
          <td align="center">${list.ordern}</td>
          <td align="center">${list.clickn}</td>
          <td class="ac8" align="center"><a href="<%=basePath%>admin/goods/goods_edit.htm?id=${list.id}" >编辑</a><a href="<%=basePath%>home/goods_product.htm?goodsId=${list.id}" target="_blank">查看</a></td>
        </tr>
      	</c:forEach>
		 <tr style="background:#F2F2F2; height:30px;">
       		 <td colspan="11">
       		 		<div class="fenye3"></div>
          	</td>
     	 </tr>
    </table>
	  <div class="fenye" align="right">
	   <input name="currentPage" type="hidden" id="currentPage" value="${curr}" />
	 
	 <a href="<%=basePath%>admin/goods/goods_sales_list.htm?currentPage=1&goods_name=${goods_name}&goods_class=${goods_class}&store_recommend=${store_recommend}">首页</a>
	 
	 <c:if test="${curr > 1}">
			 <a href="<%=basePath%>admin/goods/goods_sales_list.htm?currentPage=${curr-1}&goods_name=${goods_name}&goods_class=${goods_class}&store_recommend=${store_recommend}">上一页</a>
	 </c:if>
	 
	 <c:forEach var="i"  begin="${firstPage}" end="${lastPage>8?firstPage+7:lastPage}"  step="1" >
			<a class="${curr==i?'this':''}" href="<%=basePath%>admin/goods/goods_sales_list.htm?currentPage=${i}&goods_name=${goods_name}&goods_class=${goods_class}&store_recommend=${store_recommend}">${i}</a>
	 </c:forEach>
	 	<c:if test="${curr!=lastPage}">
			<a href="<%=basePath%>admin/goods/goods_sales_list.htm?currentPage=${curr+1}&goods_name=${goods_name}&goods_class=${goods_class}&store_recommend=${store_recommend}">下一页</a>
	 	</c:if>
		<a href="<%=basePath%>admin/goods/goods_sales_list.htm?currentPage=${lastPage}&goods_name=${goods_name}&goods_class=${goods_class}&store_recommend=${store_recommend}">末页</a>
	   </div>
    </div>
  </form>
</div>
</body>
</html>