<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no"/>
	<title>${cifyname}-福乾五金机电公司|打造中山最大五金批发</title>
	<link href="<%=basePath%>resources/home/style/css/mui.min.css" rel="stylesheet">
	<link rel="stylesheet" type="text/css" href="<%=basePath%>resources/home/style/css/iconfont.css">
	<link rel="stylesheet" type="text/css" href="<%=basePath%>resources/home/style/css/icons-extra.css">
	<link rel="stylesheet" href="<%=basePath%>resources/home/style/css/all.css">
	<link href="<%=basePath%>resources/home/style/css/jquery.mmenu.all.css" rel="stylesheet"/>

<style type="text/css">

.setHeight{
	height: 100%;
}

.setHeight2{
	height: 99%;
}

</style>
</head>
<body>
	<nav id="menu-right"  class="mm-menu mm-horizontal mm-light mm-ismenu mm-right">
			<ul class="dropdown-menu mm-list mm-panel mm-opened mm-current"
				id="mm-m0-p0">
				<li><a href="javascript:void(0)" data-cfg="0">全部</a></li>
				<li><a href="javascript:void(0)" data-cfg="2">热卖</a></li>
				<li><a href="javascript:void(0)" data-cfg="3">人气</a></li>
				<li><a href="javascript:void(0)" data-cfg="4">新品到货</a></li>
				<li><a href="javascript:void(0)" data-cfg="5">推荐</a></li>
				<li><a href="javascript:void(0)" data-cfg="6">最近下单</a></li>
				<li><a href="javascript:void(0)" data-cfg="7">促销</a></li>
				<li><a href="javascript:void(0)" data-cfg="1">畅销</a></li>
			</ul>
	</nav>



	<div class="mui-content main mm-page">
		<div class="c-search">
			<div class="mui-row c-searchBlock">
				<a href="javascript:history.back()" class="mui-col-xs-1 return"><i
					class="all-smgray mui-icon mui-icon-arrowleft"></i></a>
				<div class="mui-col-xs-9 c-inpBlock" style="width: 91%">
					<a class="a-search-input input-text" href="javascript:void(0)">
						<i class="iconfont icon-sousuo all-smgray"></i> <input type="text"
						id="key" placeholder="输入要搜索的产品" value="${key}">
						<button class="ind_search_btn s-search-btn" id="btnSearch">搜索</button>

						<input id="hidcurpage" value="2" type="hidden"> <input
						id="hidpagecount" value="1" type="hidden"> <input
						type="hidden" id="sort_type" name="sort_type" value="0"> <input
						type="hidden" id="type_id" value="1926"> <input
						type="hidden" id="filter_type" value="0"> <input
						type="hidden" name="hidfromIndex" id="hidfromIndex" value="0">
						<input type="hidden" name="hidfromCategory" id="hidfromCategory"
						value="0"> <input id="hidpara_pb" value="0" type="hidden">
						<input id="hidnotAllowOrd" value="1" type="hidden"> <input
						id="hidseller_enc" value="9557942EBC32352A" type="hidden">
						<input id="hid_para_pb" value="0" type="hidden"> <input
						id="hid_auth" value="0" type="hidden"> <input
						id="hid_memberid" value="0" type="hidden"> <input
						id="hid_not_edit_bulk" value="1" type="hidden">
					</a>
				</div>
			</div>
		</div>
		
		
		<div class="mui-row sl-module" id="sl-modules">
			<div class="mui-row">
				<ul class="sl-mUl">
					<c:if test="${classifyId!=null}">
						<li
							class="li_sort sl-active ${orderType==null||orderType=='New'?'sl-active':''}"
							data-sorttype="0"><a
							href="<%=basePath%>classify/goodsList.htm?classifyId=${classifyId}&orderType=New"
							${orderType!='New'?"style='color: #757575'":""}><i>·</i>默认</a></li>
						<li class="li_sort ${orderType=='Sales'?'sl-active':''}"
							data-sorttype="1"><a
							href="<%=basePath%>classify/goodsList.htm?classifyId=${classifyId}&orderType=Sales"
							${orderType!='Sales'?"style='color: #757575'":""}><i>·</i>销量</a></li>
						<li class="li_sort ${orderType=='Price'?'sl-active':''}"
							data-sorttype="3"><a
							href="<%=basePath%>classify/goodsList.htm?classifyId=${classifyId}&orderType=Price"
							${orderType!='Price'?"style='color: #757575'":""}><i>·</i>价格</a></li>
					</c:if>
					<c:if test="${classifyId==null&&type=='new'}">
						<li
							class="li_sort sl-active ${orderType==null||orderType=='New'?'sl-active':''}"
							data-sorttype="0"><a
							href="<%=basePath%>home/newGoods.htm?orderType=New"
							${orderType!='New'?"style='color: #757575'":""}><i>·</i>默认</a></li>
						<li class="li_sort ${orderType=='Sales'?'sl-active':''}"
							data-sorttype="1"><a
							href="<%=basePath%>home/newGoods.htm?orderType=Sales"
							${orderType!='Sales'?"style='color: #757575'":""}><i>·</i>销量</a></li>
						<li class="li_sort ${orderType=='Price'?'sl-active':''}"
							data-sorttype="3"><a
							href="<%=basePath%>home/newGoods.htm?orderType=Price"
							${orderType!='Price'?"style='color: #757575'":""}><i>·</i>价格</a></li>
					</c:if>
					<c:if test="${classifyId==null&&type=='sales'}">
						<li
							class="li_sort sl-active ${orderType==null||orderType=='New'?'sl-active':''}"
							data-sorttype="0"><a
							href="<%=basePath%>home/sales.htm?orderType=New"
							${orderType!='New'?"style='color: #757575'":""}><i>·</i>默认</a></li>
						<li class="li_sort ${orderType=='Sales'?'sl-active':''}"
							data-sorttype="1"><a
							href="<%=basePath%>home/sales.htm?orderType=Sales"
							${orderType!='Sales'?"style='color: #757575'":""}><i>·</i>销量</a></li>
						<li class="li_sort ${orderType=='Price'?'sl-active':''}"
							data-sorttype="3"><a
							href="<%=basePath%>home/sales.htm?orderType=Price"
							${orderType!='Price'?"style='color: #757575'":""}><i>·</i>价格</a></li>
					</c:if>
					<c:if test="${classifyId==null&&type=='search'}">
						<li
							class="li_sort sl-active ${orderType==null||orderType=='New'?'sl-active':''}"
							data-sorttype="0"><a
							href="<%=basePath%>classify/search.htm?orderType=New&key=${key}"
							${orderType!='New'?"style='color: #757575'":""}><i>·</i>默认</a></li>
						<li class="li_sort ${orderType=='Sales'?'sl-active':''}"
							data-sorttype="1"><a
							href="<%=basePath%>classify/search.htm?orderType=Sales&key=${key}"
							${orderType!='Sales'?"style='color: #757575'":""}><i>·</i>销量</a></li>
						<li class="li_sort ${orderType=='Price'?'sl-active':''}"
							data-sorttype="3"><a
							href="<%=basePath%>classify/search.htm?orderType=Price&key=${key}"
							${orderType!='Price'?"style='color: #757575'":""}><i>·</i>价格</a></li>
					</c:if>
				</ul>
			</div>
			
			
			<div class="sl-mList sl-mlsl">
				<div class="onload">
					<c:forEach items="${data}" var="goods">
						<div class="mui-row sc-fItem bot-line">
							<div class="sc-cCont sc-cSetImg" id="goodimg" onclick="Jumpproduct(${goods.id},'${huser}')" data-ispay="True">
								<div class="img goodimg" data-gid="${goods.id}">

									<img class="sptplazy" src="<%=basePath%>${goods.image}"
										data-original="http://pic.zstb.cn/images/9557942EBC32352A/s/12203.jpg?583"
										style="max-width: 100%; max-height: 100%;"> <span
										class="oos-sign hidden"></span> <span
										class="mui-badge all-badgegray all-small"
										id="badge_${goods.id}" style="display: none;"></span>
								</div>
								<div class="sc-cDescript">
									<div class="all-gray sc-cdFont">${goods.name}</div>
									<div class="mui-ellipsis all-smgray all-small "></div>
									<div class="mui-ellipsis all-smgray all-small">
										<span> <span class="all-stdred san-price"> <span
												class="oldSanPrice"><del></del></span> <span class="price"></span>
										</span>
										</span> <span class="" style="margin-left: 10px"> <span
											class="all-stdred jan-price"> <span
												class="oldJanPrice"><del></del></span>
												   		<c:if test="${huser!=null}">
                                               					<span class="price">￥${goods.price}</span>
		                                                </c:if>
		                                                <c:if test="${huser==null}">
			                                               		<span class="price">登录看会员价</span>
		                                                </c:if>
										</span>
										</span>
									</div>
								</div>
							</div>
						</div>
					</c:forEach>
				</div>
				<div class="mui-pull-bottom-pocket mui-visibility">
					<div class="mui-pull">
						<div class="mui-pull-loading mui-icon mui-spinner mui-visibility"
							style="display: none;"></div>
						<div class="mui-pull-caption mui-pull-caption-refresh">${fn:length(data)}
							条加载完成</div>
					</div>
				</div>

			</div>


		</div>
	</div>
	
	

	<div id="mm-blocker"></div>
	<nav class="mui-bar mui-bar-tab all" id="botTab"> 
	<a class="mui-tab-item all-gray" onclick="JumpHome();"
		href="javascript:void(0)"> <span
		class="mui-icon iconfont icon-home"></span> <span
		class="mui-tab-label">首页</span>
	</a> 
	<a class="mui-tab-item all-gray mui-active" id="classify"
		href="<%=basePath%>classify/classify.htm"> <span
		class="mui-icon iconfont icon-fenlei"></span> <span
		class="mui-tab-label">分类</span>
	</a> 
	<a class="mui-tab-item all-gray" href="javascript:void(0)"
		onclick="Jumpsousou();"> <span
		class="mui-icon iconfont icon-sousuo"></span> <span
		class="mui-tab-label">搜索</span>
	</a> 
	<a class="mui-tab-item all-gray" href="javascript:void(0)"
		data-navlink="bindok" id="mycart" 
		onclick="cartindex('${huser}')"> <span class="mui-badge all-red"
		id="span-badge" style="display: none"></span> <span
		class="mui-icon iconfont icon-gouwuche"></span> <span
		class="mui-tab-label">购物车</span>
	</a> 
	<a class="mui-tab-item all-gray" href="javascript:void(0)"
		onclick="myindex('${huser}');"> <span
		class="mui-icon iconfont icon-wode"></span> <span
		class="mui-tab-label">我的 </span>
	</a> </nav>

	<script src="<%=basePath%>resources/home/js/mui.min.js" type="text/javascript"></script>
	<script src="<%=basePath%>resources/home/js/jquery.min.js"  type="text/javascript"></script>

	<script type="text/javascript">
	
	
