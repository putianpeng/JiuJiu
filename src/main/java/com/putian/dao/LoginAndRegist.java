package com.putian.dao;
import com.putian.domain.User;
public interface LoginAndRegist {
	/**
	 * 验证普通用户登录
	 */
	public boolean login(User user);
	
	/**
	 * 
	 */
	public boolean rootLogin(String username,String password);
	
	/**
	 *执行注册
	 */
	public boolean regist(User user);
	/**
	 * 检测用户是否被注册
	 */
	public boolean ishaveUsername(String username);
}
