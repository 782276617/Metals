package com.metals.service.impl;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.metals.common.pojo.EasyUIDataGridResult;
import com.metals.common.pojo.MetalsResult;
import com.metals.common.utils.Md5Encrypt;
import com.metals.mapper.WjOrderMapper;
import com.metals.mapper.WjUserMapper;
import com.metals.pojo.WjUser;
import com.metals.pojo.WjUserExample;
import com.metals.pojo.WjUserExample.Criteria;
import com.metals.service.UserService;

@Service
public class UserServiceimpl implements  UserService {


	
	@Autowired
	private WjUserMapper userMapper;
	
	
	@Autowired
	private WjOrderMapper orderMapper;
	
	@Override
	public WjUser getItemById(Integer uId) {
		WjUserExample example = new WjUserExample();
		//创建查询条件
		Criteria criteria = example.createCriteria();
		criteria.andUidEqualTo(uId);
		List<WjUser> list = userMapper.selectByExample(example);
		//判断list中是否为空
		WjUser item = null;
		if (list != null && list.size() > 0) {
			item = list.get(0);
			Double money = orderMapper.selectByPrimaryAmountKey(item.getUid());
			item.setMonetary(money);
		}
		return item;

	}
	

	@Override
	public MetalsResult login(String username, String password) {
		WjUserExample example = new WjUserExample();
		//创建查询条件
		Criteria criteria = example.createCriteria();
		criteria.andUnameEqualTo(username);
		criteria.andUpwdEqualTo(Md5Encrypt.md5(password).toLowerCase());
		
		List<WjUser> list = userMapper.selectByExample(example);
		
		//判断list中是否为空
		WjUser user = null;
		if (list != null && list.size() > 0) {
			user = list.get(0);
			return MetalsResult.ok(user);
		}else {
			return MetalsResult.build(500, "error");
		}
	}

	@Override
	public int updateLoginDate(Integer uid,String IP,Integer count) {
		WjUser user = new WjUser();
		user.setUlastdate(new Date());
		user.setUlastloginip(IP);
		user.setUid(uid);
		user.setUlogincount(count);
		userMapper.updateByPrimaryKeySelective(user);
		return 1;
	}

	@Override
	public MetalsResult updatepwd(String usedPwd,String newPwd,HttpServletRequest request) {
		HttpSession session = request.getSession();
		WjUser user = (WjUser)session.getAttribute("user");
		WjUser uer = new WjUser();
		if(user!=null&&usedPwd!=null) {
			if(Md5Encrypt.md5(usedPwd).toLowerCase().equals(user.getUpwd())){
				uer.setUpwd(Md5Encrypt.md5(newPwd).toLowerCase());
				uer.setUid(user.getUid());
				int i = userMapper.updateByPrimaryKeySelective(uer);
				if(i>0){
					user.setUpwd(Md5Encrypt.md5(newPwd).toLowerCase());
					session.setAttribute("user",user);
					return MetalsResult.build(200, "修改成功！");
				}
			}
					
			
		}
		return MetalsResult.build(500,"原密码错误！");
	}

	@Override
	public EasyUIDataGridResult selectUserListPage(int page, int rows,String type,String search, String value) {
		//分页处理
		PageHelper.startPage(page, rows);
		//执行查询
		
		WjUserExample example = new WjUserExample();
		
		example.setOrderByClause("uRegistetime desc");
		
		//添加条件
		Criteria criteria = example.createCriteria();
		
		if(!StringUtils.isEmpty(search)&&!StringUtils.isEmpty(value)) {
			if(search.equals("userName")){
				criteria.andUnameEqualTo(value);
			}else if(search.equals("uPhone")) {
				criteria.andUphoneEqualTo(value);
			}else if(search.equals("trueName")){
				criteria.andUrealnameEqualTo(value);
			}
		}
		if(type.equals("user")) {
			criteria.andUtypeEqualTo((long)0);
		}else if(type.equals("admin")){
			criteria.andUtypeEqualTo((long)1);
		}
		
		List<WjUser> list = userMapper.selectByExample(example);
		
		for (WjUser wjUser : list) {
			Double money = orderMapper.selectByPrimaryAmountKey(wjUser.getUid());
			wjUser.setMonetary(money);
		}
		
		//取total
		PageInfo<WjUser> pageInfo = new PageInfo<>(list);
		
		
		//创建返回值对象
		EasyUIDataGridResult result = new EasyUIDataGridResult(pageInfo.getFirstPage(), page, pageInfo.getPages(), list);
		return result;
	}
	

	@Override
	public EasyUIDataGridResult selectSearchAdminUser(int page, int rows,String search, String value) {
		return selectUserListPage(page, rows, "admin", search, value);
	}

	@Override
	public EasyUIDataGridResult selectSearchUser(int page, int rows,String search, String value) {
		return selectUserListPage(page, rows,"user", search, value);
	}


	@Override
	public int getUserCount(Date beginTime, Date endTime) {
		WjUserExample example = new WjUserExample();
		Criteria criteria = example.createCriteria();
		if(beginTime!=null) {
			criteria.andUregistetimeGreaterThanOrEqualTo(beginTime);
		}
		
		if(endTime!=null) {
			criteria.andUregistetimeLessThanOrEqualTo(endTime);
		}
		criteria.andUtypeEqualTo((long)0);
		int	count = userMapper.countByExample(example);
		return count;
	}


	@Override
	public int registerUser(WjUser user) {
		//添加注册时间
		user.setUregistetime(new Date());
		user.setUname(user.getUphone());
		user.setUpwd(Md5Encrypt.md5(user.getUpwd()).toLowerCase());
		user.setUtype(0L);
		
		//更新
		return userMapper.insertSelective(user);
	}


	@Override
	public List<WjUser> getUserName(String name) {
		if(!StringUtils.isEmpty(name)){
			WjUserExample example = new WjUserExample();
			Criteria criteria = example.createCriteria();
			criteria.andUnameLike(name);
			return userMapper.selectByExample(example);
		}
		return null;
	}


	@Override
	public int updateUser(WjUser user) {
		return userMapper.updateByPrimaryKeySelective(user);
	}

}
