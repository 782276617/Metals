<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<head>
 <meta name="viewport" content="width=device-width, initial-scale=1.0,maximum=1.0,user-scalable=no">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <title>找回密码</title>
    <!-- Bootstrap -->
    <link href="<%=basePath%>resources/home/style/css/bootstrap.min.css" rel="stylesheet">
            <link href="<%=basePath%>resources/home/style/css/public.css" rel="stylesheet"> 
    
    <link href="<%=basePath%>resources/home/style/css/overAll.css" rel="stylesheet"> 
    <style>
        .table-responsive { margin-bottom: 0; }
        .center-block { display: block; margin-left: auto; margin-right: auto; text-align: center; }
        .btn-text { display: inline-block; width: 22%; height: 2.07em; margin: .5%; line-height: 2.07em; border: 1px solid #e5e5e5; text-align: center; color: #666; background: #f7f7f7; background: -moz-linear-gradient(top,#feffff,#f0f0f0); background: -webkit-gradient(linear,0 0,0 100%,from(#feffff),to(#f0f0f0)); cursor: pointer; }
        .fc-red { color: red; }
        .img-index-nav { width: 26px; /*padding: 10px; border: solid 1px red;*/ }

        .hr5 { margin: 0; padding: 0; height: 5px; min-height: 5px; }
        .mt60 { margin: 60px 0 0 0; }
        #cy-nav { display: none; margin-top: 10px; /*默认显示导航*/ }
        #pagehead { display: none; /*关闭页标题*/ }
        #cy_foot { display: none; }
    </style>

       
     <!-- jQuery (必须在bootstrap.min.js之前引入！赵强坡 2015.05.05) -->
    <script src="<%=basePath%>resources/home/js/hm.js"></script><script src="<%=basePath%>resources/home/js/jquery1.11.2.min.js"></script>

     <script>
var _hmt = _hmt || [];
(function() {
  var hm = document.createElement("script");
  hm.src = "//hm.baidu.com/hm.js?8a541c35c51294cd66cd4c685e196919";
  var s = document.getElementsByTagName("script")[0]; 
  s.parentNode.insertBefore(hm, s);
})();
</script>
<link type="text/css" rel="stylesheet" href="<%=basePath%>resources/home/style/css/layer.css" id="skinlayercss"></head>
<body>
    <a id="top"></a>
    

    <div class="container-fluid">

        
<style>
    
    #cy_foot, #nav1 {
        display: none;
    }
    body {
        background: url(../../resources/home/style/images/beijing.jpg);
        background-repeat: repeat-x;
    }
    .orgBtn {
        border: 2px #fff solid;
        background-color: #ff6a00;
        opacity: 0.9;
        height: 45px;
    }

    .orgBtn:hover, .orgBtn:focus {
        border: 2px #fff solid;
        opacity: 0.9;
        background: rgb(226,108,10);
        height: 45px;
    }
    .container-fluid div {
        margin-bottom:6px;
    }
    .yzDiv {
        display: none;
    }
    #resend{display:none;}
