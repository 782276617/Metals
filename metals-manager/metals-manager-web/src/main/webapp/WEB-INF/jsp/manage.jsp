<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="<%=basePath%>resources/system/manage/blue/template.css"  rel="stylesheet" type="text/css"/>
<script src="<%=basePath%>resources/js/jquery-1.8.3.min.js"></script>
<script src="<%=basePath%>resources/js/jquery.shop.base.js"></script>
<script>
jQuery(document).ready(function(){
    pagestyle();
	jQuery(".webmap a").click(function(){
	    jQuery(".webmap_box").fadeIn('normal');
	 });
	jQuery(".close_map").click(function(){
	    jQuery(".webmap_box").fadeOut('normal');
	});
	jQuery("a[id^=complex_]").click(function(){
	  var suffix=jQuery(this).attr("suffix");
	  if(jQuery("#"+suffix+"info").css("display")=="block"){
	      jQuery("#"+suffix+"info").hide();
		  jQuery("#"+suffix+"img").attr("src","<%=basePath%>system/manage/blue/images/spread.jpg");
	   }else{
	      jQuery("#"+suffix+"info").show();
		  jQuery("#"+suffix+"img").attr("src","<%=basePath%>system/manage/blue/images/contract.jpg");	  
	   }
	});
	jQuery(".webskin em a img").click(function(){
	      var webcss = jQuery(this).attr("webcss");
			jQuery.post("<%=basePath%>admin/set_websiteCss.htm",{
						"webcss":webcss
						},function(data){
						window.location.href="<%=basePath%>admin/index.htm";	
							},"text");
		});
});	
</script>
</head>
<body scroll="yes">
<div class="main">
  <div class="top">
    <div class="login">您登录的身份是：管理员 &nbsp;&nbsp;| <a href="<%=basePath%>admin/logout.htm" target="_self">安全退出</a>|<a href="<%=basePath%>admin/admin_pws.htm" target="main_workspace">修改密码</a>| <a href="<%=basePath%>home/index.htm" target="_blank">商城首页</a></div>
    <div class="logo"></div>
    <div class="nav">
      <ul>
        <li><a href="javascript:void(0);" class="home" id="common_operation_menu" onclick="openURL('show','common_operation')">首页</a></li>
        <li><a href="javascript:void(0);" class="active" id="about_goods_menu" onclick="openURL('show','about_goods')">商品</a></li>
        <li><a href="javascript:void(0);" class="active" id="about_trade_menu" onclick="openURL('show','about_trade')">交易</a></li>
         <li><a href="javascript:void(0);" class="active" id="sys_tool_menu" onclick="openURL('show','sys_tool')">工具</a></li>
      </ul>
    </div>
  </div>
  <div class="index" id="workspace">
    <div class="left">
      <div class="lefttop"> </div>
      <div class="left_ul">
        <ul class="ulleft" id="common_operation">
        <div class="leftone">常用操作</div>
          <li><a class="this" id="welcome_op" href="javascript:void(0);" onclick="openURL('url','<%=basePath%>admin/welcome.htm','main_workspace','welcome_op')">欢迎页面</a> 
          </li>         
          <li><a href="javascript:void(0);" id="user_list_op_q" onclick="openURL('url','<%=basePath%>admin/user_list.htm','main_workspace','user_list_op_q')">会员管理</a></li>
          <li><a href="javascript:void(0);" id="goods_manage_op_q" onclick="openURL('url','<%=basePath%>admin/goods/goods_list.htm','main_workspace','goods_manage_op_q')">商品管理</a></li>
          <li><a href="javascript:void(0);" id="order_list_op_q" onclick="openURL('url','<%=basePath%>admin/order/order_list.htm','main_workspace','order_list_op_q')">订单管理</a></li>
          <li><a href="javascript:void(0);" id="advert_set_op" onclick="openURL('url','<%=basePath%>admin/advert/advert_list.htm','main_workspace','advert_set_op')">广告管理</a></li>
        </ul>
        <ul class="ulleft" style="display:none;" id="about_goods">
          <div class="leftone">商品相关</div>
          <li><a href="javascript:void(0);" class="this" id="goods_class_op" onclick="openURL('url','<%=basePath%>admin/category/goods_class_list.htm','main_workspace','goods_class_op')">分类管理</a> </li>
          <li><a href="javascript:void(0);" id="goods_manage_op" onclick="openURL('url','<%=basePath%>admin/goods/goods_list.htm','main_workspace','goods_manage_op')">商品管理</a></li>
          <li><a href="javascript:void(0);" id="goods_spec_op" onclick="openURL('url','<%=basePath%>admin/spec/goods_spec_list.htm','main_workspace','goods_spec_op')">规格管理</a></li>
          <li><a href="javascript:void(0);" id="goods_sales_op" onclick="openURL('url','<%=basePath%>admin/goods/goods_sales_list.htm','main_workspace','goods_sales_op')">销量榜</a></li>
        </ul>
      
        <ul class="ulleft" style="display:none;" id="about_trade">
          <div class="leftone">交易管理</div>
          <li><a href="javascript:void(0);" id="order_manage_op" onclick="openURL('url','<%=basePath%>admin/order/order_list.htm','main_workspace','order_manage_op')">订单管理</a> </li>
        </ul>
        <ul class="ulleft" style="display:none;" id="sys_tool">
          <div class="leftone">系统工具</div>
          <li><a href="javascript:void(0);" id="cache_list_op" onclick="openURL('url','<%=basePath%>admin/admin_pws.htm','main_workspace','cache_list_op')">修改密码</a></li>
          <li><a href="<%=basePath%>admin/logout.htm">安全退出</a></li>
        </ul>
        <!-- <div class="statement" style="font-size:12px; font-family:Arial, Helvetica, sans-serif;">Powered By<a href="#" target="_blank"> <strong><span style="color:#FD7C20;">wemall</span></strong></a> <sup>V2.0</sup>©2015 wemall Inc.</div> -->
      </div>
    </div>
    <div class="content">
    <div class="navbar"><span class="webmap"><a href="javascript:void(0);">管理地图</a></span>
      <div style="line-height:36px;">您的位置：控制台><span id="top_nav_info">站点设置</span></div>
      </div>
      <iframe id="main_workspace" name="main_workspace" src="<%=basePath%>admin/welcome.htm" style="overflow:auto;height:550px" frameborder="0" width="100%" height="100%" scrolling="yes" onload="window.parent"></iframe>
    </div>
  </div>
