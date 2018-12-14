

window.requestAFrame = window.requestAnimateFrame || function (call) { return setTimeout(call, 16) };
window.cancelAFrame = window.cancelAnimateFrame || function (ID) { clearTimeout(ID) };
var qitval = 30000;
function seckill_bind(srvtime, urlStock, urlDosec, urlStatus) {
    var servertime = parseDate(srvtime), diff = new Date() - servertime;
    var version = layer.v;//版本号为1.8.5是微信页访问js
    if (diff > 5000 || diff < 200) diff = 1000;
    setTimeout(function () {
        $('.huodong,.hdetail').each(function () {
            var start = $(this).find('.time').data('start');
            start = parseDate(start);
            var intval = start - new Date() - diff;
            if (intval > 0) {
                intval = Math.floor(intval / 1000);
                var i = intval % 60;
                intval = Math.floor(intval / 60);
                var m = intval % 60;
                intval = Math.floor(intval / 60);
                var h = intval % 24;
                var d = Math.floor(intval / 24);
                $(this).find('.day').text(d + "天");
                $(this).find('.hour').text(padZero(h));
                $(this).find('.min').text(padZero(m));
                $(this).find('.sec').text(padZero(i));
            } else {
                if (!$(this).is('.ended') && !$(this).is('.started')) {
                    $(this).find('.down_time p').text('已开始：');
                    $(this).find('.btn-ljxq').text('立即秒杀');
                    $(this).addClass('started');
                }
                intval = Math.floor(-intval / 1000);
                var i = intval % 60;
                intval = Math.floor(intval / 60);
                var m = intval % 60;
                intval = Math.floor(intval / 60);
                var h = intval % 24;
                var d = Math.floor(intval / 24);
                $(this).find('.day').text(d + "天");
                $(this).find('.hour').text(padZero(h));
                $(this).find('.min').text(padZero(m));
                $(this).find('.sec').text(padZero(i));
            }
        });
        setTimeout(arguments.callee, 200);
    }, 200);
    inventory(urlStock);
    //定时更新库存
    //var qitval = 30000;
    //setTimeout(function () {
    //    var func = arguments.callee;
    //    var items = $('.huodong.started,.hdetail.started');
    //    var ids = [];
    //    items.each(function () {
    //        ids.push($(this).data('id'));
    //    });
    //    if (ids.length < 1) return setTimeout(func, qitval);
    //    $.ajax({
    //        url: urlStock,
    //        type: 'POST',
    //        'dataType': 'JSON',
    //        'data': { id: ids.join(',') },
    //        success: function (j) {
    //            if (j.Status == 1) {
    //                var stocks = j.data;
    //                for (var i in stocks) {
    //                    $('.item-' + i + ' .stock').text(stocks[i]);
    //                    if (stocks[i] < 1) {
    //                        $('.item-' + i + ' .btn-ljxq').addClass('disabled').text('秒杀已结束');
    //                        $('.item-' + i).removeClass('started').addClass('ended');
    //                    }
    //                }
    //            }
    //            setTimeout(func, qitval);

    //        }, error: function () {
    //            setTimeout(func, qitval);
    //        }
    //    });
    //}, qitval);
    var inqueue = {};
    $('.huodong .btn-ljxq,.hdetail .btn-ljxq').click(function () {
        if ($(this).is('.disabled')) return;
        var time = $(this).parents('.huodong,.hdetail').find('.time').data('start');
        if (!time) return layer.msg('秒杀时间错误');
        time = parseDate(time);
        if (!time || time.toString() == "Invalid Date") return layer.msg('秒杀时间错误！');
        if (time > new Date()) {
            if (version == "1.8.5") return layer.msg('即将开始！', 2, 9);
            else return layer.msg('即将开始！');
        }
        var id = $(this).data('id');
        if (inqueue[id]) {
            return layer.msg('正在秒杀，别着急！');
        }
        inqueue[id] = true;
        var index = layer.load(1, {
            shade: [0.3, '#000']
        });
        var btn = $(this);
        $.ajax({
            url: urlDosec,
            type: 'GET',
            dataType: 'JSON',
            data: { id: id },
            success: function (j) {
                delete inqueue[id];
                layer.close(index);
                if (j.Status == 0) {
                    layer.alert(j.Msg, function (lid) {
                        if (j.Url) {
                            if (j.Url.indexOf('?') > 0) j.Url += '&';
                            else j.Url += '?';
                            location.href = j.Url + 'returnUrl=' + encodeURIComponent(location.pathname);
                        }
                        layer.close(lid);
                        inventory(urlStock)
                    });
                } else if (j.Status == 2) {
                    layer.alert("您已经秒杀过该商品<br />秒杀订单号: " + j.data, { icon: 1 });
                    inventory(urlStock)
                } else if (j.Status == -1) {
                    layer.msg("秒杀失败！<br />您已经秒杀过该商品，每个会员只有一次机会");
                    inventory(urlStock)
                } else if (j.Status == 3) {
                    layer.msg("秒杀失败！<br />请查看您是否已经秒杀过该商品");
                    inventory(urlStock)
                }
                else {
                    if (version == "1.8.5")
                        var idx = layer.msg(j.Msg, 2, 9);
                    else
                        var idx = layer.msg(j.Msg, { time: 0, icon: 16 });
                    var i = 0;//判断请求次数
                    setTimeout(function () {
                        var func = arguments.callee;
                        $.ajax({
                            url: urlStatus,
                            type: 'GET',
                            dataType: 'JSON',
                            data: { id: id },
                            success: function (j) {
                                if (j.Status == 1) {
                                    inventory(urlStock)
                                    layer.alert("秒杀成功，订单号: " + j.data + "<br />请尽快完成支付", { icon: 1 }, function (index) {
                                        window.location.href = 'http://www.0760wj.com/wx_myord/wx_index'
                                        //if (version == "1.8.5") {
                                        //    window.location.href = 'http://www.0760wj.com/wx_myord/wx_index'
                                        //}
                                        //else {
                                        //    window.location.href = 'http://www.0760wj.com/home/member/myord'
                                        //}
                                    });

                                }
                                else if (j.Status == 0) {
                                    if (i < 3) {
                                        setTimeout(func, 1000);
                                        i += 1;
                                    }
                                    else {
                                        inventory(urlStock)
                                        layer.alert("秒杀成功，请尽快完成支付", { icon: 1 }, function (index) {
                                            window.location.href = 'http://www.0760wj.com/wx_myord/wx_index'
                                            //if (version == "1.8.5") {
                                            //    window.location.href = 'http://www.0760wj.com/wx_myord/wx_index'
                                            //}
                                            //else {
                                            //    window.location.href = 'http://www.0760wj.com/home/member/myord'
                                            //}
                                        });
                                    }
                                }
                                else {
                                    layer.msg("秒杀失败，看看其它商品吧");
                                    inventory(urlStock)
                                }
                            },
                            error: function () {
                                setTimeout(func, 1000);
                            }
                        })
                    }, 1000);
                }
            },
            error: function () {
                delete inqueue[id];
                layer.close(index);
                layer.confirm('真对不住，服务器出错啦，要不要重新试下？', {
                    btn: ['好的', '不用啦'] //按钮
                }, function () {
                    btn.trigger('click');
                }, function () {

                });
            }
        })
    });
}

