package com.putian.domain;

import java.sql.Timestamp;

public class VpmComment {
	private int commentId;
	private String vpmId;
	private String commentContext;
	private String userId;
	private String userNickName;
	private String userHeadImg;
	private String clickGoodNum;
	private String commentNum;
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
	 * @return the userNickName
	 */
	public String getUserNickName() {
		return userNickName;
	}
	/**
	 * @param userNickName the userNickName to set
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
	 * @param userHeadImg the userHeadImg to set
	 */
	public void setUserHeadImg(String userHeadImg) {
		this.userHeadImg = userHeadImg;
	}
	public int getCommentId() {
		return commentId;
	}
	public void setCommentId(int commentId) {
		this.commentId = commentId;
	}
	public String getVpmId() {
		return vpmId;
	}
	public void setVpmId(String vpmId) {
		this.vpmId = vpmId;
	}
	public String getCommentContext() {
		return commentContext;
	}
	public void setCommentContext(String commentContext) {
		this.commentContext = commentContext;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getClickGoodNum() {
		return clickGoodNum;
	}
	public void setClickGoodNum(String clickGoodNum) {
		this.clickGoodNum = clickGoodNum;
	}
	public String getCommentNum() {
		return commentNum;
	}
	public void setCommentNum(String commentNum) {
		this.commentNum = commentNum;
	}
	
}
