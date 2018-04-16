package com.putian.dao;
import java.util.List;

import com.putian.domain.VpmComment;
import com.putian.domain.Music;
import com.putian.domain.Photo;
import com.putian.domain.UserComment;
import com.putian.domain.Video;
import com.putian.domain.Vpm;
public interface VpmDAO {
	public List<Video> getVideoData(int startNum);
	
	public List<VpmComment> getComment(String vpmId);
	public boolean addComment(VpmComment comment);
	
	public List<VpmComment> getUserComment(UserComment comment);
	public boolean addUserComment(UserComment comment);
	
	public boolean addUserCommentNum(int commentId);
	
	public boolean addVideoCommentNum(String vpmId);
	
	public boolean vpmClickGood(String vpmId);
	
	public boolean vpmClickBad(String vpmId);
	
	public boolean commentClickGood(int commentId);
	
	public boolean userCommentClickGood(int commentId);

	public List<Music> getMusicData(int startNum);
	
	public List<Photo> getPhotoData(int startNum);
	
	public List<Vpm> getShowData(int startNum);
	
	public List<Vpm> getMyVpmData(String username);
	
	public String delVpm(String vpmId,String username);
	
	public boolean addVpm(Vpm vpm);
}
