package com.metals.controller;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.metals.common.pojo.MetalsResult;
import com.metals.common.utils.CommUtil;
import com.metals.common.utils.Md5Encrypt;
import com.metals.common.utils.UserPic;
import com.metals.pojo.WjUser;
import com.metals.service.UserService;
import com.metals.utils.IPUtils;

@Controller
public class UserController {
	
	@Autowired
	private UserService  userService;
	
	
	
	
	@RequestMapping("/user/user_add")
	public String showaddUser(WjUser user) {
		return "user_add";
	}
	
	
	
	
	@RequestMapping("/user/user_save")
	public String addUser(WjUser user,Model model,HttpServletRequest request) {
		String str = UserPic.randomPic();
		if(!StringUtils.isEmpty(str)) {
			user.setUpic(str);
		}
		 int i = userService.registerUser(user);
		 if(i>0){
			 model.addAttribute("list_url", CommUtil.getURL(request) + "/admin/user_list.htm");
				model.addAttribute("op_title","添加成功！");
			 return "success";
		 }else {
			 model.addAttribute("list_url", CommUtil.getURL(request) + "/user/user_add.htm");
			 model.addAttribute("op_title","添加失败！");
		 }
		return "error";
	}
	
	@RequestMapping("/user/user_edit")
	public String getUserEdit(Integer id,Model model) {
		WjUser user = userService.getItemById(id);
		model.addAttribute("data",user);
		return "user_edit";
	}
	
	
	@RequestMapping("/user/user_edit_save")
	public String saveEditUser(WjUser user,Model model,HttpServletRequest request) {
		if(!StringUtils.isEmpty(user.getUpwd())  ){
			user.setUpwd(Md5Encrypt.md5(user.getUpwd()).toLowerCase());
		}else {
			user.setUpwd(null);
		}
		int i = userService.updateUser(user);
		model.addAttribute("list_url", CommUtil.getURL(request) + "/admin/user_list.htm");
		if(i>0){
			model.addAttribute("op_title","更新成功！");
			return "success";
		}else {
			model.addAttribute("op_title","更新失败！");
		}
		return "error";
	}
	
	//登录验证
	@RequestMapping("/admin/login")
	@ResponseBody
	private MetalsResult login(String username,String password,HttpServletRequest request,HttpServletResponse response) {
		MetalsResult result = null;
		if(username!=null&&password!=null) {
			result = userService.login(username, password);
			Integer status = result.getStatus();
			if(status==200) {
				int savetime = (365*2)*24*60*60;
				
				HttpSession session = request.getSession();
				session.setAttribute("user", result.getData());
				session.setMaxInactiveInterval(savetime);
				
				Cookie cookie = new Cookie("JSESSIONID", session.getId());
				cookie.setMaxAge(savetime);
				cookie.setPath("/");        
				response.addCookie(cookie);
				
				WjUser data = (WjUser)result.getData();
				//更新登录时间
				userService.updateLoginDate(data.getUid(),IPUtils.getIpAddrs(request),data.getUlogincount()+1);
			}
			return result;
		}
		return result;
	}

}
