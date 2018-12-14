<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

	    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />

    <title>我的-福乾五金机电公司|打造中山最大五金批发</title>
    <link href="<%=basePath%>resources/home/style/css/mui.min.css" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="<%=basePath%>resources/home/style/css/iconfont.css">
    <link rel="stylesheet" type="text/css" href="<%=basePath%>resources/home/style/css/icons-extra.css">
    <link rel="stylesheet" href="<%=basePath%>resources/home/style/css/all.css?12.5" />
    <script src="<%=basePath%>resources/home/js/mui.min.js"></script>
    <script src="<%=basePath%>resources/home/js/iconfont.js"></script>
    <script type="text/javascript" src="<%=basePath%>resources/home/js/packageAnimt.js-1.0.js"></script>
    <script src="https://res.wx.qq.com/open/js/jweixin-1.2.0.js"></script>
		<script src="<%=basePath%>resources/home/js/jquery.min.js"></script>


<script type="text/javascript">

$(function(){
	
	window.setTimeout(parseUrl(),2000)
});

function parseUrl(){
	  var url=location.href;
    var i=url.indexOf('?search=');
    if(i==-1)return;
    var querystr=url.substr(i+8);
		if(querystr){
			$("#key").focus();
		}
}

</script>
	</head>

	<body>



		<div class="mui-content main">
			<div class="top">
				<div class="mui-slider ind-slider">
					<c:if test="${advert==null||fn:length(advert)<=0}">
							<div class="mui-slider-group mui-slider-loop">
								<div
									class="mui-slider-item ind-slider-item mui-slider-item-duplicate">
		
									<a href="javascript:;"> <img class="daolazy"
											alt="/home/list/index" src="<%=basePath%>resources/home/style/images/611.jpg"
											
											data-original="<%=basePath%>resources/home/style/images/611.jpg"
											onerror="this.src='<%=basePath%>resources/home/style/images/no-photo700x300.jpg'" /> </a>
								</div>
								<div class="mui-slider-item ind-slider-item ">
									<a href="javascript:;"> <img class="daolazy"
											alt="/home/list/index" src="<%=basePath%>resources/home/style/images/611.jpg"
											
											data-original="<%=basePath%>resources/home/style/images/611.jpg"
											onerror="<%=basePath%>resources/home/style/images/no-photo700x300.jpg'" /> </a>
								</div>
								<div class="mui-slider-item ind-slider-item ">
									<a href="javascript:;"> <img class="daolazy"
											alt="/home/list/index" src="<%=basePath%>resources/home/style/images/83.jpg"
											data-original="<%=basePath%>resources/home/style/images/83.jpg"
											onerror="this.src='<%=basePath%>resources/home/style/images/no-photo700x300.jpg'" /> </a>
								</div>
								<div class="mui-slider-item ind-slider-item ">
									<a href="javascript:;"> <img class="daolazy"
											alt="/home/list/index" src="<%=basePath%>resources/home/style/images/01150.jpg"
											data-original="<%=basePath%>resources/home/style/images/01150.jpg"
											onerror="this.src='<%=basePath%>resources/home/style/images/no-photo700x300.jpg'" /> </a>
								</div>
								<div
									class="mui-slider-item ind-slider-item ">
		
									<a href="javascript:;"> <img class="daolazy"
											alt="/home/list/index" src="<%=basePath%>resources/home/style/images/0250.jpg"
											data-original="<%=basePath%>resources/home/style/images/0250.jpg"
											onerror="this.src='<%=basePath%>resources/home/style/images/no-photo700x300.jpg'" /> </a>
								</div>
								<div class="mui-slider-item ind-slider-item ">
									<a href="javascript:;"> <img class="daolazy"
											alt="/home/list/index" src="<%=basePath%>resources/home/style/images/0250.jpg"
											data-original="<%=basePath%>resources/home/style/images/0250.jpg"
											onerror="this.src='<%=basePath%>resources/home/style/images/no-photo700x300.jpg'" /> </a>
								</div>
							</div>
					</c:if>
					<c:if test="${advert!=null&&fn:length(advert)>0}">
								<div class="mui-slider-group mui-slider-loop">
								<c:forEach items="${advert}" var="advert" varStatus="status">
								<c:if test="${status.first}">
										<div
											class="mui-slider-item ind-slider-item mui-slider-item-duplicate">
				
											<a href="javascript:;"> <img class="daolazy"
													alt="/home/list/index" src="<%=basePath%>${advert.pic}"
													
													data-original="<%=basePath%>${advert.pic}"
													onerror="this.src='<%=basePath%>resources/home/style/images/no-photo700x300.jpg'" /> </a>
										</div>
										<div class="mui-slider-item ind-slider-item ">
											<a href="javascript:;"> <img class="daolazy"
													alt="/home/list/index" src="<%=basePath%>${advert.pic}"
													
													data-original="<%=basePath%>${advert.pic}"
													onerror="<%=basePath%>resources/home/style/images/no-photo700x300.jpg'" /> </a>
										</div>
									</c:if>
									<c:if test="${!status.first&&!status.last}">
											<div class="mui-slider-item ind-slider-item ">
												<a href="javascript:;"> <img class="daolazy"
														alt="/home/list/index" src="<%=basePath%>${advert.pic}"
														data-original="<%=basePath%>${advert.pic}"
														onerror="this.src='<%=basePath%>resources/home/style/images/no-photo700x300.jpg'" /> </a>
											</div>
									</c:if>
								
								<c:if test="${status.last}">
								<div
									class="mui-slider-item ind-slider-item mui-slider-item-duplicate">
		
									<a href="javascript:;"> <img class="daolazy"
											alt="/home/list/index" src="<%=basePath%>${advert.pic}"
											data-original="<%=basePath%>${advert.pic}"
											onerror="this.src='<%=basePath%>resources/home/style/images/no-photo700x300.jpg'" /> </a>
								</div>
								<div class="mui-slider-item ind-slider-item ">
									<a href="javascript:;"> <img class="daolazy"
											alt="/home/list/index" src="<%=basePath%>${advert.pic}"
											data-original="<%=basePath%>${advert.pic}"
											onerror="this.src='<%=basePath%>resources/home/style/images/no-photo700x300.jpg'" /> </a>
								</div>
								</c:if>
								</c:forEach>
							</div>
					</c:if>
					
					<c:if test="${advert!=null&&fn:length(advert)>0}">
						<div class="mui-slider-indicator" id="ctrl-slider-indicator">
						<c:forEach items="${advert}" varStatus="status">
							<c:if test="${status.first}">
								<div class="mui-indicator mui-active"></div>
							</c:if>
							<c:if test="${!status.first}">
								<div class="mui-indicator "></div>
							</c:if>
						</c:forEach>
						</div>
					</c:if>
					<c:if test="${advert==null||fn:length(advert)<=0}">
						<div class="mui-slider-indicator" id="ctrl-slider-indicator">
								<div class="mui-indicator mui-active"></div>
								<div class="mui-indicator "></div>
								<div class="mui-indicator "></div>
								<div class="mui-indicator "></div>
						</div>
					</c:if>
				</div>
			</div>
			<div class="ind-sliBot">

			</div>
			<div class="ind_search">
				<a class="mui-icon mui-pull-left inp_search">
					<div class="mui-input-row mui-search">
						<input type="text" name="search" placeholder="输入要搜索的产品" id="key">
						<i class="mui-icon iconfont icon-sousuo"></i>
						<button class="ind_search_btn" id="btnSearch">
							搜索
						</button>
					</div> </a>
			</div>
			<div class="mui-slider icon-slider">
				<div class="mui-slider-group">
					<div class="mui-slider-item mui-slider-item-duplicate icon-page">

						<div class="icon-list">
							<a
								href="<%=basePath%>home/newGoods.htm"
								>
								<div class="img">
									<img src="<%=basePath%>resources/home/style/images/ind_07.png"
										 />
								</div>
								<div class="icon-font">
									新品到货
								</div> </a>
						</div>

						<div class="icon-list">
							<a
								href="<%=basePath%>home/sales.htm">
								<div class="img">
									<img src="<%=basePath%>resources/home/style/images/ind_06.png"
									/>
								</div>
								<div class="icon-font">
									促销
								</div> </a>
						</div>

						<div class="icon-list">
							<a
								href="<%=basePath%>classify/classify.htm"
								>
								<div class="img">
									<img src="<%=basePath%>resources/home/style/images/ind_02.png"
										 />
								</div>
								<div class="icon-font">
									分类
								</div> </a>
						</div>
						<div class="icon-list">
							<a href="javascript:;" onclick="myOrder('${huser}')" class=""
								data-url="javascript:;">
								<div class="img">
									<img src="<%=basePath%>resources/home/style/images/ind_01.png"
										 />
								</div>
								<div class="icon-font">
									我的订单
								</div> </a>
						</div>

						<div class="icon-list">
							<a href="javascript:;" onclick="zuijinxiad('${huser}')" class="a_pdLogin"
								data-url="<%=basePath%>home/recentOrders.htm">
								<div class="img">
									<img src="<%=basePath%>resources/home/style/images/ind_09.png"
										 />
								</div>
								<div class="icon-font">
									最近下单
								</div> </a>
						</div>
					</div>
				</div>
			</div>
		
		
			<span id="span_prolist">
		<!--======================= 加载页面===================== -->	
		

