window.onload = function () {
    var news = document.getElementById("news-small");
    var hot = document.getElementById("hot-scroll");
    if (news) {
        var h = news.offsetHeight / (news.children.length);
        scrollMarquee("news-small", h, 1800, 1300, "false");
    }
    if (hot) {
        var h1 = hot.offsetHeight / (hot.children.length);
        scrollMarquee("hot-scroll", h1, 8, 2500, "true");
    }
    /* 分类 */
    var h = 60;
    if (document.getElementsByClassName("c-module")[0]) { getEle("c-module", h); getEle("c-mleft", h + 53); getEle("c-mright", h + 53); }
    if (document.getElementsByClassName("s-module")[0]) getEle("s-module", h);

    //if (document.getElementsByClassName("ind-secList")[0]) {
    if (document.getElementById("ind-secListImg-block")) {
        judImg(".ind-secList .mui-slider-item .img-block img", 2);
    }

    //if (document.getElementsByClassName("sc-fItem")[0] && !document.getElementsByClassName("ordt-fItem")[0]) { autoImg(".sc-fItem .sc-cCont img", "98px"); }
    //if (document.getElementsByClassName("ordt-fItem")[0]) { autoImg(".sc-fItem .sc-cCont img", "135px"); }

    mui(".scad-addr,.sccp-scCoup,.cmdt-slider").each(function () {
        h = 54;
        flag(this.className, h);
        if (this.classList.contains('cmdt-slider')) {
            var seth = window.screen.width;
            var changeH = (seth - 60) + "px";
			document.getElementById("cmdt-slider").style.height = changeH;
			mui(".mui-active #sld-a").each(function() {
			    this.style.height = changeH;	
			    this.style.width = seth + "px";
			});
        }
    });
}
function flag(ele, num) {
    if (document.getElementsByClassName(ele)[0]) { getEle(ele, num); }
}
//图片处理
function judImg(ele, h) {
    var w = mui(ele);
    for (var i = 0; i < w.length; i++) {
        mui(w[i])[0].parentNode.style.maxHeight = w[0].width + h + "px";
    }
    autoImg(ele, w[0].width + "px");
}
function autoImg(ele, px) {
    var img = mui(ele);
    var flag = 0;
    for (var i = 0; i < img.length; i++) {
        var w = parseInt(mui(img[i])[0].width);
        var h = parseInt(mui(img[i])[0].height);
        if (w < h) { flag = -1; }
        else if (w > h) { flag = 1; }
        else { flag = 0; }
        judge(i, flag, px);
    }

    function judge(i, flag, px) {
        if (flag == -1) {
            mui(img[i])[0].style.maxWidth = px;
            mui(img[i])[0].style.minWidth = px;
            mui(img[i])[0].style.height = "auto";
        } else if (flag == 1) {
            mui(img[i])[0].style.maxHeight = px;
            mui(img[i])[0].style.minHeight = px;
            mui(img[i])[0].style.maxWidth = "none";
            mui(img[i])[0].style.width = "auto";
        } else {
            mui(img[i])[0].style.maxWidth = "100%";
            mui(img[i])[0].style.maxHeight = "100%";
            mui(img[i])[0].style.minHeight = px;
        }
    }
}

function getEle(ele, h) {
    var h = window.screen.height - h;
    var e = document.getElementsByClassName(ele)[0];
    e.style.height = h.toString() + "px";
    //	e.style.minHeight=h.toString()+"px";
}

function scrollMarquee(ele, h, sp, dt, bool) {
    var p = false;
    var t;
    var o = document.getElementById(ele);
    o.innerHTML += o.innerHTML;
    o.style.marginTop = 0;
    o.onmouseover = function () {
        p = true;
    }
    o.onmouseout = function () {
        p = false;
    }
    console.log(bool);
    if (bool == "false") {
        newsSmall(h, sp, dt, p, t, o);
    } else {
        startmarquee(h, sp, dt, p, t, o);
    }
}

function newsSmall(h, sp, dt, p, t, o) {
    function start() {
        t = setInterval(show, sp);
        if (!p) o.style.marginTop = parseInt(o.style.marginTop) - h - 1 + "px";
    }

    function show() {
        if (parseInt(o.style.marginTop) % h != 0) {
            o.style.marginTop = parseInt(o.style.marginTop) - h + "px";
            if (Math.abs(parseInt(o.style.marginTop)) >= o.scrollHeight / 2) o.style.marginTop = 0;
        } else {
            clearInterval(t);
            setTimeout(start, 0);
        }
    }
    setTimeout(start, dt);
}

function startmarquee(lh, sp, dt, p, t, o) {
    function start() {
        t = setInterval(scrolling, sp);
        if (!p) o.style.marginTop = parseInt(o.style.marginTop) - 1 + "px";
    }

    function scrolling() {
        if (parseInt(o.style.marginTop) % lh != 0) {
            o.style.marginTop = parseInt(o.style.marginTop) - 1 + "px";
            if (Math.abs(parseInt(o.style.marginTop)) >= o.scrollHeight / 2) o.style.marginTop = 0;
        } else {
            clearInterval(t);
            setTimeout(start, dt);
        }
    }
    setTimeout(start, dt);
}


