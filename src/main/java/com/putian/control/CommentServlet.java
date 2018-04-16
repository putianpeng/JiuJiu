package com.putian.control;
import java.util.List;
import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import com.putian.domain.User;
import com.putian.domain.UserComment;
import com.putian.domain.VpmComment;
import com.putian.service.VpmService;
@Controller
public class CommentServlet{
	
	@Resource(name="vpmServiceImpl")
	private VpmService vpmService;
	
	
	@RequestMapping("/getComment")
	@ResponseBody
	public List<VpmComment> returnComment(String vpmId){
		List<VpmComment> selectList=vpmService.getComment(vpmId);
		return selectList;
	}
	
	@ResponseBody
	@RequestMapping("/addComment")
	public String addComment(VpmComment comment,HttpSession session) {
		User user =(User) session.getAttribute("user");
		boolean addComment = vpmService.addComment(comment,user);
		if(addComment) {
			return "{\"state\":\"true\"}";
		}
		return "{\"state\":\"false\"}";
	}
	
	@RequestMapping("/getUserComment")
	@ResponseBody
	public List<VpmComment> returnUserComment(UserComment comment){
		List<VpmComment> selectList=vpmService.getUserComment(comment);
		return selectList;
	}
	
	@ResponseBody
	@RequestMapping("/addUserComment")
	public String addUserComment(UserComment comment,HttpSession session) {
		User user =(User) session.getAttribute("user");
		boolean addUserComment = vpmService.addUserComment(comment, user);
		if(addUserComment) {
			return "{\"state\":\"true\"}";
		}
		return "{\"state\":\"false\"}";
	}
	
	@RequestMapping("/addUserCommentNum")
	public void addUserCommentNum(int commentId) {
		vpmService.addUserCommentNum(commentId);
	}
	
	@RequestMapping("/addVideoCommentNum")
	public void addVideoCommentNum(String vpmId) {
		vpmService.addVideoCommentNum(vpmId);
	}
	
	@RequestMapping("/vpmClickGood")
	public void vpmClickGood(String vpmId) {
		vpmService.vpmClickGood(vpmId);
	}
	
	@RequestMapping("/vpmClickBad")
	public void vpmClickBad(String vpmId) {
		vpmService.vpmClickBad(vpmId);
	}
	
	@RequestMapping("/commentClickGood")
	public void commentClickGood(int commentId) {
		vpmService.commentClickGood(commentId);
	}
	
	@RequestMapping("/userCommentClickGood")
	public void userCommentClickGood(int commentId) {
		vpmService.userCommentClickGood(commentId);
	}
}
