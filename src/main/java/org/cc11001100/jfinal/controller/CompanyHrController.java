package org.cc11001100.jfinal.controller;

import java.io.File;
import java.util.List;

import org.apache.commons.collections4.CollectionUtils;
import org.apache.commons.io.FilenameUtils;
import org.cc11001100.jfinal.modle.Company;
import org.cc11001100.jfinal.modle.Job;
import org.cc11001100.jfinal.modle.Msg;
import org.cc11001100.jfinal.modle.ResumeDeliver;
import org.cc11001100.jfinal.modle.User;
import org.cc11001100.jfinal.utils.ConstantRepo;
import org.cc11001100.jfinal.utils.GenUtil;

import com.jfinal.core.Controller;
import com.jfinal.plugin.activerecord.Page;
import com.jfinal.upload.UploadFile;


/**
 * 公司HR Controller
 * 
 * @author CC11001100
 *
 */
public class CompanyHrController extends Controller {

	/**
	 * 创建公司页面入口
	 */
	public void createCompanyEntry(){
		render("/WEB-INF/jsp/companyHr/company/createCompany.jsp");
	}
	
	/**
	 * 编辑公司页面入口
	 */
	public void editCompanyEntry(){
		
		String id=getPara("id");
		Company company=Company.dao.findById(id);
		setAttr("company", company);
		setAttr("id", id);
		
		render("/WEB-INF/jsp/companyHr/company/editCompany.jsp");
	}
	
	/**
	 * 显示我创建的公司页面入口
	 */
	public void myCompanyEntry(){
		
		User user=getSessionAttr(ConstantRepo.LOGIN_FLAG);
		
		Integer pageNumber=getParaToInt("pageNumber");
		pageNumber=(pageNumber==null) ? 1 : pageNumber;
		
		String sqlSelect="SELECT * ";
		String sqlWhere="FROM t_company WHERE user_id=?";
		Page<Company> page=Company.dao.paginate(pageNumber, 20, sqlSelect, sqlWhere, user.getId());
		setAttr("page", page);
		
		render("/WEB-INF/jsp/companyHr/company/myCompany.jsp");
	}
	
	/**
	 * 编辑职位页面入口
	 */
	public void editJobEntry(){
		render("/WEB-INF/jsp/companyHr/job/editJob.jsp");
	}
	
	/**
	 * 发布职位页面入口
	 */
	public void releaseJobEntry(){
		
		User user=getSessionAttr(ConstantRepo.LOGIN_FLAG);
		
		List<Company> myCreatedCompany=user.getCompany();
		if(CollectionUtils.isEmpty(myCreatedCompany)){
			redirect("/companyHr/createCompanyEntry");
			return;
		}
		setAttr("myCreatedCompany", myCreatedCompany);
		
		render("/WEB-INF/jsp/companyHr/job/releaseJob.jsp");
	}
	
	/**
	 * 我发布的职位页面入口
	 */
	public void myReleasedJobsEntry(){
		
		User user=getSessionAttr(ConstantRepo.LOGIN_FLAG);
		
		Integer pageNumer=getParaToInt("pageNumber");
		pageNumer=(pageNumer==null) ? 1 : pageNumer;
		
		String sqlSelect="SELECT * ";
		String sqlWhere="FROM t_job WHERE user_id=?";
		Page<Job> page=Job.dao.paginate(pageNumer, 20, sqlSelect, sqlWhere, user.getId());
		setAttr("page", page);
		
		render("/WEB-INF/jsp/companyHr/job/myReleasedJobs.jsp");
	}
	
	/**
	 * 邀请面试页面入口
	 */
	public void inviteInterviewEntry(){
		
		String id=getPara("id");
		setAttr("id", id);
		
		render("/WEB-INF/jsp/companyHr/resume/inviteInterview.jsp");
	}
	
	/**
	 * 我收到的简历页面入口
	 */
	public void receiveResumeEntry(){
		
		User user=getSessionAttr(ConstantRepo.LOGIN_FLAG);
		
		Integer pageNumber=getParaToInt("pageNumber");
		pageNumber=(pageNumber==null) ? 1 : pageNumber;
		
		String sqlSelect="SELECT t1.* ";
		StringBuilder sqlExceptSelect=new StringBuilder();
		sqlExceptSelect.append(" FROM t_resume_deliver AS t1 ")
						.append("JOIN t_job AS t2 ON t2.id=t1.job_id ")
						.append("WHERE t2.user_id=? ")
						.append("ORDER BY t1.create_time DESC ");
		Page<ResumeDeliver> page=ResumeDeliver.dao.paginate(pageNumber, 20, sqlSelect, sqlExceptSelect.toString(), user.getId());
		setAttr("page", page);
		
		render("/WEB-INF/jsp/companyHr/resume/receiveResumes.jsp");
	}
	
	/**
	 * 创建公司
	 */
	public void createCompany(){
		
		UploadFile logoUploadFile=getFile("logo");
		File logoTempFile=logoUploadFile.getFile();
		String extenstion=FilenameUtils.getExtension(logoTempFile.getName());
		String newLogoFileName=new StringBuilder().append(logoTempFile.getParent()).append("/").append(GenUtil.id()).append(".").append(extenstion).toString();
		File newLogoFile=new File(newLogoFileName);
		logoTempFile.renameTo(newLogoFile);
		
		User user=getSessionAttr(ConstantRepo.LOGIN_FLAG);
		
		Company company=getModel(Company.class);
		company.setId(GenUtil.id());
		company.setUserId(user.getId());
		company.setLogo(newLogoFile.getName());
		String[] personScale=getPara("person_scale").split(",");
		company.setPersonScaleLow(Integer.parseInt(personScale[0]));
		company.setPersonScaleHigh(Integer.parseInt(personScale[1]));
		company.save();
		
		redirect("/companyHr/myCompanyEntry");
		
	}
	
