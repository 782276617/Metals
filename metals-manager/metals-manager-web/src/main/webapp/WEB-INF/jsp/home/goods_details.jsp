<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0,maximum=1.0,user-scalable=no">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <title>秒杀详情</title>
    <!-- Bootstrap -->
    <link href="assets/wx/bt3.3.4/css/bootstrap.min.css" rel="stylesheet">
    <link href="wxsc/wxhtml/_assets/css/blue.css" rel="stylesheet" />

    <link href="wxsc/wxhtml/_assets/css/overAll.css" rel="stylesheet" >
    <link href="assets_wx1/css/mui.min.css" rel="stylesheet" />
    <script src="assets_wx1/js/mui.min.js" ></script>
    <link rel="stylesheet" href="assets_wx1/css/all.css"  />
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


    <link href="Content/blue/pagerstyleswx.css" rel="stylesheet" />

    <link href="Content/seckillJD.css-v=20170324.css" rel="stylesheet" />

    <!-- jQuery (必须在bootstrap.min.js之前引入！赵强坡 2015.05.05) -->
    <script src="assets/wx/bt3.3.4/js/jquery1.11.2.min.js" ></script>

    <script>
        var _hmt = _hmt || [];
        (function() {
            var hm = document.createElement("script");
            hm.src = "hm.baidu.com/hm.js-e98a2a4a8cd730f4382796d4d71a7adc.js"/*tpa=http://hm.baidu.com/hm.js?e98a2a4a8cd730f4382796d4d71a7adc*/;
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
    <input id="hidIsSeckillWxPay" type="hidden" value="0" />
    <div class="container-fluid">
        <div style="height:45px;">&nbsp;</div>
        <div class="row">
            <!--内容-->

            <section class="container main-index main-mb detail-mb">

                <div class="hdetail item-382 ended" data-id="382" style="background-color:#ffffff;">
                    <div class="img_box col-sm-12">
                        <div class="inner thumbnail">
                            <div class="ctrl_box">
                                <img src="upload/seckill/350.bmp"  />
                            </div>
                        </div>
                    </div>
                    <div class="info col-sm-12">
                        <h3 class="title"></h3>
                        <div class="prod-price-wrap">
                            <div class="prod-price">
                                <span class="yang-pic-price" id="jdPrice-copy">
                                    ￥<span class="big-price">149.75</span>
                                </span>
                            </div>
                            <div class="depreciate-arrival-inform-box">
                                <div class="depreciate-arrival-inform  J_ping" id="depreciateInformPr">当前库存：0 件</div>
                                
                            </div>

                        </div>
                        <p class="pstock" style="">
                            <span>原价：<del>167.5</del></span>
                                <span class="limt_num">限购：1 件</span>

                        </p>
                        <div class="down_time bor_date fnTimeCountDown" data-end="2017/08/09 12:00:00">
                             <span id="time" class="pstock text_cent">已结束</span>
                        </div>
                        <div style="display:none" id="vel">
                            <input type="hidden" id="seckid" value="382" />
                            <input type="hidden" id="endtime" value="2017/08/09 16:00:00" />
                            <input type="hidden" id="flagid" value="1" />
                        </div>
                        <a class="btn btn-default btn-ljxq disabled" href="javascript:alertmsg(&#39;秒杀已结束&#39;,0)" data-id="382" role="button" id="sbtn_382">秒杀已结束</a>
                    </div>
                    <div class="clearfix"></div>
                    <input type="hidden" id="mid" value="0" />
                    <input type="hidden" id="cid" value="" />
                    <input type="hidden" id="a_pay" value="" />
                    <div class="line_empty col-sm-12">&nbsp;</div>
                    <p>
                        <div class="under_line">产品详情</div>
                        <div class="text_indent img_only"><p>金钻350*25砂轮片秒杀价，低至5.99元/片<img src="img.baidu.com/hi/jx2/j_0058.gif" /></p><p>只要你秒我们就送，等你哦。</p><p>数量有限，仅有50件</p></div>
                    </p>

                </div>
            </section>
            
            <div class="modal fade0" id="modal1" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close"><span aria-hidden="true">&times;</span></button>
                        </div>
                        <div class="modal-body">
                            <p style="height:1.8em;overflow-y:hidden;">您成功抢到 </p>
                            <p>数量：<span id="cnt"></span>件</p>
                        </div>
                        <div class="modal-footer">
                            <div class="img" id="a_pay" data-ono="" style="height:1.5em;"><img src="assets/images/btn_pay.png" ></div>
                            <br />
                            
                        </div>
                    </div>
                </div>
            </div>

        </div>
        <!--row end-->
    </div>
    <div class="hr5"></div>
    <!--导航begin-->

<div class="row" id="cy-nav">
    <div class="col-xs-3">
        <a href="javascript:if(confirm(%27http://www.0760wj.com/wx_home/wx_index  \n\nThis file was not retrieved by Teleport Ultra, because it is addressed on a domain or path outside the boundaries set for its Starting Address.  \n\nDo you want to open it from the server?%27))window.location=%27http://www.0760wj.com/wx_home/wx_index%27" >
            <div class="text-center">
                <div>
                    <img class="img-circle img-index-nav" src="wxsc/wxhtml/_assets/img/red/iconfont-shouye64.png"  />
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
                    <img class="img-circle img-index-nav" src="wxsc/wxhtml/_assets/img/red/iconfont-gouwuche64.png"  />
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
                    <img class="img-circle img-index-nav" src="wxsc/wxhtml/_assets/img/red/iconfont-xiadan64.png"  />
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
                    <img class="img-circle img-index-nav" src="wxsc/wxhtml/_assets/img/red/iconfont-wode64.png"  />
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
                <img class="w20" src="wxsc/wxhtml/_assets/img/white/iconfont-bbgxiangzuo.png"  />
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
            <img class="w20" src="wxsc/wxhtml/_assets/img/white/iconfont-fenlei32.png"  />
        </div>
    </div>
</div>

<script type="text/javascript" src="fi000001.axd-d=bshe226jcqvvz7l5k_rkj-5w3qx_veojtzpchmd4clnyrp7ny0spstlsohkukcqk0i5-abrwz2moqi8mq0b8dhp-iifrjktf0qtamctjflya3vbidwhlg0_9vrafhhggc6bi7mgdzuotqmwm-h6zkq2&t=636701185513078540.js" ></script>
    <script src="assets/libs/jquery.unobtrusive-ajax.min.js" ></script>
    <script src="assets/wx/layer2.1/layer.js" ></script>
    <script src="js/v3/seckill-wx.js" ></script>
    <script src="Scripts/jquery.signalR-1.1.4.js" ></script>
    <script src="signalr/hubs.js" ></script>
    <script src="open/js/jweixin-1.0.0.js" ></script>
    <script>
        var sope = 0;
        var chatHub = $.connection.BaseHub;
        jQuery(function ($) {
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
            chatHub.client.SendMsg = function (data) {
                layer.closeAll('loading');
                var json = $.parseJSON(data);
                if (json.status == "0") {
                    layer.msg(json.msg)
                    window.location.href = json.redirturl;
                }
                else if (json.status == "1") {
                    // 秒杀成功返回订单信息  json.orderno 订单号
                    $("#a_pay").attr("data-ono",json.orderno);
                    $("#cnt").html(json.cnt);
                    $("#detail").attr("href", '/wx1_myord/wxOrdDetail?id=' + json.id);
                    //modal1();
                    /**********************改为按参数控制秒杀支付 赵强坡 2017-11-06 **********************/
                    var isSeckillWxPay= $('#hidIsSeckillWxPay').val();
                    if (isSeckillWxPay=="1" || isSeckillWxPay==1) {
                        if ("100" == "200") {
                            Seckill_pay();
                        }
                        else{
                            Seckill_payByYsy();
                        }
                    }else {
                        modal1();
                    }

                }
                else {
                    //$("#sbtn_" + i).removeClass("disabled");
                    layer.msg(json.msg)
                }
            }
            chatHub.client.Updatecid = function (cid) {
                $("#cid").val(cid);
            }
            $.connection.hub.start().done(function () {
                var id = $("#mid").val();
                chatHub.server.sendLogin(id);
                chatHub.server.handleQueue();
            });
            if ('1') {
                $(".fnTimeCountDown").fnTimeCountDown();
            }


            /********************** 黄钰梁 2017-07-31 设置分享时 title 和 图标 begin**********************/
            var doman = window.location.host;
            console.info(doman)
            wx.config({
                debug: false, // 开启调试模式,调用的所有api的返回值会在客户端alert出来，若要查看传入的参数，可以在pc端打开，参数信息会通过log打出，仅在pc端时才会打印。
                appId: 'wx71e67514e6c413a7', // 必填，公众号的唯一标识
                timestamp: 1534708393, // 必填，生成签名的时间戳
                nonceStr: '09EE9E793E4B834BA3A9A0367C8AFE6B', // 必填，生成签名的随机串
                signature: '81bdef14fa1e063681c36aac2f3d28a4b92be244',// 必填，签名，见附录1
                jsApiList: ['onMenuShareTimeline', 'onMenuShareAppMessage'] // 必填，需要使用的JS接口列表，所有JS接口列表见附录2
            });

            wx.ready(function(){
                // 获取“分享到朋友圈”按钮点击状态及自定义分享内容接口
                wx.onMenuShareTimeline({
                    title: '限时秒杀-', // 分享标题
                    link:'detail-id=382.htm'/*tpa=http://www.0760wj.com/wx1_seckill/detail?id=382*/,
                    imgUrl: "http://"+doman+'/upload/seckill/350.bmp', // 分享图标
                    desc: '赶紧戳进来，手慢无！\r\n限时秒杀'+'', // 分享描述
                });
                // 获取“分享给朋友”按钮点击状态及自定义分享内容接口
                wx.onMenuShareAppMessage({
                    title: '', // 分享标题
                    desc: '赶紧戳进来，手慢无！\r\n限时秒杀'+'', // 分享描述
                    link:'detail-id=382.htm'/*tpa=http://www.0760wj.com/wx1_seckill/detail?id=382*/,
                    imgUrl: "http://"+doman+'/upload/seckill/350.bmp', // 分享图标
                    type: 'link', // 分享类型,music、video或link，不填默认为link
                });
            });

            /********************** 黄钰梁 2017-07-31 设置分享时 title 和 图标 end **********************/




        });
        var HAS_CHANGE = 0;
        function alertmsg(msg, seckid) {
            if (seckid == 0) {
                layer.msg(msg);
                return false;
            }
            else {
                PostOrder(seckid);
            }
        }

        var mid = "0";
        var m_phone = "";
        var headimg = "";
        var name = "";
        var isPay = false;
        function PostOrder(i) {

            if(mid == 0){
                mui.confirm('请登录后查看', '提示',  ['现在登录', '再看看'], function (e) {
                    if (e.index == 0) {
                        var url = "/WX1_Passport/index?r=" + Math.random();
                        window.location.href = url;
                    }
                });
            }else{
                $("#sbtn_" + i).addClass("disabled");
                var mid = $("#mid").val();
                var cid = $("#cid").val();
                if(!isPay)
                {
                    isPay = true;
                    chatHub.server.sendWxUsersMsg(mid, i,cid,m_phone,headimg,name,"newshop");
                }
                layer.msg('正在秒杀中,请等待', {
                    icon: 16
                     , shade: 0.01
                });
            }

        }
        function PostOrder1(seckid) {
            $.ajax({
                url: "/wx1_Seckill/Sumit",
                type: "POST",
                async: false,
                timeout: 60 * 1000,
                data: { sec_id: seckid },
                error: function (XMLHttpRequest, textStatus, errorThrown) { alert("请求错误!") },
                success: function (data) {
                    json = $.parseJSON(data);
                    if (json.status == "1") {
                        $("#cnt").html(json.cnt);
                        $("#detail").attr("href", '/wx1_myord/WX_OrdDetail?id=' + json.id);
                        modal1();
                        //window.location.href = 'http://www.0760wj.com/wx_myord/WX_Index/1';//微商城订单列表
                        //window.location.href = 'http://www.0760wj.com/wx_myord/wxOrdDetail/'+json.id;//微商城订单列表
                    }
                    else
                    {
                        layer.msg(json.msg);
                    }
                }
            });

        }
        function modal1() {
            $("#modal1").css("display", "block");
        }
        $(".modal-header .close").bind("click", function () {
            $("#modal1").css("display", "none");
        });


        /********************** 黄钰梁 2017-09-30 秒杀后立即支付 begin**********************/

        //威富通 支付接口和选择跳转  (黄钰梁，2017-06-12 新增，改成请求威富通 支付接口)
        var openid = '';
        function Seckill_pay()
        {
            var no=$("#a_pay").attr("data-ono");
            $.ajax({
                type: 'post',
                url: '/W/GetDimensionalURLNew_WFT?order_no=' + no +"&openid="+openid+"&number=" + Math.random(),
                dataType: 'json',
                data: null,
                success: function (data) {
                    if (data.state == "0") {   
                        //window.location.href = data.info;
                        var pay_info = JSON.parse(data.pay_info);                      
                        WeixinJSBridge.invoke('getBrandWCPayRequest', {
                            "appId": pay_info.appId, //公众号名称，由商户传入
                            "timeStamp": pay_info.timeStamp, //时间戳，自 1970 年以来的秒数
                            "nonceStr": pay_info.nonceStr, //随机串
                            "package": pay_info.package,
                            "signType": pay_info.signType, //微信签名方式:
                            "paySign": pay_info.paySign //微信签名
                        }, 
                        function (res) {
                            if (res.err_msg == "get_brand_wcpay_request:ok") {
                                window.location.href = "http://www.0760wj.com/wx1_myord/wx_index?r=" + Math.random();
                            }
                            // 使用以上方式判断前端返回,微信团队郑重提示：res.err_msg 将在用户支付成功后返回 ok，但并不保证它绝对可靠。
                        });
                    } else {
                        window.location.href = href;
                    }
                }
            });
        }

        function Seckill_payByYsy(){
            var no=$("#a_pay").attr("data-ono");
            $.ajax({
                type: 'post',
                url: '/ScanPay/GetDimensionalURL?orderNo=' + no +"&number=" + Math.random(),
                dataType: 'json',
                data: null,
                success: function (data) {
                    if (data.state == "1") {
                        window.location.href = data.info;
                    } else {
                        window.location.href = href;
                    }
                }
            });
        }
        /********************** 黄钰梁 2017-09-30 秒杀后立即支付 end **********************/

        var img = $(".main-mb.main-index .inner .ctrl_box img");
        var flag = 0;
        var w = parseInt($(img[0]).css("width"));
        var h = parseInt($(img[0]).css("height"));
        if (w < h) { flag = -1; judge(img, flag); } else if (w > h) { flag = 1; judge(img, flag); } else { flag = 0; judge(img, flag); }
        function judge(ele, flag) {
            if (flag == -1) { $(img[0]).parent().css({ "min-height": "none", "height": $(img[0]).parent().css("width") }); $(img[0]).css({ "max-width": "100%", "min-width": "100%", "height": "auto" }); } else if (flag == 1) {
                $(img[0]).css({ "max-height": "290px", "min-height": "290px", "width": "auto" });
            } else { $(img[0]).css({ "max-width": "100%", "max-height": "100%", "min-height": "290px" }); }
        }
    </script>
</body>
</html>