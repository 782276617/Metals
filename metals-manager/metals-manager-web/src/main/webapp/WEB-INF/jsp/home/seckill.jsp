<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0,maximum=1.0,user-scalable=no">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <title>秒杀列表-*****五金公司|打造中山最大五金批发</title>
    <!-- Bootstrap -->
    <link href="resources/style/css/bootstrap.min.css"  rel="stylesheet">
    <link href="resources/style/css/blue.css" rel="stylesheet" />
    <link href="resources/style/css/overAll.css" rel="stylesheet">

    <link href="resources/style/css/mui.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="resources/style/css/all.css" rel="stylesheet" />


    <style>
        .table-responsive {
            margin-bottom: 0;
        }

        .center-block {
            display: block;
            margin-left: auto;
            margin-right: auto;
            text-align: center;
        }

        .btn-text {
            display: inline-block;
            width: 22%;
            height: 2.07em;
            margin: .5%;
            line-height: 2.07em;
            border: 1px solid #e5e5e5;
            text-align: center;
            color: #666;
            background: #f7f7f7;
            background: -moz-linear-gradient(top,#feffff,#f0f0f0);
            background: -webkit-gradient(linear,0 0,0 100%,from(#feffff),to(#f0f0f0));
            cursor: pointer;
        }

        .fc-red {
            color: red;
        }

        .img-index-nav {
            width: 26px; /*padding: 10px; border: solid 1px red;*/
        }

        .hr5 {
            margin: 0;
            padding: 0;
            height: 5px;
            min-height: 5px;
        }

        .mt60 {
            margin: 60px 0 0 0;
        }

        #cy-nav {
            display: none;
            margin-top: 10px; /*默认显示导航*/
        }

        #pagehead {
            display: none; /*关闭页标题*/
        }

        #cy_foot {
            display: none;
        }
    </style>


    <link href="resources/style/css/pagerstyleswx.css" rel="stylesheet" />

    <link href="resources/style/css/seckillJD.css" rel="stylesheet" />


    <!-- jQuery (必须在bootstrap.min.js之前引入！赵强坡 2015.05.05) -->
    <script src="resources/js/jquery1.11.2.min.js" ></script>

    <script>
        var _hmt = _hmt || [];
        (function() {
            var hm = document.createElement("script");
            hm.src = "resources/js/hm.js-e98a2a4a8cd730f4382796d4d71a7adc.js"/*tpa=http://hm.baidu.com/hm.js?e98a2a4a8cd730f4382796d4d71a7adc*/;
            var s = document.getElementsByTagName("script")[0];
            s.parentNode.insertBefore(hm, s);
        })();
    </script>
</head>
<body>

        
    <header class="mui-bar mui-bar-nav sc-head all-badgered">
        <a class="mui-icon mui-icon-arrowleft mui-pull-left sc-hLeft" href="javascript:history.back()"></a>
        
        <h1 class="mui-title sc-hCent">
           即时秒杀
        </h1>
    </header>

        <div class="container-fluid">
            
            <div style="height:45px;">&nbsp;</div>

            <div>
                <div class="row">
                    <!--内容-->
                    <section class="container main-index main-mb bg_gray">
                        <div class="img_list"></div>
                            <div class="col-xs-12 huodong item-12 huodongend" data-id="12" onclick="alertmsg(&#39;查看详情&#39;,382)">
                                <header class="list-head">
                                    <div class="fnTimeCountDown down_time" data-end="2017/08/09 16:00:00">
                                         <span id="time" class="pstock">已结束</span>
                                    </div>
                                    <div style="display:none" id="vel">
                                        <input type="hidden" id="seckid" value="0" />
                                        <input type="hidden" id="endtime" value="2017/08/09 16:00:00" />
                                        <input type="hidden" id="flagid" value="1" />
                                        <input type="hidden" id="btnid" value="382" />
                                    </div>
                                </header>
                                <div class="media">
                                    <div class="media-left">
                                        <div style="border: 1px solid #eee; width: 102px; height: 102px; overflow: hidden;">
                                            <img class="media-object center-block" src="resources/style/images/350.bmp" >  
                                        </div>
                                    </div>
                                    <div class="media-body">
                                        <p>【秒杀】（金钻）350*25砂轮片 5.99元/片</p>
                                        <div class="pricerow">￥<span>149.75</span></div>
                                        <div>
                                            <del class="doller">￥167.5</del>

                                               <div class="sright">50件抢光啦</div>
                                        </div>
                                    </div>
                                    <span class="skill-count" onclick="alertmsg(&#39;查看详情&#39;,382)" id="sbtn_382">已抢完</span>
                                </div>
                            </div>
                        
                    </section>

                </div>
                <div id="cypager_bottom">
                </div>
            </div>

            <div class="hr5"></div>
            <!--导航begin-->

