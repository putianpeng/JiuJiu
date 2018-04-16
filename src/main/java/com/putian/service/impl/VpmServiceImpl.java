package com.putian.service.impl;
import java.io.File;
import java.sql.Timestamp;
import java.util.List;
import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;
import com.putian.dao.VpmDAO;
import com.putian.domain.VpmComment;
import com.putian.domain.Music;
import com.putian.domain.Photo;
import com.putian.domain.User;
import com.putian.domain.UserComment;
import com.putian.domain.Video;
import com.putian.domain.Vpm;
import com.putian.service.VpmService;
import com.putian.util.JavaUtil;
@Service
public class VpmServiceImpl implements VpmService{
	@Resource(name="vpmDAOImpl")
	private VpmDAO vpmDao;
	
	public List<VpmComment> getComment(String vpmId) {
		List<VpmComment> comments = vpmDao.getComment(vpmId);
		return comments;
	}
	
	public boolean addComment(VpmComment comment,User user) {
		// TODO Auto-generated method stub
		comment.setUserId(user.getUserid());
		comment.setUserNickName(user.getNickName());
		String imgPath ="resource/javaweb/JiuJiu/userData/"+user.getUsername()+"/img/"+user.getImgPath();
		comment.setUserHeadImg(imgPath);
		java.util.Date date = new java.util.Date();
		Timestamp dates = new Timestamp(date.getTime());
		comment.setCommentDate(dates);
		boolean addComment = vpmDao.addComment(comment);
		return addComment;
	}
	
	public List<VpmComment> getUserComment(UserComment comment) {
		List<VpmComment> comments = vpmDao.getUserComment(comment);
		return comments;
	}
	
	public boolean addUserComment(UserComment comment,User user) {
		// TODO Auto-generated method stub
		comment.setUserId(user.getUserid());
		comment.setUserNickName(user.getNickName());
		String imgPath ="resource/javaweb/JiuJiu/userData/"+user.getUsername()+"/img/"+user.getImgPath();
		comment.setUserHeadImg(imgPath);
		java.util.Date date = new java.util.Date();
		Timestamp dates = new Timestamp(date.getTime());
		comment.setCommentDate(dates);
		boolean addComment = vpmDao.addUserComment(comment);
		return addComment;
	}
	
	public boolean addUserCommentNum(int commentId) {
		// TODO Auto-generated method stub
		boolean addUserCommentNum = vpmDao.addUserCommentNum(commentId);
		return addUserCommentNum;
	}
	
	public boolean addVideoCommentNum(String vpmId) {
		// TODO Auto-generated method stub
		boolean addUserCommentNum = vpmDao.addVideoCommentNum(vpmId);
		return addUserCommentNum;
	}
	
	public boolean vpmClickGood(String vpmId) {
		boolean vpmClickGood = vpmDao.vpmClickGood(vpmId);
		return vpmClickGood;
	};
	
	public boolean vpmClickBad(String vpmId) {
		boolean vpmClickBad = vpmDao.vpmClickBad(vpmId);
		return vpmClickBad;
	};
	
	public boolean commentClickGood(int commentId) {
		boolean commentClickGood = vpmDao.commentClickGood(commentId);
		return commentClickGood;
	};
	
	public boolean userCommentClickGood(int commentId) {
		boolean userCommentClickGood = vpmDao.userCommentClickGood(commentId);
		return userCommentClickGood;
	};
	
	public List<Music> getMusicData(int refreshTime,HttpSession session) {
		// TODO Auto-generated method stub
		int startNum = 1*refreshTime*10;
		List<Music> musicData = vpmDao.getMusicData(startNum);
		if(musicData.size()==0) {
			Music music =defaultMusicData();
			musicData.add(music);
			session.setAttribute("refreshMusicTime",-1);
		}
		return musicData;
	}
	
