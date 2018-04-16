package com.putian.control;
import java.io.File;
import java.util.UUID;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import com.putian.domain.User;
import com.putian.service.LoginRegist;
import com.putian.service.UpdateUserService;
import com.putian.util.JavaUtil;
import com.putian.util.ReturnUserMessage;
@Controller
public class userServlet{
	@Resource(name="loginRegistImpl")
	private LoginRegist loginRegist;
	
	@Resource(name="updateUserImpl")
	private UpdateUserService updateUser;

	public userServlet() {
		super();
	}

	/**
	 * 用户登录
	 * 
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping("/login")
	public String login(String username,String password,HttpSession session) {
		if ("".equals(username) || username == null || "".equals(password) || password == null) {
			
		} else {
			try {
				password = JavaUtil.EncoderByMd5(password);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				System.out.println("md5加密失败");
			}
			boolean usertrue = loginRegist.loginService(username, password);
			if (usertrue) {
				User user = ReturnUserMessage.returnUser(username);
				session.setAttribute("user", user);
				session.setAttribute("loginErrorMessage", "");
				return "redirect:/index.jsp";
			} else {
				session.setAttribute("loginErrorMessage", "密码错误");
				return "redirect:/login.jsp";
			}
		}
		return null;
	}

	/**
	 * 用户注册
	 * 
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping("/regist")
	public String regist(String Vcode,User user,HttpSession Session) {
		if ("".equals(Vcode) || Vcode == null) {
			return "forword:/regist.jsp";
		} else {
			Vcode = Vcode.toLowerCase();
			if (Vcode.equals(Session.getAttribute("Vcode"))) {
				UUID uuid = UUID.randomUUID();
				user.setUserid(uuid.toString().replace("-", ""));
				try {
					user.setPassword(JavaUtil.EncoderByMd5(user.getPassword()));
				} catch (Exception e) {
					System.out.println("md5加密失败");
				}
				if (loginRegist.RegistService(user)) {
					Session.setAttribute("user", user);
					String appPath = Session.getServletContext().getRealPath("/");
					String userFile = appPath + "resource/javaweb/JiuJiu/vpmData/"+user.getUsername();
					String userVpmFile = appPath +"resource/javaweb/JiuJiu/userData/"+user.getUsername();
					File userfile = new File(userFile);
					userfile.mkdirs();
					File uservpmfile = new File(userVpmFile);
					uservpmfile.mkdirs();
					return "redirct:/index.jsp";
				}
				;
			} else {
				return "forword:/regist.jsp";
			}
		}
		return null;
	}

	/**
	 * 该方法用来检测是否存在用户名
	 * 
	 * @param req
	 * @param resp
	 */
	
	@RequestMapping("/isHaveUsername")
	@ResponseBody
	public String isHaveUsername(String username) {
		try {
			if ("".equals(username) || username == null) {
				return "{\"username\":\"false\"}";
			} else {
				if (loginRegist.IshaveUsername(username)) {
					return "{\"username\":\"true\"}";
				} else {
					return "{\"username\":\"false\"}";
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "{\"username\":\"false\"}";
	}

	/**
	 * 注销用户
	 * 
	 * @param req
	 * @param resp
	 */
	@RequestMapping("/logout")
	public void logout(HttpSession Session) {
		Session.invalidate();
	}

	/**
	 * 修改用户信息
	 * 
	 * @param req
	 * @param resp
	 */
	@RequestMapping("/alterUserMessage")
	public String alterUserMessage(User user,@RequestParam("herder_img") Part partImg,HttpServletRequest req,HttpServletResponse resp) {
		String username =((User) req.getSession().getAttribute("user")).getUsername();
		try {
			String contextPath = req.getServletContext().getRealPath("/");
			String header = partImg.getHeader("Content-Disposition");
			header = header.substring(header.lastIndexOf("=")+2,header.length()-1);
			if(!JavaUtil.stringIsNull(header)) {
				String str = "headImg.jpg";
				String saveImgPath = contextPath+"resource/javaweb/JiuJiu/userData/"+username+"/img/"+str;
				partImg.write(saveImgPath);
			}

		}catch (Exception e) {
			e.printStackTrace();
		}

		User userx = ReturnUserMessage.returnUser(username);
		if (!JavaUtil.stringIsNull(user.getNickName())) {
			userx.setNickName(user.getNickName());
		}
		if (!JavaUtil.stringIsNull(user.getGender())) {
			userx.setGender(user.getGender());
		}
		if (!JavaUtil.stringIsNull(user.getTel())) {
			userx.setTel(user.getTel());
		}
		if (user.getAge()!=0) {
			userx.setAge(user.getAge());
		}
		if (!JavaUtil.stringIsNull(user.getBirth())) {
			userx.setBirth(user.getBirth());
		}

		try {
			if (updateUser.alterUserService(userx)) {
				//更新User数据
				req.getSession().setAttribute("user",ReturnUserMessage.returnUser(username));
				return "forward:/WEB-INF/View/Personal.jsp";
			}else {
				resp.setContentType("text/html;charset=utf-8");
				resp.getWriter().write("修改失败");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;

	}
	
	@RequestMapping("/alterUserHederImg")
	public void alterUserHederImg() {
		
	}
	
	/**
	 * 返回用户img保存(取出的)路径
	 * @param userId
	 */
	public String saveUserImgPath(String userName,String imgName) {
		String resoucePath = "/resource/";
		String imgNamePath = imgName;
		if("headImg.jpg".equals(imgNamePath)) {
			File imgfile = new File(resoucePath+"javaweb/JiuJiu/userData/"+userName+"/img/"+imgName);
			if(!imgfile.exists()) {
				imgNamePath = "default.jpg";
			}
		}
		return resoucePath+"javaweb/JiuJiu/userData/"+userName+"/img/"+imgNamePath;
	}
	
	@RequestMapping("/jspSkip/{jspname}")
	public String jspSkip(@PathVariable("jspname") String jspName) {
		return "forward:/WEB-INF/View/"+jspName+".jsp";
	}
	
	@RequestMapping("/fileTest")
	public void fileTest(HttpServletRequest req) {
		String vpmPath = "/JiuJiuGuFeng/resource/javaweb/JiuJiu/vpmData/test/Video/1522330057488dfafgd.mp4";
		String appPath = req.getServletContext().getRealPath("/");
		System.out.println(vpmPath.substring(14));
		System.out.println(appPath);
		File file= new File(appPath+"resource/javaweb/JiuJiu/vpmData/test/Video/test.txt");
		if(file.exists()) {
			boolean delete = file.delete();
			System.out.println(delete);
			System.out.println("删除成功");
		}else {
			System.out.println("删除失败");
		}
	}
}
