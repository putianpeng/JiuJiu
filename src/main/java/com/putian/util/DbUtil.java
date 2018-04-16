package com.putian.util;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
public class DbUtil {
	private DbUtil() {};
	private static SqlSessionFactory sqlSessionFactory;
	public static ApplicationContext springContext;
	static {
		springContext = new ClassPathXmlApplicationContext("springContext.xml");
		sqlSessionFactory=(SqlSessionFactory) springContext.getBean("sqlSessionFactory");
	}
	public static SqlSession getSqlSession() {
		return sqlSessionFactory.openSession();
	}
	public static SqlSession getSqlSession(boolean bool) {
		return sqlSessionFactory.openSession(bool);
	}
}
