package org.cc11001100.jfinal.controller;

import java.io.File;
import java.io.IOException;

import javax.mail.Message;

import org.apache.commons.io.FileUtils;
import org.cc11001100.jfinal.interceptor.LoginInterceptor;
import org.cc11001100.jfinal.modle.Job;
import org.cc11001100.jfinal.modle.Msg;
import org.cc11001100.jfinal.modle.Resume;
import org.cc11001100.jfinal.modle.ResumeDeliver;
import org.cc11001100.jfinal.modle.User;
import org.cc11001100.jfinal.utils.ConstantRepo;
import org.cc11001100.jfinal.utils.GenUtil;

import com.jfinal.aop.Before;
import com.jfinal.core.Controller;
import com.jfinal.plugin.activerecord.Page;
import com.jfinal.upload.UploadFile;

/**
 * 
 * 求职者的Controller
 * 
 * @author CC11001100
 *
 */
@Before(LoginInterceptor.class)
public class JobHunterController extends Controller {

	
	/**
	 * 我投递的职位页面入口
	 */
	public void myDeliverJobsEntry(){
		
		Integer pageNumber=getParaToInt("pageNumber");
		pageNumber=(pageNumber==null)?1:pageNumber;
		
		User user=getSessionAttr(ConstantRepo.LOGIN_FLAG);
		
		String sqlSelect="SELECT t2.* ";
		StringBuilder sqlExceptSelect=new StringBuilder();
		sqlExceptSelect.append(" FROM t_resume AS t1 ")
			.append("JOIN t_resume_deliver AS t2 ON t1.id=t2.resume_id ")
			.append("WHERE t1.user_id=? ")
			.append("ORDER BY t2.create_time DESC ");
		Page<ResumeDeliver> page=ResumeDeliver.dao.paginate(pageNumber, 20, sqlSelect, sqlExceptSelect.toString(), user.getId());
		setAttr("page", page);
		
		render("/WEB-INF/jsp/jobHunter/job/myDeliverJobs.jsp");
	}
	
	/**
	 * 我的简历页面入口
	 */
	public void myResumeEntry(){
		render("/WEB-INF/jsp/jobHunter/resume/myResume.jsp");
	}
	
	/**
	 * 上传新简历
	 */
	public void uploadNewResume(){
		
		//上传文件
		UploadFile uploadFile=getFile("uploadNewResume");
		User user=(User) getSession().getAttribute(ConstantRepo.LOGIN_FLAG);
		Resume.dao.uploadNewResume(uploadFile, user);
		
		redirect("/jobHunter/uploadNewResume");
	}
	
	/**
	 * 下载简历，下载简历的时候需要恢复原名的
	 */
	public void downloadResume(){
		String id=getPara("id");
		Resume resume=Resume.dao.findById(id);
		File resumeFile=new File(ConstantRepo.BASE_DOWNLOAD_FILE_PATH+"/"+resume.getPath());
		File tempResumeFile=new File(FileUtils.getTempDirectory()+"/"+resume.getName());
		try {
			FileUtils.copyFile(resumeFile, tempResumeFile);
			renderFile(tempResumeFile);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * 向某个职位投递简历
	 */
	public void deliverMyResumeToThisJob(){
		
		
		User user=getSessionAttr(ConstantRepo.LOGIN_FLAG);
		
		//检查未登录用户
		if(user==null){
			redirect("/visitor/loginEntry");
		}
		
		String id=getPara("id");
		Job job=Job.dao.findById(id);
		Resume resume=user.getResume();
		
		if(resume==null){
			redirect("/jobHunter/myResumeEntry");
		}
		
		//记录投递信息
		ResumeDeliver resumeDeliver=new ResumeDeliver();
		resumeDeliver.setId(GenUtil.id()).setResumeId(resume.getId()).setJobId(job.getId()).save();

		//发送新消息提醒
		Msg msg=new Msg();
		StringBuilder msgContent=new StringBuilder();
		msgContent.append("收到新简历：").append(user.getNickname()).append("向您发布的职位")
				  .append(job.getName()).append("投递了简历").append(resume.getName());
		msg.setId(GenUtil.id()).setUserId(job.getUserId()).setMsgContent(msgContent.toString()).save();
		
		redirect("/common/jobDetailsEntry?id="+id);
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