<div class="pro-recommend">
                <div class="mui-row ind-seckill ind-produce">
                    <div class="mui-col-xs-10">
                        <li class="mui-table-view-cell">
                            <h4 class="">促销专区</h4>
                        </li>
                    </div>
                    <div class="mui-col-xs-2 hot-more">
                        <li class="mui-table-view-cell">
                        </li>
                    </div>
                    <div class="clear"></div>
                </div>
                <div class="mui-row pro-list">
                			<c:forEach items="${hotSale}" var="hotSale">
		                            <div class="mui-col-xs-6 pro-block bot-line">
		                                <div class="mui-card-content">
		                                <a href="javascript:;" onclick="JumpProduct(${hotSale.id},'${huser}')">
		                                    <div class="img" id="lazy-img" style="height: 159px; width: 149px;" >
		                                        <img class="lazy" src="<%=basePath%>${hotSale.image}" data-original="<%=basePath%>${hotSale.image}" data-link="javascript:viod(0)"  onerror="this.src = '<%=basePath%>resources/home/style/images/noimg.jpg'" style="width: auto; height: auto; max-width: 100%; max-height: 100%; display: inline;">
		                                    </div>
		                                    <div class="mui-card-content-inner pro-ft">
		                                        <p class="warp" >${hotSale.name} </p>
		                                        <div class="mui-ellipsis-2 pri-warp" align="right" style="width: 100%;display: flex;justify-content:space-between;align-items:flex-end;">
		                                                <c:if test="${huser!=null}">
			                                                <span class="all-new-small all-smgray" style="font-size:1.0em">￥${hotSale.price}</span>
		                                                </c:if>
		                                                <c:if test="${huser==null}">
			                                                <span class="all-new-small all-smgray" style="font-size:1.0em">登录看会员价</span>
		                                                </c:if>
		                                        		<span style="color: red;font-size:13px;border: 1px solid red;padding: 0px 4px;"  >购买</span>
		                                        </div>
		                                    </div>
		                                   </a>
		                                </div>
		                            </div>
                			</c:forEach>
                </div>
            </div>
