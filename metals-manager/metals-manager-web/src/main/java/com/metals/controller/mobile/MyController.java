package com.metals.controller.mobile;

import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.xml.ws.Response;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.w3c.dom.ls.LSInput;

import com.metals.common.pojo.MetalsResult;
import com.metals.common.utils.JsonUtils;
import com.metals.common.utils.Md5Encrypt;
import com.metals.common.utils.UserPic;
import com.metals.pojo.WjOrder;
import com.metals.pojo.WjUser;
import com.metals.service.OrderService;
import com.metals.service.UserService;
import com.metals.utils.IPUtils;

@Controller
@RequestMapping("/my")
public class MyController {
	
	@Autowired
	private OrderService orderService;
	
	@Autowired
	private UserService userService;
	
	@RequestMapping("/my_index.htm")
	public String showMy(Model model,HttpServletRequest request){
		HttpSession session = request.getSession();
		WjUser user = (WjUser)session.getAttribute("huser");
		List<WjOrder> list1 = null;
		List<WjOrder> list2 = null;
		List<WjOrder> list3 = null;
		List<WjOrder> list4 = null;
		if(user!=null){
			 list1 = orderService.selectUOrderList(user.getUid(),1);
			 list2 = orderService.selectUOrderList(user.getUid(),2);
			 list3 = orderService.selectUOrderList(user.getUid(),3);
			 list4 = orderService.selectUOrderList(user.getUid(),4);
		}
		
		model.addAttribute("i1", list1==null?0:list1.size());
		model.addAttribute("i2", list2==null?0:list2.size());
		model.addAttribute("i3", list3==null?0:list3.size());
		model.addAttribute("i4", list4==null?0:list4.size());
		
		return "/home/my_index";
	}
	
	
	@RequestMapping("/versionList.htm")
	public String showVersionList(){
		return "/home/versionList";
	}
	
	
	@RequestMapping("/orderList.htm")
	public ModelAndView showorderList(Integer tab,ModelAndView model,HttpServletRequest request){
		HttpSession session = request.getSession();
		WjUser user = (WjUser)session.getAttribute("huser");
		List<WjOrder> AllList = null;
		List<WjOrder> list1 = null;
		List<WjOrder> list2 = null;
		List<WjOrder> list3 = null;
		List<WjOrder> list4 = null;
		if(user!=null){
		 AllList = orderService.selectUOrderList(user.getUid(),null);
		 list1 = orderService.selectUOrderList(user.getUid(),1);
		 list2 = orderService.selectUOrderList(user.getUid(),2);
		 list3 = orderService.selectUOrderList(user.getUid(),3);
		 list4 = orderService.selectUOrderList(user.getUid(),4);
		}
		model.addObject("data", AllList);
		model.addObject("data1", list1);
		model.addObject("data2", list2);
		model.addObject("data3", list3);
		model.addObject("data4", list4);
		model.addObject("tab", tab);
		model.setViewName("/home/my_order");
		return model;
	}
	
	@RequestMapping("/modifyPwd.htm")
	public String showModifyPwd(){
		return "/home/modifyPwd";
	}
	@RequestMapping("/register.htm")
	public String showRegister(){
		return "/home/register";
	}
	
	@RequestMapping("/login.htm")
	public String showLogin(){
		return "/home/login";
	}
	
	@RequestMapping("/registerUser")
	@ResponseBody
	public String registerUser(WjUser  user){
		if(user!=null) {
			List<WjUser> list = userService.getUserName(user.getUphone());
			if(list!=null && list.size()>0) {
				return JsonUtils.objectToJson(1024);
			}
			user.setUname(user.getUphone());
			user.setUtype((long)0);
			String str = UserPic.randomPic();
			if(!StringUtils.isEmpty(str)) {
				user.setUpic(str);
			}
			user.setUpwd(Md5Encrypt.md5(user.getUpwd().toLowerCase()));
			int i = userService.registerUser(user);
			if(i>0) {
				return JsonUtils.objectToJson(true);
			}
		}
		return JsonUtils.objectToJson(false);
	}
	
	
	//登录验证
	@RequestMapping("/doLogin")
	@ResponseBody
	private MetalsResult login(String username,String password,HttpServletRequest request,HttpServletResponse response) {
		MetalsResult result = null;
		if(username!=null&&password!=null) {
			result = userService.login(username, password);
			Integer status = result.getStatus();
			if(status==200) {
				
				HttpSession session = request.getSession();
				session.setAttribute("huser", result.getData());
				session.setMaxInactiveInterval(Integer.MAX_VALUE);
				WjUser data = (WjUser)result.getData();
				Cookie cookie = new Cookie("JSESSIONID", session.getId());
				cookie.setMaxAge(Integer.MAX_VALUE);
				cookie.setPath("/home");
				response.addCookie(cookie);
				result.setMsg(session.getId());
				//更新登录时间
				userService.updateLoginDate(data.getUid(),IPUtils.getIpAddrs(request),data.getUlogincount()+1);
			}
			return result;
		}
		return result;
	}
}
