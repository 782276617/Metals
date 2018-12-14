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
<title>wemall商城系统后台管理</title>
<link href="<%=basePath%>resources/system/manage/blue/template.css"  rel="stylesheet" type="text/css"/>
<script src="<%=basePath%>resources//js/jquery-1.8.3.min.js"></script>
<script src="<%=basePath%>resources/js/jquery.validate.min.js"></script>
<script>
jQuery(document).ready(function(){
  jQuery("#theForm").validate({
    rules:{
	  websiteLogo:{
	    accept:"$!config.imageSuffix"
	  },
	   img0:{
	    accept:"$!config.imageSuffix"
	  },
	   img1:{
	    accept:"$!config.imageSuffix"
	  },
	   img2:{
	    accept:"$!config.imageSuffix"
	  },
	   img3:{
	    accept:"$!config.imageSuffix"
	  }
	 },
	messages:{
	  websiteLogo:{accept:"系统不允许上传该文件类型"},
	  img0:{accept:"系统不允许上传该文件类型"},
	  img1:{accept:"系统不允许上传该文件类型"},
	  img2:{accept:"系统不允许上传该文件类型"},
	  img3:{accept:"系统不允许上传该文件类型"}
	}
  });
 	//改变系统提示的样式
  jQuery("span .w").mousemove(function(){
	var id=jQuery(this.parentNode).attr("id");
	if(id="nothis"){
	   jQuery(this.parentNode).attr("id","this")
	}
  }).mouseout(function(){
     var id=jQuery(this.parentNode).attr("id");
	 if(id="this"){
	   jQuery(this.parentNode).attr("id","nothis")
	 }
  });
  //
//验证码类型
   if("$!config.securityCodeType"=="normal"){
     jQuery("#securityCodeType1").val("$!config.securityCodeType").attr("checked",true);
   }
   if("$!config.securityCodeType"=="voice"){
    jQuery("#securityCodeType2").val("$!config.securityCodeType").attr("checked",true);
   }
//tab页
jQuery("a[id^=site_]").click(function(){
	var id = jQuery(this).attr("id");
	var css = jQuery(this).attr("class");
	if(css=="this") return false;
	jQuery.each(jQuery("a[id^=site_]"),function(){
		if(jQuery(this).attr("id")==id){
			jQuery(this).addClass("this");
			var tid = "#"+jQuery(this).attr("id").substring(5);
			jQuery(tid).show();
			}else{
			jQuery(this).removeClass("this");
		   var tid="#"+jQuery(this).attr("id").substring(5);
		   jQuery(tid).hide();
			}
		})
	});
//鼠标经过logo图片显示
	jQuery("img[src='<%=basePath%>/resources/style/system/manage/blue/images/preview.jpg']").mouseover(function(){
	jQuery(this).parent().parent().find(".bigimgpre").css('display','block');
	});
	jQuery("img[src='<%=basePath%>/resources/style/system/manage/blue/images/preview.jpg']").mouseout(function(){
	jQuery(this).parent().parent().find(".bigimgpre").css('display','none');
	});
//设置站点默认状态以及判断初始显示状态
   var state = jQuery("#websiteState").val();
   if(state=="true"){
		jQuery("#websiteState_status").attr("src","<%=basePath%>resources/system/manage/blue/images/on.jpg");
	}else{
		jQuery("#websiteState_status").attr("src","<%=basePath%>resources/system/manage/blue/images/off.jpg");
	}
//允许游客咨询
   var consultState = jQuery("#visitorConsult").val();
    if(consultState=="true"){
		jQuery("#visitorConsult_status").attr("src","<%=basePath%>resources/system/manage/blue/images/on.jpg");
	}else{
		jQuery("#visitorConsult_status").attr("src","<%=basePath%>resources/system/manage/blue/images/off.jpg");
	}
   var qq_login = jQuery("#qq_login").val();
    if(qq_login=="true"){
		jQuery("#qq_login_status").attr("src","<%=basePath%>resources/system/manage/blue/images/on.jpg");
	}else{
		jQuery("#qq_login_status").attr("src","<%=basePath%>resources/system/manage/blue/images/off.jpg");
	}
   var sina_login = jQuery("#sina_login").val();
    if(sina_login=="true"){
		jQuery("#sina_login_status").attr("src","<%=basePath%>resources/system/manage/blue/images/on.jpg");
	}else{
		jQuery("#sina_login_status").attr("src","<%=basePath%>resources/system/manage/blue/images/off.jpg");
	}	
//
  jQuery("#websiteLogo").change(function(){
	 jQuery("#textfield1").val(jQuery("#websiteLogo").val());
   })
//
  jQuery(":checkbox").click(function(){
     var id=jQuery(this).attr("name");
	 id=id.substring(0,id.length-3);
	 if(jQuery(this).attr("checked")=="checked"){
	    jQuery("#"+id).val("true");
	 }else jQuery("#"+id).val("false");
  });
//
  jQuery("#qq_login_status").css("cursor","pointer").click(function(){
    var qq_login=jQuery("#qq_login").val();
   if(qq_login=="true"){
     jQuery("#qq_login_status").attr("src","<%=basePath%>/resources/style/system/manage/blue/images/off.jpg");
	 jQuery("#qq_login").val("false");
   }else{
     jQuery("#qq_login_status").attr("src","<%=basePath%>resources/system/manage/blue/images/on.jpg");
	 jQuery("#qq_login").val("true");
   }
  });
 jQuery("#sina_login_status").css("cursor","pointer").click(function(){
   var sina_login=jQuery("#sina_login").val();
   if(sina_login=="true"){
     jQuery("#sina_login_status").attr("src","<%=basePath%>/resources/system/manage/blue/images/off.jpg");
	 jQuery("#sina_login").val("false");
   }else{
     jQuery("#sina_login_status").attr("src","<%=basePath%>resources/system/manage/blue/images/on.jpg");
	 jQuery("#sina_login").val("true");
   }
  });
  jQuery("#visitorConsult_status").css("cursor","pointer").click(function(){
    var state = jQuery("#visitorConsult").val();
	if(state=="true"){
		jQuery("#visitorConsult").val("false");
		jQuery("#visitorConsult_status").attr("src","<%=basePath%>/resources/system/manage/blue/images/off.jpg");
	}else{
		jQuery("#visitorConsult").val("true");
		jQuery("#visitorConsult_status").attr("src","<%=basePath%>resources/system/manage/blue/images/on.jpg");
	}
  });
  jQuery("#websiteState_status").css("cursor","pointer").click(function(){
     var state = jQuery("#websiteState").val();
	 if(state=="true"){
		jQuery("#websiteState").val("false");
		jQuery("#websiteState_status").attr("src","<%=basePath%>/resources/system/manage/blue/images/off.jpg");
	}else{
		jQuery("#websiteState").val("true");
		jQuery("#websiteState_status").attr("src","<%=basePath%>resources/system/manage/blue/images/on.jpg");
	}
  });
  //
    jQuery("input[id^=img][type=file]").change(function(){
	   var id=jQuery(this).attr("id");
	   jQuery("#"+id+"_text").val(jQuery(this).val());
   })
  //
  jQuery(":radio[value=$!config.sysLanguage]").attr("checked",true);
});
function saveForm(){
	jQuery("#theForm").submit();
}
</script>
</head>
<body>
<form action="<%=basePath%>/admin/sys_config_save.htm" method="post" enctype="multipart/form-data" name="theForm" id="theForm">
  <input name="id" id="id" type="hidden" value="$!config.id"/>
  <input name="list_url" type="hidden" id="list_url" value="<%=basePath%>/admin/set_site.htm" />
  <input name="op_title" type="hidden" id="op_title" value="站点设置成功" />
  <div class="cont">
    <h1 class="seth1">站点设置</h1>
    <div class="settab"> <span class="tab-one"></span> <span class="tabs"> <a href="javascript:void(0);" class="this" id="site_base">基本信息</a> </span></div>
    <div class="setcont" id="base">
      <ul class="set1">
        <li>网站标题</li>
        <li> <span class="webname">
          <input name="title" type="text" id="title" value="$!config.title" />
          </span> <span id="nothis"> <strong class="q"></strong> <strong class="w">将显示在浏览器标题等位置</strong> <strong class="c"></strong> </span></li>
        <li>热门搜索</li>
        <li> <span class="webname">
          <input name="hotSearch" type="text" id="hotSearch" value="$!config.hotSearch" />
          </span> <span id="nothis"> <strong class="q"></strong> <strong class="w">显示在搜索框下面 前台点击时直接作为关键词进行搜索 新增多个关键词是用" , "隔开</strong> <strong class="c"></strong> </span> </li>
        <li>站点状态</li>
        <li> <span class="webSwitch">
          <input name="websiteState" id="websiteState" type="hidden" value="$!config.websiteState" />
          <img src="<%=basePath%>resources/system/manage/blue/images/on.jpg" width="61" height="23" id="websiteState_status"/> </span> <span id="nothis"><strong class="q"></strong><strong class="w">对站点进行管理关闭状态将无法访问但不妨碍后台管理</strong><strong class="c"></strong></span></li>
        <li>关闭原因</li>
        <li><span class="webtj">
          <textarea name="closeReason" cols="4" rows="6" id="closeReason">$!config.closeReason</textarea>
          </span><span id="nothis"><strong class="q"></strong><strong class="w">站点处于关闭状态时，关闭原因显示在前台</strong><strong class="c"></strong></span></li>
      </ul>
    </div>
    
  </div>
  <div class="submit">
    <input name="" type="button" value="保存" style="cursor:pointer;" onclick="saveForm();"/>
  </div>
</form>
</body>
</html>