	/**
	 * 删除公司
	 */
	public void deleteCompany(){
		String id=getPara("id");
		Company.dao.deleteById(id);
		String pageNumer=getPara("pageNumber");
		redirect("/companyHr/myCompanyEntry"+"?pageNumber="+pageNumer);
	}
	
	/**
	 * 发布职位
	 */
	public void releaseJob(){
		
		User user=getSessionAttr(ConstantRepo.LOGIN_FLAG);
		Job job=getModel(Job.class);
		
		job.setId(GenUtil.id());
		job.setUserId(user.getId());
		
		String[] salary=getPara("salary").split(",");
		job.setSalaryLow(Integer.parseInt(salary[0]));
		job.setSalaryHigh(Integer.parseInt(salary[1]));
		
		String[] workExperience=getPara("workExperience").split(",");
		job.setWorkExperienceLow(Integer.parseInt(workExperience[0]));
		job.setWorkExperienceHigh(Integer.parseInt(workExperience[1]));
		
		job.save();
		
		redirect("/companyHr/myReleasedJobsEntry");
	}
	
	/**
	 * 将职位下线
	 */
	public void offlineJob(){
		String id=getPara("id");
		Job.dao.findById(id).offline();
		Integer pageNumer=getParaToInt("pageNumber");
		pageNumer=(pageNumer==null)?1:pageNumer;
		redirect("/companyHr/myReleasedJobsEntry?pageNumber="+pageNumer);
	}
	
	/**
	 * 编辑公司信息
	 */
	public void editCompany(){
		
		UploadFile logoUploadFile=getFile("logo");
		File logoTempFile=logoUploadFile.getFile();
		String extenstion=FilenameUtils.getExtension(logoTempFile.getName());
		String newLogoFileName=new StringBuilder().append(logoTempFile.getParent()).append("/").append(GenUtil.id()).append(".").append(extenstion).toString();
		File newLogoFile=new File(newLogoFileName);
		logoTempFile.renameTo(newLogoFile);
		
		User user=getSessionAttr(ConstantRepo.LOGIN_FLAG);
		
		Company company=getModel(Company.class);
		company.setUserId(user.getId());
		company.setLogo(newLogoFile.getName());
		String[] personScale=getPara("person_scale").split(",");
		company.setPersonScaleLow(Integer.parseInt(personScale[0]));
		company.setPersonScaleHigh(Integer.parseInt(personScale[1]));
		company.update();
		
		redirect("/companyHr/myCompanyEntry");
	}
	
	/**
	 * 将某个投递的简历 标记为不合适
	 */
	public void refuseResumeDeliver(){
		
		User user=getSessionAttr(ConstantRepo.LOGIN_FLAG);
		
		String id=getPara("id");
		
		//更新投递状态
		ResumeDeliver resumeDeliver=ResumeDeliver.dao.findById(id);
		resumeDeliver.setResult(ResumeDeliver.Resule.REFUSE);
		resumeDeliver.update();
		
		//给投简历的人发送消息通知
		Msg msg=new Msg();
		StringBuilder msgContent=new StringBuilder();
		msgContent.append("简历投递结果：您投递给职位")
					.append(resumeDeliver.getJob().getName())
					.append("被").append(user.getNickname()).append("标记为不合适");
		msg.setId(GenUtil.id()).setUserId(resumeDeliver.getResume().getUserId()).setMsgContent(msgContent.toString()).save();
		
		Integer pageNumber=getParaToInt("pageNumber"); 
		pageNumber=(pageNumber==null) ? 1 : pageNumber;
		
		redirect("/companyHr/receiveResumeEntry?pageNumber="+pageNumber);
	}
	
	/**
	 * 将某个投递标记为邀请面试
	 */
	public void inviteInterview(){
		
		String id=getPara("id");
		ResumeDeliver resumeDeliver=ResumeDeliver.dao.findById(id);
		
		//通知对方
		String inviteInterviewMsg=getPara("inviteInterviewMsg");
		StringBuilder msgContent=new StringBuilder();
		msgContent.append("面试邀请：您投递给职位").append(resumeDeliver.getJob().getName())
				.append("的简历").append(resumeDeliver.getResume().getName())
				.append("筛选通过，邀请您参加面试，相关信息：").append(inviteInterviewMsg);
		Msg msg=new Msg();
		msg.setId(GenUtil.id()).setUserId(resumeDeliver.getResume().getUserId()).setMsgContent(msgContent.toString()).save();
		
		//更改状态
		resumeDeliver.setResult(2).update();

		Integer pageNumber=getParaToInt("pageNumber");
		pageNumber=(pageNumber==null) ? 1 : pageNumber;
		
		setAttr("code", 0);
		setAttr("msg", "success");
		setAttr("redirect", "/companyHr/receiveResumeEntry?pageNumber="+pageNumber);
		renderJson();
		
//		redirect("/companyHr/receiveResumeEntry?pageNumber="+pageNumber);
	}
	
	
	
}
