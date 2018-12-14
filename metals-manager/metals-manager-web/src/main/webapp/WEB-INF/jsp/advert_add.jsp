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
<title>Insert title here</title>
<link href="<%=basePath%>resources/system/manage/blue/template.css"  rel="stylesheet" type="text/css"/>
<link  href="<%=basePath%>resources/css/jquery-ui-1.8.22.custom.css" type=text/css rel=stylesheet>
<script src="<%=basePath%>resources/js/jquery-1.8.3.min.js"></script>
<script src="<%=basePath%>resources/js/jquery.validate.min.js"></script>
<script src="<%=basePath%>resources/js/jquery.shop.common.js"></script>
<script src="<%=basePath%>resources/js/jquery.poshytip.min.js"></script>
<script src="<%=basePath%>resources/js/jquery-ui-1.8.21.js"></script>
<script src="<%=basePath%>resources/js/jquery.zh.cn.js"></script>
<script type="text/javascript">

var image = '';
function selectImage(file){
    if(!file.files||!file.files[0]){
        return;
    }
    var reader = new FileReader();
    reader.onload = function(evt){
    	
        jQuery("#textfield1").val("file:///" + $("#acc").val());
        $("#logoShow2").attr("src",evt.target.result);
        image = evt.target.result;
    }
    reader.readAsDataURL(file.files[0]);
}


/* $(document).on('change', '#PictureUrl', function () {
    console.log(this.files[0]);
    function getObjectURL(file) {
        var url = null;
        if (window.createObjcectURL != undefined) {
            url = window.createOjcectURL(file);
        } else if (window.URL != undefined) {
            url = window.URL.createObjectURL(file);
        } else if (window.webkitURL != undefined) {
            url = window.webkitURL.createObjectURL(file);
        }
        return url;
    }
    var objURL = getObjectURL(this.files[0]);
    jQuery("#textfield1").val(objURL);
    $("#logoShow").attr("src",""+objURL+"");
});
   */


jQuery(document).ready(function(){
  jQuery("#theForm").validate({
    rules:{
     name:{required:true},
     startTime:{required:true},
     endTime:{required:true},
	 acc:{
		 required:true,accept:"gif|jpg|jpeg|bmp|png|tbi"
	  }
	 },
    messages:{
     name:{required:"广告标题不能为空"},
	 startTime:{required:"开始时间不能为空"},
	 endTime:{required:"结束时间不能为空"},
	 acc:{
		required:"图片不能为空",
	    accept:"不允许的图片格式"
	  }
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
  jQuery("#logoShow").mouseover(function(){
	    jQuery("#logoImg").css('display','block');
   }).mouseout(function(){
		jQuery("#logoImg").css('display','none');
	});
  //
  jQuery('#startTime').attr("readyonly","readyonly").datepicker({
	  dateFormat:"yy-mm-dd",
	  changeMonth: true,
	  changeYear: true
  });
  jQuery('#endTime').attr("readyonly","readyonly").datepicker({
	  dateFormat:"yy-mm-dd",
	  changeMonth: true,
	  changeYear: true
  });
  //
});
</script>
</head>
<body>
<div class="cont">
  <h1 class="seth1">广告管理</h1>
  <div class="settab"><span class="tab-one"></span> <span class="tabs"> <a href="<%=basePath%>admin/advert/advert_list.htm">所有广告</a> 
  <c:if test="${advert==null}">
  |  <a href="<%=basePath%>admin/advert_add.htm" class="this">新增广告</a>
  </c:if>
  <c:if test="${advert!=null}">
  |  <a href="javascript:void(0);" class="this">编辑</a>
  </c:if>
	   
	   
	   </span> <span class="tab-two"></span></div>
  <form action="<%=basePath%>admin/advert/advert_save.htm" method="post" enctype="multipart/form-data" id="theForm">
  <div class="setcont">
    <!--鼠标经过样式-->
    <ul class="set1">
      <li><strong class="orange fontsize20">*</strong>广告名称</li>
      <li><span class="webname">
        <input name="name" type="text" id="name" value="${advert.name}" />
        </span>
        </li>
    </ul>
    <ul class="set1">
      <li><strong class="orange fontsize20">*</strong>开始时间</li>
      <li><span class="webname">
        <input name="startTime" type="text" autocomplete="off"  id="startTime" value="<fmt:formatDate value='${advert.starttime}'/>"/>
        </span></li>
    </ul>
    <ul class="set1">
      <li><strong class="orange fontsize20">*</strong>结束时间</li>
      <li><span class="webname">
        <input name="endTime" type="text" autocomplete="off"  id="endTime" value="<fmt:formatDate value='${advert.endtime}'/>" />
        </span></li>
    </ul>

    <ul class="set1" id="advert_img">
        <li><strong class="orange fontsize20">*</strong>广告图片</li>
        <li><span class="size13" >
          <input name="pic" type="text" value="${advert.pic}" id="textfield1" />
          </span> <span class="filebtn">
          <input name="button" type="button" id="button1" value=""/>
          </span> <span style="float:left;" class="file">
          <input name="acc" type="file" id="acc"  onchange="selectImage(this)" class="file-text"  size="30"/>
          </span> 
          <span class="preview"> 
          		<img src="<%=basePath%>resources/system/manage/blue/images/preview.jpg" width="25" height="25"  id="logoShow" style="cursor:help"/> 
          </span>
          <span id="nothis"><strong class="q"></strong><strong class="w">最佳尺寸:980px * 340px</strong><strong class="c"></strong></span>
          <div class="bigimgpre" id="logoImg" style="display:none;"><img id="logoShow2" src="<%=basePath%>${advert.pic}"  width="180px" height="120px" /> </div>
        </li>
    </ul>
    <ul class="set1" id="advert_slide" >
      <li>播放序号：</li>
      <li><span class="webname">
        <input name="ad_slide_sequence" type="text"  autocomplete="off" id="ad_slide_sequence" value="${advert.sortOrder}" />
        </span></li>
    </ul>
  </div>
  <div class="submit">
    <input name="" type="submit" value="提交" style="cursor:pointer;" />
     <input name="" type="button" value="取消" onclick="JavaScript:history.go(-1)" style="cursor:pointer;" />
    <input name="id" type="hidden" id="id" value="${advert.id}" />
  </div>
  </form>
</div>
</body>
</html>