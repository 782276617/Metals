<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
	<title>收货地址</title>
	<link rel="stylesheet" href="<%=basePath%>resources/home/style/css/core.css">
	<link rel="stylesheet" href="<%=basePath%>resources/home/style/css/icon.css">
	<link rel="stylesheet" href="<%=basePath%>resources/home/style/css/home.css">
	<link rel="icon" type="image/x-icon" href="favicon.ico">
	<link href="iTunesArtwork@2x.png" sizes="114x114" rel="apple-touch-icon-precomposed">

</head>
<body style="background:#eee">

	<header class="aui-header-default aui-header-fixed ">
		<a href="javascript:history.back(-1)" class="aui-header-item">
			<i class="aui-icon aui-icon-back"></i>
		</a>
		<div class="aui-header-center aui-header-center-clear">
			<div class="aui-header-center-logo">
				<div class="">收货地址</div>
			</div>
		</div>
		<a href="#" class="aui-header-item-icon"   style="min-width:0">
			<i class="aui-icon"></i>
		</a>
	</header>
	<section class="aui-myOrder-content">
		<c:forEach items="${data}" var="address">
			<div class="aui-Address-box content_${address.id}">
				<div class="aui-Address-box-item"  onclick="choose(${address.id})">
					<div class="aui-Address-box-item-bd">
						<p>${address.consigneename}</p>
					</div>
					<div class="aui-Address-box-item-ft">
						<p>${address.tel}</p>
					</div>
				</div>
				<div class="aui-Address-box-item" onclick="choose(${address.id})">
					<div class="aui-Address-box-item-bd">
						<p>${address.region}${address.address}</p>
					</div>
				</div>
				<div class="aui-Address-box-item">
					<div class="aui-Address-box-item-bd" onclick="choose(${address.id})">
						<p><input type="radio" name="default" onclick="setdefault(${address.id})"  class="check goods-check goodsCheck" ${address.isdefault==true?"checked='checked'":""} style="background-size: 17px 17px;"> <em style="padding-left:24px;">默认地址</em></p>
					</div>
					<div class="aui-Address-box-item-ft">
						<p onclick="deleteClick(${address.id})">删除</p>
					</div>
				</div>
			</div>
		</c:forEach>
		<div class="aui-out">
			<a href="<%=basePath%>cart/my_edit_address.htm">新建收货地址</a>
		</div>
	</section>


	<script type="text/javascript" src="<%=basePath%>resources/home/js/jquery.min.js"></script>
	<script type="text/javascript" src="<%=basePath%>resources/home/js/aui.js"></script>
	<script type="text/javascript" >
	 function choose(id){
		 var url = document.referrer; 
		 var reg = RegExp(/order.htm/);
		 if(reg.exec(url)){
			 setdefault(id);
			 location.href = "<%=basePath%>cart/order.htm";
		 }
     }
			function deleteClick(id){
				$.ajax({
					type:"POST",
					url:"<%=basePath%>cart/deleteAdressId",
					data:{"id":id},
					success:function(result){
						if(result.status==200) {
							$(".content_"+id).remove();
						}
					}
				});
			}
			
			
			function setdefault(id){
				$.ajax({
					type:"POST",
					url:"<%=basePath%>cart/defaultAdress",
					data:{"id":id},
					success:function(result){
						
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