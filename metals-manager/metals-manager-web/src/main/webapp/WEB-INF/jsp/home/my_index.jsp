<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />

    <title>我的-福乾五金机电公司|打造中山最大五金批发</title>
    <link href="<%=basePath%>resources/home/style/css/mui.min.css" rel="stylesheet"/>
    <link rel="stylesheet" type="text/css" href="<%=basePath%>resources/home/style/css/iconfont.css" >
    <link rel="stylesheet" type="text/css" href="<%=basePath%>resources/home/style/css/icons-extra.css" >
    <link rel="stylesheet" href="<%=basePath%>resources/home/style/css/all.css-12.5.css"  />
    <script src="<%=basePath%>resources/home/js/mui.min.js" ></script>
    <script src="<%=basePath%>resources/home/js/iconfont.js" ></script>
    <script type="text/javascript" src="<%=basePath%>resources/home/js/packageAnimt.js-1.0.js" ></script>
    <script src="<%=basePath%>resources/home/js/jweixin-1.2.0.js" ></script>
    <script src="<%=basePath%>resources/home/js/jquery.min.js" ></script>
    <script>
var _hmt = _hmt || [];
(function() {
  var hm = document.createElement("script");
  hm.src = "<%=basePath%>resources/home/js/hm.js-8a541c35c51294cd66cd4c685e196919.js"/*tpa=http://hm.baidu.com/hm.js?8a541c35c51294cd66cd4c685e196919*/;
  var s = document.getElementsByTagName("script")[0]; 
  s.parentNode.insertBefore(hm, s);
})();
</script>
</head>

<body>
    
    

<div class="mui-content main">
    <div class="mui-row u-head">
        <div class="mui-col-xs-12 u-headBlock">
            <div class="u-img img">
                <img id="imgHead"  src="<%=basePath%>resources/head_pic/${huser.upic}"/>
            </div>
            <span class="u-name">${huser.uname}</span>
        </div>
    </div>
    <div class="u-order">
        <div class="mui-row u-orderBlock order-btn" data-typeid="">
            <div class="mui-col-xs-6 u-oLeft"><i class="u-olImg img"><img src="<%=basePath%>resources/home/style/images/user-order.png"  alt="" /></i><span class="u-olCont">我的订单</span></div>
            <div class="mui-col-xs-6 u-oRight all-gray" onclick="AllOrder()">全部订单 <i class="mui-icon mui-icon-arrowright u-oRricon"></i></div>
        </div>
        <div class="mui-row u-oList">
            <div class="mui-col-xs-3 u-olAuto order-btn" data-typeid="1" >
            	<a href="<%=basePath%>my/orderList.htm?tab=1">
                <div class="u-oImg img"><span class="mui-badge all-badgered u-oIcon" id="sp_dcl">${i1}</span><img src="<%=basePath%>resources/home/style/images/user-icon01.png"  alt=""></div>
                <div class="u-ocont all-gray">待处理</div>
            	</a>
            </div>
            <div class="mui-col-xs-3 u-olAuto order-btn" data-typeid="3">
           		<a href="<%=basePath%>my/orderList.htm?tab=2">
                <div class="u-oImg img"><span class="mui-badge all-badgered u-oIcon" id="sp_psz">${i2}</span><img src="<%=basePath%>resources/home/style/images/user-icon02.png"  alt="" /></div>
                <div class="u-ocont all-gray">配货中</div>
              	</a>
            </div>
            <div class="mui-col-xs-3 u-olAuto order-btn" data-typeid="4">
           		<a href="<%=basePath%>my/orderList.htm?tab=3">
                <div class="u-oImg img"><span class="mui-badge all-badgered u-oIcon" id="sp_yfh">${i3}</span><img src="<%=basePath%>resources/home/style/images/user-icon03.png" alt="" /></div>
                <div class="u-ocont all-gray">已送货</div>
                </a>
            </div>
            <div class="mui-col-xs-3 u-olAuto order-btn" data-typeid="5">
            	<a href="<%=basePath%>my/orderList.htm?tab=4">
                <div class="u-oImg img"><span class="mui-badge all-badgered u-oIcon" id="sp_ysh">${i4}</span><img src="<%=basePath%>resources/home/style/images/user-icon04.png"  alt="" /></div>
                <div class="u-ocont all-gray">已收货</div>
                </a>
            </div>
        </div>
    </div>
    <div class="mui-row u-inforList">
        <ul class="mui-table-view">

            <li class="mui-table-view-cell u-iBotline">
                <a class="mui-navigate-right " href="<%=basePath%>cart/my_favorite.htm" data-url="/WX1_MyCollect/index"><i class="u-ibImg img"><img src="<%=basePath%>resources/home/style/images/user-collection.png"  alt="" /></i>我的收藏</a>
            </li>
            <li class="mui-table-view-cell u-iBotline">
                <a class="mui-navigate-right " href="<%=basePath%>cart/my_addres.htm" data-url="/WX1_Addr/WX_Addr"><i class="u-ibImg img"><img src="<%=basePath%>resources/home/style/images/user-address.png"  alt="" /></i>送货地址</a>
            </li>
        </ul>
    </div>
