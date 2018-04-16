package com.putian.dao.impl;
import org.apache.ibatis.session.SqlSession;

import com.putian.dao.UpdateUserDAO;
import com.putian.domain.User;
import com.putian.util.DbUtil;

public class UpdateUserDaoImpl implements UpdateUserDAO{
	public boolean alterUser(User user) {
		SqlSession sqlSession = DbUtil.getSqlSession();
		int update = sqlSession.update("com.putian.dao.userMapper.alterUser",user);
		if (update > 0) {
			return true;
		}
		sqlSession.close();
		return false;
	}
}
