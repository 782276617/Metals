<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
    <title>版本信息</title>
    <script src="Scripts/jquery-1.10.2.min.js"  rel="stylesheet"></script>
    <link href="Content/layui/css/layui.css"   rel="stylesheet"/>
    <script src="Content/layui/layui.js"  rel="stylesheet"></script>
    <script src="Scripts/common/do_ajax.js"  rel="stylesheet"></script>
    <script src="Scripts/common/do_fun.js"  rel="stylesheet"></script>
    <script src="Scripts/common/myLayer.js"  rel="stylesheet"></script>

    
</head>

<body>
    
    

<fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">

    <legend>当前版本：v1.0.0</legend>
</fieldset>
    <div style="padding: 20px; background-color: #F2F2F2;">
        <div class="layui-row layui-col-space15">
            <div class="layui-col-md12">
                暂无版本信息
            </div>
        </div>
    </div>
<br/>

<script>
    layui.use(['element', 'layer'], function () {
    var element = layui.element;
    var layer = layui.layer;

    //监听折叠
    element.on('collapse(test)', function (data) {
        layer.msg('展开状态：' + data.show);
    });
});


</script>
</body>
</html>
