<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
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
<body style="background-color: #ffffff">

	<header class="aui-header-default aui-header-fixed ">
		<a href="javascript:history.back(-1)" class="aui-header-item">
			<i class="aui-icon aui-icon-back"></i>
		</a>
		<div class="aui-header-center aui-header-center-clear">
			<div class="aui-header-center-logo">
				<c:if test="${cart==null}">
					<div class="">购物车(0)</div>
				</c:if>
				<c:if test="${cart!=null}">
					<div class="">购物车(${fn:length(cart)})</div>
				</c:if>
			</div>
		</div>
	</header>
	<section class="aui-car-content">
		<div class="aui-dri"></div>
		<div class="aui-car-box">
			<div class="aui-car-box-list">
				<ul>
					<c:forEach items="${cart}" var="cart">
					<li class="content_${cart.id}">
						<div class="aui-car-box-list-item" >
							<input name="goodsCheck" type="checkbox"  value="${cart.id}"  class="check goods-check goodsCheck">
							<div class="aui-car-box-list-img" onclick="clickGoods(${cart.gid})">
								<a href="javascript:void(0)">
									<img src="<%=basePath%>${cart.goodsPic}" alt=""/>
								</a>
							</div>
							<div class="aui-car-box-list-text" style="margin-top: 12px">
								<h4 onclick="clickGoods(${cart.gid})">
									<a href="javascript:void(0)">${cart.name}</a>
								</h4>
								<div class="aui-car-box-list-text-brief">
									<span>规格:${cart.spec}</span>
								</div>
								<div class="aui-car-box-list-text-price">
									<div class="aui-car-box-list-text-pri">
										￥<b class="price">${cart.price}</b>
									</div>
									<div class="aui-car-box-list-text-arithmetic">
										<input name="id" type="hidden" value="${cart.gid}">
										<a href="javascript:;" class="minus">-</a>
										<span class="num">${cart.number}</span>
										<a href="javascript:;" class="plus">+</a>
									</div>
								</div>
							</div>
								<p align="right" style="color:black;line-height: 30px">
									<span onclick="deleteCart(${cart.id})">删除</span>
								</p>
						</div>
						<div class="aui-dri"></div>
					</li>
					</c:forEach>
				</ul>
			</div>
		</div>
	</section>
	<div class="aui-payment-bar">
		<div class="all-checkbox"><input type="checkbox" class="check goods-check" id="AllCheck">全选</div>
		<div class="shop-total">
			<strong>合计：<i class="total" id="AllTotal">0.00</i></strong>
		</div>
		<a href="javascript:void(0)" class="settlement" onclick="settlement()">去下单</a>
	</div>
	<script src="<%=basePath%>resources/home/js/mui.min.js"></script>
	<script src="<%=basePath%>resources/home/js/jquery.min.js"></script>
	<script src="<%=basePath%>resources/home/js/aui-car.js"></script>
<script type="text/javascript">

$(function(){
	// 数量减
	$(".minus").click(function() {
		var t = $(this).parent().find('.num');
		t.text(parseInt(t.text()) - 1);
		if (t.text() <= 1) {
			t.text(1);
		}else {
			var goodsId = $(this).parent().find("input[name='id']").val();
			$.ajax({
				type:"post",
				url:"<%=basePath%>cart/updateNum",
				data:{"goodsId":goodsId,"type":"jian"},
				success:function(result){
							
				}
			});
		}
		$(this).closest(".aui-car-box-list-item").find(".goodsCheck").prop('checked', true);
		TotalPrice();
	});
	// 数量加
	$(".plus").click(function() {
		var t = $(this).parent().find('.num');
		t.text(parseInt(t.text()) + 1);
		if (t.text() <= 1) {
			t.text(1);
		}else {
			var goodsId = $(this).parent().find("input[name='id']").val();
			$.ajax({
				type:"post",
				url:"<%=basePath%>cart/updateNum",
				data:{"goodsId":goodsId,"type":"jia"},
				success:function(result){
					
				}
			});
		}
		$(this).closest(".aui-car-box-list-item").find(".goodsCheck").prop('checked', true);
		TotalPrice();
		
	});
	 TotalPrice();
})




function settlement(){
	  var arr = new Array();
	  var arr2 = new Array();
	  var i = 0;
	var goodsCheckValue = $("input[name='goodsCheck']:checked").each(function(j) {
	    if (j >= 0) {
	    	arr2.push($(this).val());
	    	arr.push("cartId="+$(this).val());
	    	i++;
	    }
	});

	
    var goods = $(".goodsCheck").closest(".aui-car-box").find(".goodsCheck"); //获取本店铺的所有商品
   
    if(goods.length<=0){
    	   mui.alert('购物车为空！');
    	   return;
    }
	
	if(arr.length>0||i>0) {
		var ids = arr.join("&");
		$.ajax({
 			type:"post",
 			url:"<%=basePath%>cart/validateStock",
 			data:{cartIds:arr2},
 			success:function(result) {
 				if(result=="success") {
 					location.href= "<%=basePath%>cart/order.htm?"+ids;
 				}else if(result=="fail"){
 					  mui.alert('您选中的商品库存不足！');
 				}
 			},
 			error:function(result){
 				mui.alert("服务器忙！请稍后再下单",function(){
 					location.href="<%=basePath%>home/index.htm";
 				});
 			}
 		});
	}else {
	    var btn = ['确定'];
        mui.alert('请选择商品！', '提示', btn);
        return;
	}
}


function clickGoods(id) {
	location.href = "<%=basePath%>home/goods_product.htm?goodsId="+id;
}


function deleteCart(id) {
	 var btn = ['确定','取消'];
     mui.confirm('是否删除此商品！', '提示', btn, function (e) {
    	 if (e.index == 0) {
    		 $.ajax({
    	 			type:"post",
    	 			url:"<%=basePath%>cart/deleteCart",
    	 			data:{"id":id},
    	 			success:function(result) {
    	 				if(result.status==200) {
    	 					$(".content_"+id).remove();
    	 					 TotalPrice();
    	 				}
    	 			}
    	 		}); 
         }
     });
}

//计算
function TotalPrice() {
  var allprice = 0; //总价
  var total = 0; //每个商品总价
  $(".aui-car-box").each(function() { //循环一次店铺 （当前没有店铺模式，只能默认一个）
    $(this).find(".goodsCheck").each(function() { //循环店铺里面的商品
      if ($(this).is(":checked")) { //如果该商品被选中
          var num = parseInt($(this).parents(".aui-car-box-list-item").find(".num").text()); //得到商品的数量
          var price = parseFloat($(this).parents(".aui-car-box-list-item").find(".price").text()); //得到商品的单价
          total += price * num; //计算单个商品的总价
      }
    });
    allprice += total; //计算商品的总价
  });
  $("#AllTotal").text(allprice.toFixed(2)); //输出全部总价
}
</script>
</body>
</html>