function padZero(n) {
    return n < 10 ? ('0' + n) : n;
}

function parseDate(str) {
    var matches = str.match(/(\d{4})-(\d{1,2})-(\d{1,2})(?:\s+(\d{1,2})(?::(\d{1,2})(?::(\d{1,2}))?)?)?/);
    var d = new Date();
    if (matches.length > 3) {
        d.setFullYear(matches[1]);
        d.setMonth(matches[2] - 1);
        d.setDate(matches[3]);

        if (matches[4])
            d.setHours(matches[4]);
        else
            d.setHours(0);
        if (matches[5])
            d.setMinutes(matches[5]);
        else
            d.setMinutes(0);
        if (matches[6])
            d.setSeconds(matches[6]);
        else
            d.setSeconds(0);

        return d;
    } else {
        return null;
    }
}
Number.prototype.pad2 = function () {
    return this > 9 ? this : '0' + this;
}
Date.prototype.format = function (format) {
    var it = new Date();
    var it = this;
    var M = it.getMonth() + 1, H = it.getHours(), m = it.getMinutes(), d = it.getDate(), s = it.getSeconds();
    var n = {
        'yyyy': it.getFullYear()
            , 'MM': M.pad2(), 'M': M
            , 'dd': d.pad2(), 'd': d
            , 'HH': H.pad2(), 'H': H
            , 'mm': m.pad2(), 'm': m
            , 'ss': s.pad2(), 's': s
    };
    return format.replace(/([a-zA-Z]+)/g, function (s, $1) { return n[$1]; });
}
//更新库存
function inventory(urlStock) {
    var func = arguments.callee;
    var items = $('.huodong.started,.hdetail.started');
    var ids = [];
    items.each(function () {
        ids.push($(this).data('id'));
    });
    try {
        if (ids.length < 1)
            return setTimeout(func, qitval);
    } catch (e) {
        alert(e.message);
    }
    
    $.ajax({
        url: urlStock,
        type: 'POST',
        'dataType': 'JSON',
        'data': { id: ids.join(',') },
        success: function (j) {
            
            if (j.Status == 1) {
                var stocks = j.data;

                for (var i in stocks) {
                    $('.item-' + i + ' .stock').text(stocks[i]);
                    if (stocks[i] < 1) {
                        $('.item-' + i + ' .btn-ljxq').addClass('disabled').text('秒杀已结束');
                        $('.item-' + i + ' .down_time p').text('已结束：');
                        $('.item-' + i + ' .time').data('start', new Date().format('yyyy-MM-dd HH:mm:ss'))
                        $('.item-' + i).removeClass('started').addClass('ended');
                    }
                }
            }
        }
    });
};