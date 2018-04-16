package com.putian.service;
import com.putian.domain.User;
public interface LoginRegist {
	/**
	 * 登录服务
	 */
	public boolean loginService(String username,String password);
	/**
	 * 注册服务
	 */
	public boolean RegistService(User user);
	/**
	 * 验证用户名是否被注册
	 */
	public boolean IshaveUsername(String username);
}
