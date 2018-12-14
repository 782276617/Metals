/// <reference path="../public/layer3.0.1/layer.js" />
/// <reference path="../jquery-1.10.2.min.js" />

//回车事件
var do_enterClick = function (callBack) {
    $(document).keypress(function (e) {
        if (e.which == 13) {
            $(callBack).click();
        }
    });
}

var colse_enterClick = function () {
    $(".my_search").unbind('click');
}


var loadLayTable = new function () {
    var obj = new Object();
    var table;
    obj.tabId = null;
    obj.Page = {
        pageIndex: 1,
        pageSize: 15,
        pageCount: 0
    }
    obj.eventArry = [{ eName: "", funName: "" }] //监听单元格对应名称和调用方法

    var active, form;
    var load = function (list_view, url, col_arry, tab_id) {
        layui.use('table', function () {
            table = layui.table;
            form = layui.form;
           
            // var keys = $(".my_keys").val();
            //展示已知数据
            table.render({
                elem: list_view //'#demo'
                , url: url
                , where: { keyword: '' }
                , method: 'post'
                , id: tab_id //生成 Layui table 的标识 id，必须提供，用于后文刷新操作
              , cols: [col_arry]
              , even: true
              , page: true //是否显示分页
              , limits: [10,15, 20, 50, 100]
              , limit: obj.Page.pageSize //每页默认显示的数量
              , curr: 1
              , layout: ['prev', 'page', 'next']
               , curr: location.hash.replace('#!fenye=', '') //获取hash值为fenye的当前页
                , hash: 'fenye' //自定义hash值
              , done: function (res, curr, count) {
                  //如果是异步请求数据方式，res即为你接口返回的信息。
                  //如果是直接赋值的方式，res即为：{data: [], count: 99} data为当前页数据、count为数据总长度
                  console.log(res);

                  //得到当前页码
                  console.log(curr);
                  obj.Page.pageIndex = curr;

                  //得到数据总量
                  console.log(count);
              }
            });

            $ = layui.$, active = {
                getCheckData: function () { //获取选中数据
                    var checkStatus = table.checkStatus(tab_id)
                    , data = checkStatus.data;
                    // layer.alert(JSON.stringify(data));
                    return data;
                }
            };

            //监听单元格事件
            table.on('tool(demoEvent)', function (obj) {
                var data = obj.data;
                //console.info("eventArry", loadLayTable.eventArry)
                //console.info("obj", data)
                $.each(loadLayTable.eventArry, function (index, item) {
                    if (obj.event === item.eName) {
                        item.funName(data);
                    }
                })               
            });

        });
        return obj;
    }   

    obj.bindSubmit = function (sunBtn, callfun) {
        layui.use(['form', 'layedit', 'laydate'], function () {
            //监听提交
            form.on('submit(' + sunBtn + ')', function (data) {
                //console.info(callfun)
                if (callfun != undefined)
                    callfun(data);
                return false;
            });
        });
    }

    //获取选中项
    obj.getCheckData = function (e) {
        return active['getCheckData'].call(e);
    }
    //获取选中个数
    obj.getCheckCount = function (e) {
        return active['getCheckData'].call(e).length;
    }
    //是否全选
    obj.isCheckAll = function (e) {
        return active['getCheckData'].call(e).isAll;
    }

    //重新加载表格
    obj.reload = function (where_param, pageIndex) {
        if (!pageIndex)
            pageIndex = 1;

        var param = {
            where: where_param //设定异步数据接口的额外参数，任意设 { keyword: $(".my_keys").val()}
           , page: { curr: pageIndex }//重新从第 1 页开始
        }
        table.reload(obj.tabId, param);
    }
    //刷新当前页
    obj.refList = function () {
        $(".layui-laypage-btn")[0].click();
    }

    obj.ini = function (load_view, url, col_arry, tab_id) {
        obj.tabId = tab_id;
        load(load_view, url, col_arry, tab_id);
    }
    return obj;
}

var refList = function () {
    table.reload('listReload', {
        where: { //设定异步数据接口的额外参数，任意设
            keyword: $(".my_keys").val()
        }
    });
}


