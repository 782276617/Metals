package com.metals.service.impl;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.metals.common.pojo.EasyUIDataGridResult;
import com.metals.common.utils.CommUtil;
import com.metals.mapper.WjAddressMapper;
import com.metals.mapper.WjOrderItemMapper;
import com.metals.mapper.WjOrderMapper;
import com.metals.mapper.WjUserMapper;
import com.metals.pojo.WjAddress;
import com.metals.pojo.WjAddressExample;
import com.metals.pojo.WjOrder;
import com.metals.pojo.WjOrderExample;
import com.metals.pojo.WjOrderExample.Criteria;
import com.metals.pojo.WjOrderItem;
import com.metals.pojo.WjOrderItemExample;
import com.metals.pojo.WjUser;
import com.metals.pojo.WjUserExample;
import com.metals.service.OrderService;
import com.metals.service.UserService;

@Service
public class OrderServiceImpl implements OrderService {

	@Autowired
	private WjOrderMapper orderMapper;
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private WjUserMapper userMapper;
	
	
	@Autowired
	private WjAddressMapper addressMapper;
	
	
	
	@Autowired
	private WjOrderItemMapper orderItemMapper;
	@Override
	public int getGoodsCount(String goodsId) {
		WjOrderItemExample example = new WjOrderItemExample();
		com.metals.pojo.WjOrderItemExample.Criteria criteria = example.createCriteria();
		criteria.andGoodsIdEqualTo(goodsId);
		int count = orderItemMapper.countByExample(example);
		return count;
	}

	@Override
	public WjOrder getOrderId(String id) {
		WjOrder order = orderMapper.selectByPrimaryKey(id);
		return order;
	}
	@Override
	public int getOrderCount(Date beginTime, Date endTime) {
		WjOrderExample example = new WjOrderExample();
		Criteria criteria = example.createCriteria();
		if(beginTime!=null) {
			criteria.andCreateTimeGreaterThanOrEqualTo(beginTime);
		}
		
		if(endTime!=null) {
			criteria.andCreateTimeLessThanOrEqualTo(endTime);
		}
		
		
		
		int	count = orderMapper.countByExample(example);
		return count;
	}
	@Override
	public List<WjOrderItem> getOrderItem(String orderId) {
		WjOrderItemExample example = new WjOrderItemExample();
		com.metals.pojo.WjOrderItemExample.Criteria createCriteria = example.createCriteria();
		createCriteria.andOrderIdEqualTo(orderId);
		
		List<WjOrderItem> list = orderItemMapper.selectByExample(example);
		
		return list; 
	}
	@Override
	public int updateOrder(WjOrder order) {
		return orderMapper.updateByPrimaryKeySelective(order);
	}
	@Override
	public int getOrderStateCount(Integer state) {
		WjOrderExample example = new WjOrderExample();
		Criteria criteria = example.createCriteria();
		criteria.andStatusEqualTo(state);
		int count = orderMapper.countByExample(example);
		return count;
	}
	@Override
	public List<WjOrder> selectUOrderList(Integer uId,Integer orderState) {	
		WjOrderExample example = new WjOrderExample();
		Criteria criteria = example.createCriteria();
		criteria.andUidEqualTo(uId);
		example.setOrderByClause("create_time desc");
		if(orderState!=null) {
			if(orderState==1) {
				criteria.andStatusEqualTo(1);
			}else if(orderState==2){
				criteria.andStatusEqualTo(2);
			}else if(orderState==3) {
				criteria.andStatusEqualTo(3);
			}else if(orderState==4) {
				criteria.andStatusEqualTo(4);
			}
		}
		List<WjOrder> list = orderMapper.selectByExample(example);
			for (WjOrder wjOrder : list) {
				WjOrderItemExample example2 = new WjOrderItemExample();
				com.metals.pojo.WjOrderItemExample.Criteria criteria2 = example2.createCriteria();
				criteria2.andOrderIdEqualTo(wjOrder.getId());
				List<WjOrderItem> list2 = orderItemMapper.selectByExample(example2);
				wjOrder.setOrderItem(list2);
			}
		return list;
	}
	@Override
	public int saveOrder(WjOrder order) {

		int insert = orderMapper.insertSelective(order);
			
		int j = -1;
		if(insert>0) {
			//子订单
			List<WjOrderItem> Item = order.getOrderItem();
			for (WjOrderItem wjOrderItem : Item) {
				wjOrderItem.setOrderId(order.getId());
				int i = orderItemMapper.insertSelective(wjOrderItem);
				if(i>0) {
					j=1;
				}
			}
			return j;
		}
		return 0;
	}