</style>
<div style="height:80px;"></div>
<div class="container-fluid">
    <div class="row telDiv">
        <div class="col-xs-3"></div>
        <div class="col-xs-6 text-center"><h3>找 回 密 码</h3></div>
        <div class="col-xs-3"></div>
    </div>
    <div class="row telDiv">
        <div class="col-xs-1"></div>
        <div class="col-xs-10 text-center">
            <input type="text" placeholder="请输入手机号码" id="user" name="user" class="form-control" style="font-size:18px;height:46px;">
        </div>
        <div class="col-xs-1"></div>
    </div>
     <div class="row">
        <div class="col-sm-10" style="padding-left:30px;padding-right:30px;margin-bottom:10px;">
            <div class="input-group input-group-lg">
                <span class="input-group-addon" style="background-color:white;font-size:14px;">
                    <i class="glyphicon glyphicon-lock"></i>
                </span>
                <input type="password" id="pass" name="pass" class="form-control" style="border-left:0px;" placeholder="密码" aria-describedby="sizing-addon1">
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-sm-10" style="padding-left:30px;padding-right:30px;margin-bottom:10px;">
            <div class="input-group input-group-lg">
                <span class="input-group-addon" style="background-color:white;font-size:14px;">
                    <i class="glyphicon glyphicon-ok-sign"></i>
                </span>
                <input type="password" id="pass2" name="pass2" class="form-control" style="border-left:0px;" placeholder="确认密码" aria-describedby="sizing-addon1">
            </div>
        </div>
    </div>
    
    <div class="row telDiv">
        <div class="col-xs-1"></div>
        <div class="col-xs-10 text-center">
            <input type="button" id="get_vcode" class="btn btn-danger btn-block orgBtn" value="获取验证码">
        </div>
        <div class="col-xs-1"></div>
    </div>

    
    <div class="row yzDiv">
        <div class="col-xs-3"></div>
        <div class="col-xs-6 text-center"><h3>重 置 密 码</h3></div>
        <div class="col-xs-3"></div>
    </div>
    <div class="row yzDiv">
        <div class="col-xs-1"></div>
        <div class="col-xs-10 text-center"> 
            <input type="text" id="vcode" name="vcode" class="form-control" placeholder="验证码" style="font-size:18px;height:46px;" aria-describedby="sizing-addon1" title="请填入手机收到的验证码">
             
        </div>
        <div class="col-xs-1"></div>
    </div>
    <div class="row yzDiv">
        <div class="col-xs-1"></div>
        <div class="col-xs-10 text-center">
            <input type="password" id="pass" name="pass" class="form-control" style="font-size:18px;height:46px;" placeholder="密码" aria-describedby="sizing-addon1">
        </div>
        <div class="col-xs-1"></div>
    </div>
    <div class="row yzDiv">
        <div class="col-xs-1"></div>
        <div class="col-xs-10 text-center">
                <input type="password" id="pass2" name="pass2" class="form-control" style="font-size:18px;height:46px;" placeholder="确认密码" aria-describedby="sizing-addon1">
        </div>
        <div class="col-xs-1"></div>
    </div>
    <div class="row yzDiv">
        <div class="col-xs-1"></div>
        <div class="col-xs-10 text-right">
            <button type="button" id="resend" class="btn" style="padding:6px 8px;font-size:13px;">重发验证码</button>
            <button type="button" id="counter" class="btn" style="padding:6px 8px;font-size:13px;" title="冷却中...">
                重发剩余120秒
            </button>
        </div>
        <div class="col-xs-1"></div>
    </div>

    <div class="row yzDiv">
        <div class="col-xs-1"></div>
        <div class="col-xs-10 text-center">
            <button type="button" id="change_pwd" class="btn btn-danger btn-block orgBtn" style="padding:0;">保存密码</button>
        </div>
        <div class="col-xs-1"></div>
    </div>

