package com.metals.service;

import java.util.List;

import com.metals.common.pojo.EasyUIDataGridResult;
import com.metals.common.pojo.MetalsResult;
import com.metals.common.pojo.PictureResult;
import com.metals.pojo.WjAdvert;

public interface AdvertService {

	
	EasyUIDataGridResult getAdvertisingimgList(int page,int rows,String ad_title);
	
	MetalsResult insertAdvert(WjAdvert advert);
	
	MetalsResult deleteAdvertId(Integer id);

	MetalsResult updateAdvert(WjAdvert advert);
	
	WjAdvert getAdvertKeyId(Integer id);
	
	List<WjAdvert>  getAdvertList();
}
