package com.putian.dao;
import com.putian.domain.User;

public interface UpdateUserDAO {
	/**
	 *修改用户
	 * @param book:修改后的用户
	 * @return
	 */
	public boolean alterUser(User user);
}
