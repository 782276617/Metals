<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
<link href="<%=basePath%>resources/system/manage/blue/template.css"  rel="stylesheet" type="text/css"/>
<script src="<%=basePath%>resources/js/jquery-1.8.3.min.js"></script>
<script src="<%=basePath%>resources/js/jquery.validate.min.js"></script>
<script src="<%=basePath%>resources/js/additional-methods.min.js"></script>
<script type="text/javascript">

jQuery(document).ready(function(){
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

 	
   // 手机号码验证
   jQuery.validator.addMethod("uphones", function(value, element) {
   var length = value.length;
   var mobile = /(13\d|14[579]|15[^4\D]|17[^49\D]|18\d)\d{8}/g
   return this.optional(element) || (length == 11 && mobile.test(value));
   }, "手机号码格式错误");
 	

  
jQuery("#theForm").validate({
    rules:{
    	ucompany:"required",
    	urealname:"required",
    	uphone:{
    		required:true,
    		uphones:true
    	},
    	upwd:{
    	    required: true,
            minlength: 5
    	},
    	upwd2:{
    	    required: true,
            minlength: 5,
            equalTo: "#upwd"
    	}
	 },
	messages:{
	  ucompany:{
		  required:"公司名称不能为空"
	  },
	  urealname:{
		  required:"姓名不能为空"
	  },
	  uphone:{
		  required:"手机不能为空"
	  },
	  
	  upwd:{
		  required:"密码不能为空",
		  minlength:"密码长度不能小于 5 个字母"
	  },
	  upwd2:{
		  required:"确认密码不能为空",
		  minlength:"密码长度不能小于 5 个字母",
		  equalTo: "与上面密码不一致"
	  }
	  
	}
  });
  
  




});


//提交表单
function saveBrand(method){
	jQuery("#cmd").val(method);
	jQuery("#theForm").submit();
}


</script>

</head>
<body>
<form action="<%=basePath%>user/user_save" method="post"  name="theForm" id="theForm">
  <div class="cont">
    <h1 class="seth1">品牌管理</h1>
    <div class="settab"> 
	<span class="tab-one"></span> <span class="tabs">
	<a href="<%=basePath%>admin/goods/goods_list.htm">管理</a> 
		| <a class="this" href="<%=basePath%>user/user_add.htm">新增</a> 
	</span> 
	<span class="tab-two"></span>	</div>
    <div class="setcont" id="base">
      
      
      <!--鼠标经过样式-->
      <ul class="set1">
        <li><strong class="orange fontsize20">*</strong>公司名称</li>
        <li><span class="webname">
          <input name="ucompany" type="text" id="ucompany"  />
        </span></li>
      </ul>
      
          <!--鼠标未经过样式-->
      <ul class="set1">
      <li><strong class="orange fontsize20">*</strong>姓名</li>
      <li><span class="webname">
	  <input name="urealname"  type="text" id="urealname"  />
      </span>
	  </li>
    </ul>


    <!--鼠标未经过样式-->
    <ul class="set1">
      <li><strong class="orange fontsize20">*</strong>手机</li>
      <li><span class="webname">
	  <input name="uphone" type="text" id="uphone" />
      </span>
	  </li>
    </ul>
    
    <!--鼠标未经过样式-->
    <ul class="set1">
      <li>微信号</li>
      <li><span class="webname">
	  <input name="uweixin" type="text" id="uweixin" />
      </span>
	  </li>
    </ul>
    
    
    <!--鼠标未经过样式-->
    <ul class="set1">
      <li>性别</li>
      <li>
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	  <input name="usex" type="radio" checked="checked"  value="男" />&nbsp;&nbsp;&nbsp;男
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	  <input name="usex" type="radio"  value="女" />&nbsp;&nbsp;&nbsp;女
	  </li>
    </ul>
      
      
    <ul class="set1">
      <li>密码</li>
      <li><span class="webname">
	  <input name="upwd" type="password" id="upwd" />
      </span>
	  </li>
    </ul>
    
    <ul class="set1">
      <li>确认密码</li>
      <li><span class="webname">
	  <input name="upwd2" type="password" id="upwd2" />
      </span>
	  </li>
    </ul>
      
    </div>
  </div>
  <div class="submit">
    <input name="" type="button" value="提交" onclick="saveBrand('save');"/>
    <input name="" type="button" value="取消" onclick="JavaScript:history.go(-1)"/>
  </div>

  
  <br/>
  <br/>
  <br/>
  <br/>
  <br/>
  <br/>
  <br/>
  
</form>
</body>
</html>