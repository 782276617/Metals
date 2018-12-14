package com.metals.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import com.metals.common.pojo.MetalsResult;
import com.metals.mapper.WjFavoriteMapper;
import com.metals.pojo.WjFavorite;
import com.metals.pojo.WjFavoriteExample;
import com.metals.pojo.WjFavoriteExample.Criteria;
import com.metals.service.FavoriteService;

@Service
public class FavoriteServiceImpl implements FavoriteService {

	@Autowired
	private WjFavoriteMapper favoriteMapper;
	@Override
	public MetalsResult insertFavorite(WjFavorite favorite) {
		int i = favoriteMapper.insertSelective(favorite);
		if(i>0) {
			return MetalsResult.ok();
		}
		return MetalsResult.build(500, "更新失败！");
	}
	@Override
	public List<WjFavorite> getFavorite(Integer userId, String goodsId) {
		List<WjFavorite> list = null;
		if(userId!=null){
				WjFavoriteExample example = new WjFavoriteExample();
				
				Criteria criteria = example.createCriteria();
				//用户Id
				criteria.andUidEqualTo(userId);
				
				if(!StringUtils.isEmpty(goodsId)){
					//商品Id
					criteria.andGidEqualTo(goodsId);
				}
		
				//查询最新的  并进行排序
				example.setOrderByClause("created desc");
				
				list = favoriteMapper.selectByExample(example);
		}	
		return list;
	}
	@Override
	public MetalsResult delteFavorite(Integer favoriteId) {
		int i = favoriteMapper.deleteByPrimaryKey(favoriteId);
		if(i>0) {
			return MetalsResult.ok();
		}
		return MetalsResult.build(500, "更新失败！");
	}
	@Override
	public MetalsResult deleteFavorite(Integer id) {
		int i = favoriteMapper.deleteByPrimaryKey(id);
		if(i>0){
			return MetalsResult.ok();
		}
		    return MetalsResult.build(500, "删除失败！");
	}
}
