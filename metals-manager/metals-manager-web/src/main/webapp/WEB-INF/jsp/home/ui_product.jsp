<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
	<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no, minimal-ui"/>
	<meta name="apple-mobile-web-app-capable" content="yes"/>
	<meta name="apple-mobile-web-app-status-bar-style" content="black"/>
	<meta name="format-detection" content="telephone=no, email=no"/>
	<meta charset="UTF-8">
	<title>商品详情</title>
	<link href="<%=basePath%>resources/home/style/css/alert.css" rel="stylesheet"/>
	<link rel="stylesheet" href="<%=basePath %>resources/home/style/css/core.css">
	<link rel="stylesheet" href="<%=basePath %>resources/home/style/css/icon.css">
	<link rel="stylesheet" href="<%=basePath %>resources/home/style/css/home.css">
	<link rel="icon" type="image/x-icon" href="favicon.ico">
	<link href="iTunesArtwork@2x.png" sizes="114x114" rel="apple-touch-icon-precomposed">
	<style>
		.m-button {
			padding: 0 0.24rem;
		}

		.btn-block {
			text-align: center;
			position: relative;
			border: none;
			pointer-events: auto;
			width: 100%;
			display: block;
			font-size: 1rem;
			height: 2.5rem;
			line-height: 2.5rem;
			margin-top: 0.5rem;
			border-radius: 3px;
		}

		.btn-primary {
			background-color: #04BE02;
			color: #FFF;
		}

		.btn-warning {
			background-color: #FFB400;
			color: #FFF;
		}
		.mask-black {
			background-color: rgba(0, 0, 0, 0.6);
			position: fixed;
			bottom: 0;
			right: 0;
			left: 0;
			top: 0;
			display: -webkit-box;
			display: -webkit-flex;
			display: -ms-flexbox;
			display: flex;
			-webkit-box-pack: center;
			-webkit-justify-content: center;
			-ms-flex-pack: center;
			justify-content: center;
			-webkit-box-align: center;
			-webkit-align-items: center;
			-ms-flex-align: center;
			align-items: center;
			z-index:999;
		}

		.m-actionsheet {
			text-align: center;
			position: fixed;
			bottom: 0;
			left: 0;
			width: 100%;
			z-index: 1000;
			background-color: #fff;
			-webkit-transform: translate(0, 100%);
			transform: translate(0, 100%);
			-webkit-transition: -webkit-transform .3s;
			transition: -webkit-transform .3s;
			transition: transform .3s;
			transition: transform .3s, -webkit-transform .3s;
		}
		.actionsheet-toggle {
			-webkit-transform: translate(0, 0);
			transform: translate(0, 0);
		}
		.actionsheet-item {
			display: block;
			position: relative;
			font-size: 0.8rem;
			color: #555;
			height: 2rem;
			line-height: 2rem;
			background-color: #FFF;
		}
		.actionsheet-item:after {
			content: '';
			position: absolute;
			z-index: 2;
			bottom: 0;
			left: 0;
			width: 100%;
			height: 1px;
			border-bottom: 1px solid #D9D9D9;
			-webkit-transform: scaleY(0.5);
			transform: scaleY(0.5);
			-webkit-transform-origin: 0 100%;
			transform-origin: 0 100%;
		}
		.actionsheet-action {
			display: block;
			margin-top: .15rem;
			font-size: 0.8rem;
			color: #555;
			width:25px;
			height:25px;
			background-image: url('data:image/png;base64,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');
			background-repeat:no-repeat;
			background-size:25px;
			position:absolute;
			top:10px;
			right:10px;
		}

	</style>
</head>
<script type="text/javascript">

 function favorite_ajax(goodsId,user) {
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
			 $.ajax({
				 type:"POST",
				 url:"<%=basePath%>home/favorite",
				 data:{"goodsId":goodsId},
				 success:function(result){
						if(result.msg=='ins'){
					 		$("#sc").attr("src","<%=basePath%>resources/home/style/images/icon-sc2.png");
						}else if(result.msg='del'){
					 		$("#sc").attr("src","<%=basePath%>resources/home/style/images/icon-sc.png");
						}
				 }
			 });
	 }
 }



</script>

