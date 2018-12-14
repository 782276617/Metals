package com.metals.service;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.metals.common.pojo.EasyUIDataGridResult;
import com.metals.common.pojo.MetalsResult;
import com.metals.pojo.WjUser;

public interface UserService {
	
	
	WjUser getItemById(Integer uId);
	
	MetalsResult login(String username,String password);
	
	
	int updateLoginDate(Integer uid,String IP,Integer count);
	
	MetalsResult updatepwd(String usedPwd,String newPwd,HttpServletRequest request);
	
	EasyUIDataGridResult selectUserListPage(int page, int rows,String type,String search, String value);
	EasyUIDataGridResult selectSearchAdminUser(int page, int rows,String search,String value);
	EasyUIDataGridResult selectSearchUser(int page, int rows,String search,String value);

	int getUserCount(Date beginTime,Date endTime);
	
	
	/**
	 * 注册用户
	 * @param user
	 * @return
	 */
	int registerUser(WjUser user);
	
	/**
	 * 更新用户信息
	 * @param user
	 * @return
	 */
	int updateUser(WjUser user);
	
	List<WjUser> getUserName(String name);
}
