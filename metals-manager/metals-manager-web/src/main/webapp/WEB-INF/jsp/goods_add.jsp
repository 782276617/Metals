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
<script type="text/javascript">
var image = "";
function selectImage(file,type){
	var i = 0;
	if(type=="goods") {
		i = 1;
	}else if(type=="details"){
		i = 2;
	}
	if(!file.files||!file.files[0]) {
		return;
		
	}
	var reader = new FileReader();
	reader.onload = function(evt) {
		jQuery("#textfield"+i).val("file:///" + $("#"+type+"").val());
		jQuery("#textfield0"+i).val("file:///" + $("#"+type+"").val());
		$("#logoShow"+i).attr("src",evt.target.result);
		image = evt.target.result;
	}
	reader.readAsDataURL(file.files[0]);
}

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
//设置推荐的默认装态
var rec = jQuery("#recommend").val();
	if(rec=="true"){
		jQuery("#stateOn").show();
		jQuery("#stateOff").hide();
	}else{
		jQuery("#stateOn").hide();
		jQuery("#stateOff").show();
	}
 //
jQuery("#logoShow01").mouseover(function(){
	    jQuery("#logoImg1").css('display','block');
}).mouseout(function(){
	    jQuery("#logoImg1").css('display','none');
});
//	  
jQuery("#logoShow02").mouseover(function(){
    jQuery("#logoImg2").css('display','block');
}).mouseout(function(){
    jQuery("#logoImg2").css('display','none');
});
//
jQuery("#theForm").validate({
    rules:{
	  name:{
	    required :true
	  },
	  price:{
		  required :true
	  }
	 },
	messages:{
	  name:{required:"商品名称不能为空"} 
	}
  });
//编辑
jQuery("#cid").val('$!obj.category.id');
//结束
});
//修改推荐状态
function recommendState(){
	var state = jQuery("#recommend").val();
	if(state=="true"){
		jQuery("#recommend").val("false");
		jQuery("#stateOff").show();
		jQuery("#stateOn").hide();
	}else{
		jQuery("#recommend").val("true");
		jQuery("#stateOff").hide();
		jQuery("#stateOn").show();
	}
}
//品牌保存
function saveBrand(method){
	jQuery("#cmd").val(method);
	jQuery("#theForm").submit();
}


function delPic(){
	$("#textfield2").val("");
	$("#textfield02").val("");
	$("#logoShow2").attr("src","");
	$("#logoShow02").val("");
	$("#logoImg2").val("");
}
</script>

