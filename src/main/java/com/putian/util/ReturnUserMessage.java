package com.putian.util;

import com.putian.dao.impl.GetUserMessage;
import com.putian.domain.User;

public class ReturnUserMessage {
	public static User returnUser(String username) {
		GetUserMessage user = new GetUserMessage();
		return user.getUser(username);
	}

}
