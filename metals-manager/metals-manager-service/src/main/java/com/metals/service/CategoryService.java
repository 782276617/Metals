package com.metals.service;

import java.util.Map;

import com.metals.common.pojo.EasyUIDataGridResult;
import com.metals.common.pojo.MetalsResult;
import com.metals.pojo.WjCategory;


public interface CategoryService {
	
	Map<String,String> getCategoryList();
	
	
	/**
	 * 
	 * @param page	 	起始行
	 * @param rows		总行数
	 * @param result	是否为父类目	true:为父  false:为子
	 * @param parentId	所属父类目
	 * @return
	 */
	EasyUIDataGridResult getCategoryListPage(Integer page,Integer rows,Boolean result,Long parentId);
	
	MetalsResult insertCategory(WjCategory category);
	

	MetalsResult updateCategory(WjCategory category);
	
	WjCategory getCategoryId(Long id);
	
	
	
}