<body>
	<header class="aui-header-default aui-header-fixed ">
		<a href="javascript:history.back(-1)" class="aui-header-item">
			<i class="aui-icon aui-icon-back"></i>
		</a>
		<div class="aui-header-center aui-header-center-clear">
			<div class="aui-header-center-logo">
				<div id="scrollSearchPro">
					<span class="current">商品</span>
					<span onclick="jumpUlrxq();">详情</span>
				</div>
			</div>
		</div>
		<a href="javascript:;" class="aui-header-item-icon select"    style="min-width:0;">
			<i class="aui-icon aui-icon-share-pd selectVal" onselectstart="return false"></i>
			<div class="aui-header-drop-down selectList">
				<div class="aui-header-drop-down-san"></div>
				<div class="">
					<p class="" onclick="location='<%=basePath%>home/index.htm'">首页</p>
				</div>
			</div>
		</a>
	</header>
	<div class="aui-banner-content aui-fixed-top" data-aui-slider>
		<div class="aui-banner-wrapper">
			<div class="aui-banner-wrapper-item">
				<a href="#">
					<img src="<%=basePath%>${goods.image}">
				</a>
			</div>
		</div>
		<div class="aui-banner-pagination"></div>

	</div>
	<div class="aui-product-content">
		<div class="aui-real-price clearfix">
			<c:if test="${huser!=null}">
				<span>
						<i>￥</i>${goods.price}
				</span>
		    </c:if>
		    
		    <c:if test="${huser==null}">
		    		<span style="font-size: 15px">
						登录看会员价
					</span>
		    </c:if>
		    
			<!-- <del><span class="aui-font-num">￥18888</span></del> -->
			<div class="aui-settle-choice">
				<span>促销价</span>
			</div>
		</div>
		<div class="aui-product-title">
			<h2>
				${goods.name}
			</h2>
			<p>
				原封未拆，厂商授权！
			</p>
		</div>

		<div class="aui-product-coupon">
			<a href="#" class="aui-address-cell aui-fl-arrow aui-fl-arrow-clear selects" data-ydui-actionsheet="{target:'#actionSheet',closeElement:'#cancel'}">
				<div class="aui-address-cell-bd">选择</div>
				<div class="aui-address-cell-ft">规格</div>
			</a>

			<!-- 弹窗A begin -->
			<div class="m-actionsheet" id="actionSheet">
				<div style="position:relative">
					<div class="aui-product-text-content">
						<div class="aui-product-text-content-list">
							<div class="aui-product-text-content-list-bd">
								<span>已选</span>
							</div>
							<div class="aui-product-text-content-list-ft">
								<c:if test="${specJson!=null}">
										<span id="specx">${specJson[0]}</span>
								</c:if>
							</div>
						</div>
						<div class="aui-product-text-content-list">
							<div class="aui-product-text-content-list-bd">
								<span>${spec.name}</span>
							</div>
							<div class="aui-product-text-content-list-ft spec">
							<c:forEach items="${specJson}" var="spec" varStatus="status">
								<a href="#" id="specColor" onclick="clickSpec('${spec}',this)" class="${status.count==1?'aui-selected':''}">${spec}&nbsp;&nbsp;</a>
							</c:forEach>
							</div>
						</div>
					</div>

					<a href="javascript:;" class="actionsheet-action" id="cancel"></a>
					<div class="aui-product-function">
						<a href="javascript:void(0)" onclick="jiaruCar('${goods.id}','${huser}')" class="yellow-color">加入购物车</a>
						
					</div>
				</div>
			</div>
			
		
			<a href="#" class="aui-address-cell  aui-fl-arrow-clear">
				<div class="aui-address-cell-bd">运费</div>
				<div class="aui-address-cell-ft">免运费</div>
			</a>
			<a href="#" class="aui-address-cell aui-fl-arrow-clear">
				<div class="aui-address-cell-bd">说明</div>
				<div class="aui-address-cell-ft">假一赔十 7天无忧退货</div>
			</a>
		</div>
		<div class="aui-dri"></div>
		<div class="aui-dri"></div>
		<div class="aui-dri"></div>
		<div class="aui-product-pages">
			<div class="aui-product-pages-title">
				<h2>图文详情</h2>
			</div>
		 <c:if test="${goods.content!=null}">
			<div class="aui-product-pages-img">
				<img src="<%=basePath%>${goods.content}" alt="">
			</div>
		</c:if>
		 <c:if test="${goods.content==null}">
			<div style="text-align: center;">
			<br/>
			<br/>
				无详情
			</div>
		</c:if>
		<a name="xinqing"></a>
		</div>
	</div>

	<footer class="aui-footer-product">
		<div class="aui-footer-product-fixed">
			<div class="aui-footer-product-concern-cart">
				<a href="#" onclick="favorite_ajax(${goods.id},'${huser}')"  >
					<span  class="aui-f-p-icon">
					<c:if test="${favorite==true}">
						<img  id="sc" src="<%=basePath%>resources/home/style/images/icon-sc2.png" alt="">
					</c:if>
					<c:if test="${favorite==false}">
						<img  id="sc" src="<%=basePath%>resources/home/style/images/icon-sc.png" alt="">
					</c:if>
					</span>
					<span class="aui-f-p-focus-info">收藏</span>
				</a>
				
			</div>
			<div class="aui-footer-product-action-list">
				<a href="javascript:void(0)" onclick="jiaruCar2()" class="yellow-color">加入购物车</a>
				
			</div>
		</div>
	</footer>
	<script src="<%=basePath%>resources/home/js/jquery.min.js" type="text/javascript"></script>
	<script type="text/javascript" src="<%=basePath%>resources/home/js/mui.min.js"></script>
	<script src="<%=basePath%>resources/home/js/aui.js"></script>
	<script src="<%=basePath%>resources/home/js/aui-down.js"></script>
	<script type="text/javascript" src="<%=basePath%>resources/home/js/city.js"></script>
	
