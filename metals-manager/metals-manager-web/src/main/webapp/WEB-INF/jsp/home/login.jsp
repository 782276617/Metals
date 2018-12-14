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
    <title>会员登录</title>
    <!-- Bootstrap -->
    <link href="<%=basePath%>resources/home/style/css/bootstrap.min.css" rel="stylesheet">
    <link href="<%=basePath%>resources/home/style/css/public.css" rel="stylesheet"> 
    <link href="<%=basePath%>resources/home/style/css/alert.css" rel="stylesheet"/>
    
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


<link type="text/css" rel="stylesheet" href="<%=basePath%>resources/home/style/css/layer.css" id="skinlayercss">
</head>
<body>

    

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
<div class="row" style="height: 150px;">


</div>
    <div class="row">
        <div class="col-sm-10" style="padding-left:30px;padding-right:30px;margin-bottom:10px;">
            <div class="input-group input-group-lg">
                <span class="input-group-addon" style="background-color:white;font-size:12.5px;">
                    <i class="glyphicon glyphicon-user"></i>
                </span>
                <input type="text" id="link_man" name="link_man" class="form-control" style="border-left:0px;" placeholder="手机号" aria-describedby="sizing-addon1">
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
    </div>
    <div class="row">
        <div class="col-sm-1">
        </div>
        <div class="col-sm-10" style="padding-left:30px;padding-right:30px;margin-bottom:10px;">
            <button type="button" id="register1"  class="btn btn-danger btn-block orgBtn" style="display: inline;float: left;margin-top: 5px;">立 即 登 录</button> 
           
        </div>
        <div class="col-sm-1">
        </div>
    </div>
</div>
</form>   
<script src="<%=basePath%>resources/home/js/layer.min.js"></script>

<style>
    
        .forget_table { width: 100%; margin: auto auto; }
            .forget_table td { text-align: right; }
        #table02 { display:none; }
</style>

</div>
<script type="text/javascript" src="<%=basePath%>resources/home/js/mui.min.js"></script>
    <script src="<%=basePath%>resources/home/js/bootstrap.min.js"></script>
     <script src="<%=basePath%>resources/home/js/jweixin-1.2.0.js"></script>
</body>
	<script type="text/javascript">
	$("#register1").click(function(){
		var phone = $("#link_man").val();
		var pass = $("#pass").val();
		
		if(phone==""){
			mui.alert("请输入手机号！");
			return false;
		}
		
		if(pass==""){
			mui.alert("请输入密码！");
			return false;
		}
		
		$.ajax({
			type:"post",
			url:"<%=basePath%>my/doLogin",
			data:{"username":phone,"password":pass},
			success:function(result){
				if(result.status==200) {
					   //存储一个带7天期限的cookie
					//setCookie("JSESSIONID",result.msg,(1))
					mui.alert("登录成功！",function(){
						location.href = "<%=basePath%>home/index.htm";
					});
				}else{
					mui.alert("登录失败,账号或密码错误！");
				}
			}
		})
	});
	

/* 	function setCookie(c_name,value,expiredays)
	{
	var exdate=new Date()
	exdate.setDate(exdate.getDate()+expiredays)
	document.cookie=c_name+ "=" +escape(value)+
	((expiredays==null) ? "" : ";expires="+exdate.toGMTString())
	} */
	
	$("#register2").click(function(){
		location.href="<%=basePath%>my/register.htm";
	})
	</script>

</html>