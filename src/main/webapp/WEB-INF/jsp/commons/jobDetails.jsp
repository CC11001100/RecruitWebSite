<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

	<head>
		<meta charset="UTF-8">
		<title>${job.name }</title>
		<link rel="stylesheet" type="text/css" href="<c:url value="/plugins/bootstrap-3.3.5-dist/css/bootstrap-theme.css"/>" />
		<link rel="stylesheet" type="text/css" href="<c:url value="/plugins/bootstrap-3.3.5-dist/css/bootstrap.css"/>" />
		<link rel="stylesheet" type="text/css" href="<c:url value="/plugins/bootstrap-slider/css/bootstrap-slider.css"/>" />
		<link rel="stylesheet" type="text/css" href="<c:url value="/plugins/bootstrap-fileinput/css/fileinput.css"/>" />
		<link rel="stylesheet" type="text/css" href="<c:url value="/css/commons.css"/>"/>
		<link rel="stylesheet" type="text/css" href="<c:url value="/css/commons/jobDetails.css"/>" />
	</head>

	<body>

		<%--引入导航栏 --%>
		<%@include file="/WEB-INF/jsp/commons/nav/nav.jspf" %>

		<!-- 详情头 -->
		<div class="detail-header container">
			<!-- 职位描述 -->
			<div class="job-detail">
				<!-- 发布时间 -->
				<div class="release-time"><span class="glyphicon glyphicon-time"/>&nbsp;<span>${job.createTime }</span></div>
				<div>
					<span title="" class="job-name">${job.name }</span>
					<span title="" class="salary">${job.salaryLowK }K~${job.salaryHighK }K</span>
				</div>
				<div class="misc">
					<!-- 工作位置 -->
					<span title="" class="location">${job.location }</span>
					<!-- 工作经验要求-->
					<span title="" class="work-experience">${job.workExperienceLow }-${job.workExperienceHigh }年</span>
					<!-- 学历要求 -->
					<span title="" class="education-require">${job.plainEducationRequire }</span>
				</div>
			</div>
			<!-- 所属公司描述 -->
			<div class="company-detail">
				<div class="misc">
					<div>
						<span title="" class="company-name"><a href="/common/companyDetailsEntry?id=${job.company.id }">${job.company.name }</a></span>
					</div>
					<div>
						<span title="" class="person-scale">${job.company.personScaleLow }~${job.company.personScaleHigh }人</span><br />
					</div>
					<div>
						<span title="" class="company-brief">${job.company.getBriefDescContent(25) }</span>
					</div>
				</div>
				<div class="logo">
					<a href="<c:url value="/common/companyDetailsEntry?id=${job.company.id }"/>">
						<img src="<c:url value="/file/showPic?name=${job.company.logo }"/>" alt="" />
					</a>
				</div>
			</div>
		</div>
		<!-- 详情具体描述 -->
		<div class="detail-desc container">
			<!-- 职位详情 -->
			<div class="job-details">
				<div class="release-user-info">
					<img src="<c:url value="/file/showPic?name=${job.user.avatar }"/>" alt="" class="user-avatar" />
					<span class="user-name">${job.user.nickname }</span>
					<span class="contact">${job.contact }</span>
				</div>
				<div class="desc_content">
					<p class="title">职位描述：</p>
					<p>${job.descContent }</p>
				</div>
				<div class="operation-btn">


					<!-- 根据不同用户看到的按钮显示不同 -->				
					<c:choose>
					
						<%-- 求职者 --%>
						<c:when test="${user.userType==0 }">
							<c:choose>
								<c:when test="${user.isAlreadyDeliver(job.id) }">
									<button id="deliverMyResume" type="button" disabled="disabled" class="btn btn-success disabled" data-location="<c:url value="/jobHunter/deliverMyResumeToThisJob?id=${job.id }"/>">已投递</button>
								</c:when>
								<c:otherwise>
									<button id="deliverMyResume" type="button" class="btn btn-success" data-location="<c:url value="/jobHunter/deliverMyResumeToThisJob?id=${job.id }"/>">投递我的简历</button>
								</c:otherwise>
							</c:choose>
						</c:when>
						
						<%-- 企业HR看到这个 --%>
						<c:when test="${user.userType==1 }">
						</c:when>
						
						<%-- 管理员 --%>					
						<c:when test="${user.userType==2 }">
						</c:when>
						
						<c:otherwise>
							<button id="deliverMyResume" type="button" class="btn btn-success" data-location="<c:url value="/jobHunter/deliverMyResumeToThisJob?id=${job.id }"/>">投递我的简历</button>
						</c:otherwise>
						
					</c:choose>
					
				</div>
			</div>
			<!-- 其它职位 -->
			<div class="other-job">
				<div class="title">
					<h3 class="title">其它职位<span class="more-job-link"><a href="<c:url value="/common/jobListEntry"/>">更多职位></a></span></h3>
				</div>
				<div class="content">
					<ul>
						<c:forEach items="${otherJobList}" var="job">
							<li>
								<div class="desc">
									<div>
										<a  href="<c:url value="/common/jobDetailsEntry?id=${job.id }"/>" title="" class="job-name">${job.getBriefName(6) }</a>
										<span title="" class="salary">${job.salaryLowK }K~${job.salaryHighK }K</span>
									</div>
									<div>
										<span title="" class="company">${job.company.getBriefName(8) }</span>
										<span title="" class="location">${job.getBriefLocation(5) }</span>
									</div>
								</div>
								<div class="logo">
									<a href="<c:url value="/common/companyDetailsEntry?id=${job.company.id }"/>"><img src="<c:url value="/file/showPic?name=${job.company.logo }"/>" alt="" /></a>
								</div>
							</li>
						</c:forEach>
					</ul>
				</div>
			</div>
		</div>
		
		<%--引入页脚 --%>
		<%@include file="/WEB-INF/jsp/commons/footer/footer.jspf" %>

		<script type="text/javascript" src="<c:url value="/plugins/jquery/jquery-2.2.3.js"/>"></script>
		<script type="text/javascript" src="<c:url value="/plugins/bootstrap-3.3.5-dist/js/bootstrap.js"/>"></script>
		<script type="text/javascript" src="<c:url value="/plugins/bootstrap-slider/js/bootstrap-slider.js"/>"></script>
		<script type="text/javascript" src="<c:url value="/plugins/bootstrap-fileinput/js/fileinput.js"/>"></script>
		<script type="text/javascript" src="<c:url value="/plugins/layer/layer.js"/>"></script>
		<script type="text/javascript" src="<c:url value="/js/commons.js"/>"></script>
		<script type="text/javascript" src="<c:url value="/js/commons/jobDetails.js"/>"></script>
	</body>

</html>