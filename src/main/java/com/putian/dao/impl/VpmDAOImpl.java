package com.putian.dao.impl;
import java.util.List;
import org.apache.ibatis.session.SqlSession;
import com.putian.dao.VpmDAO;
import com.putian.domain.VpmComment;
import com.putian.domain.Music;
import com.putian.domain.Photo;
import com.putian.domain.UserComment;
import com.putian.domain.Video;
import com.putian.domain.Vpm;
import com.putian.util.DbUtil;

public class VpmDAOImpl implements VpmDAO{
	public List<Video> getVideoData(int startNum){
		SqlSession sqlSession = DbUtil.getSqlSession();
		List<Video> videoList = sqlSession.selectList("com.putian.dao.vpmMapper.svideo",startNum);
		sqlSession.close();
		return videoList;
	}
	public List<VpmComment> getComment(String vpmId) {
		SqlSession sqlSession = DbUtil.getSqlSession();
		List<VpmComment> selectList=null;
		try {
			selectList = sqlSession.selectList("com.putian.dao.vpmMapper.svpmComment",vpmId);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		sqlSession.close();
		return selectList;
	}
	public boolean addComment(VpmComment comment) {
		SqlSession sqlSession = DbUtil.getSqlSession();
		int insert = sqlSession.insert("com.putian.dao.vpmMapper.iaddComment",comment);
		sqlSession.close();
		if(insert>0) {
			return true;
		}
		return false;
	}
	
	public List<VpmComment> getUserComment(UserComment comment) {
		SqlSession sqlSession = DbUtil.getSqlSession();
		List<VpmComment> selectList=null;
		try {
			selectList = sqlSession.selectList("com.putian.dao.vpmMapper.suserComment",comment);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		sqlSession.close();
		return selectList;
	}
	public boolean addUserComment(UserComment comment) {
		SqlSession sqlSession = DbUtil.getSqlSession();
		int insert = sqlSession.insert("com.putian.dao.vpmMapper.iaddUserComment",comment);
		sqlSession.close();
		if(insert>0) {
			return true;
		}
		return false;
	}
	
	public boolean addUserCommentNum(int commentId) {
		SqlSession sqlSession = DbUtil.getSqlSession();
		int insert = sqlSession.update("com.putian.dao.vpmMapper.uaddUserCommentNum",commentId);
		sqlSession.close();
		if(insert>0) {
			return true;
		}
		return false;
	}
	public boolean addVideoCommentNum(String vpmId) {
		SqlSession sqlSession = DbUtil.getSqlSession();
		int insert = sqlSession.update("com.putian.dao.vpmMapper.uaddVpmCommentNum",vpmId);
		sqlSession.close();
		if(insert>0) {
			return true;
		}
		return false;
	}
	
	public boolean vpmClickGood(String vpmId) {
		SqlSession sqlSession = DbUtil.getSqlSession();
		int insert = sqlSession.update("com.putian.dao.vpmMapper.uvpmClickGood",vpmId);
		sqlSession.close();
		if(insert>0) {
			return true;
		}
		return false;
	};
	
	public boolean vpmClickBad(String vpmId) {
		SqlSession sqlSession = DbUtil.getSqlSession();
		int insert = sqlSession.update("com.putian.dao.vpmMapper.uvpmClickBad",vpmId);
		sqlSession.close();
		if(insert>0) {
			return true;
		}
		return false;
	};
	
	public boolean commentClickGood(int commentId) {
		SqlSession sqlSession = DbUtil.getSqlSession();
		int insert = sqlSession.update("com.putian.dao.vpmMapper.ucommentClickGood",commentId);
		sqlSession.close();
		if(insert>0) {
			return true;
		}
		return false;
	};
	
	public boolean userCommentClickGood(int commentId) {
		SqlSession sqlSession = DbUtil.getSqlSession();
		int insert = sqlSession.update("com.putian.dao.vpmMapper.uuserCommentClickGood",commentId);
		sqlSession.close();
		if(insert>0) {
			return true;
		}
		return false;
	};
	
	public List<Music> getMusicData(int startNum) {
		SqlSession sqlSession = DbUtil.getSqlSession();
		List<Music> musicList = sqlSession.selectList("com.putian.dao.vpmMapper.smusic",startNum);
		sqlSession.close();
		return musicList;
	}
	
	public List<Photo> getPhotoData(int startNum) {
		SqlSession sqlSession = DbUtil.getSqlSession();
		List<Photo> photoList = sqlSession.selectList("com.putian.dao.vpmMapper.sphoto",startNum);
		sqlSession.close();
		return photoList;
	}
	public List<Vpm> getShowData(int startNum) {
		SqlSession sqlSession = DbUtil.getSqlSession();
		List<Vpm> vpmList = sqlSession.selectList("com.putian.dao.vpmMapper.svpm",startNum);
		sqlSession.close();
		return vpmList;
	}
	
	public List<Vpm> getMyVpmData(String username) {
		SqlSession sqlSession = DbUtil.getSqlSession();
		List<Vpm> vpmList = sqlSession.selectList("com.putian.dao.vpmMapper.smyVpm",username);
		sqlSession.close();
		return vpmList;
	}
	
	public String delVpm(String vpmId, String username) {
		SqlSession sqlSession = DbUtil.getSqlSession();
		String vpmPath = sqlSession.selectOne("com.putian.dao.vpmMapper.spathByVpmId",vpmId);
		String userName = sqlSession.selectOne("com.putian.dao.vpmMapper.svpmUsername",vpmId);
		if(username.equals(userName)) {
			sqlSession.delete("com.putian.dao.vpmMapper.dvpm",vpmId);
			return vpmPath;
		}
		return null;
	}
	
	public boolean addVpm(Vpm vpm) {
		SqlSession sqlSession = DbUtil.getSqlSession();
		int insert = sqlSession.insert("com.putian.dao.vpmMapper.avpm",vpm);
		if(insert>0) {
			return true;
		}
		return false;
	}
}