<div class="row" id="cy-nav">
    <div class="col-xs-3">
        <a href="javascript:if(confirm(%27http://www.0760wj.com/wx_home/wx_index  \n\nThis file was not retrieved by Teleport Ultra, because it is addressed on a domain or path outside the boundaries set for its Starting Address.  \n\nDo you want to open it from the server?%27))window.location=%27http://www.0760wj.com/wx_home/wx_index%27" >
            <div class="text-center">
                <div>
                    <img class="img-circle img-index-nav" src="resources/style/images/iconfont-shouye64.png"  />
                </div>
                <div>
                    首页
                </div>
            </div>

        </a>
    </div>
    <!--分类-->
    <div class="col-xs-3">
        <a href="javascript:if(confirm(%27http://www.0760wj.com/wx_cart/wx_index  \n\nThis file was not retrieved by Teleport Ultra, because it is addressed on a domain or path outside the boundaries set for its Starting Address.  \n\nDo you want to open it from the server?%27))window.location=%27http://www.0760wj.com/wx_cart/wx_index%27" >
            <div class="text-center">
                <div>
                    <img class="img-circle img-index-nav" src="resources/style/images/iconfont-gouwuche64.png"  />
                </div>
                <div>
                    购物车
                </div>
            </div>
        </a>
    </div>
    <!--购物车-->
    <div class="col-xs-3">
        <a href="javascript:if(confirm(%27http://www.0760wj.com/wx_quick/wx_index  \n\nThis file was not retrieved by Teleport Ultra, because it is addressed on a domain or path outside the boundaries set for its Starting Address.  \n\nDo you want to open it from the server?%27))window.location=%27http://www.0760wj.com/wx_quick/wx_index%27" >
            <div class="text-center">
                <div>
                    <img class="img-circle img-index-nav" src="resources/style/images/iconfont-xiadan64.png"  />
                </div>
                <div>
                    快速下单
                </div>
            </div>
        </a>
    </div>
    <!--快速下单-->
    <div class="col-xs-3">
        <a href="javascript:if(confirm(%27http://www.0760wj.com/wx_my/wx_index  \n\nThis file was not retrieved by Teleport Ultra, because it is addressed on a domain or path outside the boundaries set for its Starting Address.  \n\nDo you want to open it from the server?%27))window.location=%27http://www.0760wj.com/wx_my/wx_index%27" >
            <div class="text-center">
                <div>
                    <img class="img-circle img-index-nav" src="resources/style/images/iconfont-wode64.png"  />
                </div>
                <div>
                    我的
                </div>
            </div>
        </a>
    </div>
</div>

            <!--导航end-->

<div class="row" id="pagehead">
    <div class="col-xs-3">
        <div style="color: white; font-weight: 700; padding: 0.2em 1em;">
            <a href="javascript:history.go(-1);">
                <img class="w20" src="resources/style/images/iconfont-bbgxiangzuo.png"  />
            </a>
        </div>
    </div>
    <div class="col-xs-6">
        <div style="text-align:center;border:0;padding:0.5em 1em;font-weight:700;font-size:14px;">
            商品列表
        </div>
    </div>
    <div class="col-xs-3">
        <div style="cursor: pointer; padding: 0.2em; text-align: right;" onclick="javascript:$('#cy-nav').toggle();">
            <img class="w20" src="resources/style/images/iconfont-fenlei32.png"  />
        </div>
    </div>
