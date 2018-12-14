package com.metals.controller;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.metals.common.pojo.EasyUIDataGridResult;
import com.metals.common.pojo.MetalsResult;
import com.metals.common.utils.CommUtil;
import com.metals.pojo.WjCategory;
import com.metals.service.CategoryService;

@Controller
@RequestMapping("/admin/category")
public class CategoryController {

	@Autowired
	private CategoryService categoryService;
	
	
	@RequestMapping("/goods_class_list.htm")
	public ModelAndView show_category_list(@RequestParam(defaultValue="1") Integer currentPage,@RequestParam(defaultValue="10")Integer rows) {
		ModelAndView model = new ModelAndView();
		EasyUIDataGridResult result = categoryService.getCategoryListPage(currentPage, rows, true,null);
		model.addObject("data",result);
		model.setViewName("goods_class_list");
		return model;
	}
	
	@RequestMapping(value="/goods_class_data.htm",produces = "text/html; charset=utf-8")
	@ResponseBody
	public String goods_class_data(long pid,int currentPage,HttpServletRequest request){
		StringBuffer buffer = new StringBuffer();
		EasyUIDataGridResult result = categoryService.getCategoryListPage(null,null,null,pid);
		
		if(result.getRows().size()>0) {
			//获取请求路径
			String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath()+"/";
			List<WjCategory> list = (List<WjCategory>)result.getRows();
			for(int i=0;i<list.size();i++){
				WjCategory str = list.get(i);
		
//1
buffer.append("<tr id='"+str.getId()+"' parent='"+str.getParentId()+"' level='child_id1'>");
		//1-1
		buffer.append("<td align='center'></td>");
		//1-2
		buffer.append("<td colspan='2' align='center'>");
			//1-2-1	
			buffer.append("<ul class='addclass'>");
					//1-2-1-1
					buffer.append("<li class='acc1'> ");
							buffer.append("<img src='"+basePath+"resources/system/manage/blue/images/jian.jpg' cls='jian' width='14' height='14' onclick='addorsubtract(this,"+str.getId()+")' style='cursor:pointer;'></li>");
					buffer.append("</li>");
					//1-2-1-2
					buffer.append("<li class='ac2'>");
							//1-2-1-2-1
							buffer.append("<span class='num'>");
							//1-2-1-2-1-1
								buffer.append("<input type='text' name='"+str.getSortOrder()+"' id='"+str.getSortOrder()+"' value='"+str.getSortOrder()+"' onblur=\"ajax_update('"+str.getId()+"','sequence',this)\" title='可编辑'>");
							buffer.append("</span>");
			    	buffer.append( "</li>");
			    	//1-2-1-2
			    	buffer.append("<li class='acc3'>");
			    		    buffer.append("<span class='classies'>");
			    	            buffer.append("<input type='text' name='"+str.getName()+"' id='"+str.getName()+"' value='"+str.getName()+"' onblur=\"ajax_update('"+str.getId()+"','className',this)\" title='可编辑'>");
			                buffer.append("</span>");
			               /* buffer.append("<span class='newclass' style='$sty'>");
			    	            buffer.append("<a href='"+basePath+"admin/category/goods_class_add.htm?pid="+str.getId()+"'>新增下级</a>");
			                buffer.append("</span>");*/
			       buffer.append("</li>");
		  buffer.append(" </ul> ");
	   buffer.append("</td >");
	   buffer.append(" <td align='center'>"+CommUtil.DateToStr(str.getUpdated())+"</td>");
	   buffer.append(" <td align='center'>");
	   			buffer.append("<img src='"+basePath+"resources/system/manage/blue/images/"+(str.getIsDisplay()==1?true:false)+".png' width='21' height='23' onclick=\"ajax_update('"+str.getId()+"','display',this)\" style='cursor:pointer;' title='可编辑'></td>");
	   buffer.append(" <td align='left' class='ac8'>");
	   			buffer.append("<a href='"+basePath+"admin/category/goods_class_edit.htm?id="+str.getId()+"&amp;currentPage=1'>编辑</a>");
	   				buffer.append("|");
	   			buffer.append("<a href='javascript:void(0);' onclick="+"if(confirm('删除分类会同时删除该分类的所有下级，是否继续?'))"+"window.location.href='"+basePath+"admin/category/goods_class_del.htm?mulitId="+str.getId()+"&amp;currentPage=1'>删除</a>");
	   buffer.append("</td>");
buffer.append(" </tr>");

}}

		//return JsonUtils.objectToJson(buffer);
		return buffer.toString();
	}
	
	
	
	
	@RequestMapping("/goods_class_add.htm")
	public ModelAndView goods_class_add(String pid,ModelAndView model){

		EasyUIDataGridResult result = categoryService.getCategoryListPage(null, null, true,null);
		model.addObject("pid",pid);
		model.addObject("option",result.getRows());
		model.setViewName("goods_class_add");
		return model;
	}
	
	
	@RequestMapping("/goods_class_edit.htm")
	public ModelAndView goods_class_edit(Long id,ModelAndView model){
		EasyUIDataGridResult result = categoryService.getCategoryListPage(null, null, false,null);
		WjCategory category = categoryService.getCategoryId(id);
		model.addObject("category",category);
		model.addObject("option",result.getRows());
		model.setViewName("goods_class_add");
		return model;
	}
	
