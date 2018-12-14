<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<%@taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no, minimal-ui"/>
	<meta name="apple-mobile-web-app-capable" content="yes"/>
	<meta name="apple-mobile-web-app-status-bar-style" content="black"/>
	<meta name="format-detection" content="telephone=no, email=no"/>
	<meta charset="UTF-8">
	<title>购物车</title>
	<link href="<%=basePath%>resources/home/style/css/mui.min.css" rel="stylesheet" />
	<link rel="stylesheet" href="<%=basePath%>resources/home/style/css/core.css">
	<link rel="stylesheet" href="<%=basePath%>resources/home/style/css/icon.css">
	<link rel="stylesheet" href="<%=basePath%>resources/home/style/css/home.css">
	<link rel="icon" type="image/x-icon" href="favicon.ico">
	<link href="iTunesArtwork@2x.png" sizes="114x114" rel="apple-touch-icon-precomposed">
</head>
<body>
<div class="dicsa">
	<header class="aui-header-default aui-header-fixed ">
		<a href="javascript:history.back(-1)" class="aui-header-item">
			<i class="aui-icon aui-icon-back"></i>
		</a>
		<div class="aui-header-center aui-header-center-clear" style="padding-right: 70px;">
			<div class="aui-header-center-logo">
				<div class="">填写订单</div>
			</div>
		</div>
	</header>
	<section class="aui-address-content">
		<div class="aui-address-box">
			<div class="aui-address-box-list">
						<c:if test="${address!=null}">
							<a href="<%=basePath%>cart/my_addres.htm" class="aui-address-box-default">
							    <ul>
										<li>
											<strong>${address.consigneename} ${address.tel}</strong>
											<span class="aui-tag aui-tag-default" id="aui-default">默认</span>
											<input type="hidden" value=" ${address.id}" id="addressId">
										</li>
										<li>
											<i class="aui-icon aui-icon-address"></i>
											${address.region}${address.address}
										</li>
					     	  </ul>
						</a>
						</c:if>
						<c:if test="${address==null}">
							<a href="javascript:void(0)" class="aui-address-box-default">
								<ul>
									<li style="text-align: center;" onclick="JumpUrl('${huser}');">
										<span class="aui-tag aui-tag-default" style="font-size: 15px;">新增收货地址</span>
									</li>
							   </ul>
					        </a>
					   </c:if>
				
			</div>
		</div>
		<c:set var="total" value="0" scope="page"></c:set>
		<c:forEach items="${order}" var="order">
		<input type="hidden" value="${order.id}" name="cartId"/>
		<div class="aui-dri"></div>
		<div class="aui-list-product-float-item">
			<a href="javascript:;" class="aui-list-product-fl-item">
				<div class="aui-list-product-fl-img">
					<img src="<%=basePath%>${order.goodsPic}" alt="">
				</div>
				<div class="aui-list-product-fl-text">
					<h3 class="aui-list-product-fl-title">${order.name}</h3>
					<div class="aui-list-product-fl-mes">
						<div>
							<span class="aui-list-product-item-price">
								<em>¥</em>
								${order.price*order.number}    <c:set value="${taotal + (order.price*order.number)}" var="taotal" />
							</span>
							<span class="aui-list-product-item-del-price">
								<!-- ¥495.65 -->
							</span>
						</div>
						<div class="aui-btn-purchase">
							<span>${order.price}x${order.number}</span>
						</div>
					</div>
				</div>
			</a>
		</div>
		</c:forEach>
		<div class="aui-address-well" style="background-color: #fff;">
			<a href="#" class="aui-address-cell">
				<div class="aui-address-cell-bd" >支持配送</div>
				<div class="aui-address-cell-ft">
					<p style="font-size: 12px;color: #222222;-webkit-font-smoothing: antialiased;font-family: arial, sans-serif">货到付款</p>
				</div>
			</a>
			<a href="#" class="aui-address-cell  aui-fl-arrow-clear">
				<div class="aui-address-cell-bd">发票</div>
				<div class="aui-address-cell-ft">个人</div>
			</a>
			<div class="aui-dri"></div>
			<a href="#" class="aui-address-cell  aui-fl-arrow-clear">
				<div class="aui-address-cell-bd">
					<h3>商品金额</h3>
				</div>
				<div class="aui-address-cell-ft" >
					<span class="aui-red">￥<c:out value="${taotal}"></c:out></span><br>
				</div>
			</a>
		</div>
		<div class="aui-payment-bar">
			<div class="shop-total">
				<span class="aui-red aui-size">实付款: <em>￥<c:out value="${taotal}"></c:out></em></span>
			</div>
			<a href="javascript:void(0)" class="settlement" onclick="lijixOrder('${address==null?true:false}','${huser}');">提交订单</a>
		</div>
	</section>
	<script src="<%=basePath%>resources/home/js/jquery.min.js"></script>
		<script src="<%=basePath%>resources/home/js/mui.min.js"></script>
</div>
</body>

<script type="text/javascript">
	
	function lijixOrder(vals,user){
		
		if(user=="") {
			  var btn = ['现在登录', '再看看'];
	          mui.confirm('请登录后查看', '提示', btn, function (e) {
	              if (e.index == 0) {
	                  var url = "<%=basePath%>my/login.htm";
	                  window.location.href = url;
	              }
	          });
	          return false;
		}
		
		
		if(vals=="true") {
			 mui.alert("请填写收货地址！");
			 return false;
		}
		
		
		 var btn = ['确定','取消'];
	     mui.confirm('是否提交订单！', '提示', btn, function (e) {
	    	 if (e.index == 0) {
	    		 var addressId = $("#addressId").val();
	    		  var cartIds = document.getElementsByName("cartId");
	    		  var cartId = "";
	    		  var arr = new Array();
	    		  for (var i = 0; i < cartIds.length; i++){
	    			  arr.push(cartIds[i].value);
	    			  }
					if(arr.length>0) {
						cartId = arr.toString();
					}
					
					
					
	    		 $.ajax({
	    	 			type:"post",
	    	 			url:"<%=basePath%>cart/saveOrder",
	    	 			data:{"aid":addressId,"cartId":cartId},
	    	 			success:function(result) {
	    	 				if(result=="true") {
	    	 					  mui.alert('下单成功！', function() {
	    	 		                 	location.href="<%=basePath%>home/index.htm";
	    	 		             });
	    	 				}
	    	 			},
	    	 			error:function(result){
	    	 				mui.alert("服务器忙！请稍后再下单",function(){
	    	 					location.href="<%=basePath%>home/index.htm";
	    	 				});
	    	 			}
	    	 		}); 
	         	}
	     });
	}
	
	function JumpUrl(user){
		if(user=="") {
			 var btn = ['现在登录', '再看看'];
	          mui.confirm('请登录后查看', '提示', btn, function (e) {
	              if (e.index == 0) {
	                  var url = "<%=basePath%>my/login.htm";
	                  window.location.href = url;
	              }
	          });
	          return false;
		}else {
			location.href="<%=basePath%>cart/my_edit_address.htm";
		}
	}
</script>
</html>