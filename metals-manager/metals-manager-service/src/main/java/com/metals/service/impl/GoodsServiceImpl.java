package com.metals.service.impl;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.metals.common.pojo.EasyUIDataGridResult;
import com.metals.common.pojo.MetalsResult;
import com.metals.mapper.WjCategoryMapper;
import com.metals.mapper.WjGoodsMapper;
import com.metals.pojo.WjCategory;
import com.metals.pojo.WjCategoryExample;
import com.metals.pojo.WjGoods;
import com.metals.pojo.WjGoodsExample;
import com.metals.pojo.WjGoodsExample.Criteria;

@Service
public class GoodsServiceImpl implements com.metals.service.GoodsService {

	@Autowired
	private WjGoodsMapper goodsMapper;
	
	@Autowired
	private WjCategoryMapper categoryMapper;
	
	
	@Override
	public EasyUIDataGridResult selectUserListPage(int page, int rows,String goods_name, Integer goods_class,String store_recommend) {
	
		//执行查询
		
		WjGoodsExample example = new WjGoodsExample();
		//添加条件
		WjGoodsExample.Criteria criteria = example.createCriteria();
		
		
		//上架商品
		criteria.andStatusEqualTo(1);
		
		
		
		if(!StringUtils.isEmpty(goods_name)){
			criteria.andNameEqualTo(goods_name);
		}
		
		
		if(!StringUtils.isEmpty(goods_class)){
			WjCategory category = categoryMapper.selectByPrimaryKey((long)goods_class);
			if(category.getIsParent()) {
				WjCategoryExample example2 = new WjCategoryExample();
				Long id = category.getId();
				 com.metals.pojo.WjCategoryExample.Criteria criteria2 = example2.createCriteria();
				criteria2.andParentIdEqualTo(id);
				List<WjCategory> list = categoryMapper.selectByExample(example2);
				List<Long> listparam = new ArrayList<>();
				for (WjCategory wjCategory : list) {
					listparam.add(wjCategory.getId());
				}
				criteria.andCidIn(listparam);
			}else {
				criteria.andCidEqualTo(Long.valueOf(goods_class));
			}
		}
		
		if(!StringUtils.isEmpty(store_recommend)){
			if("true".equals(store_recommend)) {
				criteria.andIsvouchEqualTo(1);
			}else if("false".equals(store_recommend)) {
				criteria.andIsvouchEqualTo(0);
			}
			
		}
		
		
		
				
		//分页处理
		PageHelper.startPage(page, rows);
		List<WjGoods> list = goodsMapper.selectByExample(example);
		
		
		//取total
		PageInfo<WjGoods> pageInfo = new PageInfo<>(list);
		
	
		//创建返回值对象
		EasyUIDataGridResult result = new EasyUIDataGridResult(pageInfo.getFirstPage(), page, pageInfo.getPages(), list);
		return result;
	}


	@Override
	public MetalsResult updateGoodsId(WjGoods goods) {
	   int i = goodsMapper.updateByPrimaryKeySelective(goods);
	   
	   if(i>0){
		   	return MetalsResult.build(200,"保存成功");
	   }
		 	return  MetalsResult.build(500, "更新失败");
	}


	@Override
	public WjGoods getGoodsId(String id) {
		WjGoods goods = goodsMapper.selectByPrimaryKey(id);
		return goods;
	}


	@Override
	public MetalsResult deleteGoodsId(String id) {
		int i = goodsMapper.deleteByPrimaryKey(id);
		if(i>0) {
			return MetalsResult.ok();
		}
			return MetalsResult.build(500,"删除失败！");
	}


	@Override
	public int getGoodsCount(Date beginTime, Date endTime) {
		WjGoodsExample example = new WjGoodsExample();
		Criteria criteria = example.createCriteria();
		if(beginTime!=null) {
			criteria.andCreatedGreaterThanOrEqualTo(beginTime);
		}
		
		if(endTime!=null) {
			criteria.andCreatedLessThanOrEqualTo(endTime);
		}
			
		int count = goodsMapper.countByExample(example);
		return count;
	}