<script type="text/javascript">
$(function(){
	window.onscroll = function(){ 
	     var t = document.documentElement.scrollTop || document.body.scrollTop;  //获取距离页面顶部的距离
	     if( t >= 300 ) { //当距离顶部超过300px时
	    	 $("#scrollSearchPro span").removeClass("current");
	    	 $("#scrollSearchPro span:eq(1)").addClass("current");
	     } else { //如果距离顶部小于300px
	    	 $("#scrollSearchPro span").removeClass("current");
	    	 $("#scrollSearchPro span:eq(0)").addClass("current");
	     } 
	} 
});

</script>	
	
	
	<script type="text/javascript" >
	function jumpUlrxq(){
		location.href="#xinqing";
	}
	function jiaruCar(id,user) {
		if(user==""){
			 var btn = ['现在登录', '再看看'];
	          mui.confirm('请登录后查看', '提示', btn, function (e) {
	              if (e.index == 0) {
	                  var url = "<%=basePath%>my/login.htm";
	                  window.location.href = url;
	              }else {
	             	  $("#botTab a").removeClass("mui-active");
	            	  $("#classifys").addClass("mui-active");
	              }
	          });
	          return false;
		}else {
			var name = $("#specx").text();
			location.href = "<%=basePath%>cart/add_cart.htm?goodsId="+id+"&spec="+name;
		}
	}		
	function jiaruCar2(){
		$(".selects").click();
	}
	

	
	function clickSpec(name,thiss){
		$("#specx").text(name);
		$(".spec a").removeClass("aui-selected");
		$(thiss).addClass("aui-selected");
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
	<script>
        /**
         * 默认调用
         */
        !function () {
            var $target = $('#J_Address');

            $target.citySelect();

            $target.on('click', function (event) {
                event.stopPropagation();
                $target.citySelect('open');
            });

            $target.on('done.ydui.cityselect', function (ret) {
                $(this).val(ret.provance + ' ' + ret.city + ' ' + ret.area);
            });
        }();
        /**
         * 设置默认值
         */
        !function () {
            var $target = $('#J_Address2');

            $target.citySelect({
                provance: '新疆',
                city: '乌鲁木齐市',
                area: '天山区'
            });

            $target.on('click', function (event) {
                event.stopPropagation();
                $target.citySelect('open');
            });

            $target.on('done.ydui.cityselect', function (ret) {
                $(this).val(ret.provance + ' ' + ret.city + ' ' + ret.area);
            });
        }();
	</script>
	<script type="text/javascript">
        $(function () {
            //绑定滚动条事件
            //绑定滚动条事件
            $(window).bind("scroll", function () {
                var sTop = $(window).scrollTop();
                var sTop = parseInt(sTop);
                if (sTop >= 100) {
                    if (!$("#scrollSearchPro").is(":visible")) {
                        try {
                            $("#scrollSearchPro").slideDown();
                        } catch (e) {
                            $("#scrollSearchPro").show();
                        }
                    }
                }
                else {
                    if ($("#scrollSearchPro").is(":visible")) {
                        try {
                            $("#scrollSearchPro").slideUp();
                        } catch (e) {
                            $("#scrollSearchPro").hide();
                        }
                    }
                }
            });
        })
	</script>

	<script>
        /**
         * Javascript API调用ActionSheet
         */
        !function ($) {
            var $myAs = $('#J_ActionSheet');

            $('#J_ShowActionSheet').on('click', function () {
                $myAs.actionSheet('open');
            });

            $('#J_Cancel').on('click', function () {
                $myAs.actionSheet('close');
            });

        }(jQuery);
	</script>
</body>
</html>