</div>
<script src="<%=basePath%>resources/home/js/layer.min.js"></script>
<script> 
    function validatemobile(mobile) {
        var user = $('#user');//---------手机号
        var msg = '';
        if (mobile.length == 0) {
            msg += '请输入手机号码！';
            cytips(msg, user);
            user.focus();
            return false;
        }
        if (mobile.length != 11) {
            msg += '请输入有效的手机号码！';
            cytips(msg, user);
            user.focus();
            return false;
        }

        var myreg = /^(((13[0-9]{1})|(15[0-9]{1})|(17[0-9]{1})|(18[0-9]{1}))+\d{8})$/;
        if (!myreg.test(mobile)) {
            msg += '请输入有效的手机号码！';
            cytips(msg, user);
            user.focus();
            return false;
        }
        return true;
    }

    function vcodeCounter() {
        counter--;
        $counter = $('#counter');
        if (counter <= 0) {
            clearInterval(timer);
            $counter.hide();
            $("#resend").show();
            counter = 120;
        } else {
            $counter.show();
            $counter.text("重发剩余 " + counter + " 秒");
        }
    }
    var counter = 120;
    var timer = 0;

    $("#resend").click(function () {//重发验证码
        var data = {};
        data.user = $('#user').val();
        $.ajax({
            type: 'post',
            url: '/Login/forget_password',
            dataType: 'json',
            data: data,
            success: function (data) {
                if (data.state == "1") {
                    layer.msg(data.info, 3, -1, function () {
                        $("#resend").hide();
                        $('#counter').fadeIn();
                        counter = 120;
                        timer = setInterval("vcodeCounter()", 1000);

                    });

                } else {


                }

            }
        })// ajax end


        return false; // 一定要加这句，防止重复提交，因为form里的button会触发提交
    });

    $("#get_vcode").click(function () {

        if (!validatemobile($('#user').val())) {
            return;
        }
          
        var user = $('#user');//---------手机号 
        var data = {};
        data.user = user.val();
        $.ajax({
            type: 'post',
            url: '/WX_Register/forget_password',
            dataType: 'json',
            data: data,
            success: function (data) {
                if (data.state == "1") {
                    layer.msg(data.info, 3, -1, function () {
                        cytips($("#vcode").attr('title'), $("#vcode"));
                        $('#counter').fadeIn();
                        counter = 120;
                        timer = setInterval("vcodeCounter()", 1000);
                    });

                    $(".yzDiv").each(function (x, y) {
                        $(this).show();
                    });
                    $(".telDiv").each(function (x, y) {
                        $(this).hide();
                    });
                } else {
                    cytips(data.info, $("#user"));
                }

            }
        })// ajax end

        return false;

    });
    function cytips(msg, obj) {
        layer.tips(msg, obj, { guide: 2, time: 2 });
    }
    $("#change_pwd").click(function () {

        if ($("#pass").val() != $("#pass2").val()) {
            layer.msg("两次密码输入不相同", 4, -1);
            return false;
        }

        var data = {};
        data.user = $('#user').val();
        data.pass = $('#pass').val();
        data.vcode = $('#vcode').val();

        $.ajax({
            type: 'post',
            url: '/WX_Register/changePwd',
            dataType: 'json',
            data: data,
            success: function (data) {
                if (data.state == "1") {
                    layer.msg(data.info, 3, -1, function () {
                        layer.load('请稍候，正在跳转……');
                        window.location.href = '/WX1_Passport/index';
                    });

                } else {

                    layer.alert(data.info);
                }

            }
        })// ajax end

        return false;

    });


