package com.metals.controller.mobile;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.metals.common.pojo.EasyUIDataGridResult;
import com.metals.common.pojo.MetalsResult;
import com.metals.common.utils.CommUtil;
import com.metals.pojo.WjCategory;
import com.metals.pojo.WjGoods;
import com.metals.service.CategoryService;
import com.metals.service.GoodsService;

@Controller
@RequestMapping("/classify")
public class ClassifyContorller {
	
	@Autowired
	private CategoryService categoryService;
	
	@Autowired
	private GoodsService goodsService;
	

	//分类
	@RequestMapping("/classify.htm")
	public ModelAndView showClassify(ModelAndView model){
		List<List<WjCategory>> list2 = new ArrayList<>();
		EasyUIDataGridResult categoryListPage = categoryService.getCategoryListPage(null, null, true, null);
		List<WjCategory> list = (List<WjCategory>)categoryListPage.getRows();
		for (WjCategory cate : list) {
			EasyUIDataGridResult cates =  categoryService.getCategoryListPage(null, null, false, cate.getId());
			list2.add((List<WjCategory>)cates.getRows());
		}
		model.addObject("category", categoryListPage.getRows());
		model.addObject("category2", list2);
		model.setViewName("/home/classify");
		return model;
	}
	
	
	@RequestMapping("/goodsList.htm")
	public ModelAndView shwGoodsList(String classifyId,@RequestParam(defaultValue="New")String orderType,String cifyname,ModelAndView model){
		if(!StringUtils.isEmpty(classifyId)&&CommUtil.isInteger(classifyId)) {
			MetalsResult result = goodsService.selectClassifyGoods(orderType,Long.valueOf(classifyId));
			model.addObject("orderType",orderType);
			model.addObject("classifyId",classifyId);
			model.addObject("cifyname", cifyname);
			model.addObject("data",result.getData());
		}
		model.setViewName("/home/goodsList");
		return model;
	}
	
	
	
	@RequestMapping("/search")
	public ModelAndView showSearch(String key,@RequestParam(defaultValue="New")String orderType,ModelAndView model) throws Exception{
		List<WjGoods> list = goodsService.selectSearchGoods(key,orderType);
		model.addObject("orderType", orderType);
		model.addObject("key", key);
		model.addObject("data", list);
		model.addObject("type", "search");
		model.setViewName("/home/goodsList");
		return model;
	}
}
