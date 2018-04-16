package com.putian.domain;

import java.sql.Timestamp;

public class Vpm {
	private String vpmId;
	private String userId;
	private String vpmPath;
	private String vpmContext;
	private int clickGoodNum;
	private int clickBadNum;
	private int commentNum;
	private String userName;
	private String userNickName;
	private String vpmCategory;
	private Timestamp vpmDate;
	private String vpmDateStr;
	private String coverPath;
	/**
	 * @return the coverPath
	 */
	public String getCoverPath() {
		return coverPath;
	}
	/**
	 * @param coverPath the coverPath to set
	 */
	public void setCoverPath(String coverPath) {
		this.coverPath = coverPath;
	}
	/**
	 * @return the vpmDate
	 */
	public Timestamp getVpmDate() {
		return vpmDate;
	}
	/**
	 * @param vpmDate the vpmDate to set
	 */
	public void setVpmDate(Timestamp vpmDate) {
		this.vpmDate = vpmDate;
	}
	/**
	 * @return the vpmDateStr
	 */
	public String getVpmDateStr() {
		return vpmDateStr;
	}
	/**
	 * @param vpmDateStr the vpmDateStr to set
	 */
	public void setVpmDateStr(String vpmDateStr) {
		this.vpmDateStr = vpmDateStr;
	}
	/**
	 * @return the vpmCategory
	 */
	public String getVpmCategory() {
		return vpmCategory;
	}
	/**
	 * @param vpmCategory the vpmCategory to set
	 */
	public void setVpmCategory(String vpmCategory) {
		this.vpmCategory = vpmCategory;
	}
	/**
	 * @return the vpmId
	 */
	public String getVpmId() {
		return vpmId;
	}
	/**
	 * @param vpmId the vpmId to set
	 */
	public void setVpmId(String vpmId) {
		this.vpmId = vpmId;
	}
	/**
	 * @return the userId
	 */
	public String getUserId() {
		return userId;
	}
	/**
	 * @param userId the userId to set
	 */
	public void setUserId(String userId) {
		this.userId = userId;
	}
	/**
	 * @return the vpmPath
	 */
	public String getVpmPath() {
		return vpmPath;
	}
	/**
	 * @param vpmPath the vpmPath to set
	 */
	public void setVpmPath(String vpmPath) {
		this.vpmPath = vpmPath;
	}
	/**
	 * @return the vpmContext
	 */
	public String getVpmContext() {
		return vpmContext;
	}
	/**
	 * @param vpmContext the vpmContext to set
	 */
	public void setVpmContext(String vpmContext) {
		this.vpmContext = vpmContext;
	}
	/**
	 * @return the clickGoodNum
	 */
	public int getClickGoodNum() {
		return clickGoodNum;
	}
	/**
	 * @param clickGoodNum the clickGoodNum to set
	 */
	public void setClickGoodNum(int clickGoodNum) {
		this.clickGoodNum = clickGoodNum;
	}
	/**
	 * @return the clickBadNum
	 */
	public int getClickBadNum() {
		return clickBadNum;
	}
	/**
	 * @param clickBadNum the clickBadNum to set
	 */
	public void setClickBadNum(int clickBadNum) {
		this.clickBadNum = clickBadNum;
	}
	/**
	 * @return the commentNum
	 */
	public int getCommentNum() {
		return commentNum;
	}
	/**
	 * @param commentNum the commentNum to set
	 */
	public void setCommentNum(int commentNum) {
		this.commentNum = commentNum;
	}
	/**
	 * @return the userName
	 */
	public String getUserName() {
		return userName;
	}
	/**
	 * @param userName the userName to set
	 */
	public void setUserName(String userName) {
		this.userName = userName;
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
	/* (non-Javadoc)
	 * @see java.lang.Object#toString()
	 */
	@Override
	public String toString() {
		return "Vpm [vpmId=" + vpmId + ", userId=" + userId + ", vpmPath=" + vpmPath + ", vpmContext=" + vpmContext
				+ ", clickGoodNum=" + clickGoodNum + ", clickBadNum=" + clickBadNum + ", commentNum=" + commentNum
				+ ", userName=" + userName + ", userNickName=" + userNickName + ", vpmCategory=" + vpmCategory
				+ ", vpmDate=" + vpmDate + ", vpmDateStr=" + vpmDateStr + ", coverPath=" + coverPath + "]";
	}
	
	
}
