package com.putian.control;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.sql.Timestamp;
import java.util.Date;
import java.util.List;
import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.putian.domain.Music;
import com.putian.domain.Photo;
import com.putian.domain.User;
import com.putian.domain.Video;
import com.putian.domain.Vpm;
import com.putian.service.VpmService;
import com.putian.util.JavaUtil;
@Controller
public class vpmServlet{
	@Resource(name="vpmServiceImpl")
	private VpmService vpmService;
	
	/**
	 * 返回数据库视频数据
	 */
	@ResponseBody
	@RequestMapping("/getVideoData")
	public List<Video> returnVideoData(Model model,HttpSession session) {
		Object refreshTime = session.getAttribute("refreshVideoTime");
		List<Video> videoList=null;
		if(refreshTime==null) {
			session.setAttribute("refreshVideoTime",0);
			videoList = vpmService.getVideoData(0,session);
		}else {
			videoList = vpmService.getVideoData((Integer)refreshTime,session);
		}
		session.setAttribute("refreshVideoTime",(Integer)session.getAttribute("refreshVideoTime")+1);
		return videoList;
	}
	
	/**
	 * 返回数据库音频数据
	 */
	@ResponseBody
	@RequestMapping("/getMusicData")
	public List<Music> returnMusicData(Model model,HttpSession session) {
		Object refreshTime = session.getAttribute("refreshMusicTime");
		List<Music> musicList=null;
		if(refreshTime==null) {
			session.setAttribute("refreshMusicTime",0);
			musicList = vpmService.getMusicData(0,session);
		}else {
			musicList = vpmService.getMusicData((Integer)refreshTime,session);
		}
		session.setAttribute("refreshMusicTime",(Integer)session.getAttribute("refreshMusicTime")+1);
		return musicList;
	}
	
	/**
	 * 返回数据库图片数据
	 */
	@ResponseBody
	@RequestMapping("/getPhotoData")
	public List<Photo> returnPhotoData(Model model,HttpSession session) {
		Object refreshTime = session.getAttribute("refreshPhotoTime");
		List<Photo> photoList=null;
		if(refreshTime==null) {
			session.setAttribute("refreshPhotoTime",0);
			photoList = vpmService.getPhotoData(0,session);
		}else {
			photoList = vpmService.getPhotoData((Integer)refreshTime,session);
		}
		model.addAttribute("photoList", photoList);
		session.setAttribute("refreshPhotoTime",(Integer)session.getAttribute("refreshPhotoTime")+1);
		return photoList;
	}
	
	@ResponseBody
	@RequestMapping("/getShowData")
	public List<Vpm> returnShowData(Model model,HttpSession session) {
		Object refreshTime = session.getAttribute("refreshShowTime");
		List<Vpm> videoList=null;
		if(refreshTime==null) {
			session.setAttribute("refreshShowTime",0);
			videoList = vpmService.getShowData(0,session);
		}else {
			videoList = vpmService.getShowData((Integer)refreshTime,session);
		}
		model.addAttribute("showList", videoList);
		session.setAttribute("refreshShowTime",(Integer)session.getAttribute("refreshShowTime")+1);
		return videoList;
	}
	
	@RequestMapping("/getMyVpmData")
	public String returnMyVpmData(Model model,HttpSession session) {
		String username = ((User)session.getAttribute("user")).getUsername();
		List<Vpm> videoList = vpmService.getMyVpmData(username);
		model.addAttribute("myVpmList", videoList);
		return "userIndex";
	}
	
	@RequestMapping("/delVpm")
	public void delVpm(String vpmId,HttpSession session) {
		String appPath = session.getServletContext().getRealPath("/");
		String username = ((User)session.getAttribute("user")).getUsername();
		vpmService.delVpm(vpmId,username,appPath);
	}
	
	@RequestMapping("/addVpmJ/{vpmCategory}")
	public String addVpmJ(Model model,@PathVariable("vpmCategory") String vpmCategory,HttpSession session) {
		if(session.getAttribute("user")==null) {
			return "redirect:/"+vpmCategory+".jsp";
		}
		model.addAttribute("vpmCategory",vpmCategory);
		return "addVpm";
	}
	
	@RequestMapping("/addVpm/{vpmCategory}")
	public String addVpm(Model model,@PathVariable("vpmCategory") String vpmCategory,@RequestParam("vpmSource") Part vpmSource,String vpmContext,HttpSession session) {
		try {
			Vpm vpm = new Vpm();
			String appTextPath = session.getServletContext().getContextPath();
			String contextPath = session.getServletContext().getRealPath("/");
			String userName = ((User)session.getAttribute("user")).getUsername();
			String userNickName = ((User)session.getAttribute("user")).getNickName();
			String header = vpmSource.getHeader("Content-Disposition");
			String vpmPath =null;
			header = header.substring(header.lastIndexOf("=")+2,header.length()-1);
			if(!JavaUtil.stringIsNull(header)) {
				String str = (new Date().getTime())+header;
				String saveImgPath = contextPath+"resource/javaweb/JiuJiu/vpmData/"+userName+"/"+vpmCategory+"/"+str;
				vpmSource.write(saveImgPath);
				
				int length=0;
				byte[] b = new byte[1024];
				InputStream inputstream = new FileInputStream(saveImgPath);
				FileOutputStream cpFile = new FileOutputStream("D:\\java编译器\\JiuJiuGuFeng\\src\\main\\webapp\\"+"resource/javaweb/JiuJiu/vpmData/"+userName+"/"+vpmCategory+"/"+str);
				while(-1!=(length=inputstream.read(b))){
					cpFile.write(b);
				}
				inputstream.close();
				cpFile.close();
				
				//解决eclipse乱删资源问题，布在服务器上时必须删除
				vpmPath =appTextPath+"/resource/javaweb/JiuJiu/vpmData/"+userName+"/"+vpmCategory+"/"+str;
				vpm.setUserName(userName);
				vpm.setUserNickName(userNickName);
				vpm.setVpmId(JavaUtil.returnUUID());
				vpm.setVpmPath(vpmPath);
				vpm.setVpmContext(vpmContext);
				Date date = new java.util.Date();
				vpm.setVpmDate(new Timestamp(date.getTime()));
				vpm.setVpmCategory(vpmCategory);
				vpmService.addVpm(vpm);
			}
			

		}catch (Exception e) {
			e.printStackTrace();
		}
		return "addVpm";
	}
	
}
