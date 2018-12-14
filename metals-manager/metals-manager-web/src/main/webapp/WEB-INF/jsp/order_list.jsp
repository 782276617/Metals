<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
<link href="<%=basePath%>resources/system/manage/blue/template.css"  rel="stylesheet" type="text/css"/>
<link  href="<%=basePath%>resources/css/jquery-ui-1.8.22.custom.css" type=text/css rel=stylesheet>
<script src="<%=basePath%>resources/js/jquery-1.8.3.min.js"></script>
<script src="<%=basePath%>resources/js/jquery.validate.min.js"></script>
<script src="<%=basePath%>resources/js/jquery.shop.common.js"></script>
<script src="<%=basePath%>resources/js/jquery.poshytip.min.js"></script>
<script src="<%=basePath%>resources/js/jquery-ui-1.8.21.js"></script>
<script src="<%=basePath%>resources/js/jquery.zh.cn.js"></script>
<script src="<%=basePath%>resources/js/provincesData.js"></script>
<script src="<%=basePath%>resources/js/jquery.provincesCity.js"></script>

<script>
jQuery(document).ready(function(){
  jQuery('#beginTime').datepicker({
	  dateFormat:"yy-mm-dd",
	  changeMonth: true,
	  changeYear: true
  });
  jQuery('#endTime').datepicker({
	  dateFormat:"yy-mm-dd",
	  changeMonth: true,
	  changeYear: true
  });
  //
});
</script>
</head>
<body>

