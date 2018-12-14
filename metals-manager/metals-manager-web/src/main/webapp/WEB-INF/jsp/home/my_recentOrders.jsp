<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
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
	<title>我的订单</title>
	<link rel="stylesheet" href="<%=basePath%>resources/home/style/css/core.css">
	<link rel="stylesheet" href="<%=basePath%>resources/home/style/css/icon.css">
	<link rel="stylesheet" href="<%=basePath%>resources/home/style/css/home.css">
	<link rel="icon" type="image/x-icon" href="favicon.ico">
	<link href="iTunesArtwork@2x.png" sizes="114x114" rel="apple-touch-icon-precomposed">

</head>
<body>

	<header class="aui-header-default aui-header-fixed ">
		<a href="javascript:history.back(-1)" class="aui-header-item">
			<i class="aui-icon aui-icon-back"></i>
		</a>
		<div class="aui-header-center aui-header-center-clear">
			<div class="aui-header-center-logo">
				<div class="">最近下单</div>
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
						<c:forEach items="${data}" var="order" varStatus="status">
						<li>
							<div class="aui-list-title-info">
								<a href="#" class="aui-well ">
									<div class="aui-well-bd"><fmt:formatDate value="${order.createTime}"/> </div>
									<div class="aui-well-ft">待付款</div>
								</a>
								<c:forEach items="${order.orderItem}" var="orderItem" >
								<a href="<%=basePath%>home/goods_product.htm?goodsId=${orderItem.goodsId}" class="aui-list-product-fl-item">
									<div class="aui-list-product-fl-img">
										<img src="<%=basePath%>${orderItem.picPath}" alt="">
									</div>
									<div class="aui-list-product-fl-text">
										<h3 class="aui-list-product-fl-title">${orderItem.title}</h3>
										<div class="aui-list-product-fl-mes">
											<div>
									<span class="aui-list-product-item-price">
										<em>¥</em>
										${orderItem.price}
									</span>
												<span class="aui-list-product-item-del-price">
										¥495.65
									</span>
											</div>
											<div class="aui-btn-purchase">
											x${orderItem.num}
											</div>
										</div>
									</div>
								</a>
								</c:forEach>
							</div>
								<c:if test="${!status.last}">
								<div class="aui-dri"></div>
							</c:if>
						</li>
						</c:forEach>
					</ul>
				</div>
			</div>
		</div>
	</section>


	<script type="text/javascript" src="<%=basePath%>resources/home/js/jquery.min.js"></script>
	<script type="text/javascript" src="<%=basePath%>resources/home/js/aui.js"></script>
	<script type="text/javascript" >
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