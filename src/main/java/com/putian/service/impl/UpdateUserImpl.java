package com.putian.service.impl;
import com.putian.dao.impl.UpdateUserDaoImpl;
import com.putian.domain.User;
import com.putian.service.UpdateUserService;
public class UpdateUserImpl implements UpdateUserService{
	private UpdateUserDaoImpl updateService = new UpdateUserDaoImpl();
	public boolean alterUserService(User user) {
		if(updateService.alterUser(user)) {
			return true;
		}
		return false;
	}
}
