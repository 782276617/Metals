package com.metals.service;

import java.util.List;

import com.metals.common.pojo.MetalsResult;
import com.metals.pojo.WjAddress;

public interface AddressService {

	WjAddress getAddressId(Integer id);
	
	List<WjAddress> getAddressUid(Integer uid);
	
	int insertAddress(WjAddress address);
	
	int updateAddress(WjAddress address);
	
	MetalsResult deleteAddress(Integer aid);
	
	int updateDefault(Integer uid,Integer id);
	
	WjAddress getDefaultAddress(Integer uid);
	
}