<div class="pro-recommend">
                <div class="mui-row ind-seckill ind-produce">
                    <div class="mui-col-xs-10">
                        <li class="mui-table-view-cell">
                            <h4 class="">新品上市</h4>
                        </li>
                    </div>
                    <div class="mui-col-xs-2 hot-more">
                        <li class="mui-table-view-cell">
                            
                        </li>
                    </div>
                    <div class="clear"></div>
                </div>
                <div class="mui-row pro-list">
						<c:forEach items="${newx}" var="newx">
                            <div class="mui-col-xs-6 pro-block bot-line">
                                <div class="mui-card-content">
                                <a href="javascript:;" onclick="JumpProduct(${newx.id},'${huser}')">
                                    <div class="img" id="lazy-img" style="height: 159px; width: 149px;" >
                                      <img class="lazy" src="<%=basePath%>${newx.image}" data-original="<%=basePath%>${newx.image}" data-link="javascript:viod(0)"  onerror="this.src = '<%=basePath%>resources/home/style/images/noimg.jpg'" style="width: auto; height: auto; max-width: 100%; max-height: 100%; display: inline;">
                                    </div>
                                    <div class="mui-card-content-inner pro-ft">
                                        <p class="warp" >${newx.name} </p>
                                        <div class="mui-ellipsis-2 pri-warp" align="right" style="width: 100%;display: flex;justify-content:space-between;align-items:flex-end;">
                                                         <c:if test="${huser!=null}">
                                               					 <span class="all-new-small all-smgray" style="font-size:1.0em">￥${newx.price}</span>
		                                                </c:if>
		                                                <c:if test="${huser==null}">
			                                                <span class="all-new-small all-smgray" style="font-size:1.0em">登录看会员价</span>
		                                                </c:if>
                                                <span style="color: red;font-size:13px;border: 1px solid red;padding: 0px 4px;"  >购买</span>
                                        </div>
                                    </div>
                                    </a>
                                </div>
                            </div>
						</c:forEach>
                </div>
            </div>
