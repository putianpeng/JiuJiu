package com.putian.domain;

import java.sql.Timestamp;

public class UserComment {
	private int commentId;
	private String vpmId;
	private String commentContext;
	private String userId;
	private String userNickName;
	private String userHeadImg;
	private String clickGoodNum;
	private String commentUserId;
	private int replyCommentId;
	private Timestamp commentDate;
	private String commentDateStr;

	/**
	 * @return the commentDate
	 */
	public Timestamp getCommentDate() {
		return commentDate;
	}

	/**
	 * @param commentDate the commentDate to set
	 */
	public void setCommentDate(Timestamp commentDate) {
		this.commentDate = commentDate;
	}

	/**
	 * @return the commentDateStr
	 */
	@SuppressWarnings("deprecation")
	public String getCommentDateStr() {
		if(getCommentDate()!=null) {
			commentDateStr=getCommentDate().toLocaleString();
		}
		return commentDateStr;
	}

	/**
	 * @param commentDateStr the commentDateStr to set
	 */
	public void setCommentDateStr(String commentDateStr) {
		this.commentDateStr = commentDateStr;
	}

	/**
	 * @return the replyCommentId
	 */
	public int getReplyCommentId() {
		return replyCommentId;
	}

	/**
	 * @param replyCommentId the replyCommentId to set
	 */
	public void setReplyCommentId(int replyCommentId) {
		this.replyCommentId = replyCommentId;
	}

	/**
	 * @return the commentId
	 */
	public int getCommentId() {
		return commentId;
	}

	/**
	 * @param commentId
	 *            the commentId to set
	 */
	public void setCommentId(int commentId) {
		this.commentId = commentId;
	}

	/**
	 * @return the vpmId
	 */
	public String getVpmId() {
		return vpmId;
	}

	/**
	 * @param vpmId
	 *            the vpmId to set
	 */
	public void setVpmId(String vpmId) {
		this.vpmId = vpmId;
	}

	/**
	 * @return the commentContext
	 */
	public String getCommentContext() {
		return commentContext;
	}

	/**
	 * @param commentContext
	 *            the commentContext to set
	 */
	public void setCommentContext(String commentContext) {
		this.commentContext = commentContext;
	}

	/**
	 * @return the userId
	 */
	public String getUserId() {
		return userId;
	}

	/**
	 * @param userId
	 *            the userId to set
	 */
	public void setUserId(String userId) {
		this.userId = userId;
	}

	/**
	 * @return the userNickName
	 */
	public String getUserNickName() {
		return userNickName;
	}

	/**
	 * @param userNickName
	 *            the userNickName to set
	 */
	public void setUserNickName(String userNickName) {
		this.userNickName = userNickName;
	}

	/**
	 * @return the userHeadImg
	 */
	public String getUserHeadImg() {
		return userHeadImg;
	}

	/**
	 * @param userHeadImg
	 *            the userHeadImg to set
	 */
	public void setUserHeadImg(String userHeadImg) {
		this.userHeadImg = userHeadImg;
	}

	/**
	 * @return the clickGoodNum
	 */
	public String getClickGoodNum() {
		return clickGoodNum;
	}

	/**
	 * @param clickGoodNum
	 *            the clickGoodNum to set
	 */
	public void setClickGoodNum(String clickGoodNum) {
		this.clickGoodNum = clickGoodNum;
	}

	/**
	 * @return the commentUserId
	 */
	public String getCommentUserId() {
		return commentUserId;
	}

	/**
	 * @param commentUserId
	 *            the commentUserId to set
	 */
	public void setCommentUserId(String commentUserId) {
		this.commentUserId = commentUserId;
	}
}
