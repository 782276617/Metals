package com.metals.controller;

import java.math.BigDecimal;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.metals.common.pojo.EasyUIDataGridResult;
import com.metals.common.utils.CommUtil;
import com.metals.pojo.WjAddress;
import com.metals.pojo.WjOrder;
import com.metals.pojo.WjOrderItem;
import com.metals.pojo.WjUser;
import com.metals.service.AddressService;
import com.metals.service.GoodsService;
import com.metals.service.OrderService;
import com.metals.service.UserService;

@Controller
@RequestMapping("/admin/order")
public class OrderController {
	
	@Autowired
	private OrderService orderService;
	
	@Autowired
	private UserService userService;
	
	
	@Autowired
	private AddressService addressService;
	
	
	@Autowired
	private GoodsService goodsService;
	
	
	@RequestMapping("/order_list.htm")
	public ModelAndView showOrder_list(@RequestParam(defaultValue="1")Integer currentPage
			,@RequestParam(defaultValue="10") Integer rows
			,Integer order_status
			,String type
			,String type_data
			,String beginTime
			,String endTime
			,String begin_price
			,String end_price
			,String province
			,String city
			,String area){
		
		ModelAndView model = new ModelAndView();
		Date beginTimes = null;
		Date endTimes = null;
		BigDecimal beginPrice = null;
		BigDecimal endPrice = null;
		
		
		//下单开始时间
		if(!StringUtils.isEmpty(beginTime)){
			beginTimes = CommUtil.StrToDate(beginTime);
			model.addObject("beginTime", beginTime);
		}
		
		//下单结束时间
		if(!StringUtils.isEmpty(endTime)){
			endTimes = CommUtil.StrToDate(endTime);
			model.addObject("endTime", endTime);
		}
		
		//订单类型
		if(!StringUtils.isEmpty(type_data)) {
			model.addObject("type_data", type_data);
		}
		
		//判断是否是数字    进行数据类型转换
		if(CommUtil.isNumeric(begin_price)){
			beginPrice = new BigDecimal(begin_price);
			beginPrice = beginPrice.setScale(2, BigDecimal.ROUND_HALF_UP);
			model.addObject("begin_price",begin_price);
		}
		
		//判断是否是数字    进行数据类型转换
		if(CommUtil.isNumeric(end_price)){
			endPrice = new BigDecimal(end_price);
			endPrice = endPrice.setScale(2, BigDecimal.ROUND_HALF_UP);
			model.addObject("end_price",end_price);
		}
		EasyUIDataGridResult result = orderService.selectUserListPage(currentPage, rows, order_status,type ,type_data, beginTimes, endTimes, beginPrice, endPrice,province,city,area);	
	
		model.addObject("province",province);
		model.addObject("city",city);
		model.addObject("area",area);
		model.addObject("order_status",order_status);
		model.addObject("type", type);
		model.addObject("data", result);
		model.setViewName("order_list");
		return model;
	}
	
	
	@RequestMapping("/order_view.htm")
	public ModelAndView showOrder_view(String id,ModelAndView model){
		//查询订单
		WjOrder order = orderService.getOrderId(id);
		//查询订单用户信息
		WjUser user = userService.getItemById(order.getUid());
		order.setuName(user.getUname());
		order.setuCompany(user.getUcompany());
		
		//查询订单地址
		WjAddress address = addressService.getAddressId(order.getAid());
		
		
		//查询子订单
		List<WjOrderItem> orderItem = orderService.getOrderItem(order.getId());
		
		
		model.addObject("orderItem", orderItem);
		model.addObject("address", address);
		model.addObject("order", order);
		model.setViewName("order_view");
		return model;
	}
	
	
	@RequestMapping("/order_updateState")
	public String goods_updateState(String id,Integer state) {
		if(!StringUtils.isEmpty(id)){
			WjOrder order = new WjOrder();
			order.setId(id);
			if(state==2){
				order.setStatus(2);
				order.setDistributionTime(new Date());
			}else if(state==3) {
				order.setStatus(3);
				order.setDeliverTime(new Date());
			}else if(state==4) {
				order.setStatus(4);
				order.setReceiveTime(new Date());
			}
			orderService.updateOrder(order);
		}
		return "redirect:/admin/order/order_view.htm?id="+id;
	}

	@RequestMapping("/print.htm")
	public ModelAndView showPrint(String orderId,String Customer,String Salesman,String Remarks,ModelAndView model){
		//查询主订单
		WjOrder order = orderService.getOrderId(orderId);
		
		//查询子订单
		List<WjOrderItem> orderItem = orderService.getOrderItem(order.getId());
		
		model.addObject("orderItem", orderItem);
		model.addObject("order", order);
		model.addObject("Customer", Customer);
		model.addObject("Salesman", Salesman);
		model.addObject("Remarks", Remarks);
		model.setViewName("print");
		return model;
	}
	@RequestMapping("/printform.htm")
	public ModelAndView showPrintform(String orderId,ModelAndView model){
				//查询主订单
				WjOrder order = orderService.getOrderId(orderId);
				
				//查询订单用户信息
				WjUser user = userService.getItemById(order.getUid());
				order.setuName(user.getUname());
				order.setuCompany(user.getUcompany());
				
				//查询子订单
				List<WjOrderItem> orderItem = orderService.getOrderItem(order.getId());
				
				model.addObject("orderItem", orderItem);
				model.addObject("order", order);
				model.setViewName("printform");
				return model;
	}
	
	
}
