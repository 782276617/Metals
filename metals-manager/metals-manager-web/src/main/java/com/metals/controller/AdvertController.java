package com.metals.controller;

import java.io.IOException;
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
import com.metals.pojo.WjAdvert;
import com.metals.service.AdvertService;
import com.metals.utils.UploadUtils;


@Controller
@RequestMapping("/admin/advert")
public class AdvertController {

	@Autowired
	private AdvertService advertService;
	
	
	
	@RequestMapping("/advert_list.htm")
	public ModelAndView showAdvert_list(@RequestParam(defaultValue="1") int currentPage,@RequestParam(defaultValue="10") int rows,String ad_title) {
		ModelAndView model = new ModelAndView();
		EasyUIDataGridResult result = advertService.getAdvertisingimgList(currentPage, rows,ad_title);
		
		model.addObject("data",result);
		model.setViewName("advert_list");
		return model;
	}
	
	
	//骞垮憡鏂板
	@RequestMapping("/advert_add.htm")
	public String  showAdvert_add() {
		return "advert_add";
	}
	
	//骞垮憡鏂板
	@RequestMapping("/advert_save.htm")
	public ModelAndView  saveAdvert(HttpServletRequest request) throws Exception, IOException {
		ModelAndView model  = new ModelAndView();
		WjAdvert advert = new WjAdvert();

		String id = null;
		
		Map<String, String> upload = UploadUtils.Upload(request,"/WEB-INF/upload/advert");
		
		if(upload.size()>0) {
			String name = upload.get("name");
			String startTime = upload.get("startTime");
			String endTime = upload.get("endTime");
			String sort_order = upload.get("ad_slide_sequence");
			String fileName = upload.get("file1");
						 id = upload.get("id");
	
			if(!StringUtils.isEmpty(name)){
				advert.setName(name);
			}
			
			if(!StringUtils.isEmpty(startTime)){
				advert.setStarttime(CommUtil.StrToDate(startTime));
			}
			if(!StringUtils.isEmpty(endTime)){
				advert.setEndtime(CommUtil.StrToDate(endTime));
			}
			
			if(!StringUtils.isEmpty(sort_order)&&CommUtil.isInteger(sort_order)) {
				advert.setSortOrder(Integer.parseInt(sort_order));
			}
			
			if(!StringUtils.isEmpty(fileName)) {
				advert.setPic("upload\\advert\\"+fileName);
			}
		}else {
			 advert = null;
		}
		MetalsResult result = null;
		if(!StringUtils.isEmpty(id)) {
			advert.setId(Integer.parseInt(id));
			result = advertService.updateAdvert(advert);
		}else {
			result = advertService.insertAdvert(advert);
			model.addObject("list_url", CommUtil.getURL(request) + "/admin/advert/advert_add.htm");
		}
	
			
		if(result.getStatus()==200) {
			model.addObject("op_title", result.getMsg());
			model.setViewName("success");
		}else {
			model.addObject("op_title", result.getMsg());
			model.setViewName("error");
			return model;
		}
		
		model.addObject("list_url", CommUtil.getURL(request) + "/admin/advert/advert_list.htm");
		return model;
	}
	
	
	//骞垮憡鏂板
	@RequestMapping("/advert_del.htm")
	public String  advert_del(HttpServletRequest request,Integer mulitId) {
			advertService.deleteAdvertId(mulitId);
		return "forward:/admin/advert/advert_list.htm";
	}
	
	
	
	@RequestMapping("/advert_edit.htm")
	public ModelAndView  advert_edit(Integer id,ModelAndView model) {
		WjAdvert advert = advertService.getAdvertKeyId(id);
		model.addObject("advert", advert);
		model.setViewName("advert_add");
		return model;
	}

}
