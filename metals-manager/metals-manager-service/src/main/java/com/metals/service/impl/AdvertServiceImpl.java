package com.metals.service.impl;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.metals.common.pojo.EasyUIDataGridResult;
import com.metals.common.pojo.MetalsResult;
import com.metals.mapper.WjAdvertMapper;
import com.metals.pojo.WjAdvert;
import com.metals.pojo.WjAdvertExample;
import com.metals.service.AdvertService;

@Service
public class AdvertServiceImpl implements AdvertService {

	@Autowired
	private WjAdvertMapper advertMapper; 
	
	@Override
	public EasyUIDataGridResult getAdvertisingimgList(int page, int rows,String ad_title) {
		PageHelper.startPage(page, rows);
		WjAdvertExample example = new WjAdvertExample();
		WjAdvertExample.Criteria criteria = example.createCriteria();
		
		if(!StringUtils.isEmpty(ad_title)) {
			criteria.andNameEqualTo(ad_title);
		}
		List<WjAdvert> list = advertMapper.selectByExample(example);
		

		PageInfo<WjAdvert>  pageInfo = new PageInfo<>(list);
		return new EasyUIDataGridResult(pageInfo.getFirstPage(),page,pageInfo.getPages(),list);
	}

	@Override
	public MetalsResult insertAdvert(WjAdvert advert) {
		int i = advertMapper.insertSelective(advert);
		if (i>0) {
			return MetalsResult.build(200,"数据保存成功！");
		}
		return MetalsResult.build(500,"数据保存失败！");
	}

	@Override
	public MetalsResult deleteAdvertId(Integer id) {
		int i = advertMapper.deleteByPrimaryKey(id);
		if (i>0) {
			return MetalsResult.build(200,"删除成功！");
		}
		return MetalsResult.build(500,"删除失败！");
	}

	@Override
	public MetalsResult updateAdvert(WjAdvert advert) {
		int i = advertMapper.updateByPrimaryKeySelective(advert);
		if (i>0) {
			return MetalsResult.build(200,"数据保存成功！");
		}
		return MetalsResult.build(500,"数据保存失败！");
	}

	@Override
	public WjAdvert getAdvertKeyId(Integer id) {
		return advertMapper.selectByPrimaryKey(id);
	}

	@Override
	public List<WjAdvert> getAdvertList() {
		WjAdvertExample example = new WjAdvertExample();
		WjAdvertExample.Criteria criteria = example.createCriteria();
		//当前时间小于结束时间
		criteria.andEndtimeGreaterThanOrEqualTo(new Date());
		return advertMapper.selectByExample(example);
	}

}
