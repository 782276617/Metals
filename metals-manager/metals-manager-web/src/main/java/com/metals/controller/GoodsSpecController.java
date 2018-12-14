package com.metals.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.metals.common.pojo.EasyUIDataGridResult;
import com.metals.common.pojo.MetalsResult;
import com.metals.common.utils.CommUtil;
import com.metals.common.utils.JsonUtils;
import com.metals.pojo.WjGoodsSpec;
import com.metals.service.GoodsSpecService;

@Controller
@RequestMapping("/admin/spec")
public class GoodsSpecController {
	
	@Autowired
	private GoodsSpecService goodsSpecService;

	
	
	@RequestMapping("/goods_spec_list.htm")
	public ModelAndView showSpec_list(@RequestParam(defaultValue="1") int currentPage,@RequestParam(defaultValue="10") int rows){
		ModelAndView model = new ModelAndView();
		EasyUIDataGridResult result = goodsSpecService.getGoodsSpecList(currentPage, rows);
		
		model.addObject("data", result);
		model.setViewName("goods_spec_list");
		
		return model;
	}
	
	@RequestMapping("/goods_spec_add.htm")
	public String goods_spec_add(){
		return "goods_spec_add";
	}
	
	
	
	@RequestMapping("/goods_spec_save.htm")
	public ModelAndView goods_spec_save(Integer id,String name,String sequence,Integer count,HttpServletRequest request){
		ModelAndView model = new ModelAndView();
		MetalsResult result = null;
		WjGoodsSpec spec = new WjGoodsSpec();
		List<String> list = new ArrayList<>();
		
		for(int i=0;i<count;i++) {
			Map<String,String> map = new HashMap<>();
			String sequen = request.getParameter("sequence_"+(i+1));
			String value = request.getParameter("value_"+(i+1));
			map.put("order",sequen);
			map.put("spec",value);
			String toJson = JsonUtils.objectToJson(map);
			list.add(toJson);
		}
		
		if(!StringUtils.isEmpty(name)) {
			spec.setName(name);
		}
		
		if(!StringUtils.isEmpty(sequence)&&CommUtil.isInteger(sequence)) {
			spec.setSortOrder(Integer.valueOf(sequence));
		}
		
		//转换json数据进行存储
		if(!list.isEmpty()) {
			spec.setSpec(list.toString());
		}
		
		
		
			
		if(id!=null&&id>0) {
			spec.setId(id);
			//category.setUpdated(new Date());
			result = goodsSpecService.updateGoodsSpec(spec);
		}else {
			//category.setUpdated(new Date());
			//category.setCreated(new Date());
			result = goodsSpecService.insertGoodsSpec(spec);
			model.addObject("list_url", CommUtil.getURL(request) + "/admin/spec/goods_spec_add.htm");
		}
			
		if(result.getStatus()==200) {
			model.addObject("op_title", result.getMsg());
			model.setViewName("success");
		}else {
			model.addObject("op_title", result.getMsg());
			model.setViewName("error");
			return model;
		}
		
		model.addObject("list_url", CommUtil.getURL(request) + "/admin/spec/goods_spec_list.htm");
		return model;
	}
	
	@RequestMapping("/goods_spec_edit.htm")
	public ModelAndView goods_spec_edit(Integer id,ModelAndView model){
		WjGoodsSpec spec = goodsSpecService.getGoodsSpecId(id);
		List<Map> toJson = JsonUtils.jsonToList(spec.getSpec(), Map.class);
		model.addObject("specJson", toJson);
		model.addObject("spec", spec);
		model.setViewName("goods_spec_add");
		return model;
	}
	
	
	@RequestMapping("/goods_spec_del.htm")
	public String goods_spec_del(Integer mulitId){
		  MetalsResult deleteGoodsSpec = goodsSpecService.deleteGoodsSpec(mulitId);
		  
		  return "redirect:/admin/spec/goods_spec_list.htm";
	}
}
