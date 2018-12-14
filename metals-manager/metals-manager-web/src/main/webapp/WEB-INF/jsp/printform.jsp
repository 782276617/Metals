<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
    
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>订单打印</title>
  <link rel="stylesheet" href="<%=basePath%>resources/layui/css/layui.css">
<style type="text/css">
#table1 td{
  text-align: center;
}
</style>
</head>
<body id="sdxxx">
	<div  align="center">
		<table   width="100%">
			<tr><img alt="支付二维码" width="75px" height="75px" src="<%=basePath%>resources/home/style/images/10.jpg">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<h2 style="display: inline;">中山市福乾五金机电有限公司</h2><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;单号：SA${order.id}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span></tr>
			<tr>
			</tr>
			<tr>
				<td align="center" colspan="3">中三市三乡镇平南雅居乐森岚商铺1区12卡-14卡&nbsp;&nbsp;电话：0760-86688228&nbsp;&nbsp;手机：18928133923</td>
			</tr>
			<tr>
				<td>客户：${order.uCompany}<input type="hidden" name="Customer" value="${order.uCompany}" placeholder="请输入客户名称"/></td>			
				<td align="right">&nbsp;&nbsp;&nbsp;&nbsp;业务员：<input type="text" name="Salesman" placeholder="请输入业务员名称" /></td>		
				<td align="right">&nbsp;&nbsp;&nbsp;日期：<fmt:formatDate value="<%=new Date()%>" pattern="yyyy-MM-dd"/></td>			
			</tr>
		</table>
		<table id="table1" border="1" cellspacing="0" width="100%" cellpadding="0" bordercolor="896FB9" >
			<tr>
				<td  width="5%">序号</td>
				<td  width="15%">商品编号</td>
				<td  width="30%">商品名称</td>
				<td  width="8%">单位</td>
				<td  width="8%">数量</td>
				<td  width="8%">单价</td>
				<td  width="8%">金额</td>
				<td  width="8%">折扣</td>
				<td  width="15%">备注</td>
			</tr>
			<c:forEach items="${orderItem}" var="orders" varStatus="status">
					<tr>
					    <td>${status.count}</td>
						<td>${orders.goodsId}</td>
						<td >${orders.title}</td>
						<td >${orders.spec}</td>
						<td >${orders.num}</td>
						<td >${orders.price}</td>
						<td >${orders.price*orders.num}</td>
						<td >0%</td>
						<td></td>
					</tr>
			</c:forEach>
			<tr>
			 <td colspan="6" style="text-align: right;">总金额：</td>
			 <td colspan="3">${order.payment}</td>
			</tr>
			<!-- <tr height="80px">
				<td colspan="9"></td>
			</tr> -->
			</table>
			<textarea rows="4" cols="207" style="width: 100%" id="Remarks" placeholder="备注：(可填)"></textarea>
	
			<table  width="100%">
			<tr>
			 <td width="25%" >制单人：管理员</td>
			 <td colspan="2" align="left" >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;仓管：</td>
			 <td >收货人：</td>
			</tr>
			<tr>
			 <td style="text-align: left;font-size: 12px">白联：收款</td>
			 <td style="text-align: left;font-size: 12px">红联：客户</td>
			 <td style="text-align: left;font-size: 12px">黄联：仓管</td>
			</tr>
			</table>
	</div>
	<br>
	<br>
	<div align="right">
		 <input name="go4" class="layui-btn layui-btn-sm"  type="button" value="打印订单" onclick="clickEvent(${order.id})"   />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	</div>
</body>
<script src="<%=basePath%>resources/js/jquery-1.8.3.min.js"></script>
<script type="text/javascript">
		function clickEvent(id){
			var Customer = $("input[name='Customer']").val();
			var Salesman = $("input[name='Salesman']").val();
			var Remarks = $("#Remarks").val();
			var url = "<%=basePath%>admin/order/print.htm?orderId="+id+"&Customer="+Customer+"&Salesman="+Salesman+"&Remarks="+Remarks
			//window.open(url);
			location.href=url;
		}
</script>
</html>