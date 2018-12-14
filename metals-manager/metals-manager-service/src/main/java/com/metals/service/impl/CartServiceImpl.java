package com.metals.service.impl;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import com.metals.common.pojo.MetalsResult;
import com.metals.mapper.WjCartMapper;
import com.metals.pojo.WjCart;
import com.metals.pojo.WjCartExample;
import com.metals.pojo.WjCartExample.Criteria;
import com.metals.service.CartService;

@Service
public class CartServiceImpl implements CartService {

	@Autowired
	private WjCartMapper cartMapper;
	
	@Override
	public MetalsResult insertCart(WjCart cart) {
		int i = cartMapper.insertSelective(cart);
		if(i>0) {
			MetalsResult.ok();
		}
		return MetalsResult.build(500, "加入失败！");
	}

	@Override
	public List<WjCart> getCartUidOrGoodsidList(Integer uId,String goodsId) {
		if(uId!=null||!StringUtils.isEmpty(goodsId)) {
			WjCartExample example = new WjCartExample();
			Criteria criteria = example.createCriteria();
			if(uId!=null){
				criteria.andUidEqualTo(uId);
			}
			if(goodsId!=null) {
				criteria.andGidEqualTo(goodsId);
			}
			
			example.setOrderByClause("created desc");
			
			List<WjCart> list = cartMapper.selectByExample(example);
			return list;
		}else {
			return null;
		}
	
	}

	@Override
	public MetalsResult updateCart(WjCart cart) {
		int i = cartMapper.updateByPrimaryKeySelective(cart);
		if(i>0) {
			MetalsResult.ok();
		}
		return MetalsResult.build(500, "更新失败！");
	}

	@Override
	public List<WjCart> getCartInId(List<Integer> cartId) {
		WjCartExample example = new WjCartExample();
		Criteria criteria = example.createCriteria();
		criteria.andIdIn(cartId);
		List<WjCart> list = cartMapper.selectByExample(example);
		return list;
	}

	@Override
	public MetalsResult deleteCart(Integer id) {
		int i = cartMapper.deleteByPrimaryKey(id);
		if(i>0){
			return MetalsResult.ok();
		}
		    return MetalsResult.build(500, "删除失败！");
	}

	@Override
	public MetalsResult deleteCartList(List<Integer> cartid) {
		for (Integer integer : cartid) {
			deleteCart(integer);
		}
		return MetalsResult.ok();
	}


}
