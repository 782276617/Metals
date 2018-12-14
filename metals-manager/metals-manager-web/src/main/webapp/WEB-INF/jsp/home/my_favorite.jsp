<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

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
	<title>我的收藏</title>
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
				<div class="">我的收藏</div>
			</div>
		</div>
		<a href="#" class="aui-header-item-icon"   style="min-width:0">
		</a>
	</header>

	<section class="aui-myOrder-content">
		<div class="m-tab demo-small-pitch" data-ydui-tab>
			<div class="tab-panel">
				<div class="tab-panel-item tab-active">
					<ul>
					<c:forEach items="${favorite}" var="favorite" varStatus="status">
						<li class="content_${favorite.id}">
							<div class="aui-list-title-info" >
								<a href="#" class="aui-well ">
									<div class="aui-well-bd"><fmt:formatDate value="${favorite.created}" pattern="yyyy-MM-dd"/></div>
									<div class="aui-well-ft"></div>
								</a>
								<a href="javascript:void(0)" class="aui-list-product-fl-item">
									<div class="aui-list-product-fl-img" onclick="clickGoods(${goods[status.index].id})">
										<img src="<%=basePath%>${goods[status.index].image}" alt="">
									</div>
									<div class="aui-list-product-fl-text" >
											<div onclick="clickGoods(${goods[status.index].id})">
										<h3 class="aui-list-product-fl-title">${goods[status.index].name}</h3>
										<div class="aui-list-product-fl-mes">
											<div>
									<span class="aui-list-product-item-price" onclick="clickGoods(${goods[status.index].id})">
										<em>¥</em>
										${goods[status.index].price}
									</span>
											</div>
											<div class="aui-btn-purchase">
											</div>
										</div>
											</div>
										<p align="right"><span style="color: black;" onclick="deleteFavorite(${favorite.id})">删除&nbsp;&nbsp;&nbsp;</span></p>
									</div>
								</a>
								
									
								
							</div>
							<div class="aui-dri"></div>
						</li>
						</c:forEach>
						
						<div align="center" style="line-height: 75px">
							<c:if test="${favorite==null}">
									无收藏商品
							</c:if>
						</div>
					</ul>
				</div>
				<div class="tab-panel-item">
					<ul>
						<li>
							<div class="aui-list-title-info">
								<a href="#" class="aui-well ">
									<div class="aui-well-bd">2017-11-14</div>
									<div class="aui-well-ft">待付款</div>
								</a>
								<a href="javascript:;" class="aui-list-product-fl-item">
									<div class="aui-list-product-fl-img">
										<img src="themes/img/pd/sf-12.jpg" alt="">
									</div>
									<div class="aui-list-product-fl-text">
										<h3 class="aui-list-product-fl-title">2016夏天新款男士短袖t恤青少年韩版修身印花圆领半袖男装衣服潮领半袖男装衣服潮领半袖男装衣服潮</h3>
										<div class="aui-list-product-fl-mes">
											<div>
									<span class="aui-list-product-item-price">
										<em>¥</em>
										399.99
									</span>
												<span class="aui-list-product-item-del-price">
										¥495.65
									</span>
											</div>
											<div class="aui-btn-purchase">
												x1
											</div>
										</div>
									</div>

								</a>
							</div>
							<div class="aui-list-title-btn">
								<a href="#">取消订货</a>
								<a href="#" class="red-color">立即付款</a>
							</div>
							<div class="aui-dri"></div>
						</li>
					</ul>
				</div>
				<div class="tab-panel-item">
					<ul>
						<li>
							<div class="aui-list-title-info">
								<a href="#" class="aui-well ">
									<div class="aui-well-bd">2017-11-14</div>
									<div class="aui-well-ft">待付款</div>
								</a>
								<a href="javascript:;" class="aui-list-product-fl-item">
									<div class="aui-list-product-fl-img">
										<img src="themes/img/pd/sf-11.jpg" alt="">
									</div>
									<div class="aui-list-product-fl-text">
										<h3 class="aui-list-product-fl-title">2016夏天新款男士短袖t恤青少年韩版修身印花圆领半袖男装衣服潮领半袖男装衣服潮领半袖男装衣服潮</h3>
										<div class="aui-list-product-fl-mes">
											<div>
									<span class="aui-list-product-item-price">
										<em>¥</em>
										399.99
									</span>
												<span class="aui-list-product-item-del-price">
										¥495.65
									</span>
											</div>
											<div class="aui-btn-purchase">
												x1
											</div>
										</div>
									</div>

								</a>
							</div>
							<div class="aui-list-title-btn">
								<a href="#">取消订货</a>
								<a href="#" class="red-color">立即付款</a>
							</div>
							<div class="aui-dri"></div>
						</li>
					</ul>
				</div>
				<div class="tab-panel-item">
					<ul>
						<li>
							<div class="aui-list-title-info">
								<a href="#" class="aui-well ">
									<div class="aui-well-bd">2017-11-14</div>
									<div class="aui-well-ft">待付款</div>
								</a>
								<a href="javascript:;" class="aui-list-product-fl-item">
									<div class="aui-list-product-fl-img">
										<img src="themes/img/pd/sf-10.jpg" alt="">
									</div>
									<div class="aui-list-product-fl-text">
										<h3 class="aui-list-product-fl-title">2016夏天新款男士短袖t恤青少年韩版修身印花圆领半袖男装衣服潮领半袖男装衣服潮领半袖男装衣服潮</h3>
										<div class="aui-list-product-fl-mes">
											<div>
									<span class="aui-list-product-item-price">
										<em>¥</em>
										399.99
									</span>
												<span class="aui-list-product-item-del-price">
										¥495.65
									</span>
											</div>
											<div class="aui-btn-purchase">
												x1
											</div>
										</div>
									</div>

								</a>
							</div>
							<div class="aui-list-title-btn">
								<a href="#">查看物流</a>
								<a href="#" class="red-color">确认收货</a>
							</div>
							<div class="aui-dri"></div>
						</li>
					</ul>
				</div>
				<div class="tab-panel-item">
					<ul>
						<li>
							<div class="aui-list-title-info">
								<a href="#" class="aui-well ">
									<div class="aui-well-bd">2017-11-14</div>
									<div class="aui-well-ft">待付款</div>
								</a>
								<a href="javascript:;" class="aui-list-product-fl-item">
									<div class="aui-list-product-fl-img">
										<img src="themes/img/pd/sf-9.jpg" alt="">
									</div>
									<div class="aui-list-product-fl-text">
										<h3 class="aui-list-product-fl-title">2016夏天新款男士短袖t恤青少年韩版修身印花圆领半袖男装衣服潮领半袖男装衣服潮领半袖男装衣服潮</h3>
										<div class="aui-list-product-fl-mes">
											<div>
									<span class="aui-list-product-item-price">
										<em>¥</em>
										399.99
									</span>
												<span class="aui-list-product-item-del-price">
										¥495.65
									</span>
											</div>
											<div class="aui-btn-purchase">
												x1
											</div>
										</div>
									</div>

								</a>
							</div>
							<div class="aui-list-title-btn">
								<a href="#">查看订单</a>
								<a href="#" class="red-color">评价送币</a>
							</div>
							<div class="aui-dri"></div>
						</li>
					</ul>
				</div>
			</div>
		</div>
	</section>

	<script src="<%=basePath%>resources/home/js/mui.min.js"></script>
	<script type="text/javascript" src="<%=basePath%>resources/home/js/jquery.min.js"></script>
	<script type="text/javascript" src="<%=basePath%>resources/home/js/aui.js"></script>
	<script type="text/javascript" >
	
	function clickGoods(id) {
		location.href = "<%=basePath%>home/goods_product.htm?goodsId="+id;;
	}
	
	
	function deleteFavorite(id) {
		 var btn = ['确定','取消'];
	     mui.confirm('是否删除此商品！', '提示', btn, function (e) {
	    	 if (e.index == 0) {
	    		 $.ajax({
	    	 			type:"post",
	    	 			url:"<%=basePath%>cart/deleteFavorite",
	    	 			data:{"id":id},
	    	 			success:function(result) {
	    	 				if(result.status==200) {
	    	 					$(".content_"+id).remove();
	    	 				}
	    	 			}
	    	 		}); 
	         }
	     });
	}
	
	
	
        /**
         * Javascript API调用Tab
         */
        !function ($) {
            var $tab = $('#J_Tab');

            $tab.tab({
                nav: '.tab-nav-item',
                panel: '.tab-panel-item',
                activeClass: 'tab-active'
            });

			/*
			 $tab.find('.tab-nav-item').on('open.ydui.tab', function (e) {
			 console.log('索引：%s - [%s]正在打开', e.index, $(this).text());
			 });
			 */

            $tab.find('.tab-nav-item').on('opened.ydui.tab', function (e) {
                console.log('索引：%s - [%s]已经打开了', e.index, $(this).text());
            });
        }(jQuery);
	</script>

</body>
</html>