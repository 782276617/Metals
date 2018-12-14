// 插件
// 传参 ele, h, setBool: old_Customer/new_Customer
(function (win, doc, undefined) {
    var autoSetImg = function (ele, h, s, rh) {
        this.eleM = mui(ele);
        this.addedH = parseInt(h);
        this.setBool = s;
        this.resourceH = rh;
        this.init();
    }
    autoSetImg.prototype = {
        constructor: autoSetImg,
        init: function () {
            var _self = this;
            var ele = _self.eleM;
            var h = _self.addedH;
            var s = _self.setBool;
            var rh = _self.resourceH;
            var d = _self.setDisplay;
            _self.judImg(ele, h, s, rh);
        },
        judImg: function (ele, h, s, rh) {
            var _self = this;
            var iEle = ele;
            var w = mui(ele);
            if (s == "old_Customer") {_self.oldAutoImg(iEle);}
            if (s == "new_Customer") { _self.autoImg(iEle, rh);}
        },
        oldAutoImg: function(ele){
            var _self = this;
            var w = mui(ele);
            for (var i = 0; i < w.length; i++) {
                mui(w[i])[0].style.maxWidth = "100%";
                mui(w[i])[0].style.maxHeight = "100%";
            }
        },
        autoImg: function (ele, px) {
            var _self = this;
            var img = mui(ele);
            var flag = 0;
            for (var i = 0; i < img.length; i++) {
                var w = parseInt(mui(img[i])[0].width);
                var h = parseInt(mui(img[i])[0].height);
                if (w < h) { flag = -1; }
                else if (w > h) { flag = 1; }
                else { flag = 0; }
                _self.judge(img, i, flag, px);
            }
        },
        judge: function (img, i, flag, px) {
            if (flag == -1) {
                mui(img[i])[0].style.maxWidth = px;
                mui(img[i])[0].style.minWidth = px;
                mui(img[i])[0].style.width= "100%";
                mui(img[i])[0].style.height = "auto";
                mui(img[i])[0].parentNode.style.display = "block";
            } else if (flag == 1) {
                mui(img[i])[0].style.maxHeight = px;
                mui(img[i])[0].style.minHeight = px;
                mui(img[i])[0].style.maxWidth = "none";
                mui(img[i])[0].style.width = "auto";
                mui(img[i])[0].style.height = "100%";
                mui(img[i])[0].parentNode.style.display = "block";
            } else {
                mui(img[i])[0].style.maxWidth = "100%";
                mui(img[i])[0].style.maxHeight = "100%";
                mui(img[i])[0].style.minHeight = px;
                mui(img[i])[0].style.width = "100%";
                mui(img[i])[0].style.height = "100%";
                mui(img[i])[0].parentNode.style.display = "block";
            }
        }
    }
    win.autoSetImg = autoSetImg;
}(window, document))