</div>
            <script type="text/javascript" src="resources/js/36701185513078540.js" ></script>
            
            <script src="resources/js/seckill-wx.js-v=2017032701.js" ></script>
            <script src="resources/js/jquery.unobtrusive-ajax.min.js" ></script>
            <script src="resources/js/layer.js" ></script>
            <script src="resources/js/sec_index.js" ></script>
            <script src="resources/js/jweixin-1.0.0.js" ></script>

            <script>



                //子页专用js
                jQuery(function ($) {
                    $(".fnTimeCountDown").fnTimeCountDown();
                    $(window).scroll(function () {//滚动到底部
                        var $pager = $('#cypager> .clearfix.pagerpnl');
                        var $list = $('#cypager> .list-group');
                        if ($(window).scrollTop() == $(document).height() - $(window).height()) {
                            //$('#cypager_bottom').append($('.cypager'));
                            $pager.insertAfter($list);
                            return;
                        }
                        if ($(document).scrollTop() == 0) {
                            $list.insertAfter($pager);
                            //$('.pagerpnl').append($('.cypager'));
                            //alert('到顶了');
                        }

                    });



                    /********************** 黄钰梁 2017-07-31 设置分享时 title 和 图标 begin**********************/

                    wx.config({
                        debug: false, // 开启调试模式,调用的所有api的返回值会在客户端alert出来，若要查看传入的参数，可以在pc端打开，参数信息会通过log打出，仅在pc端时才会打印。
                        appId: 'wx71e67514e6c413a7', // 必填，公众号的唯一标识
                        timestamp: 1534706958, // 必填，生成签名的时间戳
                        nonceStr: 'A74E0DD19A7F3313FEA3FAA8EC206A24', // 必填，生成签名的随机串
                        signature: '3a5aed98765f41e4d6236a700ab309e9c1a6cf46',// 必填，签名，见附录1
                        jsApiList: ['onMenuShareTimeline', 'onMenuShareAppMessage'] // 必填，需要使用的JS接口列表，所有JS接口列表见附录2
                    });

                    wx.ready(function(){
                        // 获取“分享到朋友圈”按钮点击状态及自定义分享内容接口
                        wx.onMenuShareTimeline({
                            title: '限时秒杀-中兴五金公司|打造中山最大五金批发', // 分享标题
                            link:'WX_index.htm'/*tpa=http://www.0760wj.com/WX1_SecKill/WX_index*/,
                            imgUrl: 'assets/images/Seckill.png'/*tpa=http://www.0760wj.com/assets/images/Seckill.png*/ // 分享图标
                        });
                        // 获取“分享给朋友”按钮点击状态及自定义分享内容接口
                        wx.onMenuShareAppMessage({
                            title:  '限时秒杀-中兴五金公司|打造中山最大五金批发', // 分享标题
                            desc: "点击进入秒杀", // 分享描述
                            link:'WX_index.htm'/*tpa=http://www.0760wj.com/WX1_SecKill/WX_index*/,
                            imgUrl: 'assets/images/Seckill.png'/*tpa=http://www.0760wj.com/assets/images/Seckill.png*/, // 分享图标
                            type: 'link', // 分享类型,music、video或link，不填默认为link
                        });
                    });

                    /********************** 黄钰梁 2017-07-31 设置分享时 title 和 图标 end **********************/





                });
                function alertmsg(msg, seckid) {
                    if (seckid == 0) {
                        layer.msg(msg);
                    }
                    else {
                       // window.location.href = 'http://www.0760wj.com/wx1_seckill/detail?id=' + seckid;
                       window.location.href = 'goods_details.jsp';
                    }
                }

                var img = $(".main-mb.main-index .huodong img");
                var flag = 0;
                for (var i = 0; i < img.length; i++) {
                    var w = parseInt($(img[i]).css("width"));
                    var h = parseInt($(img[i]).css("height"));
                    if (w < h) { flag = -1; } else if (w > h) { flag = 1; } else { flag = 0; }
                    judge(i, flag);
                }
                function judge(i, flag) {
                    if (flag == -1) { $(img[i]).css({ "max-width": "102px", "min-width": "102px", "height": "auto" }); } else if (flag == 1) { $(img[i]).css({ "max-height": "102px", "min-height": "102px", "width": "auto" }); } else { $(img[i]).css({ "max-width": "100%", "max-height": "100%", "min-width": "102px", "min-height": "102px" }); }
                }
            </script>

        </div>
</body>
</html>