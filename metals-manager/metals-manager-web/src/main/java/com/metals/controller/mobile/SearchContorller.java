package com.metals.controller.mobile;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.metals.service.GoodsService;

@Controller
@RequestMapping("/search")
public class SearchContorller {
	@Autowired
	GoodsService goodsService;
	
	@RequestMapping("/search.htm")
	public String showGoodsService() {
		return "";
	}
}