<div class="pro-recommend">
                <div class="mui-row ind-seckill ind-produce">
                    <div class="mui-col-xs-10">
                        <li class="mui-table-view-cell">
                            <h4 class="">热销产品</h4>
                        </li>
                    </div>
                    <div class="mui-col-xs-2 hot-more">
                        <li class="mui-table-view-cell">
                            
                        </li>
                    </div>
                    <div class="clear"></div>
                </div>
                <div class="mui-row pro-list">
						<c:forEach items="${sales}" var="sales">
                            <div class="mui-col-xs-6 pro-block bot-line">
                                <div class="mui-card-content">
                                <a href="javascript:;" onclick="JumpProduct(${sales.id},'${huser}')">
                                    <div class="img" id="lazy-img" style="height: 159px; width: 149px;" >
                                        <img class="lazy" src="<%=basePath%>${sales.image}" data-original="<%=basePath%>${sales.image}" data-link="javascript:viod(0)" onerror="this.src = '<%=basePath%>resources/home/style/images/noimg.jpg'" style="width: auto; height: auto; max-width: 100%; max-height: 100%;">
                                    </div>
                                    <div class="mui-card-content-inner pro-ft">
                                        <p class="warp" >${sales.name}</p>
                                        <div class="mui-ellipsis-2 pri-warp" align="right" style="width: 100%;display: flex;justify-content:space-between;align-items:flex-end;">
                                                
                                                     <c:if test="${huser!=null}">
                                               				 <span class="all-new-small all-smgray" style="font-size:1.0em">￥${sales.price}</span>
		                                                </c:if>
		                                                <c:if test="${huser==null}">
			                                                <span class="all-new-small all-smgray" style="font-size:1.0em">登录看会员价</span>
		                                                </c:if>
                                                
                                                <span style="color: red;font-size:13px;border: 1px solid red;padding: 0px 4px;"  >购买</span>
                                        </div>
                                    </div>
                                    </a>
                                </div>
                            </div>
						</c:forEach>
                </div>
            </div>

<script type="text/javascript">
    mui.ready(function () {
        //商品图片加载
        $("img.lazy").lazyload({
            //placeholder: "<%=basePath%>resources/home/style/images/noimg.jpg",
            effect: "fadeIn",
            threshold: 200
        });
    });
    $(function () {
        $("#span_prolist img.lazy").click(function () {
            var link = $(this).data("link");
            location.href = link;
        });

        // 图片设置 2018-04-09
        judImg(".pro-recommend .pro-block img", 0);
    });

    // 图片设置 2018-04-09
    function judImg(ele, h) {
        var w = mui(ele);
        for (var i = 0; i < w.length; i++) {
            mui(w[i])[0].parentNode.style.height = w[0].parentNode.parentNode.offsetWidth + 10 + "px";
            mui(w[i])[0].parentNode.style.width = w[0].parentNode.parentNode.offsetWidth + "px";
            mui(w[i])[0].style.width = "auto";
            mui(w[i])[0].style.height = "auto";
        }
        var setON = "old_Customer";
        var p = new autoSetImg(ele, h, setON, w[0].parentNode.parentNode.offsetWidth + "px");
    }
</script>


<!-- 
		===================	加载页面  ============================================
 -->