$(function(){
	  var len = $(".onload .bot-line").length;
	  if(len>2) {
		  $("#sl-modules").removeClass("setHeight");
	  }else {
		  $("html").addClass("setHeight");
		  $("body").addClass("setHeight");
		  $("#sl-modules").addClass("setHeight2");
	  }
	  
	  
	  
	
		  
		

})	
	
	
	function Jumpproduct(id,user){
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
	 		location.href = "<%=basePath%>home/goods_product.htm?goodsId="+id;
		}
	}

    function JumpHome(){
		location.href = "<%=basePath%>home/index.htm";
	}
	
	function Jumpsousou(){
		location.href = "<%=basePath%>home/index.htm?search=true";
	}
	
	
	
	
	function myindex(user){
		if(user=="") {
			  var btn = ['现在登录', '再看看'];
	          mui.confirm('请登录后查看', '提示', btn, function (e) {
	              if (e.index == 0) {
	                  var url = "<%=basePath%>my/login.htm";
	                  window.location.href = url;
	              }else {
	             	  $("#botTab a").removeClass("mui-active");
	            	  $("#classify").addClass("mui-active");
	              }
	          });
	          return false;
		}else {
			location.href = "<%=basePath%>my/my_index.htm";
		}
	}
	function cartindex(user){
		if(user=="") {
			  var btn = ['现在登录', '再看看'];
	          mui.confirm('请登录后查看', '提示', btn, function (e) {
	              if (e.index == 0) {
	                  var url = "<%=basePath%>my/login.htm";
	                  window.location.href = url;
	              }else {
	               	  $("#botTab a").removeClass("mui-active");
	            	  $("#classify").addClass("mui-active");
	              }
	          });
	          return false;
		}else {
			location.href = "<%=basePath%>cart/cart_list.htm";
		}
	}

	



        //设置加载效果
        function setLoading() {
            $("body").append('<div class="loading myLoading" style="z-index:999;background: url(<%=basePath%>resources/home/style/images/loading.gif) center center no-repeat;display:none; width: 100px;height: 100px;position: fixed;left: 50%;top: 50%; margin-left:-50px;margin-top:-70px;"></div>');
		}
		$(function() {
			setLoading();
		})

		//正在加载效果 
		function openLoading() {
			$(".myLoading").show();
		}
		//关闭加载2
		function closeLoading() {
			$(".myLoading").hide();
		}
		
		
		
		$(function(){
				$("#btnSearch").click(function () {
				        var url =  "<%=basePath%>classify/search?key=" + $("#key").val() + "&r=" + Math.random();
				        window.location.href = url;
				});
		})
	</script>

	<div class="loading myLoading"
		style="z-index:999;background: url(<%=basePath%>resources/home/style/images/loading.gif) center center no-repeat;display:none; width: 100px;height: 100px;position: fixed;left: 50%;top: 50%; margin-left:-50px;margin-top:-70px;"></div>
</body>
</html>