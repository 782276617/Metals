<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  
<%@taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
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
<link href="<%=basePath%>resources/css/overlay.css" type="text/css" rel="stylesheet" />
<script src="<%=basePath%>resources/js/jquery-1.8.3.min.js"></script>
<script src="<%=basePath%>resources/js/jquery-ui-1.8.21.js"></script>
<script src="<%=basePath%>resources/js/jquery.shop.common.js"></script>
<script src="<%=basePath%>resources/js/jquery.validate.min.js"></script>
<script src="<%=basePath%>resources/js/jquery.poshytip.min.js"></script>
<script>
jQuery(document).ready(function(){
  jQuery("#theForm").validate({
    rules:{
	  name:{
	    required :true}
	 },
	messages:{
	  name:{required:"规格名称不能为空"}
	}
  });
/*    var type="$!obj.type";
   if(type=="text"){
     jQuery("#type1").attr("checked",true);
   }else{
     jQuery("#type2").attr("checked",true);
   } */
});
function saveForm(){
	jQuery("#count").val(count);
	jQuery("#theForm").submit();
}

</script>
</head>
<body>
<form action="<%=basePath%>admin/spec/goods_spec_save.htm" method="post"  name="theForm" id="theForm">
  <input name="count" type="hidden" id="count" />
  <div class="cont">
    <h1 class="seth1">规格管理</h1>
    <div class="settab"><span class="tab-one"></span> <span class="tabs"> <a href="<%=basePath%>admin/spec/goods_spec_list.htm">管理</a> | <c:if test="${spec==null}"><a href="<%=basePath%>admin/spec/goods_spec_add.htm" class="this">新增</a></c:if>
	<c:if test="${spec!=null}">
	   <a href="javascript:void(0);" class="this">编辑</a>
	</c:if>	   
	   </span> <span class="tab-two"></span></div>
    <div class="edit">
      <div class="editul ">
        <ul class="set3">
          <li><strong class="sred">*</strong>规格名称</li>
          <li><span class="pxnum">
          
            <input name="id" type="hidden" id="id" value="${spec.id}"/>
            <input name="name" type="text" id="name" value="${spec.name}"/>
            </span><span id="nothis"><strong class="q"></strong><strong class="w">请填写常用的商品规格的名称；例如：颜色；尺寸等。</strong><strong class="c"></strong></span></li>
        </ul>
      </div>
<script type="text/javascript">

if(${spec!=null}){
	var count=${fn:length(specJson)};	
}else {
	var count=1;
}

function img_spec(status){
  if(status=="1"){
    jQuery("span[id^=goods_spec_property_img_]").show();
  }
  if(status=="0"){
    jQuery("span[id^=goods_spec_property_img_]").hide();
  }
}
function remove_goods_spec_property(obj,id){
	    jQuery(obj).remove();
        count--;
}

function add_goods_spec_property(){
count++;
 var goods_spec_property_img="<tr id='goods_spec_'><td width='82'><span class='pxnum size5'><input name='sequence_"+count+"' id='sequence_"+count+"' value='' type='text'></span></td><td width='271'><span class='pxnum size7'><input name='value_"+count+"' id='value_"+count+"' value=''  type='text'></span></td><td class='ac8' align='center' width='116'><a href='javascript:void(0);' onclick='remove_goods_spec_property(this.parentNode.parentNode)'>删除</a></td></tr>";
  var goods_spec_property_text="<tr id='goods_spec_'><td width='82'><span class='pxnum size5'><input name='sequence_"+count+"' id='sequence_"+count+"' value='' type='text'></span></td><td width='271'><span class='pxnum size7'><input name='value_"+count+"' id='value_"+count+"' value=''  type='text'></span></td><td class='ac8' align='center' width='116'><a href='javascript:void(0);' onclick='remove_goods_spec_property(this.parentNode.parentNode)'>删除</a></td></tr>";
  var type=jQuery(":radio:checked").val();
  if(type=="img"){
    jQuery(".addsx_table tr[id^=goods_spec_]").last().after(goods_spec_property_img.replace(/count/g,count));
  }else{
    jQuery(".addsx_table tr[id^=goods_spec_]").last().after(goods_spec_property_text.replace(/count/g,count));
  }
}
</script>
      <div class="specification">
        <h2>新增规格值</h2>
        <table width="100%" border="0" cellspacing="0" cellpadding="0" class="addsx_table">
          <tr id="goods_spec_">
            <td width="10%"><strong>排序</strong></td>
            <td width="80%"><strong>规格值</strong></td>
            <td width="10%" align="center">操作</td>
          </tr>
          <c:if test="${spec!=null}">
			<c:forEach items="${specJson}" var="spec" varStatus="status">
		   <tr id="goods_spec_property">
            <td width="82"><span class="pxnum size5">
            <input name="sequence_${status.count}" type="text" id="sequence_${status.count}" value="${spec['order']}"/>
            </span></td>
            <td ><span class="pxnum size7">
              <input name="value_${status.count}" type="text" id="value_${status.count}" value="${spec['spec']}"/>
            </span></td>
            <td width="116" align="center" class="ac8"><a href="javascript:void(0);" onclick="remove_goods_spec_property(this.parentNode.parentNode)">删除</a></td>
          </tr>
			</c:forEach>
          </c:if>
		 <c:if test="${spec==null}">
          <tr id="goods_spec_property">
            <td width="82"><span class="pxnum size5">
            <input name="sequence_1" type="text" id="sequence_1" value=""/>
              </span></td>
             <td width="271"><span class="pxnum size7">
              <input name="value_1" type="text" id="value_1" value=""/>
              </span></td>
            
            <td width="116" align="center" class="ac8"><a href="javascript:void(0);" onclick="remove_goods_spec_property(this.parentNode.parentNode)">删除</a></td>
          </tr>
		 </c:if>
          <tr>
            <td colspan="3"><span class="newclass"><a href="javascript:void(0);" onclick="add_goods_spec_property();">新增规格值</a></span></td>
            <td>&nbsp;</td>
          </tr>
        </table>
      </div>
	
	</div>
    <div class="submit">
      <input name="" type="button" value="提交" onclick="saveForm();"/>
      <input name="" type="button" value="取消" onclick="javascript:history.go(-1)"/>
    </div>
  </div>
</form>
</body>
</html>

