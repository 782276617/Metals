package com.metals.controller;

import java.util.List;
import java.util.Properties;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.metals.common.pojo.EasyUIDataGridResult;
import com.metals.common.pojo.MetalsResult;
import com.metals.common.utils.CommUtil;
import com.metals.pojo.WjOrder;
import com.metals.pojo.WjUser;
import com.metals.service.OrderService;
import com.metals.service.UserService;
import com.metals.trsk.HourResult;
import com.metals.trsk.OrderStateResult;
import com.metals.trsk.WeekTaskResult;
import com.metals.utils.DatabaseTools;
import com.metals.utils.IPUtils;

@Controller
@RequestMapping("/admin")
public class ManageController {

	@Autowired
	private UserService  userService;
	@Autowired
	private OrderService  orderService;
	

	@RequestMapping("/index.htm")
	private String  showLogin() {
		return "login";
	}
	
	
	
	@RequestMapping("/welcome.htm")
	private String  showWelcome(Model model,HttpServletRequest request) {
		 Properties props = System.getProperties();
		 HttpSession session = request.getSession();
		 WjUser user = (WjUser)session.getAttribute("user");
		 
		 
		 //涓�涓ぜ鎷滅粺璁＄殑鏁版嵁
		 model.addAttribute("WThistime",WeekTaskResult.Thistime);
		 model.addAttribute("WNexttime",WeekTaskResult.Nexttime);
		 model.addAttribute("WnewUserCount",WeekTaskResult.newUserCount);
		 model.addAttribute("WnewOrderCount",WeekTaskResult.newOrderCount);
		 model.addAttribute("WnewGoodsCount",WeekTaskResult.newGoodsCount);
	
		 
		 //鍗婂皬鏃剁粺璁＄殑鏃堕棿
		 model.addAttribute("HThistime",HourResult.Thistime);
		 model.addAttribute("HNexttime",HourResult.Nexttime);
		 model.addAttribute("HnewUserCount",HourResult.userCount);
		 model.addAttribute("HnewOrderCount",HourResult.orderCount);
		 model.addAttribute("HnewGoodsCount",HourResult.goodsCount);
		 
		 
		 //鍗婂皬鏃剁粺璁＄殑鏃堕棿
		 model.addAttribute("OThistime",OrderStateResult.Thistime);
		 model.addAttribute("ONexttime",OrderStateResult.Nexttime);
		 model.addAttribute("OpendingCount",OrderStateResult.pendingCount);
		 model.addAttribute("OconsignmentCount",OrderStateResult.consignmentCount);
		 model.addAttribute("OshippingCount",OrderStateResult.shippingCount);
		 model.addAttribute("OreceivedCount",OrderStateResult.receivedCount);
		 
		 model.addAttribute("os", props.getProperty("os.name"));
		 model.addAttribute("java_version", props.getProperty("java.version"));
		 model.addAttribute("shop_version", Integer.valueOf(20170119));
		 model.addAttribute("database_version",DatabaseTools.queryDatabaseVersion());
		 model.addAttribute("lastLoginIp",IPUtils.getIpAddrs(request));
		 model.addAttribute("userName",user.getUname());
		 model.addAttribute("lastLoginDate",user.getUlastdate());
		return "welcome";
	}
	
	//淇敼瀵嗙爜椤甸潰
	@RequestMapping("/admin_pws.htm")
	private String  showAdmin_pws(Model model,HttpServletRequest request) {
		return "admin_pws";
	}
	
	

	//淇敼瀵嗙爜
	@RequestMapping("/admin_pws_save.htm")
	private ModelAndView  showAdmin_pws_save(String usedPwd,String newPwd,HttpServletRequest request) {
		ModelAndView model = new ModelAndView();
		MetalsResult result = userService.updatepwd(usedPwd, newPwd, request);
		if(result.getStatus()==200) {
			model.addObject("op_title", result.getMsg());
			model.setViewName("success");
		}else {
			model.addObject("op_title", result.getMsg());
			model.setViewName("error");
		}
		model.addObject("list_url", CommUtil.getURL(request) + "/admin/admin_pws.htm");
		
		return model;
	}

	//閫�鍑�
	@RequestMapping("/logout.htm")
	public String logout(HttpServletRequest request) throws Exception {
	    HttpSession session = request.getSession();
	    session.removeAttribute("user");
	    return "redirect:/admin/index.htm";
	}
	
	
	
	//绠＄悊棣栭〉
	@RequestMapping("/manage.htm")
	private String  showManage(HttpServletRequest request) {
		HttpSession session = request.getSession();
		WjUser user = (WjUser)session.getAttribute("user");
		if(user!=null){
			return "manage";
		}
		return "redirect:/admin/index.htm";
	}
	
	
	

	
	//绔欑偣璁剧疆
	@RequestMapping("/set_site.htm")
	private String  getSet_site() {
		return "set_site_setting";
	}
	

	//浼氬憳绠＄悊
	@RequestMapping("/user_list.htm")
	private ModelAndView  getUser_list(@RequestParam(defaultValue="1")int currentPage,@RequestParam(defaultValue="10")int rows,ModelAndView model) {
		EasyUIDataGridResult result = userService.selectSearchUser(currentPage, rows, null, null);
		model.addObject("data",result);
		model.setViewName("user_list");
		return model;
	}
	
	//浼氬憳绠＄悊鎼滅储
	@RequestMapping("/search.htm")
	private ModelAndView dsearchUser(@RequestParam(defaultValue="1")int currentPage,@RequestParam(defaultValue="10")int rows,String condition,String value,ModelAndView model) {
		EasyUIDataGridResult result = userService.selectSearchUser(currentPage, rows, condition, value);
		model.addObject("condition",condition);
		model.addObject("search",value);
		model.addObject("data",result);
		model.setViewName("user_list");
		return model;
	}
	
	
	//浼氬憳绠＄悊鏌ョ湅
	@RequestMapping("/user_see.htm")
	private ModelAndView showUser_see(Integer id,ModelAndView model) {
		WjUser user = userService.getItemById(id);
		List<WjOrder> list = orderService.selectUOrderList(user.getUid(), -1);
		model.addObject("money",list.size());
		model.addObject("data",user);
		model.setViewName("user_see");
		return model;
	}
	
	
	


	
	

	
	

	/*
	 *=====================================鍟嗗搧=========================================
	 * */
	


	
	//绫诲瀷绠＄悊
	@RequestMapping("/goods_type_list.htm")
	private String  showGoods_type_list(Model model,HttpServletRequest request) {
		return "goods_type_list";
	}
	
	
	
	//瑙勬牸绠＄悊
	@RequestMapping("/goods_spec_list.htm")
	private String  showGoods_spec_list(Model model,HttpServletRequest request) {
		return "goods_spec_list";
	}
	
	
	
	
	/**
	 * ================================浜ゆ槗==============================
	 */
	
	
	//璁㈠崟璁剧疆
	@RequestMapping("/set_order_confirm.htm")
	private String  showSet_order_confirm(Model model,HttpServletRequest request) {
		return "set_order_confirm";
	}
	
	
	/**
	 * ================================宸ュ叿==============================
	 */
	//骞垮憡鏂板
	@RequestMapping("/cache_list.htm")
	private String  showCache_list(Model model,HttpServletRequest request) {
		return "cache_list";
	}
	
}