</div>
<div class="webmap_box" style="display:none;">
  <h4><a href="javascript:void(0);" class="close_map"></a>管理中心导航</h4>
  <div class="webmap_list"> 
    <span class="weblist_sp">
    <h5>商品</h5>
    <a href="javascript:void(0);" onclick="openURL('url','<%=basePath%>admin/category/goods_class_list.htm','main_workspace','goods_class_op','about_goods')">分类管理</a>
    <a href="javascript:void(0);" onclick="openURL('url','<%=basePath%>admin/goods/goods_list.htm','main_workspace','goods_manage_op','about_goods')">商品管理</a>
    <a href="javascript:void(0);" onclick="openURL('url','<%=basePath%>admin/spec/goods_spec_list.htm','main_workspace','goods_spec_op','about_goods')">规格管理</a>
    <a href="javascript:void(0);" onclick="openURL('url','<%=basePath%>admin/goods/goods_sales_list.htm','main_workspace','goods_sales_op','about_goods')">销量榜</a>
    </span> 
    <span class="weblist_sp">
    <h5>交易</h5>
    <a href="javascript:void(0);" onclick="openURL('url','<%=basePath%>admin/order/order_list.htm','main_workspace','order_manage_op','about_trade')">订单管理</a>
    </span> 
    <span class="weblist_sp">
    <h5>工具</h5>
      <a href="javascript:void(0);" onclick="openURL('url','<%=basePath%>admin/advert/advert_list.htm','main_workspace','advert_set_op','business_operation')">修改密码</a>
      <a href="javascript:void(0);" onclick="openURL('url','<%=basePath%>admin/advert/advert_list.htm','main_workspace','advert_set_op','business_operation')">安全退出</a>
 </span> 
  </div>
</div>
$!uc_login_js
</body>
</html>