	@Override
	public MetalsResult insertGoods(WjGoods goods) {
	   int i = goodsMapper.insertSelective(goods);
	   if(i>0){
		   	return MetalsResult.build(200,"保存成功");
	   }
		 	return  MetalsResult.build(500, "保存失败");
	}


	@Override
	public MetalsResult selectClassifyGoods(String orderType,Long id) {
		WjGoodsExample example = new WjGoodsExample();
		Criteria criteria = example.createCriteria();
		//上架商品
		criteria.andStatusEqualTo(1);
		
		//库存数量必须大于零
		criteria.andStocknGreaterThan(0);
		
		
		
		if("Sales".equals(orderType)){
			//设置下单数排序条件
			example.setOrderByClause("orderN desc");
		}else if("New".equals(orderType)){
			//设置创建时间排序条件
			example.setOrderByClause("created desc");
		}else if("Price".equals(orderType)) {
			//设置价格排序条件
			example.setOrderByClause("price desc");
		}
		criteria.andCidEqualTo(id);
		List<WjGoods> list = goodsMapper.selectByExample(example);
		return MetalsResult.ok(list);
	}


	@Override
	public List<WjGoods> selectGoodsState(String state,Integer index,Integer page) {
		WjGoodsExample example = new WjGoodsExample();
		PageHelper.startPage(index,page);
		Criteria criteria = example.createCriteria();
		if("new".equals(state)) {				//新品
			example.setOrderByClause("created desc");
		}else if("sales".equals(state)){		//销量
			example.setOrderByClause("ordern desc");
		}else if("hotSale".equals(state)) {		//热销
			criteria.andIsvouchEqualTo(1);
		}
		//上架商品
		criteria.andStatusEqualTo(1);
		
		//库存数量必须大于零
		criteria.andStocknGreaterThan(0);
		
		
		List<WjGoods> list = goodsMapper.selectByExample(example);
		PageInfo<WjGoods> pageInfo = new PageInfo<>(list);
		
		return pageInfo.getList();
	}


	@Override
	public List<WjGoods> selectSearchGoods(String search,String orderType) {	
		WjGoodsExample example = new WjGoodsExample();
		Criteria criteria = example.createCriteria();
		if("Sales".equals(orderType)){
			//设置下单数排序条件
			example.setOrderByClause("orderN desc");
		}else if("New".equals(orderType)){
			//设置创建时间排序条件
			example.setOrderByClause("created desc");
		}else if("Price".equals(orderType)) {
			//设置价格排序条件
			example.setOrderByClause("price desc");
		}
		
		//上架
		criteria.andStatusEqualTo(1);
		
		//库存数量必须大于零
		criteria.andStocknGreaterThan(0);
		
		criteria.andGkeysLike("%"+search+"%");
		List<WjGoods> list = goodsMapper.selectByExample(example);
		return list;
	}


	@Override
	public List<WjGoods> selectNewGoodsState(String state, Integer index, Integer page) {
		PageHelper.startPage(index, page);
		WjGoodsExample example = new WjGoodsExample();
		Criteria criteria = example.createCriteria();
		//默认设置创建时间排序条件
		example.setOrderByClause("created desc");
		
		
		if("Sales".equals(state)){
			//设置下单数排序条件
			example.setOrderByClause("orderN desc");
		}else if("Price".equals(state)) {
			//设置价格排序条件
			example.setOrderByClause("price desc");
		}
		//上架
		criteria.andStatusEqualTo(1);
		
		//库存数量必须大于零
		criteria.andStocknGreaterThan(0);
		
		List<WjGoods> list = goodsMapper.selectByExample(example);
		PageInfo<WjGoods> pageInfo = new PageInfo<>(list);
		return pageInfo.getList();
	}