</script>

        <div class="hr5"></div>
        <div class="row" id="cy_foot">           

            <div class="col-xs-12">
                <div class="row">
                    <div class="col-xs-12">
                        <div class="text-center">
                            技术支持:中山超悦动力网络科技有限公司 网址:<a href="http://www.cywl.cn/">www.cywl.cn</a><br>
                            
                    <a target="_blank" href="http://www.miitbeian.gov.cn/">粤ICP备15033299号. </a>

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
     <div style="margin-bottom: 50px; position: relative;">&nbsp;
        
    </div>

    <!--底部导航条-->
    <div id="nav1" style="z-index: 99;">
        <div class="row">
            <div class="col-xs-2" style="padding-left:1px;padding-right:1px;">
                <a href="http://www.0760wj.com/wx_home/wx_index">
                    <div class="text-center">
                        <div>
                            <img src="<%=basePath%>resources/home/style/images/首页.png">
                        </div>
                        <div>
                            <small>首页</small>
                        </div>
                    </div>
                </a>
            </div>
            <div class="col-xs-2" style="padding-left:1px;padding-right:1px;">
                <a href="http://www.0760wj.com/wx_pcategory/wx_index">
                    <div class="text-center">
                        <div>
                            <img src="<%=basePath%>resources/home/style/images/iconfont-unie668.png">
                        </div>
                        <div>
                            <small>分类</small>
                        </div>
                    </div>
                </a>
            </div>
            <div class="col-xs-2" style="padding-left:1px;padding-right:1px;">
                <a href="http://www.0760wj.com/wx_cart/wx_index">
                    <div class="text-center">
                        <div>
                            <img src="<%=basePath%>resources/home/style/images/购物车.png">
                        </div>
                        <div>
                            <small>购物车</small>
                        </div>
                    </div>
                </a>
            </div>
            <div class="col-xs-2" style="padding-left:1px;padding-right:1px;">
                <a href="http://www.0760wj.com/wx_quick/wx_index">
                    <div class="text-center">
                        <div>
                            <img src="<%=basePath%>resources/home/style/images/快速下单.png">
                        </div>
                        <div>
                            <small>快速下单</small>
                        </div>
                    </div>
                </a>
            </div>
            <div class="col-xs-2" style="padding-left:1px;padding-right:1px;">
                <a href="http://www.0760wj.com/wx_my/wx_index">
                    <div class="text-center">
                        <div>
                            <img src="<%=basePath%>resources/home/style/images/会员中心.png">
                        </div>
                        <div>
                            <small>我的</small>
                        </div>
                    </div>
                </a>
            </div>
            <div class="col-xs-2" style="padding-left:1px;padding-right:1px;">
                
                <a href="javascript:void()" onclick="scanQRCode()">
                     <div class="text-center">
                        <div>
                    <img src="<%=basePath%>resources/home/style/images/扫码.png">
                    </div>
                        <div>
                            <small>扫码</small>
                        </div>
                    </div>
                </a>
            </div>
        </div>

        
    </div>
    <!--底部导航条end-->       
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="<%=basePath%>resources/home/js/bootstrap.min.js"></script>
     <script src="<%=basePath%>resources/home/js/jweixin-1.2.0.js"></script>
     
          
    
    <script>
        wx.config({
            debug: false,
            appId: 'wx71e67514e6c413a7', 
            timestamp: '1537636189', 
            nonceStr: 'E3FC7AD905D9B2896672139995413CF7', 
            signature: 'f6ab22b7c76b2249813e5e9e9c3cfac9b2f159d0',
            jsApiList: ['scanQRCode']
        });
        
    wx.ready(function () {
        // config信息验证后会执行ready方法，所有接口调用都必须在config接口获得结果之后，config是一个客户端的异步操作，所以如果需要在页面加载时就调用相关接口，则须把相关接口放在ready函数中调用来确保正确执行。对于用户触发时才调用的接口，则可以直接调用，不需要放在ready函数中。
        console.log('调用成功(wx.ready!)');
    });

    function scanQRCode() {
        wx.scanQRCode({
            needResult: 1, // 默认为0，扫描结果由微信处理，1则直接返回扫描结果，
            scanType: ["qrCode", "barCode"], // 可以指定扫二维码还是一维码，默认二者都有
            success: function (res) {
                var result = res.resultStr; // 当needResult 为 1 时，扫码返回的结果

                //操作
                $.post("/WX_ProdList/checkScan", { key: result, auth: '', mid: '' }, function (data) {
                    var st = data;
                    if (st.state == 0)
                        layer.msg("没有找到此商品！");
                    else
                        //跳转
                        window.location = '/WX_ProdList/WX_Index?key=' + result.split(",")[1];
                    //window.location='/WX_ProdList/ScanSearch?key='+result;
                }, "json");
            }
        });
    }
    </script>
    <script>
        function pleaseLogin() {            
            layer.confirm('此操作需要绑定微信后才可以进行。是否去绑定？', function () {
                layer.load();
                window.location.href = '/wx_passport/Wx_Login';
            });
            return false;
        }
        
        //layer.alert('旧版商城已停止使用，立即前往新商城！', {
        //     closeBtn: 0
        //}, function () {
        //    window.location.href = '/wx1_home/index';
        //});
    </script>


</body></html>