</head>
<body>
<form action="<%=basePath%>admin/goods/goods_save.htm" method="post" enctype="multipart/form-data" name="theForm" id="theForm">
  <input name="id" id="id" type="hidden" value="${goods.id}"/>
  <div class="cont">
    <h1 class="seth1">品牌管理</h1>
    <div class="settab"> 
	<span class="tab-one"></span> <span class="tabs">
	<a href="<%=basePath%>admin/goods/goods_list.htm">管理</a> 
	<c:if test="${goods==null}">
		| <a class="this" href="<%=basePath%>admin/goods/goods_add.htm">新增</a> 
	</c:if>
	<c:if test="${goods!=null}">
		|<a href="javascript:void(0);" class="this">编辑</a>
	</c:if>
	</span> 
	<span class="tab-two"></span>	</div>
    <div class="setcont" id="base">
      <!--鼠标经过样式-->
      <ul class="set1">
        <li><strong class="orange fontsize20">*</strong>商品名称</li>
        <li><span class="webname">
          <input name="name" type="text" id="name" value="${goods.name}" />
        </span></li>
      </ul>
      	 <input type="hidden" name="currentPage" value="${currentPage}">
          <!--鼠标未经过样式-->
      <ul class="set1">
      <li><strong class="orange fontsize20">*</strong>价格</li>
      <li><span class="webname">
	  <input name="price" type="number" id="cat_name" value="${goods==null?'0.00':goods.price}" />
      </span>
	  </li>
    </ul>


          <!--鼠标未经过样式-->
     <ul class="set1">
      <li><strong class="orange fontsize20">*</strong>数量</li>
      <li><span class="webname">
	  <input name="stockn" type="number" id="stockn" value="${goods==null?'1':goods.stockn}" />
      </span>
	  </li>
    </ul>
      
      
    <ul class="set1">
      <li>商品关键字</li>
      <li><span class="webname">
	  <input name="Keyword" type="text" id="cat_name" value="${goods.gkeys}" />
      </span><span id="nothis"><strong class="q"></strong><strong class="w">便于搜索商品的关键字，多个关键字用，逗号隔开</strong><strong class="c"></strong></span>
	  </li>
    </ul>
    
    
 <ul class="set1">
      <li><strong class="orange fontsize20">*</strong>所属分类</li>
      <li><span class="webnamesec sizese">
        <select name="Taxonomy" id="pid" >
              <option value="0">请选择所属商品分类...</option>
              	<c:forEach items="${goodsOption}" var="goodsOption">
              <option value="${goodsOption.id}" ${goodsOption.id==goods.cid?"selected='selected'":""}  >${goodsOption.name}</option>
       			</c:forEach>
         </select>
      </span></li>
    </ul>
      
          <!--鼠标未经过样式-->
    <ul class="set1">
      <li>规格所属</li>
      <li><span class="webnamesec sizese">
        <select name="specId" id="pid" >
              <option value="0">请选择规格所属分类...</option>
              	<c:forEach items="${specOption}" var="specOption">
              <option value="${specOption.id}" ${specOption.id==goods.specid?"selected='selected'":""} >${specOption.name}</option>
       			</c:forEach>
         </select>
      </span></li>
    </ul>
  
      
   <ul class="set1" id="advert_img1">
        <li><strong class="orange fontsize20">*</strong>商品图片</li>
        <li><span class="size13" >
          <input name="goods" type="hidden" value="" id="textfield01" />
          <input name="goodsd" type="text" value="${goods.image}" id="textfield1" />
          </span> <span class="filebtn">
          <input name="button" type="button" id="button1" value=""/>
          </span> <span style="float:left;" class="file">
          <input name="goods" type="file" id="goods"  onchange="selectImage(this,'goods')" class="file-text"  size="30"/>
          </span> 
          <span class="preview"> 
          		<img src="<%=basePath%>resources/system/manage/blue/images/preview.jpg" width="25" height="25"  id="logoShow01" style="cursor:help"/> 
          </span>
          <span id="nothis"><strong class="q"></strong><strong class="w">最佳尺寸:980px * 340px</strong><strong class="c"></strong></span>
          <div class="bigimgpre" id="logoImg1" style="display:none;"><img id="logoShow1" src="<%=basePath%>${goods.image}"  width="180px" height="120px" /> </div>
        </li>
    </ul>
      
      <ul class="set1" id="advert_img2">
        <li>详情图片</li>
        <li><span class="size13" >
          <input name="details" type="hidden" value="" id="textfield02" />
          <input name="detailsd" type="text" value="${goods.content}" id="textfield2" />
          </span> <span class="filebtn">
          <input name="button" type="button" id="button2" value=""/>
          </span> <span style="float:left;" class="file">
          <input name="details" type="file" id="details"  onchange="selectImage(this,'details')" class="file-text"  size="30"/>
          </span> 
          <span class="preview"> 
          		<img src="<%=basePath%>resources/system/manage/blue/images/preview.jpg" width="25" height="25"  id="logoShow02" style="cursor:help"/> 
          </span>
          <span class="preview">
	          		<img src="<%=basePath%>resources/system/manage/blue/images/del.svg" width="25" height="25"  onclick="delPic()"/> 
          </span>
          <span id="nothis"><strong class="q"></strong><strong class="w">最佳尺寸:980px * 340px</strong><strong class="c"></strong></span>
          <div class="bigimgpre" id="logoImg2" style="display:none;"><img id="logoShow2" src="<%=basePath%>${goods.content}"  width="180px" height="120px" /> </div>
        </li>
    </ul>
    </div>
  </div>
  <div class="submit">
    <input name="" type="button" value="提交" onclick="saveBrand('save');"/>
    <input name="" type="button" value="取消" onclick="JavaScript:history.go(-1)"/>
  </div>
</form>
</body>
</html>