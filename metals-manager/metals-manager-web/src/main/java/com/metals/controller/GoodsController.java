package com.metals.controller;

import java.math.BigDecimal;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.metals.common.pojo.EasyUIDataGridResult;
import com.metals.common.pojo.MetalsResult;
import com.metals.common.utils.CommUtil;
import com.metals.common.utils.IDUtils;
import com.metals.common.utils.JsonUtils;
import com.metals.pojo.WjGoods;
import com.metals.service.CategoryService;
import com.metals.service.GoodsService;
import com.metals.service.GoodsSpecService;
import com.metals.service.OrderService;
import com.metals.utils.UploadUtils;

@Controller
@RequestMapping("/admin/goods")
public class GoodsController {

	@Autowired
	private GoodsService goodsService;
	
	@Autowired
	private CategoryService categoryService;
	
	@Autowired
	private OrderService orderService;
	
	@Autowired
	private GoodsSpecService goodsSpecService;
	//鍟嗗搧绠＄悊
	@RequestMapping("/goods_list.htm")
	public ModelAndView showGoods_list(@RequestParam(defaultValue="1")int currentPage,@RequestParam(defaultValue="10")int page,String goods_name,Integer goods_class,String store_recommend,ModelAndView model){
		EasyUIDataGridResult result = goodsService.selectUserListPage(currentPage, page, goods_name, goods_class,store_recommend);
		Map<String, String> map = categoryService.getCategoryList();
		String categoryHtml = map.get("cateHtml");
		List<WjGoods> goodsList = (List<WjGoods>)result.getRows();
		
		for (WjGoods goods : goodsList) {
			int goodsCount = orderService.getGoodsCount(goods.getId());
			goods.setOrdern(goodsCount);
			String data = map.get(goods.getCid()+"");
			String[] split = data.split("&");
			if(split.length>=2) {
				goods.setParentName(split[0]);
				goods.setLeafName(split[1]);
			}
		}
		
		
		//搜索值
		model.addObject("goods_name",goods_name);
		model.addObject("goods_class",goods_class);
		model.addObject("store_recommend",store_recommend);
		
		
		result.setRows(goodsList);
		model.addObject("data",result);
		model.addObject("categoryHtml",categoryHtml);
		model.setViewName("goods_list");
		return model;
	}
	
	
	//鍟嗗搧绠＄悊鏇存柊
		@RequestMapping("/goods_ajax.htm")
		@ResponseBody
		public  String updateAjax(String id,String fieldName,HttpServletRequest request){
			WjGoods goods = new WjGoods();
			
			MetalsResult  metalsResult = new MetalsResult();
			goods.setId(id);
			
			if(fieldName.equals("store_recommend")) {
					//鏌ヨ鐘舵��
					WjGoods goods2 = goodsService.getGoodsId(id);
					Integer isvouch = goods2.getIsvouch();
					if(isvouch==1) {
						goods.setIsvouch(0);
						metalsResult.setData(false);
					}else {
						goods.setIsvouch(1);
						metalsResult.setData(true);
					}
			}else if(fieldName.equals("goods_status")){
						goods.setStatus(2);
			}
			
			MetalsResult result = goodsService.updateGoodsId(goods);
			
			metalsResult.setMsg(result.getMsg());
			metalsResult.setStatus(result.getStatus());
			
			return JsonUtils.objectToJson(metalsResult);
		}
		
		
		@RequestMapping("/goods_add.htm")
		public ModelAndView goods_add(ModelAndView model){
			EasyUIDataGridResult result = categoryService.getCategoryListPage(null, null, false,null);
			EasyUIDataGridResult result2 = goodsSpecService.getGoodsSpecList(1, 10000000);
			model.addObject("goodsOption",result.getRows());
			model.addObject("specOption",result2.getRows());
			model.setViewName("goods_add");
			return model;
		}
	
		
		@RequestMapping("/goods_edit.htm")
		public ModelAndView goods_edit(String id,Integer currentPage,ModelAndView model){
			WjGoods goods = null;
			if(!StringUtils.isEmpty(id)) {
				 goods = goodsService.getGoodsId(id);
			}
			
			EasyUIDataGridResult result = categoryService.getCategoryListPage(null, null, false,null);
			EasyUIDataGridResult result2 = goodsSpecService.getGoodsSpecList(1, 10000000);
			model.addObject("goods",goods);
			model.addObject("goodsOption",result.getRows());
			model.addObject("specOption",result2.getRows());
			model.addObject("currentPage",currentPage!=null?currentPage:1);
			model.setViewName("goods_add");
			
			return model;
		}
		
		
		@RequestMapping("/goods_save.htm")
		public ModelAndView goods_save(HttpServletRequest request){
			ModelAndView model  = new ModelAndView();
			WjGoods goods = new WjGoods();

			String id = null;
			Integer currentPage = 1;
			Map<String, String> upload = UploadUtils.Upload(request,"/WEB-INF/upload/goods");
			
			if(upload.size()>0) {
				id = upload.get("id");
				String name = upload.get("name");
				String price = upload.get("price");
				String stockn = upload.get("stockn");
				String Keyword = upload.get("Keyword");
				String Taxonomy = upload.get("Taxonomy");
				String specId = upload.get("specId");
				String goodsImg = upload.get("goods");
				String detailsImg = upload.get("details");
				String currentPages = upload.get("currentPage");
				if(!StringUtils.isEmpty(currentPages)) {
					currentPage = Integer.valueOf(currentPages);
				 }
		
				if(!StringUtils.isEmpty(name)){
					goods.setName(name);
				}
				
				if(!StringUtils.isEmpty(price)&&CommUtil.isNumeric(price)){
					goods.setPrice(BigDecimal.valueOf(Double.valueOf(price)));
				}
				
				
				if(!StringUtils.isEmpty(stockn)&&CommUtil.isNumeric(stockn)){
					int val = Integer.valueOf(stockn);
					goods.setStockn(val<=0?0:val);
				}
				
				if(!StringUtils.isEmpty(Keyword)){
					goods.setGkeys(Keyword);
				}
				
				if(!StringUtils.isEmpty(Taxonomy)&&Long.valueOf(Taxonomy)>0) {
					goods.setCid(Long.valueOf(Taxonomy));
				}
				
				if(!StringUtils.isEmpty(specId)&&Long.valueOf(specId)>0) {
					goods.setSpecid(Integer.valueOf(specId));
				}
				if(!StringUtils.isEmpty(goodsImg)) {
					goods.setImage("upload\\goods\\"+upload.get("file1"));
				}
					String string = upload.get("file2");
					if(!StringUtils.isEmpty(string)) {
						goods.setContent("upload\\goods\\"+upload.get("file2"));
					}else {
						goods.setContent("");
					}
			}else {
				 goods = null;
			}
			MetalsResult result = null;
			if(!StringUtils.isEmpty(id)&&goods.getCid()!=null) {
				goods.setId(id);
				goods.setUpdated(new Date());
				result = goodsService.updateGoodsId(goods);
			}else if(goods.getCid()!=null){
				//生成id
				goods.setId(IDUtils.genItemId()+"");
				goods.setCreated(new Date());
				goods.setUpdated(new Date());
				result = goodsService.insertGoods(goods);
				model.addObject("list_url", CommUtil.getURL(request) + "/admin/goods/goods_add.htm");
			}else {
				
				model.addObject("op_title", "保存失败");
				if(goods.getCid()==null||goods.getCid()<=0){
				model.addObject("op_title", "<span style='color:red'>保存失败，请选择所属分类</span>");
				}
				model.addObject("list_url", CommUtil.getURL(request) + "/admin/goods/goods_add.htm");
				
				model.setViewName("error");
				return model;
			}
				
			if(result!=null) {
				if(result.getStatus()==200) {
					model.addObject("op_title", result.getMsg());
					model.setViewName("success");
				}else {
					model.addObject("op_title", result.getMsg());
					model.setViewName("error");
					return model;
				}
			}
			model.addObject("list_url", CommUtil.getURL(request) + "/admin/goods/goods_list.htm?currentPage="+currentPage);
			return model;
		}
		
		
		//商品销量列表
		@RequestMapping("/goods_sales_list.htm")
		public String goods_sales_list(@RequestParam(defaultValue="1")int currentPage,@RequestParam(defaultValue="10")int page,String goods_name,Integer goods_class,String store_recommend,Model model){
			Map<String, Object> map = goodsService.getGoodsSalesList(currentPage, page, goods_name,goods_class,store_recommend);
			List<WjGoods> goodsList = (List<WjGoods>)map.get("data");
			Map<String, String> maps = categoryService.getCategoryList();
			for (WjGoods goods : goodsList) {
				String data = maps.get(goods.getCid()+"");
				String[] split = data.split("&");
				if(split.length>=2) {
					goods.setParentName(split[0]);
					goods.setLeafName(split[1]);
				}
			}
			
			//分类下拉列表
			Map<String, String> mapsz = categoryService.getCategoryList();
			String categoryHtml = mapsz.get("cateHtml");
			
			
			//搜索值
			model.addAttribute("goods_name",goods_name);
			model.addAttribute("goods_class",goods_class);
			model.addAttribute("store_recommend",store_recommend);
			
			//重新赋值
			map.put("data", goodsList);
			
			model.addAttribute("categoryHtml",categoryHtml);
			model.addAllAttributes(map);
			
			return "goods_sales_list";
		}
}
