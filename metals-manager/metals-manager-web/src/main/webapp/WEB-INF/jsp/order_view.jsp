<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   
 <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
 
 <%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
 <%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html style="overflow-x:auto;overflow-y:auto;">
<head>
<title></title>
<link href="<%=basePath%>resources/system/manage/blue/template.css"  rel="stylesheet" type="text/css"/>
</head>
<body>
<div class="cont">
  <div class="orderdetail">
    <div class="orderh">订单状态</div>
    <div class="orderul">
      <ul>
        <li><span class="ordertitle">订单号:</span><span>${order.id}</span></li>
        <li>
        	<span class="ordertitle"> 订单状态:</span>
        		<c:if test="${order.status==1}">
        				<span>待处理</span>
        		</c:if>
        		<c:if test="${order.status==2}">
        				<span>配货中</span>
        		</c:if>
        		<c:if test="${order.status==3}">
        				<span>送货中</span>
        		</c:if>
        		<c:if test="${order.status==4}">
        				<span>已收货</span>
        		</c:if>
        </li>
         <li><span class="ordertitle">运费:</span><span>￥${order.postFee}</span></li>
        <li><span class="ordertitle">订单总额:</span><span><strong class="orange" style="padding-right:10px;">￥${order.payment}</strong></span></li>
      </ul>
    </div>
    <div class="orderh">订单详情</div>
    <div class="orderhh">订单信息</div>
    <div class="orderul">
      <ul>
        <li><span class="ordertitle">公司名称:</span><span>${order.uCompany}</span></li>
        <li><span class="ordertitle">支付方式:</span><span>微信支付</span></li>
        <li><span class="ordertitle">下单时间:</span><span><fmt:formatDate value="${order.createTime}" pattern="yyyy-MM-dd HH:mm:ss"/></span></li>
      </ul>
    </div>
    <div class="orderhhh">收货人及发货信息</div>
    <div class="orderul">
      <ul>
        <li><span class="ordertitle">收货人姓名:</span><span>${address.consigneename}</span></li>
        <li><span class="ordertitle">所在地区:</span><span>${address.region} </span></li>
        <li><span class="ordertitle">详细地址:</span><span>${address.address}</span></li>
        <li><span class="ordertitle">电话号码:</span><span>${address.tel}</span></li>
        <li><span class="ordertitle">配送方式:</span><span></span></li>
      </ul>
    </div>
    <div class="orderhhh">商品信息</div>
    <div class="ordetable">
      <table width="90%" border="0" cellspacing="0" cellpadding="0" class="orde_table">
        <tr style="border-bottom:1px dotted #CCEAF4">
          <td width="20%">&nbsp;</td>
          <td width="50%"><strong>商品信息</strong></td>
          <td width="10%"><strong>商品规格</strong></td>
          <td width="10%"><strong>单价</strong></td>
          <td width="10%"><strong>数量</strong></td>
        </tr>
        <c:forEach items="${orderItem}" var="orderItem">
        <tr style="border-bottom:1px dotted #CCEAF4"> 
          <td><img src="<%=basePath%>${orderItem.picPath}" width="45" height="45" /></td>
          <td><a href="javascript:void(0)" target="_blank" class="blue">${orderItem.title}</a> 
          </td>
          <td>
            <li class="hui2">${orderItem.spec}</li>
            </td>
          <td><strong class="orange">¥</strong><strong style="color:#F90">${orderItem.price}</strong></td>
          <td>${orderItem.num}</td>
        </tr>
        </c:forEach>
      </table>
    </div>
    <div class="orderhhh">物流信息</div>
    <div class="orderul_record">
      <ul>
          <li><strong style="color:#F90"><fmt:formatDate value="${order.createTime}" pattern="yyyy-MM-dd hh:mm:ss"/>
           &nbsp; &nbsp; &nbsp; ${order.uName} 创建订单</strong></li>
           
           <c:if test="${order.distributionTime!=null}">
             <li><strong style="color:#F90"><fmt:formatDate value="${order.distributionTime}" pattern="yyyy-MM-dd hh:mm:ss"/>
          		 &nbsp; &nbsp; &nbsp; 订单更改状态为：配货中</strong></li>
           </c:if>
           
            <c:if test="${order.deliverTime!=null}">
             <li><strong style="color:#F90"><fmt:formatDate value="${order.deliverTime}" pattern="yyyy-MM-dd hh:mm:ss"/>
          		 &nbsp; &nbsp; &nbsp; 订单更改状态为：送货中</strong></li>
           </c:if>
           
            <c:if test="${order.receiveTime!=null}">
             <li><strong style="color:#F90"><fmt:formatDate value="${order.receiveTime}" pattern="yyyy-MM-dd hh:mm:ss"/>
          		 &nbsp; &nbsp; &nbsp; 订单更改状态为：已收货</strong></li>
           </c:if>
      </ul>
    </div>
  </div>
  <div class="submit">
   			 <input name="go" type="button" value="返回列表" onclick="javascript:history.back()" />
   			 <div  style="display: inline-block;float: right;">
        		<c:if test="${order.status<=1}">
        			 <input name="go1"  type="button" value="配货中" onclick="location.href='<%=basePath%>admin/order/order_updateState?state=2&id=${order.id}'" />
        		</c:if>
        		<c:if test="${order.status<=2}">
        		   	 <input name="go2"  type="button" value="待发货" onclick="location.href='<%=basePath%>admin/order/order_updateState?state=3&id=${order.id}'" />
        		</c:if>
        		<c:if test="${order.status<=3}">
        			 <input name="go3"  type="button" value="已接收" onclick="location.href='<%=basePath%>admin/order/order_updateState?state=4&id=${order.id}'" />
        		</c:if>
				 <input name="go4"  type="button" value="打印订单" onclick="window.open('<%=basePath%>admin/order/printform.htm?orderId=${order.id}')"   />
   				  &nbsp;&nbsp;&nbsp;
   				  &nbsp;&nbsp;&nbsp;
   				  &nbsp;&nbsp;&nbsp;
   				  &nbsp;&nbsp;&nbsp;
   				  &nbsp;&nbsp;&nbsp;
   				  &nbsp;&nbsp;&nbsp;
   			 </div>
  </div>
</div>
</body>
</html>
