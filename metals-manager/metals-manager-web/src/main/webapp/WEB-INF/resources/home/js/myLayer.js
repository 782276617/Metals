var mylayer = new function () {
    var obj = new Object();
    obj.msgView;

    obj.msg = function (msg, time, callfun) {
        var _time = time;
        if (!time)
            _time = 1300;
        if (!msg)
            msg = "还没有提示信息！";

        obj.msgView =  layer.msg(msg, { time: _time }, function () {
            if (callfun)
                callfun();
        });
        return false;
    }

    obj.alert = function (msg, params, callfun) {
        if (!msg)
            msg = "还没有提示信息！";

        layer.alert(msg, params, function (index) {
            if (callfun)
                callfun(index);
            layer.close(index);
        });
        return false;
    }

    //目前支持两个按钮
    obj.confirm = function (msg, params, callfun1, callfun2) {
        var param = { btn: ['确定', '取消'], skin: 'layui-layer-demo', title: '信息提示' };
        if (!params)
            params = param;
        if (!msg)
            msg = "是否确定这样做？";

        layer.confirm(msg, params, function (index) {
            if (callfun1) callfun1(index);
            layer.close(index);
        }, function (index) {
            if (callfun2) callfun2(index);
            layer.close(index);
        });
    }

    return obj;
}