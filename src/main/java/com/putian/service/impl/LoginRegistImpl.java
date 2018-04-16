package com.putian.service.impl;
import com.putian.dao.impl.LoginAndRegistImpl;
import com.putian.domain.User;
import com.putian.service.LoginRegist;

public class LoginRegistImpl implements LoginRegist{
	private LoginAndRegistImpl loginRegist = new LoginAndRegistImpl();
	public boolean loginService(String username,String password) {
		User user = new User();
		user.setUsername(username);
		user.setPassword(password);
		boolean bool = loginRegist.login(user);
		return bool;
	}
	public boolean RegistService(User user) {
		if(loginRegist.regist(user)) {
			return true;
		}
		return false;
	}
	public boolean IshaveUsername(String username) {
		if(loginRegist.ishaveUsername(username)) {
			return true;
		}
		return false;
	}
}
