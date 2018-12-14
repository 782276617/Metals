$.extend($.fn, {
    fnTimeCountDown: function (d) {
        this.each(function () {
            var $this = $(this);
            var o = {
                sec: $this.find(".sec"),
                mini: $this.find(".mini"),
                hour: $this.find(".hour"),
                day: $this.find(".day")
            };

            var f = {
                haomiao: function (n) {
                    if (n < 10) return "00" + n.toString();
                    if (n < 100) return "0" + n.toString();
                    return n.toString();
                },
                zero: function (n) {
                    var _n = parseInt(n, 10);//解析字符串,返回整数
                    if (_n > 0) {
                        if (_n <= 9) {
                            _n = "0" + _n
                        }
                        return String(_n);
                    } else {
                        return "00";
                    }
                },
                dv: function () {
                    var _d = $this.data("end");
                    var now = new Date(),
                        endDate = new Date(_d);
                    var dur = (endDate - now.getTime()) / 1000,
                         mss = endDate - now.getTime(),
                         pms = {
                             sec: "00",
                             mini: "00",
                             hour: "00",
                             day: "00"
                         };
                    dur = (endDate - now.getTime()) / 1000;
                    mss = endDate - now.getTime();
                    pms = {
                        sec: "00",
                        mini: "00",
                        hour: "00",
                        day: "00"
                    };
                    if (mss > 0) {
                        pms.sec = f.zero(dur % 60);
                        pms.mini = Math.floor((dur / 60)) > 0 ? f.zero(Math.floor((dur / 60)) % 60) : "00";
                        pms.hour = Math.floor((dur / 3600)) > 0 ? f.zero(Math.floor((dur / 3600)) % 24) : "00";
                        pms.day = Math.floor((dur / 86400)) > 0 ? f.zero(Math.floor(dur / 86400)) : "00";
                    }
                    else {
                        //距离结束时间倒计时
                        var endtime = $this.next().find("#endtime").val();
                        $this.attr("data-end", endtime);
                        endDate = new Date(endtime);

                        dur = (endDate - now.getTime()) / 1000,
                        mss = endDate - now.getTime(),
                        pms = {
                            sec: "00",
                            mini: "00",
                            hour: "00",
                            day: "00"
                        };
                        var seckid = $this.next().find("#seckid").val();//为零是列表页
                        var flag = $this.next().find("#flagid").val();//判断是结束标记 1标识已结束
                      
                        if (mss > 0) {
                            pms.sec = f.zero(dur % 60);
                            pms.mini = Math.floor((dur / 60)) > 0 ? f.zero(Math.floor((dur / 60)) % 60) : "00";
                            pms.hour = Math.floor((dur / 3600)) > 0 ? f.zero(Math.floor((dur / 3600)) % 24) : "00";
                            pms.day = Math.floor((dur / 86400)) > 0 ? f.zero(Math.floor(dur / 86400)) : "00";
                            if (flag == "1") {
                                $this.find("#time").text('已结束');
                            }
                            else {
                                if (seckid != 0) {
                                    $this.find("#time").text('距离活动结束:');
                                    $('#sbtn_' + seckid).text("立即秒杀");
                                    $('#sbtn_' + seckid).attr('href', "javascript:PostOrder('" + seckid + "')")
                                }
                                else {
                                    var btnid = $this.next().find("#btnid").val();
                                    $this.find("#time").text('距离活动结束:');
                                    $('#sbtn_' + btnid).text("立即秒杀");
                                }
                            }
                        }
                        else
                        {
                            if (seckid != 0) {
                                $this.empty();
                                $this.html("<span id=\"time\" class=\"pstock\">已结束</span>")
                                //$this.find("#time").addClass("text_cent");
                                $('#sbtn_' + seckid).text("秒杀已结束");
                                $('#sbtn_' + seckid).attr('href', "javascript:alertmsg('秒杀已结束','" + seckid + "')");
                                $('#sbtn_' + seckid).addClass("btn-ljxqend");

                            }
                            else {
                                var btnid = $this.next().find("#btnid").val();
                                //清除样式 变成已结束
                                var p = $this.parent().parent(".huodong");
                                p.attr('onclick', "javascript:alertmsg('秒杀已结束',"+btnid+")");
                                p.addClass("huodongend");
                                //p.find(".sright").empty();
                                //p.find(".seckill_mod_goods_progress").empty();

                                //p.find(".sright").html("");
                                $this.empty();
                                $this.html("<span id=\"time\" class=\"pstock\">已结束</span>")
                                //$this.find("#time").addClass("text_cent");
                              
                                $this.find("#time").text('已结束');
                                $('#sbtn_' + btnid).text("已结束");
                                $('#sbtn_' + btnid).attr('onclick', "javascript:alertmsg('秒杀已结束',"+btnid+")");
                            }

                        }

                    }
                    return pms;
                },
                ui: function () {
                    if (o.sec) {
                        o.sec.html(f.dv().sec);
                    }
                    if (o.mini) {
                        o.mini.html(f.dv().mini);
                    }
                    if (o.hour) {
                        o.hour.html(f.dv().hour);
                    }
                    if (o.day) {
                        o.day.html(f.dv().day);
                    }
                    setTimeout(f.ui, 1);

                }
            };
            f.ui();
        });
    }
});