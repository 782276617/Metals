<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
    
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
<title>Insert title here</title>
  <link rel="stylesheet" href="<%=basePath%>resources/layui/css/layui.css">
<style type="text/css">
#table1 td{
  text-align: center;
}
</style>
</head>
<body>
	<div  align="center">
		<table  width="100%">
			<tr>
				<td align="center" colspan="8">
					<div style="display: flex; flex-direction:row;justify-content:space-around;">
					<div  >
						<img alt="支付二维码" width="75px" height="75px" src="<%=basePath%>resources/home/style/images/10.jpg">
					</div>
					<div  >
						<h2 style="display: inline;">中山市福乾五金机电有限公司</h2>
					</div>
					<div>
						<span>
							单号：SA${order.id}
						</span>
					</div>
					</div>
				</td>
			</tr>
			<tr>
			</tr>
			<tr>
				<td align="center" colspan="3">中三市三乡镇平南雅居乐森岚商铺1区12卡-14卡&nbsp;&nbsp;电话：0760-86688228&nbsp;&nbsp;手机：18928133923</td>
			</tr>
			<tr ><td colspan="3" height="12px"></td></tr>
			<tr>
				<td>客户：${Customer}</td>			
				<td align="right">&nbsp;&nbsp;&nbsp;&nbsp;业务员：${Salesman}</td>		
				<td align="right">&nbsp;&nbsp;&nbsp;日期：<fmt:formatDate value="<%=new Date()%>" pattern="yyyy-MM-dd"/>  </td>			
			</tr>
		</table>
		<div style="height: 280px;">
		<table id="table1" border="1" cellspacing="0" height="250px" width="100%"  cellpadding="0" bordercolor="896FB9" >
			<tr>
				<td  width="5%">序号</td>
				<td  width="7%">商品编号</td>
				<td  width="40%">商品名称</td>
				<td  width="5%">单位</td>
				<td  width="5%">数量</td>
				<td  width="8%">单价</td>
				<td  width="8%">金额</td>
				<td  width="8%">备注</td>
			</tr>
			<c:forEach  items="${orderItem}" var="orders"  varStatus="status">
					<c:if test="${status.count<=8}">
						<tr>
						    <td>${status.count}</td>
							<td>${orders.goodsId}</td>
							<td >${orders.title}</td>
							<td >${orders.spec}</td>
							<td >${orders.num}</td>
							<td >${orders.price}</td>
							<td >${orders.price*orders.num}</td>
							<td></td>
						</tr>
					</c:if>
			</c:forEach>
			<tr>
			 <td colspan="6" style="text-align: right;">总金额：</td>
			 <td colspan="3">${order.payment}</td>
			</tr>
			<!-- <tr height="80px">
				<td colspan="9"></td>
			</tr> -->
			</table>
			<p align="left">备注：${Remarks}</p>
		</div>
		
			<table  width="100%">
			<tr>
			 <td width="25%" >&nbsp;制单人：管理员</td>
			 <td colspan="2" align="center" >仓管：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
			 <td >收货人：</td>
			</tr>
			<tr>
			 <td style="text-align: left;font-size: 12px">*白联：收款</td>
			 <td style="text-align: left;font-size: 12px">红联：客户</td>
			 <td style="text-align: left;font-size: 12px">黄联：仓管</td>
			</tr>
			</table>
