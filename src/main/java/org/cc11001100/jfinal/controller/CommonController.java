package org.cc11001100.jfinal.controller;

import java.io.IOException;
import java.util.Date;
import java.util.List;

import org.cc11001100.jfinal.modle.Company;
import org.cc11001100.jfinal.modle.Job;
import org.cc11001100.jfinal.modle.Msg;
import org.cc11001100.jfinal.modle.User;
import org.cc11001100.jfinal.utils.ConstantRepo;

import com.jfinal.core.Controller;
import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Page;
import com.jfinal.upload.UploadFile;

/**
 * 
 * 通用部分的Controller
 * 
 * @author CC11001100
 *
 */
public class CommonController extends Controller {

	/**
	 * 进入公司详情页面
	 */
	public void companyDetailsEntry(){
		
		String id=getPara("id");
		
		//查询公司信息
		Company company=Company.dao.findById(id);
		setAttr("company", company);
		
		//查询推荐其它公司信息
		String sql="SELECT * FROM t_company WHERE id!=? ORDER BY create_time DESC LIMIT 0,10";
		List<Company> otherCompanyList=Company.dao.find(sql, id);
		setAttr("otherCompanyList", otherCompanyList);
		
		render("/WEB-INF/jsp/commons/companyDetails.jsp");
	}
	
	/**
	 * 进入消息页面入口
	 */
	public void msgListEntry(){

		User user=getSessionAttr(ConstantRepo.LOGIN_FLAG);
		
		Integer pageNumber=getParaToInt("pageNumber");
		pageNumber=(pageNumber==null) ? 1 : pageNumber;
		
		String sqlSelect="SELECT * ";
		String sqlExceptSelect=" FROM t_msg WHERE user_id=? ORDER BY create_time DESC ";
		Page<Msg> page=Msg.dao.paginate(pageNumber, 20, sqlSelect, sqlExceptSelect, user.getId());
		setAttr("page", page);
		
		render("/WEB-INF/jsp/commons/msg.jsp");
	}
	
	/**
	 * 获取未读消息数
	 */
	public void getUnreadMsgCount(){
		
		User user=getSessionAttr(ConstantRepo.LOGIN_FLAG);
		
		String sql="SELECT COUNT(id) FROM t_msg WHERE user_id=? AND is_have_read=0";
		int unreadMsgCount=Db.queryInt(sql, user.getId());
		
		setAttr("code", 0);
		setAttr("msg", "success");
		setAttr("unreadMsgCount", unreadMsgCount);
		renderJson();
	}
	
	/**
	 * 将某条消息标记为已读
	 */
	public void readMsg(){
		
		String id=getPara("id");
		Msg msg=Msg.dao.findById(id);
		boolean res=msg.setIsHaveRead(1).setHaveReadTime(new Date()).update();
		
		if(res){
			setAttr("code", 0);
			setAttr("msg", "success");
			setAttr("data", null);
		}else{
			setAttr("code", -1);
			setAttr("msg", "failed");
			setAttr("data", null);
		}
		
		renderJson();
	}
	
	/**
	 * 查看职位详情页面入口
	 */
	public void jobDetailsEntry(){
		
		//要查看的职位的信息
		String id=getPara("id");
		Job job=Job.dao.findById(id);
		setAttr("job", job);
		
		//其它职位推荐，不搞太复杂...
		String sql="SELECT * FROM t_job WHERE id!=? ORDER BY create_time DESC LIMIT 0,10";
		List<Job> otherJobList=Job.dao.find(sql, id);
		setAttr("otherJobList", otherJobList);
		
		render("/WEB-INF/jsp/commons/jobDetails.jsp");
	}
	
	/**
	 * 职位列表页入口
	 */
	public void jobListEntry(){
		
		Integer pageNumber=getParaToInt("pageNumber");
		pageNumber=(pageNumber==null) ? 1 : pageNumber;
		String keyword=getPara("keyword");
		keyword=(keyword==null) ? "" : keyword;
		
		String sqlSelect="SELECT * ";
		String sqlWhere="FROM t_job WHERE name LIKE CONCAT('%',?,'%') OR desc_content LIKE CONCAT('%',?'%')";
		Page<Job> page=Job.dao.paginate(pageNumber, 15, sqlSelect, sqlWhere, keyword, keyword);
		setAttr("page", page);
		
		setAttr("keyword", keyword);
		
		render("/WEB-INF/jsp/commons/jobList.jsp");
	}

	
	/**
	 * 用户资料修改页面入口
	 */
	public void userInfoEntry(){
		render("/WEB-INF/jsp/commons/userInfo.jsp");
	}
	
	
	/**
	 * 修改密码
	 */
	public void changePasswd(){

		User user=getSessionAttr(ConstantRepo.LOGIN_FLAG);
		
		String oldPasswd=getPara("oldPasswd");
		String newPasswd=getPara("newPasswd");
		if(!new User().setPasswd(oldPasswd).enctypePasswd().getPasswd().equals(user.getPasswd())){
			setAttr("tipMsg", "原密码不正确");
			render("/WEB-INF/jsp/commons/userInfo.jsp");
			return;
		}
		
		user.setPasswd(newPasswd);
		user.enctypePasswd();
		user.update();
		
		redirect("/common/userInfoEntry");
	}
	
	/**
	 * 修改用户资料
	 */
	public void changeUserInfo(){
		
		User user=getSessionAttr(ConstantRepo.LOGIN_FLAG);
		
		//处理头像
		UploadFile avatarUploadFile=getFile("avatar");
		user.processAvatar(avatarUploadFile);
		
		//处理昵称
		String nickname=getPara("nickname");
		user.setNickname(nickname);
		
		user.update();
		
		redirect("/common/userInfoEntry");
	}
	
	/**
	 * 退出登录
	 * @throws IOException 
	 */
	public void logout() throws IOException{
		
		/*移除登录标记*/
		getSession().removeAttribute(ConstantRepo.LOGIN_FLAG);
		
		/*重定向到首页*/
		redirect("/indexEntry");
	}
	
	
	
	
	
	
}
