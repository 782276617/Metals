package com.metals.service;

import java.util.Date;
import java.util.List;
import java.util.Map;

import com.metals.common.pojo.EasyUIDataGridResult;
import com.metals.common.pojo.MetalsResult;
import com.metals.pojo.WjGoods;

public interface GoodsService {

	
	
	EasyUIDataGridResult selectUserListPage(int page, int rows,String goods_name, Integer goods_class,String store_recommended);
	
	MetalsResult updateGoodsId(WjGoods goods);
	
	WjGoods getGoodsId(String id);
	
	MetalsResult deleteGoodsId(String id);
	
	int getGoodsCount(Date beginTime,Date endTime);

	MetalsResult insertGoods(WjGoods advert);
	
	MetalsResult selectClassifyGoods(String orderType,Long id);
	
	List<WjGoods> selectGoodsState(String state,Integer index,Integer page);
	
	List<WjGoods> selectSearchGoods(String search,String orderType);

	List<WjGoods> selectNewGoodsState(String state,Integer index,Integer page);
	
	List<WjGoods> selectSalesGoodsState(String state,Integer index,Integer page);

	int getStockstatus(String[] gIds,Integer[] number, Integer size);
	
	
	
	/**
	 * 商品销量排行
	 * @param page
	 * @param rows
	 * @return
	 */
	Map<String,Object> getGoodsSalesList(int page, int rows,String goods_name, Integer goods_class,String store_recommend);
}