<br/>
<br/>
<br/>
<c:if test="${fn:length(orderItem)>8}">
		<table   width="100%" >
			<tr>
				<td align="center" colspan="8">
					<div style="display: flex; flex-direction:row;justify-content:space-around;">
					<div  >
						<img alt="支付二维码" width="75px" height="75px" src="<%=basePath%>resources/home/style/images/10.jpg">
					</div>
					<div  >
						<h2 style="display: inline;">中山市福乾五金机电有限公司</h2>
					</div>
					<div>
						<span>
							单号：SA${order.id}
						</span>
					</div>
					</div>
				</td>
			<tr>
			</tr>
			<tr>
				<td align="center" colspan="3">中三市三乡镇平南雅居乐森岚商铺1区12卡-14卡&nbsp;&nbsp;电话：0760-86688228&nbsp;&nbsp;手机：18928133923</td>
			</tr>
			<tr ><td colspan="3" height="12px"></td></tr>
			<tr>
				<td>客户：${Customer}</td>			
				<td align="right">&nbsp;&nbsp;&nbsp;&nbsp;业务员：${Salesman}</td>		
				<td align="right">&nbsp;&nbsp;&nbsp;日期：<fmt:formatDate value="<%=new Date()%>" pattern="yyyy-MM-dd"/>  </td>			
			</tr>
		</table>
		<div style="height: 280px;">
		<table id="table1" border="1" cellspacing="0" height="250px" width="100%"  cellpadding="0" bordercolor="896FB9" >
			<tr>
				<td  width="5%">序号</td>
				<td  width="7%">商品编号</td>
				<td  width="40%">商品名称</td>
				<td  width="5%">单位</td>
				<td  width="5%">数量</td>
				<td  width="8%">单价</td>
				<td  width="8%">金额</td>
				<td  width="8%">备注</td>
			</tr>
			<c:forEach var="i" begin="8"  end="${fn:length(orderItem)-1}"  varStatus="status">
				<c:if test="${status.count<=8}">
					<tr>
					    <td>
					    <c:if test="${status.count==1}">
			          			9
			          	</c:if>
					   <c:if test="${status.count>1}">
				          ${(8*(2-1))+status.count}
			           </c:if>
					    
					    </td>
						<td>${orderItem[i].goodsId}</td>
						<td >${orderItem[i].title}</td>
						<td >${orderItem[i].spec}</td>
						<td >${orderItem[i].num}</td>
						<td >${orderItem[i].price}</td>
						<td >${orderItem[i].price*orderItem[i].num}</td>
						<td></td>
					</tr>
				</c:if>
			</c:forEach>
			<tr>
			 <td colspan="6" style="text-align: right;">总金额：</td>
			 <td colspan="3">${order.payment}</td>
			</tr>
			<!-- <tr height="80px">
				<td colspan="9"></td>
			</tr> -->
			</table>
			<p align="left">备注：${Remarks}</p>
		</div>
		
			<table  width="100%">
			<tr>
			 <td width="25%" >&nbsp;制单人：管理员</td>
			 <td colspan="2" align="center" >仓管：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
			 <td >收货人：</td>
			</tr>
			<tr>
			 <td style="text-align: left;font-size: 12px">*白联：收款</td>
			 <td style="text-align: left;font-size: 12px">红联：客户</td>
			 <td style="text-align: left;font-size: 12px">黄联：仓管</td>
			</tr>
			</table>
</c:if>



<br/>
<br/>
<br/>
<c:if test="${fn:length(orderItem)>16}">
		<table   width="100%">
			<tr>
				<td align="center" colspan="8">
					<div style="display: flex; flex-direction:row;justify-content:space-around;">
					<div  >
						<img alt="支付二维码" width="75px" height="75px" src="<%=basePath%>resources/home/style/images/10.jpg">
					</div>
					<div  >
						<h2 style="display: inline;">中山市福乾五金机电有限公司</h2>
					</div>
					<div>
						<span>
							单号：SA${order.id}
						</span>
					</div>
					</div>
				</td>
			<tr>
			</tr>
			<tr>
				<td align="center" colspan="3">中三市三乡镇平南雅居乐森岚商铺1区12卡-14卡&nbsp;&nbsp;电话：0760-86688228&nbsp;&nbsp;手机：18928133923</td>
			</tr>
			<tr ><td colspan="3" height="12px"></td></tr>
			<tr>
				<td>客户：${Customer}</td>			
				<td align="right">&nbsp;&nbsp;&nbsp;&nbsp;业务员：${Salesman}</td>		
				<td align="right">&nbsp;&nbsp;&nbsp;日期：<fmt:formatDate value="<%=new Date()%>" pattern="yyyy-MM-dd"/>  </td>			
			</tr>
		</table>
		<div style="height: 280px;">
		<table id="table1" border="1" cellspacing="0" width="100%"  height="250px" cellpadding="0" bordercolor="896FB9" >
			<tr>
				<td  width="5%">序号</td>
				<td  width="7%">商品编号</td>
				<td  width="40%">商品名称</td>
				<td  width="5%">单位</td>
				<td  width="5%">数量</td>
				<td  width="8%">单价</td>
				<td  width="8%">金额</td>
				<td  width="8%">备注</td>
			</tr>
			<c:forEach var="i" begin="17"  end="${fn:length(orderItem)-1}"  varStatus="status">
				<c:if test="${status.count<=8}">
					<tr>
					    <td>${status.count}</td>
						<td>${orderItem[i].goodsId}</td>
						<td >${orderItem[i].title}</td>
						<td >${orderItem[i].spec}</td>
						<td >${orderItem[i].num}</td>
						<td >${orderItem[i].price}</td>
						<td >${orderItem[i].price*orderItem[i].num}</td>
						<td></td>
					</tr>
				</c:if>
			</c:forEach>
			<tr>
			 <td colspan="6" style="text-align: right;">总金额：</td>
			 <td colspan="3">${order.payment}</td>
			</tr>
			<!-- <tr height="80px">
				<td colspan="9"></td>
			</tr> -->
			</table>
			<p align="left">备注：${Remarks}</p>
		</div>
		
			<table  width="100%">
			<tr>
			 <td width="25%" >&nbsp;制单人：管理员</td>
			 <td colspan="2" align="center" >仓管：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
			 <td >收货人：</td>
			</tr>
			<tr>
			 <td style="text-align: left;font-size: 12px">*白联：收款</td>
			 <td style="text-align: left;font-size: 12px">红联：客户</td>
			 <td style="text-align: left;font-size: 12px">黄联：仓管</td>
			</tr>
			</table>
