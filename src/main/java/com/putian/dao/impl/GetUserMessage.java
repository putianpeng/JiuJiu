package com.putian.dao.impl;
import org.apache.ibatis.session.SqlSession;

import com.putian.domain.User;
import com.putian.util.DbUtil;

public class GetUserMessage {
	public User getUser(String username){
		SqlSession sqlSession = DbUtil.getSqlSession();
		User user = sqlSession.selectOne("com.putian.dao.userMapper.suser",username);
		sqlSession.close();
		return user;
	}
}