<div class="cont">
  <h1 class="seth1">订单管理</h1>
  <div class="settab"><span class="tab-one"></span> <span class="tabs"> <a href="javascript:void(0);" class="this">所有订单</a></span> <span class="tab-two"></span></div>
  <form action="<%=basePath%>admin/order/order_list.htm" method="post" id="queryForm" >
  <div class="orders">
    <ul>
      <li> 
     	<div id="cotys">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;地区</div>
      </li>
      <li> <span>订单状态</span><span class="ordersel">
        <select name="order_status" id="order_status">
          <option value="" >所有订单</option>
          <option value="1" ${order_status==1?"selected='selected'":""}>待处理</option>
          <option value="2" ${order_status==2?"selected='selected'":""}>配货中</option>
          <option value="3" ${order_status==3?"selected='selected'":""}>送货中</option>
          <option value="4" ${order_status==4?"selected='selected'":""}>已收货</option>
        </select>
      </span><span>类型</span><span>
        <select name="type" id="type">
          <option value="buyer" ${type=="buyer"?"selected='selected'":""} >买家名称</option>
          <option value="order" ${type=="order"?"selected='selected'":""} >订单号</option>
        </select>
        </span> <span class="order_input size1">
        <input name="type_data" value="${type_data}" type="text" id="type_data" />
      </span> 
      </li>
      <li> <span>下单时间</span><span class="order_input size2">
        <input name="beginTime" type="text" value="${beginTime}" id="beginTime"  readonly="readonly"/>
        </span><span>—</span><span class="order_input size2">
        <input name="endTime" type="text"  value="${endTime}" id="endTime" readonly="readonly" />
        </span> <span>订单金额</span><span class="order_input size2">
        <input name="begin_price" type="text" value="${begin_price}" id="begin_price" />
        </span><span>—</span><span class="order_input size2">
        <input name="end_price" type="text" value="${end_price}" id="end_price" />
        </span> <span class="btn_search">
        <input name="" type="submit"  value="搜索" style="cursor:pointer;"/>
      </span> </li>
    </ul>
  </div>
  </form>
  <form action="<%=basePath%>admin/order_list.htm" method="post" id="ListForm" >
    <div class="allshop_table">
    <table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr style="background:#2A7AD2; height:30px; color:#FFF">
        <td width="12%">订单号</td>
        <td width="10%">买家名称</td>
         <td width="15%">公司名称</td>
        <td  width="14%">下单时间</td>
        <td  width="12%">订单总额</td>
        <td width="12%">支付方式</td>
        <td width="12%">订单状态</td>
        <td align="center">操作</td>
      </tr>
      <c:forEach items="${data.rows}" var="list" >
      <tr>
        <td>${list.id}</td>
        <td>${list.uName}</td>
        <td>${list.uCompany}</td>
        <td><fmt:formatDate value="${list.createTime}" pattern="yy-MM-dd HH:mm:ss"/></td>
        <td>${list.payment}</td>
 		<td>微信支付 </td>
 		
 		<c:if test="${list.status==1}">
 			<td>待处理</td>
 		</c:if>
 		<c:if test="${list.status==2}">
 			<td>配货中</td>
 		</c:if>
 		<c:if test="${list.status==3}">
 			<td>送货中</td>
 		</c:if>
 		<c:if test="${list.status==4}">
 			<td>已收货</td>
 		</c:if>
        
        <td align="center" class="blue xiahua"><a href="<%=basePath%>admin/order/order_view.htm?id=${list.id}">查看</a></td>
      </tr>
      </c:forEach>
         <tr style="background:#F2F2F2; height:30px;">
        <td colspan="9"><div class="fenye3">
          </div></td>
      </tr>
    </table>
  </div>
  
  <div class="fenye">
     <input name="currentPage" type="hidden" id="currentPage" value="${data.currPageNo}" />
		
	 <a href="<%=basePath%>admin/order/order_list.htm?currentPage=1&province=${province}&city=${city}&area=${area}&order_status=${order_status}&type=${type}&begin_price=${begin_price}&end_price=${end_price}&type_data=${type_data}&beginTime=${beginTime}&endTime=${endTime}">首页</a>
	 
	 <c:if test="${data.currPageNo > 1}">
			 <a href="<%=basePath%>admin/order/order_list.htm?currentPage=${data.currPageNo-1}&province=${province}&city=${city}&area=${area}&order_status=${order_status}&type=${type}&begin_price=${begin_price}&end_price=${end_price}&type_data=${type_data}&beginTime=${beginTime}&endTime=${endTime}">上一页</a>
	 </c:if>
	 
	 <c:forEach var="i" begin="${data.firstPage}" end="${data.lastPage>8?data.firstPage+7:data.lastPage}" step="1" >
			<a class="${data.currPageNo==i?'this':''}" href="<%=basePath%>admin/order/order_list.htm?currentPage=${i}&province=${province}&city=${city}&area=${area}&order_status=${order_status}&type=${type}&begin_price=${begin_price}&end_price=${end_price}&type_data=${type_data}&beginTime=${beginTime}&endTime=${endTime}">${i}</a>
	 </c:forEach>
	 	<c:if test="${data.currPageNo!=data.lastPage}">
			<a href="<%=basePath%>admin/order/order_list.htm?currentPage=${data.currPageNo+1}&province=${province}&city=${city}&area=${area}&order_status=${order_status}&type=${type}&begin_price=${begin_price}&end_price=${end_price}&type_data=${type_data}&beginTime=${beginTime}&endTime=${endTime}">下一页</a>
	 	</c:if>
		<a href="<%=basePath%>admin/order/order_list.htm?currentPage=${data.lastPage}&province=${province}&city=${city}&area=${area}&order_status=${order_status}&type=${type}&begin_price=${begin_price}&end_price=${end_price}&type_data=${type_data}&beginTime=${beginTime}&endTime=${endTime}">末页</a>    
    </div>
  </form>
</div>
</body>
<script type="text/javascript">

$(function(){
	  $("#cotys").ProvinceCity();
	  
	  jsSelectItemByValue(document.getElementById("province"),"province","${province}");
	  jsSelectItemByValue(document.getElementById("city"),"city","${city}");
	  jsSelectItemByValue(document.getElementById("area"),"area","${area}");
	  
	
});

var indexs = "";
function jsSelectItemByValue(objSelect,type,objItemText) {
	//分别获取3个下拉框
    for(var i=0;i<objSelect.options.length;i++) {
        if(objSelect.options[i].value == objItemText) {
            objSelect.options[i].selected = true;
            if("province"==type){
            	indexs = i;
	            $.each( GT[i-1],function(index,data){
					$("#city").append("<option value='"+data+"'>"+data+"</option>");
				});
            }else if("city"==type){
            	$.each( GC[indexs-1][i-1] , function(index,data){
        			$("#area").append("<option value='"+data+"'>"+data+"</option>");
        		})
            }
            break;
        }
    }
}
</script>
</html>