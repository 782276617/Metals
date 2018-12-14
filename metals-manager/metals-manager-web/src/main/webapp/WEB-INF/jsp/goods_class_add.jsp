<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
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
<script>
$(function(){
//设置默认状态以及判断初始显示状态
	var state = jQuery("#display").val();
	if(state==""){
		jQuery("#display").val("true");
		jQuery("#displayOff").hide();
	}else{
		 if(state=="true"){
			jQuery("#displayOff").hide();
		}else{
			jQuery("#displayOn").hide();
		}
	}
	
	var state1 = jQuery("#recommend").val();
	if(state1==""){
		jQuery("#recommend").val("true");
		jQuery("#recommendOff").hide();
	}else{
		 if(state1=="true"){
			jQuery("#recommendOff").hide();
		}else{
			jQuery("#recommendOn").hide();
		}	
	}	
//
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
  jQuery("#theForm").validate({
    rules:{
	  className:{
	    required :true
	  }
	 },
	messages:{
	  className:{required:"分类名称不能为空"}
	}
  });
 
  jQuery("input[type='radio']").click(function(){
	 var val = jQuery(this).attr("value");
	  if(val==1){
	  jQuery("#icon_sys_ul").hide();
	  jQuery("#icon_acc_ul").show();	  
	  }else{
	  jQuery("#icon_sys_ul").show();
	  jQuery("#icon_acc_ul").hide();		  
	  }
  });
  jQuery(".icon_sys a").click(function(){
	  jQuery("#icon_sys").val(jQuery(this).attr("icon"));
	  jQuery(this).parent().find("a").removeClass("this");
	  jQuery(this).addClass("this");
	  });
   jQuery("#icon_acc").change(function(){
	 jQuery("#textfield1").val(jQuery("#icon_acc").val());
   })
     jQuery("#logoShow").mouseover(function(){
	    jQuery("#logoImg").css('display','block');
   }).mouseout(function(){
		jQuery("#logoImg").css('display','none');
	});

});


function saveForm(){
   jQuery("#theForm").submit();
}

//设置显示开关
function displayState(){
	var state = jQuery("#display").val();
	if(state=="true"){
		jQuery("#display").val("false");
		jQuery("#displayOff").show();
		jQuery("#displayOn").hide();
	}else{
		jQuery("#display").val("true");
		jQuery("#displayOff").hide();
		jQuery("#displayOn").show();
	}
}

/* //设置推荐开关
function recommendState(){
	var state = jQuery("#recommend").val();
	if(state=="true"){
		jQuery("#recommend").val("false");
		jQuery("#recommendOff").show();
		jQuery("#recommendOn").hide();
	}else{
		jQuery("#recommend").val("true");
		jQuery("#recommendOff").hide();
		jQuery("#recommendOn").show();
	}
} */
</script>
</head>
<body>
<div class="cont">
  <h1 class="seth1">商品分类</h1>
  <div class="settab"><span class="tab-one"></span>
      <span class="tabs">
       <a href="<%=basePath%>admin/category/goods_class_list.htm">管理</a> |
       <c:if test="${category==null}" >
       		<a href="<%=basePath%>admin/category/goods_class_add.htm" class="this" >新增</a>	
       </c:if>   
      	<c:if test="${category!=null}">| 
	   		<a href="javascript:void(0);" class="this">编辑</a>
      	</c:if> 
	   </span>
      
      <span class="tab-two"></span></div>
 <form name="theForm" id="theForm" action="<%=basePath%>admin/category/goods_class_save.htm" method="post">
 <input name="id" type="hidden" id="id" value="${category.id}" />
  <div class="setcont">
    <ul class="set1">
      <li><strong class="orange fontsize20">*</strong>分类名称</li>
      <li><span class="webname">
        <input name="className" type="text" id="className" value="${category.name}" size="40" />
      </span></li>
    </ul>
    <!--鼠标未经过样式-->
    <ul class="set1">
      <li>上级分类</li>
      <li><span class="webnamesec sizese">
        <select name="pid" id="pid" >
              <option value="0">请选择上级商品分类...</option>
              	<c:forEach items="${option}" var="option">
              <option value="${option.id}" ${option.id==pid?"selected='selected'":""} ${category.parentId==option.id?"selected='selected'":""} >${option.name}</option>
       			</c:forEach>
         </select>
      </span><span id="nothis"><strong class="q"></strong><strong class="w">如果选择上级分类，那么新增的分类则为被选择上级分类的子分类</strong><strong class="c"></strong></span></li>
    </ul>
	
	<ul class="set1">
      <li>显示</li>
      <li>
    	 <input name="display" id="display" type="hidden" value="${category.isDisplay==1?'true':'false'}" />
         <img src="<%=basePath%>resources/system/manage/blue/images/on.jpg" width="61" height="23" id="displayOn" onclick="displayState();" style="cursor:pointer"/>
         <img src="<%=basePath%>resources/system/manage/blue/images/off.jpg" width="61" height="23" id="displayOff" onclick="displayState();" style="cursor:pointer"/>
      </li>
    </ul>

    
       
    
    <ul class="set1">
      <li>排序</li>
      <li><span class="webname">
        <input name="sequence" type="text" id="sequence" value="${category.sortOrder}" />
      </span><span id="nothis"><strong class="q"></strong><strong class="w">序号越小，分类显示越靠前</strong><strong class="c"></strong></span></li>
    </ul>
    </div>
  <div class="submit">
    <input name="save" type="submit" value="提交"  />
  </div>
  </form>
</div>
</body>
</html>