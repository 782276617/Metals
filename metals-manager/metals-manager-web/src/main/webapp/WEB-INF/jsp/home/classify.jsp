<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
	
  <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
		<meta name="viewport"
			content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />

		<title>分类-福乾五金机电公司|打造中山最大五金批发</title>
		<link href="<%=basePath%>resources/home/style/css/mui.min.css"
			
			rel="stylesheet" />
		<link rel="stylesheet" type="text/css"
			href="<%=basePath%>resources/home/style/css/iconfont.css"
			>
		<link rel="stylesheet" type="text/css"
			href="<%=basePath%>resources/home/style/css/icons-extra.css"
			>
		<link rel="stylesheet" href="<%=basePath%>resources/home/style/css/all.css-12.5.css"
			/>
		<script src="<%=basePath%>resources/home/js/mui.min.js"
			></script>
		<script src="<%=basePath%>resources/home/js/iconfont.js"
			></script>
		<script type="text/javascript"
			src="<%=basePath%>resources/home/js/packageAnimt.js-1.0.js"
			></script>
		<script src="<%=basePath%>resources/home/js/jweixin-1.2.0.js"
			></script>
		<script src="<%=basePath%>resources/home/js/jquery.min.js"
			></script>
	</head>
	<body>



		<script>
    $(function () {
        $("#btnSearch").click(function () {
                var url =  "<%=basePath%>classify/search?key=" + $("#key").val() + "&r=" + Math.random();
                window.location.href = url;
        });
        mui(".c-mrTitleBar").on("click", ".c-mrulRigDown", function () {
            if (!this.classList.contains("mui-icon-arrowup")) {
                this.parentNode.nextElementSibling.style.display = "none";
                this.classList.remove("mui-icon-arrowdown")
                this.classList.add("mui-icon-arrowup");
            } else {
                this.parentNode.nextElementSibling.style.display = "block";
                this.classList.add("mui-icon-arrowdown");
                this.classList.remove("mui-icon-arrowup");
            }
        });
        linknav();
    });

    var linknav = function () {
        $('[data-link]').click(function () {           
            localStorage.nav1 = $(this).parents(".my_item_nav").attr("id");
            localStorage.nav2 = $(this).data("link");
            localStorage.navid = $(this).attr("id");
            location.href = localStorage.nav2;
        });
        
        if ($('[data-linknav="' + localStorage.nav1 + '"]').length > 0 && localStorage.nav1) {
            $("[data-linknav],.my_item_nav ").removeClass("mui-active");
            $('[data-linknav="' + localStorage.nav1 + '"]').addClass("mui-active");
            $('#' + localStorage.nav1).addClass("mui-active");
        }
        getObj();
    }

    function getObj() {
        var title_id = $("#segmentedControls>.mui-active");
        var list_id = $('#' + localStorage.navid);
        if (list_id.length > 0 && localStorage.navid) {
            change_scroll("segmentedControlContents", list_id);
        }
        change_scroll("segmentedControls", title_id);
    }
    function change_scroll(ele,obj) {
        var scroll_offset = obj.offset();
        document.getElementById(ele).scrollTop = scroll_offset.top - 60;
    }
</script>


		<div class="mui-content main">
			<div class="c-search">
				<div class="mui-row c-searchBlock">
					<div class="mui-col-xs-10 c-inpBlock">
						<a class="a-search-input input-text" href="#"> <i
							class="iconfont icon-sousuo all-smgray"></i> <input type="text"
								id="key" placeholder="输入要搜索的产品" />
							<button class="ind_search_btn s-search-btn" id="btnSearch">
								搜索
							</button> </a>
					</div>
				</div>
			</div>
			<div class="mui-row c-module">
				<div class="mui-col-xs-3 c-mleft">
					<div id="segmentedControls"
						class="mui-segmented-control mui-segmented-control-inverted mui-segmented-control-vertical c-mlblock">
						<c:forEach items="${category}" var="category" varStatus="status">
						<a class="mui-control-item c-mrlg ${status.count==1?'mui-active':''} " href="#content_${category.id}"
							data-linknav="content_${category.id}">${category.name}</a>
						</c:forEach>
					</div>
				</div>
				<div id="segmentedControlContents" class="mui-col-xs-9 c-mright">

				<c:forEach items="${category}" var="cate" varStatus="status">
						<div id="content_${cate.id}"
							class="mui-control-content my_item_nav ${status.count==1?'mui-active':''}">
							<ul class="mui-table-view c-mrul" style="display: block">
							 <c:forEach items="${category2[status.index]}" var="category">
								<li class="mui-table-view-cell c-mrulli">
									<a class="c-block"
										data-link="<%=basePath%>classify/goodsList.htm?classifyId=${category.id}&cifyname=${category.name}"
										id="cListId_${category.id}" href="javascript:;">${category.name}</a>
								</li>
							</c:forEach>
							</ul>
						</div>
				</c:forEach>
				</div>
			</div>
		</div>
		<nav class="mui-bar mui-bar-tab all" id="botTab">
		<a class="mui-tab-item all-gray"  onclick="JumpHome();" href="javascript:void(0)"> <span
			class="mui-icon iconfont icon-home"></span> <span
			class="mui-tab-label">首页</span> </a>
		<a class="mui-tab-item all-gray mui-active"
			id="classifys" href="javascript:void(0)" 
			> <span
			class="mui-icon iconfont icon-fenlei"></span> <span
			class="mui-tab-label">分类</span> </a>
		<a class="mui-tab-item all-gray   "
			href="javascript:void(0)" onclick="Jumpsousou();"
			> <span
			class="mui-icon iconfont icon-sousuo"></span> <span
			class="mui-tab-label">搜索</span> </a>

		<a class="mui-tab-item all-gray   "
			href="javascript:void(0)"
			
			data-navlink="bindok" id="mycart" onclick="cartindex('${huser}')"> <span
			class="mui-badge all-red" id="span-badge" style="display: none"></span>

			<span class="mui-icon iconfont icon-gouwuche"></span> <span
			class="mui-tab-label">购物车</span> </a>
		<a class="mui-tab-item all-gray   "
			href="javascript:void(0)" onclick="myindex('${huser}');"
			> <span
			class="mui-icon iconfont icon-wode"></span> <span
			class="mui-tab-label">我的 </span> </a>
		</nav>

		<script type="text/javascript">

			
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
		            	  $("#classifys").addClass("mui-active");
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
		            	  $("#classifys").addClass("mui-active");
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