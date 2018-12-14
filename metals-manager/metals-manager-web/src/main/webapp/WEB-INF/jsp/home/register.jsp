<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0,maximum=1.0,user-scalable=no">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <title>会员注册</title>
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

<script src="<%=basePath%>resources/home/js/hm.js"></script>
<script src="<%=basePath%>resources/home/js/jquery1.11.2.min.js"></script>
<link href="<%=basePath%>resources/home/style/css/alert.css" rel="stylesheet"/>
<link type="text/css" rel="stylesheet" href="<%=basePath%>resources/home/style/css/layer.css" id="skinlayercss">
</head>
<body>
    <a id="top"></a>
    

    <div class="container-fluid">

        
<style>
    #imgHead {
        width: 90px;
        height: 90px;
        border-radius: 50%;
        margin-top: 50px;
    }
    /*子页专用样式*/
    /*登录页面*/
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
    
    body {
        background: url('<%=basePath%>resources/home/style/images/beijing.jpg');
        background-repeat: repeat-x;
    }
    #nav1 {
        display: none;
    }  
    i {
    color:#c6c6c6;
    }



</style>
<form method="post">
<div class="container-fluid">
    <div class="row" style="height: 110px;">
    </div>
    <div class="row"> 
        <div class="col-sm-10" style="padding-left:30px;padding-right:30px;margin-bottom:10px;">
            <div class="input-group input-group-lg">
                <span class="input-group-addon" style="background-color:white;font-size:14px;">
                    <i class="glyphicon glyphicon-briefcase"></i>
                </span>
                <input type="text" id="company" name="company" class="form-control" style="border-left:0px;" placeholder="公司名称" aria-describedby="sizing-addon1">
            </div>
        </div>
        
    </div>

    <div class="row">
        <div class="col-sm-10" style="padding-left:30px;padding-right:30px;margin-bottom:10px;">
            <div class="input-group input-group-lg">
                <span class="input-group-addon" style="background-color:white;font-size:12.5px;">
                    <i class="glyphicon glyphicon-user"></i>
                </span>
                <input type="text" id="link_man" name="link_man" class="form-control" style="border-left:0px;" placeholder="联系人" aria-describedby="sizing-addon1">
            </div>
        </div>
    </div>

    <div class="row">
        <div class="col-sm-10" style="padding-left:30px;padding-right:30px;margin-bottom:10px;">
            <div class="input-group input-group-lg">
                <span class="input-group-addon" style="background-color:white;font-size:14px;">
                    <i class="glyphicon glyphicon-phone"></i></span>
                <input type="text" id="mobile" name="mobile" class="form-control" style="border-left:0px;" placeholder="手机" aria-describedby="sizing-addon1">
            </div>
        </div>
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
    
    <div class="row">
        <div class="col-sm-1">
        </div>
        <div class="col-sm-10" style="padding-left:30px;padding-right:30px;margin-bottom:10px;">
            <button type="button" id="register1" class="btn btn-danger btn-block orgBtn">立 即 注 册</button>
        </div>
        <div class="col-sm-1">
        </div>
    </div>
</div>
</form>   
<style>
        .forget_table { width: 100%; margin: auto auto; }
            .forget_table td { text-align: right; }
        #table02 { display:none; }
</style>
</body>
    <!--底部导航条end-->       
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="<%=basePath%>resources/home/js/bootstrap.min.js"></script>
     <script src="<%=basePath%>resources/home/js/jweixin-1.2.0.js"></script>
<script type="text/javascript" src="<%=basePath%>resources/home/js/mui.min.js"></script>
<script>
    $("#register1").click(function () {
    	var company = $("#company").val();
 		var link_man = $("#link_man").val();
 		var mobile = $("#mobile").val();
 		var pass = $("#pass").val();
 		var pass2 = $("#pass2").val();
 		
 		if(company==""){
 			mui.alert("请填写公司名称！");
 			return false;
 		}
 		
 		if(link_man==""){
 			mui.alert("请填写联系人！");
 			return false;
 		}
 		
 		if(mobile==""){
 			mui.alert("请输入手机号！");
 			return false;
 		}
 		if(pass==""){
 			mui.alert("请输入密码！");
 			return false;
 		}
 		
		if(pass2==""){
 			mui.alert("请输入确让密码！");
 			return false;
 		}
		
		if(pass!=pass2) {
			mui.alert("确让密码和密码不一致，请重新输入");
 			return false;
		}
		
		$.ajax({
			type:"post",
			url:"<%=basePath%>my/registerUser",
			data:{"ucompany":company,"urealname":link_man,"uphone":mobile,"upwd":pass},
			success:function(result){
				if("true"==result) {
					mui.alert("注册成功！",function(){
						location.href = "<%=basePath%>my/login.htm";
					});
				}else if("1024"==result){
					mui.alert("该手机号码已被注册！");
				}else{
					mui.alert("服务器忙！注册失败！");
				}
			}
		})
    });
</script>

</html>