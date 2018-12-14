package com.metals.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.metals.common.pojo.MetalsResult;
import com.metals.mapper.WjAddressMapper;
import com.metals.pojo.WjAddress;
import com.metals.pojo.WjAddressExample;
import com.metals.pojo.WjAddressExample.Criteria;
import com.metals.service.AddressService;

@Service
public class AddressServiceImpl implements AddressService {

	@Autowired
	private WjAddressMapper addressMapper;
	
	@Override
	public WjAddress getAddressId(Integer id) {
		return addressMapper.selectByPrimaryKey(id);
	}
	@Override
	public List<WjAddress> getAddressUid(Integer uid) {
		WjAddressExample example = new WjAddressExample();
		Criteria criteria = example.createCriteria();
		criteria.andUidEqualTo(uid);
		List<WjAddress> list = addressMapper.selectByExample(example);
		return list;
	}
	@Override
	public int insertAddress(WjAddress address) {
		return addressMapper.insertSelective(address);
	}
	@Override
	public int updateAddress(WjAddress address) {
		return addressMapper.updateByPrimaryKeySelective(address);
	}
	@Override
	public MetalsResult deleteAddress(Integer aid) {
		int i = addressMapper.deleteByPrimaryKey(aid);
		if(i>0){
			return MetalsResult.ok();
		}
			return MetalsResult.build(500, "删除失败！");
	}
	@Override
	public int updateDefault(Integer uid, Integer id) {

		WjAddress address1 = new WjAddress();
		address1.setId(id);
		address1.setIsdefault(true);
		int i = addressMapper.updateByPrimaryKeySelective(address1);
		if(i>0){		//该用户下清空所有默认地址状态
			WjAddressExample example = new WjAddressExample();
			Criteria criteria = example.createCriteria();
			criteria.andUidEqualTo(uid);
			criteria.andIdNotEqualTo(id);
			WjAddress address2 = new WjAddress();
			address2.setIsdefault(false);
			addressMapper.updateByExampleSelective(address2, example);
		}
		return i;
	}
	@Override
	public WjAddress getDefaultAddress(Integer uid) {
		WjAddressExample example = new WjAddressExample();
		Criteria criteria = example.createCriteria();
		criteria.andUidEqualTo(uid);
		criteria.andIsdefaultEqualTo(true);
		List<WjAddress> list = addressMapper.selectByExample(example);
		WjAddress address = null;
		if(list!=null&&list.size()>0) {
			address = list.get(0);
		}
		return address;
	}
}