</c:if>


<br/>
<br/>
<br/>
<c:if test="${fn:length(orderItem)>24}">
		<table   width="100%">
			<tr>
				<td align="center" colspan="8">
					<div style="display: flex; flex-direction:row;justify-content:space-around;">
					<div  >
						<img alt="支付二维码" width="75px" height="75px" src="<%=basePath%>resources/home/style/images/10.jpg">
					</div>
					<div  >
						<h2 style="display: inline;">中山市福乾五金机电有限公司</h2>
					</div>
					<div>
						<span>
							单号：SA${order.id}
						</span>
					</div>
					</div>
				</td>
			<tr>
			</tr>
			<tr>
				<td align="center" colspan="3">中三市三乡镇平南雅居乐森岚商铺1区12卡-14卡&nbsp;&nbsp;电话：0760-86688228&nbsp;&nbsp;手机：18928133923</td>
			</tr>
			<tr ><td colspan="3" height="12px"></td></tr>
			<tr>
				<td>客户：${Customer}</td>			
				<td align="right">&nbsp;&nbsp;&nbsp;&nbsp;业务员：${Salesman}</td>		
				<td align="right">&nbsp;&nbsp;&nbsp;日期：<fmt:formatDate value="<%=new Date()%>" pattern="yyyy-MM-dd"/>  </td>			
			</tr>
		</table>
		<div style="height: 280px;">
		<table id="table1" border="1" cellspacing="0" width="100%" height="250px"  cellpadding="0" bordercolor="896FB9" >
			<tr>
				<td  width="5%">序号</td>
				<td  width="7%">商品编号</td>
				<td  width="40%">商品名称</td>
				<td  width="5%">单位</td>
				<td  width="5%">数量</td>
				<td  width="8%">单价</td>
				<td  width="8%">金额</td>
				<td  width="8%">备注</td>
			</tr>
			<c:forEach var="i" begin="25"  end="${fn:length(orderItem)-1}"  varStatus="status">
				<c:if test="${status.count<=8}">
					<tr>
					    <td>${status.count}</td>
						<td>${orderItem[i].goodsId}</td>
						<td >${orderItem[i].title}</td>
						<td >${orderItem[i].spec}</td>
						<td >${orderItem[i].num}</td>
						<td >${orderItem[i].price}</td>
						<td >${orderItem[i].price*orderItem[i].num}</td>
						<td></td>
					</tr>
				</c:if>
			</c:forEach>
			<tr>
			 <td colspan="6" style="text-align: right;">总金额：</td>
			 <td colspan="3">${order.payment}</td>
			</tr>
			<!-- <tr height="80px">
				<td colspan="9"></td>
			</tr> -->
			</table>
			<p align="left">备注：${Remarks}</p>
		</div>
		
			<table  width="100%">
			<tr>
			 <td width="25%" >&nbsp;制单人：管理员</td>
			 <td colspan="2" align="center" >仓管：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
			 <td >收货人：</td>
			</tr>
			<tr>
			 <td style="text-align: left;font-size: 12px">*白联：收款</td>
			 <td style="text-align: left;font-size: 12px">红联：客户</td>
			 <td style="text-align: left;font-size: 12px">黄联：仓管</td>
			</tr>
			</table>
</c:if>
		</div>
</body>
</html>