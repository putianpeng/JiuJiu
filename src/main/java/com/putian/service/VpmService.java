package com.putian.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.http.HttpRequest;

import com.putian.domain.VpmComment;
import com.putian.domain.Music;
import com.putian.domain.Photo;
import com.putian.domain.User;
import com.putian.domain.UserComment;
import com.putian.domain.Video;
import com.putian.domain.Vpm;

public interface VpmService {
	/**
	 * 获取视频数据
	 * @return
	 */
	public List<Video> getVideoData(int refreshTime,HttpSession session);
	
	/**
	 * 获取视频（图片，音乐）评论
	 * @param vpmId 视频的id(评论的是哪一个视屏)
	 * @return
	 */
	public List<VpmComment> getComment(String vpmId);
	
	/**
	 * 添加视频（图片，音乐）评论
	 * @param comment 要增加的评论对象
	 * @param user 发送评论的用户对象
	 * @return
	 */
	public boolean addComment(VpmComment comment,User user);
	
	/**
	 * 获取其他用户评论自己的那些评论 
	 * @param comment 需要的条件
	 * @return
	 */
	public List<VpmComment> getUserComment(UserComment comment);
	
	/**
	 * 增加评论别人的评论
	 * @param comment 评论对象
	 * @param user		评论者
	 * @return
	 */
	public boolean addUserComment(UserComment comment,User user);
	
	
	/**
	 * 增加用户评论的数量
	 * @param commentId
	 * @return
	 */
	public boolean addUserCommentNum(int commentId);
	
	public boolean addVideoCommentNum(String vpmId);
	
	public boolean vpmClickGood(String vpmId);
	
	public boolean vpmClickBad(String vpmId);
	
	public boolean commentClickGood(int commentId);
	
	public boolean userCommentClickGood(int commentId);
	
	
	public List<Music> getMusicData(int refreshTime,HttpSession session);
	
	public List<Photo> getPhotoData(int refreshTime,HttpSession session);
	
	public List<Vpm> getShowData(int refreshTime,HttpSession session);
	
	public List<Vpm> getMyVpmData(String username);
	
	public boolean delVpm(String vpmId,String username,String appPath);
	
	public boolean addVpm(Vpm vpm);
	
}
