//调用
//window.onload = function(){ 
document.addEventListener('DOMContentLoaded', function() {
    init();
});

function init() {
    //点击件散block
    var box = mui('.sc-cbNum');
    var abox;
    for (var o = 0; o < box.length; o++) {
        abox = mui(box[o])[0].querySelectorAll(".sc-cbBlock");
        for (var j = 0; j < abox.length; j++) {
            abox[j].onclick = function () {
                for (var i = 0; i < abox.length; i++) {
                    this.parentNode.getElementsByTagName("span")[i].classList.remove('sc-cbActive');
                }
                this.classList.add("sc-cbActive");
            }
        }
    }
    var n;
    if (document.getElementsByClassName("sc-order")[0]) {
        n = getElementsByClassName("sc-fItem", "sc-order");
        getClassNameLen(n);
    }
    if (document.getElementsByClassName("sl-module")[0]) {
        n = getElementsByClassName("sc-fItem", "sl-module");
        getClassNameLen(n);
    }
    if (document.getElementsByClassName("cmdt-cDetail")[0]) {//.getElementsByClassName("mui-active")[0]
        n = getElementsByClassName("sc-fItem", "cmdt-cDetail");
        getClassNameLen(n);
    }

    mui(".sc-fItem").on("tap", "#delPro", function () {
        this.parentNode.parentNode.remove();
    });

    //document.getElementById("clt-pro").addEventListener("tap",function(){
    //mui(".sc-fItem").on("click", "#clt-pro", function () {
    //    if (!this.classList.contains("clt-iActive")) {
    //        //console.log(this.classList.contains("clt-iActive"));
    //        this.classList.add("clt-iActive");
    //        this.firstChild.classList.remove("mui-icon-extra", "mui-icon-extra-heart");
    //        this.firstChild.classList.add("mui-icon-extra", "mui-icon-extra-heart-filled");
    //    }
    //    else {
    //        //console.log(this.classList.contains("clt-iActive"));
    //        this.classList.remove("clt-iActive");
    //        this.firstChild.classList.remove("mui-icon-extra", "mui-icon-extra-heart-filled");
    //        this.firstChild.classList.add("mui-icon-extra", "mui-icon-extra-heart");
    //    }
    //});

    //点击排列bar
    if (document.getElementsByClassName("sl-mUl")[0]) {
        changeBar(".sl-mUl", "#li", "li", "sl-active");
    }
    if (document.getElementsByClassName("cmdt-cHead")[0]) {
        changeBar(".cmdt-cHead", "#cmdt-chBlock", "div", "cmdt-chbActive");
    }


    //图片-prodlist
    //if (document.getElementsByClassName("sc-fItem")[0] && !document.getElementsByClassName("ordt-fItem")[0]) { autoImg(".sc-fItem .sc-cCont img", "98px"); }


}

// 点击bar 效果
function changeBar(ele,id,tn,act){
//var tagname=id.slice(1); console.log(tagname);
	var lsbar = mui(ele);
	var abox0;
	abox0 = mui(lsbar)[0].querySelectorAll(id);
	for(var j = 0; j < abox0.length; j++) {
		abox0[j].onclick = function() {
			for(var i = 0; i < abox0.length; i++) {
				this.parentNode.getElementsByTagName(tn)[i].classList.remove(act);
			}
			this.classList.add(act);
		}
	}
}

function getClassNameLen(n){
	for(var k = 0; k < n; k++) {
		document.getElementsByClassName('sc-fItem')[k].getElementsByClassName('sc-cbNumbox')[0].setAttribute("id", "sc-cbNumbox" + k);
		change('sc-cbNumbox' + k);
	}
}
// 获取相同类名的div
function getElementsByClassName(n,parent) {
	var classElements = [],
		allElements = document.getElementsByClassName(parent)[0].getElementsByTagName('div');
	for(var i = 0; i < allElements.length; i++) {
		var arr = allElements[i].className.split(' ');
		for(var j = 0; j < allElements[i].className.split(' ').length; j++) {
			if(arr[j] == n) {
				classElements[classElements.length] = arr[j];
			}
		}
	}
	//console.log(classElements);
	return classElements.length;
}

function change(ele, secEle) {
//	mui("#" + ele).on("click", ".sc-btn-numbox-plus", function() {
//		var t = mui("#" + ele + " #sc-cbnInp")[0];
//		//console.log(t.value);
//		t.value = (parseInt(t.value) + 1);
//		if(parseInt(t.value) > 0) {
//			document.getElementById(ele).getElementsByClassName("sc-btn-numbox-minus")[0].removeAttribute('disabled');
//		}
//		return false;
//	});
//	mui("#" + ele).on("click", ".sc-btn-numbox-minus", function() {
//		var t = mui("#" + ele + " #sc-cbnInp")[0];
//		t.value = (parseInt(t.value) - 1);
//		//console.log(t.value);
//		if(parseInt(t.value) <= 0) {
//			document.getElementById(ele).getElementsByClassName("sc-btn-numbox-minus")[0].setAttribute('disabled', 'disabled');
//			t.value = 0;
//			//console.log(t.value);
//		}
//	});
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
        console.log("w:" + w + " h:" + h + " px:" + px);
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