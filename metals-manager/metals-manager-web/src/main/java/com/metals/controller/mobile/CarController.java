package com.metals.controller.mobile;

import java.io.UnsupportedEncodingException;
import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.http.client.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.metals.common.pojo.MetalsResult;
import com.metals.common.utils.CommUtil;
import com.metals.common.utils.IDUtils;
import com.metals.common.utils.JsonUtils;
import com.metals.pojo.WjAddress;
import com.metals.pojo.WjCart;
import com.metals.pojo.WjFavorite;
import com.metals.pojo.WjGoods;
import com.metals.pojo.WjOrder;
import com.metals.pojo.WjOrderItem;
import com.metals.pojo.WjUser;
import com.metals.service.AddressService;
import com.metals.service.CartService;
import com.metals.service.FavoriteService;
import com.metals.service.GoodsService;
import com.metals.service.OrderService;

@Controller
@RequestMapping("/cart")
public class CarController {
	@Autowired
	private CartService cartService;
	
	@Autowired
	private GoodsService goodsService;
	
	@Autowired
	private AddressService addressService;
	
	@Autowired
	private FavoriteService favoriteService;
	
	 @Autowired
	private OrderService orderService;
	@RequestMapping("/cart_list.htm")
	public ModelAndView showCar(ModelAndView model,HttpServletRequest request){
		HttpSession session = request.getSession();
		WjUser user = (WjUser)session.getAttribute("huser");
		if(user!=null){
			List<WjCart> list = cartService.getCartUidOrGoodsidList(user.getUid(),null);
			model.addObject("cart",list);
		}
		model.setViewName("/home/car");
		return model;
	}
	
	@RequestMapping("/add_cart.htm")
	public String add_cart(String goodsId,String spec,HttpServletRequest request) throws UnsupportedEncodingException{
		HttpSession session = request.getSession();
		WjUser user = (WjUser)session.getAttribute("huser");
		if(user!=null){
			List<WjCart> list = cartService.getCartUidOrGoodsidList(user.getUid(),goodsId);
	
/*		if(!StringUtils.isEmpty(spec)) {
			spec = new String(spec.getBytes("iso-8859-1"),"utf-8");
		}
*/		WjCart cart = new WjCart();
		MetalsResult result = null;
		boolean falsz = false;
		for (WjCart wjCart : list) {
			if(!spec.equals(wjCart.getSpec())){
				falsz = true;
			}
		}
		if(list.isEmpty()||falsz) {							//插入
			WjGoods goods = goodsService.getGoodsId(goodsId);
			cart.setUid(user.getUid());
			cart.setGid(goods.getId());
			cart.setName(goods.getName());
			cart.setPrice(goods.getPrice());
			cart.setGoodsPic(goods.getImage());
			cart.setCreated(new Date());
			cart.setSpec(spec);
			result = cartService.insertCart(cart);
		}else {
			cart.setId(list.get(0).getId());		  //更新数量
			cart.setNumber(list.get(0).getNumber()+1);
			 result = cartService.updateCart(cart);
		}
		}
		return "redirect:/cart/cart_list.htm";
	}
	
	
	//更新购物车商品数量
	@RequestMapping("/updateNum")
	@ResponseBody
	public MetalsResult updateNum(String goodsId,String type,HttpServletRequest request){
		MetalsResult result = null;
		HttpSession session = request.getSession();
		WjUser user = (WjUser)session.getAttribute("huser");
		if(user!=null){
		List<WjCart> list = cartService.getCartUidOrGoodsidList(user.getUid(),goodsId);
		if(!list.isEmpty()) {						  //更新	
			WjCart cart = new WjCart();
			cart.setId(list.get(0).getId());
			if("jia".equals(type)) {
			   //更新数量
			   cart.setNumber(list.get(0).getNumber()+1);
			}else if("jian".equals(type)){
				 cart.setNumber(list.get(0).getNumber()-1);
			}
			result = cartService.updateCart(cart);
			}
		}
		return result;
	}
	
	@RequestMapping("/order.htm")
	public ModelAndView showOrder(Integer[] cartId,ModelAndView model,HttpServletRequest request){
		HttpSession session = request.getSession();
		WjUser user = (WjUser)session.getAttribute("huser");
		WjAddress address = addressService.getDefaultAddress(user.getUid());
		model.addObject("address", address);
			
		if(cartId==null) {
		
			cartId = (Integer[])session.getAttribute(1+"");
		}else {
			session.setAttribute(1+"", cartId);
		}
		if(cartId!=null) {
			List<WjCart> cartList = cartService.getCartInId( Arrays.asList(cartId));
			model.addObject("order", cartList);
			model.setViewName("/home/order");
		}else {
			model.setViewName("redirect:/cart/cart_list.htm");
		}
		return model;
	}
	