	@Override
	public List<WjGoods> selectSalesGoodsState(String state, Integer index, Integer page) {
		PageHelper.startPage(index, page);
		WjGoodsExample example = new WjGoodsExample();
		Criteria criteria = example.createCriteria();
		//默认设置创建时间排序条件
		example.setOrderByClause("created desc");
		
		//查询促销商品
		criteria.andIsvouchEqualTo(1);
		
		//上架
		criteria.andStatusEqualTo(1);
		
		
		//库存数量必须大于零
		criteria.andStocknGreaterThan(0);
		
		if("Sales".equals(state)){
			//设置下单数排序条件
			example.setOrderByClause("orderN desc");
		}else if("Price".equals(state)) {
			//设置价格排序条件
			example.setOrderByClause("price desc");
		}
		
		
		List<WjGoods> list = goodsMapper.selectByExample(example);
		PageInfo<WjGoods> pageInfo = new PageInfo<>(list);
		return pageInfo.getList();
	}


	@Override
	public int getStockstatus(String[] gIds,Integer[] number,Integer size) {
		WjGoodsExample example = new WjGoodsExample();
	

		for (int i = 0; i < gIds.length; i++) {
			Criteria criteria = example.or();
			criteria.andIdIn(Arrays.asList(gIds[i]));
			//库存数量必须大于零
			criteria.andStocknGreaterThanOrEqualTo(number[i]);
		}
		
		List<WjGoods> list = goodsMapper.selectByExample(example);
		
		if(list!=null&&list.size()>0) {
			int sizes = list.size(); 
			if(size!=null) {
				sizes += size;
			}
			if(sizes==gIds.length){
				return 1;
			}
		}
		return 0;
	}


	@Override
	public Map<String, Object> getGoodsSalesList(int page, int rows,String goods_name, Integer goods_class,String store_recommend) {
				
				
						
				
				
	
		
		WjGoodsExample example = new WjGoodsExample();
		example.setOrderByClause("orderN desc");
		
		//添加条件
		WjGoodsExample.Criteria criteria = example.createCriteria();
		
		//上架商品
		criteria.andStatusEqualTo(1);
		
		
		if(!StringUtils.isEmpty(goods_name)){
			criteria.andNameEqualTo(goods_name);
		}
		
		
		if(!StringUtils.isEmpty(goods_class)){
			WjCategory category = categoryMapper.selectByPrimaryKey((long)goods_class);
			if(category.getIsParent()) {
				WjCategoryExample example2 = new WjCategoryExample();
				Long id = category.getId();
				 com.metals.pojo.WjCategoryExample.Criteria criteria2 = example2.createCriteria();
				criteria2.andParentIdEqualTo(id);
				List<WjCategory> list = categoryMapper.selectByExample(example2);
				List<Long> listparam = new ArrayList<>();
				for (WjCategory wjCategory : list) {
					listparam.add(wjCategory.getId());
				}
				criteria.andCidIn(listparam);
			}else {
				criteria.andCidEqualTo(Long.valueOf(goods_class));
			}
		}
		
		if(!StringUtils.isEmpty(store_recommend)){
			if("true".equals(store_recommend)) {
				criteria.andIsvouchEqualTo(1);
			}else if("false".equals(store_recommend)) {
				criteria.andIsvouchEqualTo(0);
			}
			
		}
			
		
		//取total
		PageHelper.startPage(page, rows);
		
		List<WjGoods> list = goodsMapper.selectByExample(example);
		
		PageInfo<WjGoods> pageInfo = new PageInfo<>(list);
		
		Map<String,Object> map = new HashMap<>();
		//数据列表
		map.put("data", list);
		//当前页
		map.put("curr", page);
		//第一页
		map.put("firstPage",pageInfo.getFirstPage());
		//最后一页
		map.put("lastPage",pageInfo.getPages());
		
		return map;
	}
}