</span>
		</div>
		<script src="<%=basePath%>resources/home/js/jquery.lazyload.min.js"
			></script>
		<script src="<%=basePath%>resources/home/js/autoNewOldImg.js"
			></script>
		<script src="<%=basePath%>resources/home/js/jweixin-1.2.0.js"
			></script>
		<script type="text/javascript">
    var gallery = mui('.ind-slider');
    gallery.slider({
        interval: 5000
    });

    var doman = window.location.host;
    

    mui.ready(function () {

        localStorage.mid = "0";
        localStorage.auth = "0";
        localStorage.nav1 = null;
        //轮播图片加载
        $("img.daolazy").lazyload({
            //placeholder: "resources/style/images/ind_banner.png"/*tpa=http://www.0760wj.comresources/style/images/ind_banner.png*/, 修改 2018-3-19 注释掉
            effect: "fadeIn",
            threshold: 200
        });



        $("#btnSearch").click(function () {
            var url =  "<%=basePath%>classify/search?key=" + $("#key").val() + "&r=" + Math.random();
            window.location.href = url;
        });

    });

    judgeImg(".ind-slider .ind-slider-item img", 0);
    //sliderImg 930*460
    function judgeImg(ele, h) {
        var w = mui(ele);
        for (var i = 0; i < w.length; i++) {
            mui(w[i])[0].parentNode.style.maxHeight = parseInt(w[0].width / 2.02173913) + "px";
        }
        autoJudImg(ele, w[0].width + "px", w[0].parentNode.style.maxHeight);
    }
    function autoJudImg(ele, wpx, hpx) {
        var img = mui(ele);
        var flag = 0;
        for (var i = 0; i < img.length; i++) {
            var w = parseInt(mui(img[i])[0].width);
            var h = parseInt(mui(img[i])[0].height);
            if (w < h) { flag = -1; }
            else if (w > h) { flag = 1; }
            else { flag = 0; }
            judChange(i, flag, wpx, hpx);
        }
        function judChange(i, flag, wpx, hpx) {
            if (flag == -1) {
                mui(img[i])[0].style.maxWidth = wpx;
                mui(img[i])[0].style.minWidth = wpx;
                mui(img[i])[0].style.height = "auto";
            } else if (flag == 1) {
                mui(img[i])[0].style.maxHeight = hpx;
                mui(img[i])[0].style.minHeight = hpx;
                mui(img[i])[0].style.maxWidth = "none";
                mui(img[i])[0].style.width = "auto";
                //防止原图宽已小于window.width
                if (parseInt(mui(img[i])[0].width) < window.screen.width && parseInt(mui(img[i])[0].width) != 0) {
                    mui(img[i])[0].style.maxWidth = wpx;
                    mui(img[i])[0].style.minWidth = wpx;
                    mui(img[i])[0].style.maxHeight = "none";
                    mui(img[i])[0].style.height = "auto";
                }
            } else {
                mui(img[i])[0].style.maxWidth = "100%";
                mui(img[i])[0].style.maxHeight = "100%";
                mui(img[i])[0].style.minHeight = hpx;
            }
        }
    }
</script>
		<nav class="mui-bar mui-bar-tab all" id="botTab">
		<a class="mui-tab-item all-gray   mui-active" id="home"  href="<%=basePath%>home/index.htm"
			> <span
			class="mui-icon iconfont icon-home"></span> <span
			class="mui-tab-label">首页</span> </a>
		<a class="mui-tab-item all-gray"
			href="javascript:void(0)" onclick="JumpUrls();" > <span
			class="mui-icon iconfont icon-fenlei"></span> <span
			class="mui-tab-label">分类</span> </a>
		<a class="mui-tab-item all-gray   "
			href="javascript:void(0)" onclick="Jumpsousou();"> <span
			class="mui-icon iconfont icon-sousuo"></span> <span
			class="mui-tab-label">搜索</span> </a>

		<a class="mui-tab-item all-gray   "
			href="javascript:void(0)"
			data-navlink="bindok" id="mycart" onclick="cartindex('${huser}')"> <span
			class="mui-badge all-red" id="span-badge" style="display: none"></span>
			<span class="mui-icon iconfont icon-gouwuche"></span> <span
			class="mui-tab-label">购物车</span> </a>
		<a class="mui-tab-item all-gray"
			href="javascript:void(0)" onclick="myindex('${huser}');"> 
			<span class="mui-icon iconfont icon-wode"></span> <span
			class="mui-tab-label" >我的 </span> </a>
		</nav>

		<script type="text/javascript">
		
		function JumpProduct(id,user){
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
		            	  $("#home").addClass("mui-active");
		              }
		          });
		          return false;
			}else {
				location.href = "<%=basePath%>my/my_index.htm";
			}
		}
		
		
		function myOrder(user){
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
				location.href = "<%=basePath%>my/orderList.htm";
			}
		}
		
		function  zuijinxiad(user){
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
				location.href = "<%=basePath%>home/recentOrders.htm";
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
		            	  $("#home").addClass("mui-active");
		              }
		          });
		          return false;
			}else {
				location.href = "<%=basePath%>cart/cart_list.htm";
			}
		}
	

		
		function JumpUrls(){
			location.href="<%=basePath%>classify/classify.htm";
		}

        //设置加载效果
        function setLoading() {
            $("body").append('<div class="loading myLoading" style="z-index:999;background: url(<%=basePath%>resources/home/style/images/loading.gif) center center no-repeat;display:none; width: 100px;height: 100px;position: fixed;left: 50%;top: 50%; margin-left:-50px;margin-top:-70px;"></div>');
        }
        $(function () { setLoading(); })

        //正在加载效果 
        function openLoading() {
            $(".myLoading").show();
        }
        //关闭加载2
        function closeLoading() {
            $(".myLoading").hide();
        }
    </script>

	</body>
</html>