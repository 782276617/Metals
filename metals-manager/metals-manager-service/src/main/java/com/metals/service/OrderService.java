package com.metals.service;

import java.math.BigDecimal;
import java.util.Date;
import java.util.List;
import java.util.Map;

import com.metals.common.pojo.EasyUIDataGridResult;
import com.metals.pojo.WjOrder;
import com.metals.pojo.WjOrderItem;

public interface OrderService {

	
	//查找商品下单次数
	int getGoodsCount(String goodsId);
	
	//订单列表
	EasyUIDataGridResult selectUserListPage(Integer page,Integer rows,Integer order_status,String type,String type_data,Date beginTime,Date endTime,BigDecimal begin_price,BigDecimal end_price, String province, String city, String area);
	
	
	//查看订单
	WjOrder getOrderId(String id);
	
	
	//时间查询
	int getOrderCount(Date beginTime,Date endTime);
	
	List<WjOrderItem> getOrderItem(String orderId);
	
	int updateOrder(WjOrder order);
	
	int getOrderStateCount(Integer state);
	
	List<WjOrder> selectUOrderList(Integer uId,Integer orderState);
	
	
	int saveOrder(WjOrder order);
	

}
