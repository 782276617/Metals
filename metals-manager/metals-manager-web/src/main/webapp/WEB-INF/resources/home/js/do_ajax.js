/// <reference path="../public/layer3.0.1/layer.js" />
/// <reference path="../jquery-1.10.2.min.js" />
/*
*Ajax 璇锋眰閫氱敤鎿嶄綔绫诲簱
*/
//$.ajaxSetup({ async: false });//娓呴櫎$.post寮傛鏁堟灉
//浠jax post褰㈠紡璇锋眰
function ajax_JsonAjaxPost(url, data, callBack) {
    $.ajax({
        type: "POST",
        url: url,
        data: data,
        dataType: "json",
        success: function (sucessdata) {
            callBack(sucessdata);
        },
        error: function (sucessdata) {

        }
    });
}
//浠jax闈炲紓姝�post褰㈠紡璇锋眰 
function ajax_AjaxPostNoAsync(url, data, callBack) {
    $.ajax({
        type: "POST",
        url: url,
        data: data,
        dataType: "json",
        async: false,
        success: function (sucessdata) {
            callBack(sucessdata);
        },
        error: function (sucessdata) {
            ajax_colsedloadingnew();//鍒犻櫎鍔犺浇鎻愮ず 
        },
        complete: function (sucessdata) {
            ajax_colsedloadingnew();
        }
    });
}
//浠jax get褰㈠紡璇锋眰 
function ajax_JsonAjaxGet(url, data, callBack) {
    $.ajax({
        type: "GET",
        url: url,
        data: data,
        dataType: "json",
        success: function (sucessdata) {
            callBack(sucessdata);
        },
        error: function (sucessdata) {

        }
    });
}

//浠ost褰㈠紡璇锋眰 杩斿洖Json鏁版嵁 
function ajax_Post(url, data, callBack) {
    $.post(url, data, function (sucessdata, status) {
        callBack(sucessdata, status);
    }, "json");
}

//浠et褰㈠紡璇锋眰 杩斿洖Json鏁版嵁 
function ajax_Get(url, data, callBack) {
    $.get(url, data, function (sucessdata, status) {
        callBack(sucessdata, status);
    }, "json");
}

//璺ㄥ煙璇锋眰  鍙兘瑕佹牴鎹疄闄呮儏鍐佃皟鏁磈soncallback鍚嶇О
function ajax_getJSON(url,data,callBack) {
    $.getJSON(url + "&jsoncallback=?", data, function (sucessdata, status) {
        callBack(sucessdata, status);
    });
}


//璁剧疆鍔犺浇鏁堟灉
function setLoading() {
    $("body").append('<div class="loading myLoading" style="z-index:999999;background: url(/sresousrces/style/images/loading.gif) center center no-repeat;display:none; width: 100px;height: 100px;position: fixed;left: 50%;top: 50%; margin-left:-50px;margin-top:-70px;"></div>');
}
$(function () { setLoading(); })

//姝ｅ湪鍔犺浇鏁堟灉 
function ajax_loadingnew() {
    $(".myLoading").show(); 
}
//鍏抽棴鍔犺浇2
function ajax_colsedloadingnew() {
    $(".myLoading").hide();
}
//璇锋眰鍒嗛〉閮ㄥ垎========================================================================================
//鎵撳紑绐楀彛鍙婂搴旈伄缃╁眰
function openView(winObj, thisBg) {
    do_setViewLeftTop(winObj, 0).show();
    $(thisBg).show();
}
//鍏抽棴绐楀彛鍙婂搴旈伄缃╁眰
function closeView(winObj, thisBg) {
    $(winObj).hide();
    $(thisBg).hide();
}

//閫氱敤璇锋眰鏂规硶 鍚屾
function postReqSync(url, param, callBack, loadingView) {
    ajax_loadingnew();//鍔犺浇鎻愮ず   
    ajax_AjaxPostNoAsync(url, param, function (data) {
        var flag = postRulstCheck(data);//閫氱敤杩斿洖淇℃伅鍒ゆ柇

        if (flag === true) {
            callBack(data);
        } else if (flag == "AutoLogin") {
            postReqSync(url, param, callBack, loadingView);
        }
    });
}


//閫氱敤璇锋眰鏂规硶 寮傛
function postReq(url, param, callBack,message, loadingView) {
    ajax_loadingnew();//鍔犺浇鎻愮ず
    $.post(url, param, function (data) {
        ajax_colsedloadingnew();//鍒犻櫎鍔犺浇鎻愮ず    
        var flag = postRulstCheck(data, message);//閫氱敤杩斿洖淇℃伅鍒ゆ柇

        if (flag === true) {
            callBack(data);
        } else if (flag == "AutoLogin") {
            postReq(url, param, callBack, loadingView);
        }
    }, "json");
}
//璇锋眰杩斿洖鍒ゆ柇杈撳嚭淇℃伅 
function postRulstCheck(data, message) {
    var flag = false;
    var showmsg = data.message;
    if (message)
        showmsg = message;
    if (data.msg && !message)
        showmsg = data.msg;

    if (data.code == 1001) {
        layer.confirm(data.message, { btn: ['纭畾'], skin: 'layui-layer-demo' }, function (index) {
            location.href = "http://www.0760wj.com/login";
        });
    } else if (data.code == 505) {
        layer.msg(showmsg, { time: 1300 });
    } else if (data.code == 500) {
        layer.msg(showmsg, { time: 1800 });
    } else if (data.code == 404) {
        layer.msg(showmsg, { time: 1800 });
    } else {
        flag = true;
    }

    return flag;
}