	public List<Photo> getPhotoData(int refreshTime,HttpSession session) {
		// TODO Auto-generated method stub
		int startNum = 1*refreshTime*10+1;
		List<Photo> photoData = vpmDao.getPhotoData(startNum);
		if(photoData.size()==0) {
			Photo photo =defaultPhotoData();
			photoData.add(photo);
			session.setAttribute("refreshPhotoTime",-1);
		}
		return photoData;
	}
	
	public List<Vpm> getShowData(int refreshTime,HttpSession session) {
		int startNum = 1*refreshTime*10+1;
		List<Vpm> vpmData = vpmDao.getShowData(startNum);
		if(vpmData.size()==0) {
			Vpm vpm =defaultVpmData();
			vpmData.add(vpm);
			session.setAttribute("refreshShowTime",-1);
		}
		return vpmData;
	}
	
	public List<Video> getVideoData(int refreshTime,HttpSession session){
		int startNum = 1*refreshTime*10;
		List<Video> videoData = vpmDao.getVideoData(startNum);
		if(videoData.size()==0) {
			Video video =defaultVideoData();
			videoData.add(video);
			session.setAttribute("refreshVideoTime",-1);
		}
		return videoData;
	}
	
	public List<Vpm> getMyVpmData(String username) {
		List<Vpm> vpmData = vpmDao.getMyVpmData(username);
		if(vpmData.size()==0) {
			Vpm vpm =defaultVpmData();
			vpmData.add(vpm);
		}
		return vpmData;
	}
	
	public boolean delVpm(String vpmId, String username,String appPath) {
		String vpmPath = vpmDao.delVpm(vpmId,username).substring(14);
		if(!JavaUtil.stringIsNull(vpmPath)) {
			File file = new File(appPath+vpmPath);
			if(file.exists()) {
				file.delete();
			}
			return true;
		}
		return false;
	}
	
	public boolean addVpm(Vpm vpm) {
		boolean bool = vpmDao.addVpm(vpm);
		return bool;
	}
	
	public Vpm defaultVpmData() {
		Vpm vpm = new Vpm();
		vpm.setVpmId("00000000000000000000000000000000");
		vpm.setUserName("putian");
		vpm.setUserNickName("000000");
		vpm.setClickGoodNum(9999);
		vpm.setVpmCategory("Photo");
		vpm.setVpmContext("没有更多资源了QAQ");
		vpm.setVpmPath("/JiuJiuGuFeng/resource/javaweb/JiuJiu/vpmData/putian/Photo/1139.jpg");
		return vpm;
	}
	public Video defaultVideoData() {
		Video vpm = new Video();
		vpm.setVpmId("00000000000000000000000000000000");
		vpm.setUserName("putian");
		vpm.setUserNickName("000000");
		vpm.setClickGoodNum(9999);
		vpm.setVpmCategory("Photo");
		vpm.setVpmContext("没有更多资源了QAQ");
		vpm.setVpmPath("/JiuJiuGuFeng/resource/javaweb/JiuJiu/vpmData/putian/Photo/1139.jpg");
		return vpm;
	}
	public Music defaultMusicData() {
		Music vpm = new Music();
		vpm.setVpmId("00000000000000000000000000000000");
		vpm.setUserName("putian");
		vpm.setUserNickName("000000");
		vpm.setClickGoodNum(9999);
		vpm.setVpmCategory("Photo");
		vpm.setVpmContext("没有更多资源了QAQ");
		vpm.setVpmPath("/JiuJiuGuFeng/resource/javaweb/JiuJiu/vpmData/putian/Photo/1139.jpg");
		return vpm;
	}
	public Photo defaultPhotoData() {
		Photo vpm = new Photo();
		vpm.setVpmId("00000000000000000000000000000000");
		vpm.setUserName("putian");
		vpm.setUserNickName("000000");
		vpm.setClickGoodNum(9999);
		vpm.setVpmCategory("Photo");
		vpm.setVpmContext("没有更多资源了QAQ");
		vpm.setVpmPath("/JiuJiuGuFeng/resource/javaweb/JiuJiu/vpmData/putian/Photo/1139.jpg");
		return vpm;
	}
	
	
}
