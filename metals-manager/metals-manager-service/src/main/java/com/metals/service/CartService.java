package com.metals.service;

import java.util.Date;
import java.util.List;

import com.metals.common.pojo.MetalsResult;
import com.metals.pojo.WjCart;

public interface CartService {

	MetalsResult insertCart(WjCart cart);
	
	List<WjCart> getCartUidOrGoodsidList(Integer uId, String goodsId);
	
	

	MetalsResult updateCart(WjCart cart);
	
	List<WjCart> getCartInId(List<Integer> cartId);
	
	
	MetalsResult deleteCart(Integer id);
	
	MetalsResult deleteCartList(List<Integer> cartid);
	

	
}