	@Override
	public EasyUIDataGridResult selectUserListPage(Integer page, Integer rows, Integer order_status, String type,
			String type_data, Date beginTime, Date endTime, BigDecimal begin_price, BigDecimal end_price,
			String province, String city, String area) {
		
		boolean blak = false;
		
		//执行查询
		WjOrderExample example = new WjOrderExample();
		
		//最新排序
		example.setOrderByClause("create_time desc");
		
		Criteria criteria = example.createCriteria();
		
		
		//省
		if(province!=null&&province.length()>0){
			WjAddressExample example2 = new WjAddressExample();
			com.metals.pojo.WjAddressExample.Criteria criteria2 = example2.createCriteria();
			criteria2.andRegionLike(province+" "+city+ "_" +area+"%");
			List<WjAddress> list = addressMapper.selectByExample(example2);
			List<Integer> listid = new ArrayList<>(); 
			for (WjAddress address : list) {
				listid.add(address.getId());
			}
			if(listid.size()<=0){
				listid.add(-11111111);
			}
			
			criteria.andAidIn(listid);
			blak = true;
		}
		
		
			//订单状态
				if(!StringUtils.isEmpty(order_status)) {
					criteria.andStatusEqualTo(order_status);
					blak = true;
				}
				
				
				//买家搜索
				if("buyer".equals(type)&&!StringUtils.isEmpty(type_data)) {
					WjUserExample example2 = new WjUserExample();
					com.metals.pojo.WjUserExample.Criteria createCriteria = example2.createCriteria();
					createCriteria.andUrealnameEqualTo(type_data);
					List<WjUser> list = userMapper.selectByExample(example2);
					List<Integer> lists = new ArrayList<>();
					for (WjUser wjUser : list) {
						lists.add(wjUser.getUid());
					}
					if(list.size()>0) {
						criteria.andUidIn(lists);
						blak = true;
					}
				}
				//订单搜索
				else if("order".equals(type)&&!StringUtils.isEmpty(type_data)&&CommUtil.isNumeric(type_data)) {
					criteria.andIdEqualTo(type_data);
					blak = true;
				}
				
				
				//开始时间
				if(beginTime!=null){
					criteria.andCreateTimeGreaterThanOrEqualTo(beginTime);
					blak = true;
				}
				
				//结束时间
				if(endTime!=null){
					GregorianCalendar calendar = new GregorianCalendar();
					calendar.setTime(endTime);
					calendar.add(calendar.DATE,1);
					criteria.andCreateTimeLessThanOrEqualTo(calendar.getTime());
					blak = true;
				}
				
				
				//开始金额
				if(begin_price!=null){
					criteria.andPaymentGreaterThanOrEqualTo(begin_price);
					blak = true;
				}
				
				//结束金额
				if(end_price!=null){
					criteria.andPaymentLessThanOrEqualTo(end_price);
					blak = true;
				}
				
		PageHelper.startPage(page,rows);
		List<WjOrder> list = new ArrayList<>();
		if(type!=null||blak){
				//搜索条件
				list = orderMapper.selectByExample(example);
		}else if(type==null&&blak==false){
				//数据列表
				list = orderMapper.selectByExample(example);
		}
	
		
		
		//取total
		PageInfo<WjOrder> pageInfo = new PageInfo<>(list);
		//创建返回值对象
		EasyUIDataGridResult result = new EasyUIDataGridResult(pageInfo.getFirstPage(), page, pageInfo.getPages(), list);	
		
		if(result.getRows()!=null&&result.getRows().size()>0){
			List<WjOrder> lists = (List<WjOrder>)result.getRows();
			for (WjOrder order : lists) {
				WjUser user = userService.getItemById(order.getUid());
				order.setuName(user.getUrealname());
				order.setuCompany(user.getUcompany());
			}
		}
		return result;
	}
}