	@RequestMapping("/my_addres.htm")	
	public ModelAndView showMy_addres(ModelAndView model,HttpServletRequest request){
		HttpSession session = request.getSession();
		WjUser user = (WjUser)session.getAttribute("huser");
		if(user!=null) {
		List<WjAddress> list = addressService.getAddressUid(user.getUid());
		model.addObject("data", list);
		}
		model.setViewName("/home/my_addres");
		return model;
	}
	
	@RequestMapping("/my_edit_address.htm")
	public String showMy_edit_address(){
		return "/home/my_edit_address";
	}
	
	@RequestMapping("/saveAddress")
	@ResponseBody
	public void saveAddress(WjAddress address,HttpServletRequest request){
		HttpSession session = request.getSession();
		WjUser  user = (WjUser)session.getAttribute("huser");
		if(user!=null) {
		List<WjAddress> list = addressService.getAddressUid(user.getUid());
			if(!StringUtils.isEmpty(address)) {
				address.setUid(user.getUid());
				if(list.isEmpty()){
					address.setIsdefault(true);
				}
				addressService.insertAddress(address);
			}
		}
	}
	
	@RequestMapping("/deleteAdressId")
	@ResponseBody
	public MetalsResult deleteAdressId(Integer id){
		MetalsResult result = addressService.deleteAddress(id);
		return result;
	}
	
	@RequestMapping("/defaultAdress")
	@ResponseBody
	public void defaultAdress(Integer id,HttpServletRequest request){
		HttpSession session = request.getSession();
		WjUser user = (WjUser)session.getAttribute("huser");
		if(user!=null) {
			addressService.updateDefault(user.getUid(), id);
		}
	}
	
	
	
	/*
	 * 收藏商品
	 * */
	@RequestMapping("/my_favorite.htm")
	public ModelAndView my_collect(ModelAndView model,HttpServletRequest request){
		HttpSession session = request.getSession();
		WjUser user = (WjUser)session.getAttribute("huser");
		if(user!=null) {
		List<WjFavorite> list = favoriteService.getFavorite(user.getUid(), null);
		List<WjGoods> list2 = new ArrayList<>();
		if(list!=null&&list.size()>0){
			for (WjFavorite favorite : list) {
				WjGoods goodsId = goodsService.getGoodsId(favorite.getGid()); 
				list2.add(goodsId);
			}
		}
		model.addObject("favorite", list);
		model.addObject("goods", list2);
		}
		model.setViewName("/home/my_favorite");
		return model;
	}
	
	
	/*
	 * 删除购物车
	 */
	@RequestMapping("/deleteCart")
	@ResponseBody
	public MetalsResult deleteCart(Integer id){
		MetalsResult result = cartService.deleteCart(id);
		return result;
	}
	
	/*
	 * 删除收藏商品
	 */
	@RequestMapping("/deleteFavorite")
	@ResponseBody
	public MetalsResult deleteFavorite(Integer id){
		MetalsResult result = favoriteService.deleteFavorite(id);
		return result;
	}
	
//	
//	/*
//	 * 立即下单
//	 */
//	@RequestMapping("/xiaOrder.htm")
//	public String xiaOrder(String goodsId,String spec,HttpServletRequest request) throws UnsupportedEncodingException{
//		HttpSession session = request.getSession();
//		WjUser user = (WjUser)session.getAttribute("huser");
//		if(user!=null) {
//		List<WjCart> list = cartService.getCartUidOrGoodsidList(user.getUid(),goodsId);
//		WjCart cart = new WjCart();
//		boolean falsz = false;
//		for (WjCart wjCart : list) {
//			if(!spec.equals(wjCart.getSpec())){
//				falsz = true;
//			}
//		}
//		if(list.isEmpty()||falsz) {							//插入
//			WjGoods goods = goodsService.getGoodsId(goodsId);
//			cart.setUid(user.getUid());
//			cart.setGid(goods.getId());
//			cart.setName(goods.getName());
//			cart.setPrice(goods.getPrice());
//			cart.setGoodsPic(goods.getImage());
//			cart.setCreated(new Date());
//			cart.setSpec(spec);
//			cartService.insertCart(cart);
//		}else {
//			cart.setId(list.get(0).getId());		  //更新数量
//			cart.setNumber(list.get(0).getNumber()+1);
//			 cartService.updateCart(cart);
//		}
//		return "forward:/cart/order.htm&cartId="+cart.getId();
//		}
//		return "forward:/home/index.htm";
//	}
	
	
	
