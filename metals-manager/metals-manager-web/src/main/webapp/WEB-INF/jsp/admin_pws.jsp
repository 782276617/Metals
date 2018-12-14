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
<title></title>
</head>
<link href="<%=basePath%>resources/system/manage/blue/template.css"  rel="stylesheet" type="text/css"/>
<script src="<%=basePath%>resources/js/jquery-1.8.3.min.js"></script>
<script src="<%=basePath%>resources/js/jquery.poshytip.min.js"></script>
<script src="<%=basePath%>resources/js/jquery.shop.common.js"></script>
<script src="<%=basePath%>resources/js/jquery.validate.min.js"></script>
<script>
jQuery(document).ready(function(){
  jQuery("#theForm").validate({
    rules:{
	  old_password:{
	    required :true,
	    minlength:6,
		maxlength:20
	  },
	 password:{
	    required :true,
	    minlength:6,
		maxlength:20
	  },
	 password1:{
	    required :true,
	    minlength:6,
		maxlength:20,
		equalTo:"#password"
	  }
   },
	messages:{
	  old_password:{required:"旧密码不能为空",minlength:"最小长度为6位",maxlength:"最大不能超过20位"},
	  password:{required:"新密码不能为空",minlength:"最小长度为6位",maxlength:"最大不能超过20位"},
	  password1:{required:"重复密码不能为空",minlength:"最小长度为6位",maxlength:"最大不能超过20位",equalTo:"两次输入密码不一致"},
	}
  });	
  jQuery(":radio[name=sex]").each(function(){
    if(jQuery(this).val()=="$!obj.sex")jQuery(this).attr("checked",true);
  });
});

function saveForm(){
   jQuery("#theForm").submit();
}


</script>
<body>
<div class="cont">
  <h1 class="seth1">修改管理员密码</h1>
  <form name="theForm" id="theForm" action="<%=basePath%>admin/admin_pws_save.htm" method="post">
    <div class="setcont">
      <!--鼠标经过样式-->
      <ul class="set1">
        <li><strong class="orange fontsize20">*</strong>管理员旧密码</li>
      <li><span class="webname">
        <input name="usedPwd" type="password" id="old_password" size="40" autocomplete="off" />
      </span></li>
    </ul>
    <ul class="set1">
      <li><strong class="orange fontsize20">*</strong>管理员新密码</li>
      <li><span class="webname">
        <input name="newPwd" type="password" id="password" size="40" />
      </span></li>
    </ul>
	<ul class="set1">
      <li><strong class="orange fontsize20">*</strong>重复新密码</li>
      <li><span class="webname">
        <input name="password1" type="password" id="password1" size="40" />
      </span></li>
	</ul>
    </div>
  </form>
  <div class="submit">
    <input name="save" type="button" value="提交" onclick="saveForm()" />
  </div>
</div>
</body>
</html>