var openView = function (title, content, area, callfun) {
    if (!title)
        title = "编辑";
    if (!area)
        area = ['600px', '400px'];
    //页面层-自定义
    layer.open({
        type: 2, //1 2（iframe）
        title: title,
        area: area,
        //maxmin: true, //最大最小按钮
        closeBtn: 1,
        shadeClose: true,
        skin: 'yourclass',
        content: content, //['/BusinessActivity/CheckStock/LayerUpdateStock?id=' + id, 'yes'], //iframe的url，yes是否有滚动条
        //yes: function (index, layero) {
        //    alert(index);
        //    alert(layero);
        //},
        end: function () {
            //location.reload();
            if (!callfun)
                seachClick();
            else
                callfun();
        }
    });
    colse_enterClick();
}

var layUpFile = new function () {
    var obj = new Object();
    obj.upFile = { name: "", size: 0, isup: false }

    obj.load = function (url, data, showNameView, elem, bindAction, size, tipmsg) {
        if (size == undefined)
            size = 10 * 1024;

        layui.use('upload', function () {
            var $ = layui.jquery
            , upload = layui.upload;
            //选完文件后不自动上传
            upload.render({
                elem: elem
                , url: url
                , auto: false
                //,multiple: true
                , bindAction: bindAction
                , data: data //可选项。额外的参数，如：{id: 123, abc: 'xxx'}
                , accept: 'file' //允许上传的文件类型
                , size: size //最大允许上传的文件大小
                , choose: function (objfile) {
                    //预读本地文件，如果是多文件，则会遍历。(不支持ie8/9)
                    objfile.preview(function (index, file, result) {

                        if (showNameView && showNameView != undefined) {
                            obj.upFile.name = file.name;
                            obj.upFile.size = file.size;
                            $(showNameView).val(file.name);
                        }

                        //console.log(index); //得到文件索引
                        console.log(file); //得到文件对象
                        //console.log(result); //得到文件base64编码，比如图片
                        //这里还可以做一些 append 文件列表 DOM 的操作

                        //obj.upload(index, file); //对上传失败的单个文件重新上传，一般在某个事件中使用
                        //delete files[index]; //删除列表中对应的文件，一般在某个事件中使用
                    });
                }
                , before: function (obj) { //obj参数包含的信息，跟 choose回调完全一致
                    layer.load(); //上传loading
                }
                , done: function (res) {//上传完毕回调
                    console.log(res)
                    if (res.code != 0) {
                        layer.msg(res.msg)
                    } else {
                        obj.upFile.isup = true;
                        //layer.msg(tipmsg)
                        mainView.postSave();
                    }
                    layer.closeAll('loading');

                }
                , error: function (data) {
                    //请求异常回调
                    console.log("上传请求异常回调", data)
                    layer.closeAll('loading'); //关闭loading
                }
            });
        })
    }

    obj.ini = function () {

    }
    return obj;
}

//获取url中的参数值 
var do_getUrlParam = function (name) {
    var ur2 = decodeURIComponent(window.location.search);
    var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)"); //构造一个含有目标参数的正则表达式对象
    var r = ur2.substr(1).match(reg);  //匹配目标参数
    if (r != null) return unescape(r[2]); return null; //返回参数值
}

function checkRedio(checkName) {
    var ids = '';
    $.each($(checkName,dataName), function (val, obj) {
        $(this)[0].checked = $(x)[0].checked;
        if ($(x)[0].checked) {
           return $(this)[0]
        }
    });
    $("#ids").val(ids);
}

var do_redio = new function () {
    var obj = new Object();
    obj.checkData;

    obj.checkbind = function (e, dataName) {
        console.info("单击",dataName)
        obj.checkData = $(e).data(dataName);
    }
    return obj;
}

var do_form = new  function () {
    var obj = new Object();
    obj.getValues = function (formName) {
        var params = obj.getParams(formName);
        var values = {};
        for (x in params) {
            values[params[x].name] = params[x].value;
        }
        return values;
    }

    obj.getParams = function (formName) {
        if (formName.length == 0) { layer.msg("formName不能为空！"); return; }
        return $(formName).serializeArray();
    }
    return obj;
}

var do_validate = new function () {
    var obj = new Object();
    //为空时返回false
    obj.checkEmpty = function (value,msg) {
        if (!value || value.trim().length == 0) {
            layer.msg(msg); return false;
        }
        return true;
    }
    //为0时返回false
    obj.checkZero = function (value, msg) {
        if (value == 0) {
            layer.msg(msg); return false;
        }
        return true;
    }
    return obj;
}