	@RequestMapping("/validateStock")
	@ResponseBody
	public String validateStock(@RequestParam(value ="cartIds[]")String[] cartIds) {
		if(cartIds!=null&&cartIds.length>0) {
			Integer[] ids = new Integer[cartIds.length];
			for (int i = 0; i < ids.length; i++) {
				ids[i] = Integer.parseInt(cartIds[i]);
			}
			List<WjCart> list = cartService.getCartInId(Arrays.asList(ids));
			
			if(list!=null) {
				List<String> list2 = new ArrayList<>();
				String[] gIds = new String[list.size()];
				Integer[] number = new Integer[list.size()];
				for (int i = 0; i < list.size(); i++) {
					String  gId = list.get(i).getGid();
					list2.add(gId);
					gIds[i] = gId;
				}
				
				Map<String, String> map = CommUtil.getRepetitionIndex(list2);
				Iterator it = map.entrySet().iterator();  
				while(it.hasNext()){
					Map.Entry entry = (Map.Entry) it.next();   
					
					//获取每个重复商品的下标
					String  value  =  entry.getValue().toString();
					
					String[] split = value.split(",");
					Integer total = 0;
					//获取重复商品库存数
					for (int i = 0; i < split.length; i++) {
						WjCart cart = list.get(i);
						total += cart.getNumber();
					}
					
					//更新库存数
					for (int i = 0; i < split.length; i++) {
						WjCart cart = list.get(i);
						cart.setNumber(total);
					}
				} 
				
				for (int i = 0; i < list.size(); i++) {
					Integer num  = list.get(i).getNumber();
					number[i] = num;
				}
			
				if((gIds!=null&&number!=null)&&(gIds.length==number.length)){
					int i  = goodsService.getStockstatus(gIds,number,map!=null&&map.size()>0?map.size():null);
					if(i>0) {
						return "success";
					}
				}
			}
		}
		return "fail";
	}

	@RequestMapping("/saveOrder")
	@ResponseBody
	public String saveOrder(Integer aid,String cartId,HttpServletRequest request){
		
		String[] strings = cartId.split(",");
		List<Integer>  list = new ArrayList<>();
		if(strings.length>0) {
			List<String> asList = Arrays.asList(strings);
			for (String integer : asList) {
				if(integer!=null||!"".equals(integer)) {
					list.add(Integer.valueOf(integer));
				}
			}
		}
		WjOrder order = new WjOrder();
		List<WjCart> cartList = cartService.getCartInId(list);
		List<WjOrderItem> orderItemList = new ArrayList<>();
		double total = 0;
		
		for (WjCart wjCart : cartList) {
			//订单子项
			WjOrderItem item = new WjOrderItem();

			BigDecimal price = wjCart.getPrice();
			int number = wjCart.getNumber();
			BigDecimal totals = price.multiply(new BigDecimal(number));
			
			item.setId(IDUtils.genItemId()+"");
			item.setGoodsId(wjCart.getGid());
			item.setNum(number);
			item.setTitle(wjCart.getName());
			item.setPrice(price);
			item.setSpec(wjCart.getSpec());
			item.setTotalFee(totals);
			item.setPicPath(wjCart.getGoodsPic());
			total += totals.doubleValue();
			
			orderItemList.add(item);
		}
		
		
		
		
		//地址
		if(aid!=null&&aid>0) {
			order.setAid(aid);
		}
		
		
		//查询当天的订单总数
		Date dayBegin = CommUtil.getDayBegin();
		Date dayEnd = CommUtil.getDayEnd();
		int orderCount = orderService.getOrderCount(dayBegin, dayEnd);
		
		
		//总金额
		order.setPayment(new BigDecimal(total));
		Date date = new Date();
		//订单生成日期
		order.setCreateTime(date);
		
		order.setOrderItem(orderItemList);
		
		//生成ID
		String format = new SimpleDateFormat("yyyyMMdd").format(date);
		order.setId(format+String.format("%03d",orderCount+1));
		
		
		order.setShippingCode(order.getId());
		HttpSession session = request.getSession();
		WjUser user = (WjUser)session.getAttribute("huser");
		order.setUid(user.getUid());
		int i = orderService.saveOrder(order);
		if(i>0) {
			cartService.deleteCartList(list);
			
			for (int j = 0; j < cartList.size(); j++) {
				WjCart wjCart = cartList.get(j);
				WjGoods goodsId = goodsService.getGoodsId(wjCart.getGid());
				
				
				WjGoods goods = new WjGoods();
				
				
				//增加下单数
				int orderN = goodsId.getOrdern()+wjCart.getNumber();
				
				//减去库存数量
				int num = goodsId.getStockn()-wjCart.getNumber();
				
				goods.setId(goodsId.getId());
				
				goods.setStockn(num);
				
				goods.setOrdern(orderN);
				//更新库存数量
				goodsService.updateGoodsId(goods);
			}
			
			return  JsonUtils.objectToJson(true);
		}
		return JsonUtils.objectToJson(false);
	}
}
