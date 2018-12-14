package com.metals.service;

import com.metals.common.pojo.EasyUIDataGridResult;
import com.metals.common.pojo.MetalsResult;
import com.metals.pojo.WjCategory;
import com.metals.pojo.WjGoodsSpec;

public interface GoodsSpecService {

	
	EasyUIDataGridResult getGoodsSpecList(int page,int rows);
	
	
	MetalsResult insertGoodsSpec(WjGoodsSpec goodsSpec);
	
	WjGoodsSpec getGoodsSpecId(Integer id);
	
	MetalsResult updateGoodsSpec(WjGoodsSpec goodsSpec);
	
	MetalsResult deleteGoodsSpec(Integer id);
	
}
