<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html style="overflow-x:auto;overflow-y:auto;">
<head>
	<title>Metals 管理平台 登录</title>
	<meta http-equiv="Content-Type" content="text/html;charset=UTF-8" />
	<meta name="author" content="http://www.91shidu.com/"/>
<meta name="renderer" content="webkit"><meta http-equiv="X-UA-Compatible" content="IE=8,IE=9,IE=10" />
<meta http-equiv="Expires" content="0"><meta http-equiv="Cache-Control" content="no-cache">
<meta http-equiv="Cache-Control" content="no-store">
<link rel="shortcut icon" href="<%=basePath%>resources/login/static/images/favicon.ico"  />
<script src="<%=basePath%>resources/login/jquery/jquery-1.8.3.min.js"  type="text/javascript"></script>
<link href="<%=basePath%>resources/login/bootstrap/2.3.1/css_cerulean/bootstrap.min.css" type="text/css" rel="stylesheet" />
<script src="<%=basePath%>resources/login/bootstrap/2.3.1/js/bootstrap.min.js"  type="text/javascript"></script>
<!--[if lte IE 7]><link href=".resources/login/static/bootstrap/2.3.1/awesome/font-awesome-ie7.min.css" tppabs="http://47.106.99.172:8080/static/bootstrap/2.3.1/awesome/font-awesome-ie7.min.css" type="text/css" rel="stylesheet" /><![endif]-->
<!--[if lte IE 6]><link href=".resources/login/static/bootstrap/bsie/css/bootstrap-ie6.min.css" tppabs="http://47.106.99.172:8080/static/bootstrap/bsie/css/bootstrap-ie6.min.css" type="text/css" rel="stylesheet" />
<script src=".resources/login/static/bootstrap/bsie/js/bootstrap-ie.min.js" tppabs="http://47.106.99.172:8080/static/bootstrap/bsie/js/bootstrap-ie.min.js" type="text/javascript"></script><![endif]-->
<link href="<%=basePath%>resources/login/jquery-validation/1.11.0/jquery.validate.min.css"  type="text/css" rel="stylesheet" />
<script src="<%=basePath%>resources/login/jquery-validation/1.11.0/jquery.validate.min.js"  type="text/javascript"></script>
<link href="<%=basePath%>resources/login/jquery-jbox/2.3/Skins/Bootstrap/jbox.min.css" rel="stylesheet" />
<script src="<%=basePath%>resources/login/jquery-jbox/2.3/jquery.jBox-2.3.min.js"  type="text/javascript"></script>
<script src="<%=basePath%>resources/login/My97DatePicker/WdatePicker.js" ></script>
<script src="<%=basePath%>resources/login/common/mustache.min.js" ></script>
<link href="<%=basePath%>resources/login/common/jstone.min.css"  type="text/css" rel="stylesheet" />
<script src="<%=basePath%>resources/login/common/jstone.min.js"  type="text/javascript"></script>
<script type="text/javascript">var ctx = '/login', ctxStatic='/static';</script>
	<!-- Baidu tongji analytics <script>var _hmt=_hmt||[];(function(){var hm=document.createElement("script");hm.src="//hm.baidu.com/hm.js?82116c626a8d504a5c0675073362ef6f";var s=document.getElementsByTagName("script")[0];s.parentNode.insertBefore(hm,s);})();</script>-->
	
	
	<meta name="decorator" content="blank"/>
	<style type="text/css">
      html,body,table{width:100%;text-align:center;}.form-signin-heading{font-family:Helvetica, Georgia, Arial, sans-serif, 黑体;font-size:36px;margin-bottom:20px;color:#0663a2;}
      .form-signin{position:relative;text-align:left;width:300px;padding:25px 29px 29px;margin:0 auto 20px;background-color:#fff;border:1px solid #e5e5e5;
        	-webkit-border-radius:5px;-moz-border-radius:5px;border-radius:5px;-webkit-box-shadow:0 1px 2px rgba(0,0,0,.05);-moz-box-shadow:0 1px 2px rgba(0,0,0,.05);box-shadow:0 1px 2px rgba(0,0,0,.05);}
      .form-signin .checkbox{margin-bottom:10px;color:#0663a2;} .form-signin .input-label{font-size:16px;line-height:23px;color:#999;}
      .form-signin .input-block-level{font-size:16px;height:auto;margin-bottom:15px;padding:7px;*width:283px;*padding-bottom:0;_padding:7px 7px 9px 7px;}
      .form-signin .btn.btn-large{font-size:16px;} .form-signin #themeSwitch{position:absolute;right:15px;bottom:10px;}
      .form-signin div.validateCode {padding-bottom:15px;} .mid{vertical-align:middle;}
      .header{height:80px;padding-top:20px;} .alert{position:relative;width:300px;margin:0 auto;*padding-bottom:0px;}
      label.error{background:none;width:270px;font-weight:normal;color:inherit;margin:0;}
    </style>
	<script src="<%=basePath%>resources/login/jquery/jquery.backstretch.js"  type="text/javascript"></script>
	<script type="text/javascript">
		$(document).ready(function() {
			$.backstretch([
              "<%=basePath%>resources/login/images/bg1.jpg"/*tpa=http://47.106.99.172:8080/static/images/bg1.jpg*/,
              "<%=basePath%>resources/login/images/bg2.jpg"/*tpa=http://47.106.99.172:8080/static/images/bg2.jpg*/,
              "<%=basePath%>resources/login/images/bg3.jpg"/*tpa=http://47.106.99.172:8080/static/images/bg3.jpg*/,
              "<%=basePath%>resources/login/images/bg4.jpg"/*tpa=http://47.106.99.172:8080/static/images/bg4.jpg*/
            ], {
                fade: 750,
                duration: 4000
            });
			$(window).keydown(function(event){
				  if(event.keyCode==13) {
					  submitFormat();
				  }
			});
			$("#loginForm").click(function(){
				
				submitFormat();
			});
			
			
			function submitFormat(){
				var username = $("#username").val();
				var password = $("#password").val();
				
				if(username==""||password==""){
					alert("账号密码不能为空！");
				}
					
				
				
				if(username!=null&&password!=null) {
					$.ajax({
						type:"post",
						url:"<%=basePath%>admin/login",
						data:{"username":username,"password":password},
						success:function(result) {
							if(result.status==200) {
								location.href="<%=basePath%>admin/manage.htm";
							}else {
								alert("账号或密码错误！请重新输入");
							}
						}
					})
				}
			}
			
		});
	</script>

</head>
<body>
	
	<!--[if lte IE 6]><br/><div class='alert alert-block' style="text-align:left;padding-bottom:10px;"><a class="close" data-dismiss="alert">x</a><h4>温馨提示：</h4><p>你使用的浏览器版本过低。为了获得更好的浏览体验，我们强烈建议您 <a href="javascript:if(confirm(%27http://browsehappy.com/  \n\nThis file was not retrieved by Teleport Ultra, because it is addressed on a domain or path outside the boundaries set for its Starting Address.  \n\nDo you want to open it from the server?%27))window.location=%27http://browsehappy.com/%27" tppabs="http://browsehappy.com/" target="_blank">升级</a> 到最新版本的IE浏览器，或者使用较新版本的 Chrome、Firefox、Safari 等。</p></div><![endif]-->
	<div class="header">
		<div id="messageBox" class="alert alert-error hide"><button data-dismiss="alert" class="close">×</button>
			<label id="loginError" class="error"></label>
		</div>
	</div>
	<h1 class="form-signin-heading">Metals 管理平台</h1>
	<form  class="form-signin" action="<%=basePath%>admin/login" method="post">
		<label class="input-label" for="username">登录名</label>
		<input type="text" id="username" name="username" class="input-block-level required" value="">
		<label class="input-label" for="password">密码</label>
		<input type="password" id="password" name="password" class="input-block-level required">
		
		<input class="btn btn-large btn-primary" style="float: right"  id="loginForm" type="button" value="登 录"/>&nbsp;&nbsp;
		<br/>
		<p></p>
		<p></p>
	</form>
	<div class="footer">
		Copyright &copy; 2012-2017 <a href="">Metals 管理平台</a> - Powered By 
	</div>

</body>
</html>