package org.cc11001100.jfinal.controller;

import java.util.List;

import org.cc11001100.jfinal.modle.Company;
import org.cc11001100.jfinal.modle.Job;
import org.cc11001100.jfinal.modle.Msg;
import org.cc11001100.jfinal.modle.Resume;
import org.cc11001100.jfinal.modle.User;
import org.cc11001100.jfinal.utils.ConstantRepo;
import org.cc11001100.jfinal.utils.GenUtil;

import com.jfinal.core.Controller;
import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Page;

/**
 * 
 * 管理员Controller 
 * 
 * @author CC11001100
 *
 */
public class AdminController extends Controller {

	/**
	 * 进入公司管理页面
	 */
	public void companyManagerEntry(){
		
		Integer pageNumber=getParaToInt("pageNumber");
		pageNumber=(pageNumber==null) ? 1 : pageNumber;
		
		String sqlSelect="SELECT * ";
		String sqlExceptSelect=" FROM t_company ";
		Page<Company> page=Company.dao.paginate(pageNumber, 20, sqlSelect, sqlExceptSelect);
		setAttr("page", page);
		
		render("/WEB-INF/jsp/admin/company/companyManager.jsp");
	}
	
	/**
	 * 进入统计页面
	 */
	public void countEntry(){
		
		//同时在线用户数
		Integer loginCount=(Integer) getSession().getServletContext().getAttribute(ConstantRepo.LOGIN_COUNT);
		loginCount=(loginCount==null) ? 0 : loginCount;
		setAttr("loginCount", loginCount);
		
		//总注册人数
		String sql="SELECT COUNT(id) FROM t_user ";
		Long totalRegisterUserCount=Db.queryLong(sql);
		setAttr("totalRegisterUserCount", totalRegisterUserCount);
		
		//总职位数
		sql="SELECT COUNT(id) FROM t_job ";
		Long totalJobCount=Db.queryLong(sql);
		setAttr("totalJobCount", totalJobCount);
		
		//总公司数
		sql="SELECT COUNT(id) FROM t_company ";
		Long totalCompanyCount=Db.queryLong(sql);
		setAttr("totalCompanyCount", totalCompanyCount);
		
		render("/WEB-INF/jsp/admin/count/count.jsp");
	}
	
	/**
	 * 进入职位管理界面
	 */
	public void jobManagerEntry(){
		
		Integer pageNumber=getParaToInt("pageNumber");
		pageNumber=(pageNumber==null) ? 1 : pageNumber;
		
		String sqlSelect="SELECT * ";
		String sqlExceptSelect=" FROM t_job ";
		Page<Job> page=Job.dao.paginate(pageNumber, 20, sqlSelect, sqlExceptSelect);
		setAttr("page", page);
		
		render("/WEB-INF/jsp/admin/job/jobManager.jsp");
	}
	
	/**
	 * 进入用户管理页面
	 */
	public void userManagerEntry(){
		
		Integer pageNumber=getParaToInt("pageNumber");
		pageNumber=(pageNumber==null) ? 1 : pageNumber;
		
		String sqlSelect="SELECT * ";
		String sqlSelectExcept="FROM t_user WHERE user_type=0 OR user_type=1";
		Page<User> page=User.dao.paginate(pageNumber, 20, sqlSelect, sqlSelectExcept);
		setAttr("page", page);
		
		render("/WEB-INF/jsp/admin/user/userManager.jsp");
	}
	
	/**
	 * 冻结账户
	 */
	public void freezeUser(){
		
		Integer pageNumber=getParaToInt("pageNumber");
		pageNumber=(pageNumber==null) ? 1 : pageNumber;
		
		String id=getPara("id");
		User user=User.dao.findById(id);
		user.setIsFreeze(1).update();
		
		redirect("/admin/userManagerEntry?pageNumber="+pageNumber);
	}
	
	/**
	 * 取消冻结账户
	 */
	public void undoFreezeUser(){
		
		Integer pageNumber=getParaToInt("pageNumber");
		pageNumber=(pageNumber==null) ? 1 : pageNumber;
		
		String id=getPara("id");
		User user=User.dao.findById(id);
		user.setIsFreeze(0).update();
		
		redirect("/admin/userManagerEntry?pageNumber="+pageNumber);
		
	}
	
	/**
	 * 删除掉某个公司
	 */
	public void deleteCompany(){
		
		Integer pageNumber=getParaToInt("pageNumber");
		pageNumber=(pageNumber==null) ? 1 : pageNumber;
		
		String id=getPara("id");
		Company company=Company.dao.findById(id);
		
		//给公司所属人发送站内信
		StringBuilder msgContent=new StringBuilder();
		msgContent.append("公司：").append("您创建的公司").append(company.getName()).append("已经被管理员删除，请知悉。");
		Msg msg=new Msg();
		msg.setId(GenUtil.id()).setUserId(company.getUserId()).setMsgContent(msgContent.toString()).save();
		
		//删除公司
		company.delete();

		redirect("/admin/companyManagerEntry?pageNumber="+pageNumber);
	}

	/**
	 * 删除掉某个职位
	 */
	public void deleteJob(){
		
		String id=getPara("id");
		Job job=Job.dao.findById(id);
		
		//给发布职位的人发送消息
		StringBuilder msgContent=new StringBuilder();
		msgContent.append("职位删除：您发布的职位").append(job.getName()).append("已经被管理员删除，请知悉。");
		Msg msg=new Msg();
		msg.setId(GenUtil.id()).setUserId(job.getUserId()).setMsgContent(msgContent.toString()).save();
		
		//给投递过简历的人发送消息
		List<Resume> resumeList=job.getResume();
		for(Resume resume : resumeList){
			msgContent=new StringBuilder();
			msgContent.append("职位删除：您投递过简历的职位").append(job.getName()).append("已经被管理员删除，请知悉。");
			msg=new Msg();
			msg.setId(GenUtil.id()).setUserId(resume.getUserId()).setMsgContent(msgContent.toString()).save();
		}
		
		//删除掉职位记录
		job.delete();
		
		Integer pageNumber=getParaToInt("pageNumber");
		pageNumber=(pageNumber==null) ? 1 : pageNumber;
		
		redirect("/admin/jobManagerEntry?pageNumber="+pageNumber);
	}
	
}
