package com.metals.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.metals.common.pojo.EasyUIDataGridResult;
import com.metals.common.pojo.MetalsResult;
import com.metals.mapper.WjCategoryMapper;
import com.metals.pojo.WjCategory;
import com.metals.pojo.WjCategoryExample;
import com.metals.pojo.WjCategoryExample.Criteria;
import com.metals.service.CategoryService;
@Service
public class CategoryServiceImpl implements CategoryService{

	@Autowired
	private WjCategoryMapper categoryMapper;
	@Override
	public Map<String,String> getCategoryList() {
		Map<String,String> map = new HashMap<>();
		StringBuffer str = new StringBuffer();
		WjCategoryExample example = new WjCategoryExample();
		Criteria criteria = example.createCriteria();
		//不包括二  1：为正常  不查询删除的数据
		criteria.andParentIdEqualTo((long)0);
		List<WjCategory> list = categoryMapper.selectByExample(example);
		
		for (WjCategory wjCategory : list) {
			WjCategoryExample example2 = new WjCategoryExample();
			Criteria criteria2 = example2.createCriteria();
			criteria2.andParentIdEqualTo(wjCategory.getId());
			List<WjCategory> list2 = categoryMapper.selectByExample(example2);
				str.append("<option value='"+wjCategory.getId()+"'>"+wjCategory.getName()+"</option>");
			for (WjCategory wjCategory2 : list2) {
				map.put(wjCategory2.getId()+"",wjCategory2.getName()+"&"+wjCategory.getName());
				str.append("<option value='"+wjCategory2.getId()+"'>&nbsp;&nbsp;&nbsp;  "+wjCategory2.getName()+"</option>");
			}
		}
		map.put("cateHtml",str.toString());
		return map;
	}
	@Override
	public EasyUIDataGridResult getCategoryListPage(Integer page,Integer rows,Boolean result,Long parentId) {
		if(page!=null&&rows!=null){
		PageHelper.startPage(page,rows);
		}
		
		WjCategoryExample example = new WjCategoryExample();
		
		
		Criteria criteria = example.createCriteria();
		example.setOrderByClause("sort_order ASC");
		
		//不包括二  2：为删除  不查询删除的数据
		criteria.andStatusEqualTo(1);
		//true:父类目 、false：子类目
		if(result!=null){
			criteria.andIsParentEqualTo(result);
		}
		if(parentId!=null){
			criteria.andParentIdEqualTo(parentId);
		}
		
		//进行查询
		List<WjCategory> list = categoryMapper.selectByExample(example);
		if(page!=null&&rows!=null){
			PageInfo<WjCategory>  pageInfo = new PageInfo<>(list);
			return new EasyUIDataGridResult(pageInfo.getFirstPage(), page, pageInfo.getPages(), list);
		}
			return new EasyUIDataGridResult(null, null, null, list);
	}
	@Override
	public MetalsResult insertCategory(WjCategory category) {
		int i = categoryMapper.insertSelective(category);
		if (i>0) {
			return MetalsResult.build(200,"数据保存成功！");
		}
		return MetalsResult.build(500,"数据保存失败！");
	}

	@Override
	public MetalsResult updateCategory(WjCategory category) {
		int i = categoryMapper.updateByPrimaryKeySelective(category);
		if (i>0) {
			return MetalsResult.build(200,"数据保存成功！");
		}
		return MetalsResult.build(500,"数据保存失败！");
	}
	@Override
	public WjCategory getCategoryId(Long id) {
		return categoryMapper.selectByPrimaryKey(id);
	}
}
