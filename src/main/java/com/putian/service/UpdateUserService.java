package com.putian.service;

import com.putian.domain.User;

public interface UpdateUserService {
	/**
	 *修改用户信息
	 * @param user:最新用户信息
	 * @return
	 */
	public boolean alterUserService(User user);
}