	@RequestMapping("/goods_class_save.htm")
	public ModelAndView goods_class_save(Long id,String className,String pid,boolean display,String sequence,ModelAndView model,HttpServletRequest request){
		MetalsResult result = null;
		WjCategory category = new WjCategory();
		category.setName(className);
		if(!StringUtils.isEmpty(pid)) {
			Long valueOf = Long.valueOf(pid);
			category.setParentId(valueOf);
			if(valueOf>0) {
				category.setIsParent(false);
			}else {
				category.setIsParent(true);
			}
		}
		//保存是否显示
		if(display){
			category.setIsDisplay(1);
		}else{
			category.setIsDisplay(0);
		}
		if(sequence!=null&&CommUtil.isInteger(sequence)){
			category.setSortOrder(Integer.parseInt(sequence));
		}else {
			category.setSortOrder(0);
		}
		
			
		if(id!=null&&id>0) {
			category.setId(id);
			category.setUpdated(new Date());
			result = categoryService.updateCategory(category);
		}else {
			category.setUpdated(new Date());
			category.setCreated(new Date());
			result = categoryService.insertCategory(category);
			model.addObject("list_url", CommUtil.getURL(request) + "/admin/category/goods_class_add.htm");
		}
	
			
		if(result.getStatus()==200) {
			model.addObject("op_title", result.getMsg());
			model.setViewName("success");
		}else {
			model.addObject("op_title", result.getMsg());
			model.setViewName("error");
			return model;
		}
		
		model.addObject("list_url", CommUtil.getURL(request) + "/admin/category/goods_class_list.htm");
		return model;
	}
	
	@RequestMapping("/goods_class_del.htm")
	public String goods_class_del(Integer mulitId){
		if(mulitId!=null){
			WjCategory category = new WjCategory();
			category.setId((long)mulitId);
			 category.setStatus(2);
			 categoryService.updateCategory(category);
		}
		return "forward:/admin/category/goods_class_list.htm";
	}
	
	@RequestMapping("/goods_class_ajax.htm")
	@ResponseBody
	public String goods_class_ajax(Integer id,String fieldName,String value){
		boolean results = false;
		if(id!=null&&id>0) {
			WjCategory category = new WjCategory();
			category.setId((long)id);
			if("sequence".equals(fieldName)){
				category.setSortOrder(Integer.valueOf(value));
			}else if("className".equals(fieldName)) {
				category.setName(value);
			}else if("display".equals(fieldName)) {
				WjCategory wjCategory = categoryService.getCategoryId((long)id);
				if(wjCategory!=null){
					if(wjCategory.getIsDisplay()==1){
						category.setIsDisplay(0);
					}else {
						category.setIsDisplay(1);
						results = true;
					}
					
				}
			}
			MetalsResult result = categoryService.updateCategory(category);
			if(result.getStatus()==200) {
				return results+"";
			}else{
				//更新失败数据取反
				if(results==true) {
					results = false;
				}else if(results==false) {
					results = true;
				}
			}
		}
		
		return results+"";
	}
	
}