<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
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
	<title>新建地址</title>
	<link href="<%=basePath%>resources/home/style/css/alert.css" rel="stylesheet"/>
	<link rel="stylesheet" href="<%=basePath%>resources/home/style/css/core.css">
	<link rel="stylesheet" href="<%=basePath%>resources/home/style/css/icon.css">
	<link rel="stylesheet" href="<%=basePath%>resources/home/style/css/home.css">
	<link rel="icon" type="image/x-icon" href="favicon.ico">
	<link href="iTunesArtwork@2x.png" sizes="114x114" rel="apple-touch-icon-precomposed">
	<style>
		.m-cell {
			background-color: #FFF;
			position: relative;
			z-index: 1;
			margin-bottom: .35rem;
			height: 3rem;
			line-height: 3rem;
		}
		/* 有些资料显示需要写，有些显示不需要，但是在编辑器webstorm中该属性不被识别 */
		::-webkit-input-placeholder {
			/* WebKit browsers */
			color: #888;
		}

		:-moz-placeholder {
			/* Mozilla Firefox 4 to 18 */
			color: #888;
		}

		::-moz-placeholder {
			/* Mozilla Firefox 19+ */
			color: #888;
		}

		:-ms-input-placeholder {
			/* Internet Explorer 10+ */
			color: #888;
		}
	</style>

</head>
<body style="background:#eee">

	<header class="aui-header-default aui-header-fixed ">
		<a href="javascript:history.back(-1)" class="aui-header-item">
			<i class="aui-icon aui-icon-back"></i>
		</a>
		<div class="aui-header-center aui-header-center-clear">
			<div class="aui-header-center-logo">
				<div class="">新建地址</div>
			</div>
		</div>
		<a href="#" class="aui-header-item-icon"   style="min-width:0">
			<!--<i class="aui-icon aui-icon-search"></i>-->
		</a>
	</header>


	<section class="aui-myOrder-content">
		<div class="aui-prompt"><i class="aui-icon aui-prompt-sm"></i>填写您的地址信息</div>
		<div class="aui-Address-box">
			<p>
				<input class="aui-Address-box-input" name="name" type="text" placeholder="收货人姓名">
			</p>
			<p>
				<input class="aui-Address-box-input" name="tel" type="text" placeholder="手机号码">
			</p>
			<p>
				<input class="aui-Address-box-input"  name="region" type="text" readonly id="J_Address"  placeholder="所在地区">
			</p>
			<p>
				<textarea class="aui-Address-box-text" id="address"  placeholder="街道， 小区门牌等详细地址" rows="3"></textarea>
			</p>
		</div>
		<div class="aui-out">
			<a href="#" class="red-color" onclick="saveSubmit()" style="color:#fff">保存并使用</a>
		</div>
	</section>

	<script type="text/javascript" src="<%=basePath%>resources/js/jquery.min.js"></script>
	<script type="text/javascript" src="<%=basePath%>resources/home/js/mui.min.js"></script>
	<script type="text/javascript" src="<%=basePath%>resources/home/js/aui.js"></script>
	<script type="text/javascript" src="<%=basePath%>resources/home/js/city.js"></script>
	<script type="text/javascript" >
		
		function saveSubmit(){
		
			var name = $("input[name='name']").val();
			var tel = $("input[name='tel']").val();
			var region = $("input[name='region']").val();
			var address = $("#address").val();
			
			if(name=="") {
				mui.alert("请填写收货人姓名！");
				return;
			}
			
			if(tel=="") {
				mui.alert("请填写手机号码！");
				return;
			}
			
			if(region=="") {
				mui.alert("请填写收货地区！");
				return;
			}
			
			
			$.ajax({
				type:"POST",
				url:"<%=basePath%>cart/saveAddress",
				data:{'consigneename':name,'tel':tel,'region':region,'address':address},
				async: false,
				success:function(result){
					 var url = document.referrer; 
					 var reg = RegExp(/order.htm/);
					 if(reg.exec(url)){
						 location.href = "<%=basePath%>cart/order.htm";
					 }else {
						window.location.href="<%=basePath%>cart/my_addres.htm";
					 }
				},error: function(request) {
         			alert("服务器忙！！！");
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
</body>
</html>