</div>
<script src="<%=basePath%>resources/home/js/jquery.min.js" ></script>
<script type="text/javascript">
    $(document).ready(function () {

        localStorage.mid = "0";
        localStorage.auth = "0";

        var mid = "0";
        var auth = "0";

        if (auth == "1" && mid > 0) {
            $.post("/wx1_myord/Get_OrdTypeCount", {}, function (data) {
                $("#sp_dcl").text(data.待处理);
                $("#sp_psz").text(data.配货中);
                $("#sp_yfh").text(data.已发货);
                $("#sp_ysh").text(data.已收货);
            }, "json");
        }
        

        $(".order-btn").click(function () {
      /*       //window.location.href = $(this).attr("data-typeid");
            if (auth == "1" && mid > 0) {
                var type_id = $(this).attr('data-typeid');
                window.location.href = "http://www.0760wj.com/wx1_myord/wx_index_mid?mid=" + mid + "&auth=" + auth + "&typeid=" + type_id;
            } else {
                var btn = ['现在登录', '再看看'];
                mui.confirm('请登录后查看', '提示', btn, function (e) {
                    if (e.index == 0) {
                        var url = "/WX1_Passport/index" ;
                        window.location.href = url;
                    }
                });
            } */
        });

        $(".a_pdLogin").click(function () {
            //window.location.href = $(this).attr("data-url");
            var dataurl =$(this).attr("data-url");
            if (auth == "1" && mid > 0) {               
                if (dataurl  == "/wx1_passport/Wx_LoginOut") {
                    mui.confirm('是否确定解除绑定？', '提示', ['确定', '取消'], function (e) {
                        if (e.index == 0) {
                            var url = dataurl + "?mid=" + mid + "&auth=" + auth + "&r=" + Math.random();
                            window.location.href = url;
                        }
                    });
                } else {
                    var url = dataurl + "?mid=" + mid + "&auth=" + auth + "&r=" + Math.random();
                    window.location.href = url;
                }              
            }
            else if (dataurl == "/wx1_my/versionList") {
                window.location.href = dataurl;
            }
            else {
                var btn = ['现在登录', '再看看'];
                mui.confirm('请登录后查看', '提示', btn, function (e) {
                    if (e.index == 0) {
                        var url = "/WX1_Passport/index";
                        window.location.href = url;
                    }
                });
            }

        });
    });

    

</script>
    <nav class="mui-bar mui-bar-tab all" id="botTab">
        <a class="mui-tab-item all-gray   "
           href="<%=basePath%>home/index.htm" >
            <span class="mui-icon iconfont icon-home"></span>
            <span class="mui-tab-label">首页</span>
        </a>
        <a class="mui-tab-item all-gray   "
           href="<%=basePath%>classify/classify.htm" >
            <span class="mui-icon iconfont icon-fenlei"></span>
            <span class="mui-tab-label">分类</span>
        </a>
        <a class="mui-tab-item all-gray   "
           href="<%=basePath%>home/index.htm?search=true" >
            <span class="mui-icon iconfont icon-sousuo"></span>
            <span class="mui-tab-label">搜索</span>
        </a>

        <a class="mui-tab-item all-gray   "
           href="<%=basePath%>cart/cart_list.htm" data-navlink="bindok" id="mycart" data-bind="">

                <span class="mui-badge all-red" id="span-badge" style="display:none"></span>
            
            <span class="mui-icon iconfont icon-gouwuche"></span>
            <span class="mui-tab-label">购物车</span>
        </a>
        <a class="mui-tab-item all-gray   mui-active   "
           href="<%=basePath%>my/my_index.htm" >
            <span class="mui-icon iconfont icon-wode"></span>
            <span class="mui-tab-label">我的 </span>
        </a>
    </nav>
    
    <script type="text/javascript">
    
    
    function AllOrder(){
		location.href = "<%=basePath%>my/orderList.htm"; 	
    }
    
    
        localStorage.mid = "0";
        localStorage.auth = "0";

        mui('#botTab').on('tap', 'a', function () {

            var mid = localStorage.mid;
            var auth = localStorage.auth;
            var lastParam = "";//"?mid=" + mid + "&auth=" + auth + "&r=" + Math.random();
            if (this.href.indexOf('?') > -1) {
                lastParam = "";
            }
           
            if (auth == "0" || !auth) {
                if (this.href.indexOf("/WX1_Cart/WX_Index") > 0) {
                    var btn = ['现在登录', '再看看'];
                    mui.confirm('请登录后查看', '提示', btn, function (e) {
                        if (e.index == 0) {
                            var url = "/WX1_Passport/index";
                            window.location.href = url;
                        }
                    });
                }
                else {
                       document.location.href = this.href + lastParam;
                }
            } else {
                var isbind = $("#mycart").data("bind");
                if (isbind === true || isbind === "")
                    document.location.href = this.href + lastParam;
                else //列表页 且输入数与请求数不一致时
                {
                    reqBind(lastInputId, lastInpuName, lastInputNum, lastInputType, this.href + lastParam);
                }
              //  document.location.href = this.href + lastParam;
            }

        });

      

       

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