$(function(){
	/******------------分割线-----------------******/
	  // 点击商品按钮
  $(".goodsCheck").click(function() {
    var goods = $(this).closest(".aui-car-box").find(".goodsCheck"); //获取本店铺的所有商品
    var goodsC = $(this).closest(".aui-car-box").find(".goodsCheck:checked"); //获取本店铺所有被选中的商品
    if (goods.length == goodsC.length) { //如果选中的商品等于所有商品
        $("#AllCheck").prop('checked', true); //全选按钮被选中
        TotalPrice();
    } else { //如果选中的商品不等于所有商品
      $("#AllCheck").prop('checked', false); //全选按钮也不被选中
      // 计算
      TotalPrice();
    }
  });

  // 点击全选按钮
  $("#AllCheck").click(function() {
    if ($(this).prop("checked") == true) { //如果全选按钮被选中
      $(".goods-check").prop('checked', true); //所有按钮都被选中
      TotalPrice();
    } else {
      $(".goods-check").prop('checked', false); //else所有按钮不全选
      TotalPrice();
    }
  });

  //计算
  function TotalPrice() {
    var allprice = 0; //总价
    var total = 0; //每个商品总价
    $(".aui-car-box").each(function() { //循环一次店铺 （当前没有店铺模式，只能默认一个）
      $(this).find(".goodsCheck").each(function() { //循环店铺里面的商品
        if ($(this).is(":checked")) { //如果该商品被选中
            var num = parseInt($(this).parents(".aui-car-box-list-item").find(".num").text()); //得到商品的数量
            var price = parseFloat($(this).parents(".aui-car-box-list-item").find(".price").text()); //得到商品的单价
            total += price * num; //计算单个商品的总价
        }
      });
      allprice += total; //计算商品的总价
    });
    $("#AllTotal").text(allprice.toFixed(2)); //输出全部总价
  }
});

//function getRootPath() {
////    var pathName = window.location.pathname.substring(1);
////    var webName = pathName == '' ? '' : pathName.substring(0, pathName.indexOf('/'));
//    return window.location.protocol + '//' + window.location.host + '/';
//}


