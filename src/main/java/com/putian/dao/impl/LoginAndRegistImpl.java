package com.putian.dao.impl;
import java.util.Date;
import org.apache.ibatis.session.SqlSession;
import com.putian.dao.LoginAndRegist;
import com.putian.domain.User;
import com.putian.util.DbUtil;

public class LoginAndRegistImpl implements LoginAndRegist{
	public boolean login(User user) {
			SqlSession sqlSession = DbUtil.getSqlSession();
			User selectOne = sqlSession.selectOne("com.putian.dao.userMapper.suserLogin",user);
			sqlSession.close();
			if(selectOne!=null) {
				return true;
			}
			return false;
	}
	public boolean rootLogin(String username,String password) {
		SqlSession sqlSession = DbUtil.getSqlSession();
		User user = sqlSession.selectOne("com.putian.dao.userMapper.srootUserLogin",username);
		sqlSession.close();
		if(user!=null) {
			return true;
		}
		return false;
	}
	public boolean regist(User user) {
		SqlSession sqlSession = DbUtil.getSqlSession();
		java.sql.Date date = new java.sql.Date((new Date()).getTime());
		user.setRegistDate(date);
		int insert = sqlSession.insert("com.putian.dao.userMapper.iaddUser",user);
		sqlSession.close();
		if(insert>0) {
			return true;
		}
		return false;
	}
	
	public boolean ishaveUsername(String username) {
		SqlSession sqlSession = DbUtil.getSqlSession();
		User user = sqlSession.selectOne("com.putian.dao.userMapper.suser",username);
		sqlSession.close();
		if(user!=null) {
			return true;
		}
		
		return false;
	}
}
