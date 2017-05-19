<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

	<head>
		<meta charset="UTF-8">
		<title>${company.name }</title>
		<link rel="stylesheet" type="text/css" href="<c:url value="/plugins/bootstrap-3.3.5-dist/css/bootstrap-theme.css"/>" />
		<link rel="stylesheet" type="text/css" href="<c:url value="/plugins/bootstrap-3.3.5-dist/css/bootstrap.css"/>" />
		<link rel="stylesheet" type="text/css" href="<c:url value="/plugins/bootstrap-slider/css/bootstrap-slider.css"/>" />
		<link rel="stylesheet" type="text/css" href="<c:url value="/plugins/bootstrap-fileinput/css/fileinput.css"/>" />
		<link rel="stylesheet" type="text/css" href="<c:url value="/css/commons.css"/>"/>
		<link rel="stylesheet" type="text/css" href="<c:url value="/css/commons/companyDetails.css"/>" />
	</head>

	<body>

		<%--引入导航栏 --%>
		<%@include file="/WEB-INF/jsp/commons/nav/nav.jspf" %>

		<!-- 详情头 -->
		<div class="detail-header container">
			<!-- 职位描述 -->
			<!--<div class="job-detail">
				<div class="release-time"><span class="glyphicon glyphicon-time"/>&nbsp;<span>发布于昨天</span></div>
				<div>
					<span title="" class="job-name">Java研发</span>
					<span title="" class="salary">7K~10K</span>
				</div>
				<div class="misc">
					<span title="" class="location">北京</span>
					<span title="" class="work-experience">1-3年</span>
					<span title="" class="education-require">本科</span>
				</div>
			</div>-->
			<!-- 所属公司描述 -->
			<div class="company-detail">
				<div class="misc">
					<div>
						<span title="" class="company-name">${company.name }</span>
					</div>
					<div>
						<span title="" class="person-scale">${company.personScaleLow }~${company.personScaleHigh }人</span><br />
					</div>
					<div>
						<!--<span title="" class="company-brief">公司简介公司简介公司简介公司简介公司简介</span>-->
					</div>
				</div>
				<div class="logo">
					<img src="<c:url value="/file/showPic?name=${company.logo }"/>" alt="" />
				</div>
			</div>
		</div>
		<!-- 详情具体描述 -->
		<div class="detail-desc container">
			<!-- 职位详情 -->
			<div class="job-details">
				<div class="release-user-info">
					<img src="<c:url value="/file/showPic?name=${company.user.avatar }"/>" alt="" class="user-avatar" />
					<span class="user-name">${company.user.nickname }</span>
					<span class="contact">${company.contact }</span>
				</div>
				<div class="desc_content">
					<p class="title">公司简介：</p>
					<p>${company.descContent }</p>
				</div>
				<!--<div class="operation-btn">
					<button id="deliverMyResume" type="button" class="btn btn-success">投递我的简历</button>
				</div>-->
				<c:if test="${company.jobCount!=0}">
					<div class="job-list">
						<p class="title">此公司发布的职位（${company.jobCount }个）：</p>
						<ul class="list-group">
							<c:forEach items="${company.job }" var="job">
								<li class="list-group-item">
									<div class="job-info">
										<div>
											<a target="_blank" href="<c:url value="/common/jobDetailsEntry?id=${job.id }"/>" class="name">${job.name }</a>
											<span class="location">${job.location }</span>
											<span class="salary">${job.salaryLowK }K~${job.salaryHighK }K</span>
										</div>
										<div>
											<span class="release-time">${job.createTime}</span>
										</div>
									</div>
								</li>
							</c:forEach>
						</ul>
					</div>
				</c:if>
			</div>
			
			<!-- 其它公司 -->
			<div class="other-job">
				<div class="title">
					<h3 class="title">其它公司</h3>
				</div>
				<div class="content">
					<ul>
						<c:forEach items="${otherCompanyList }" var="company">
							<li>
								<div class="desc">
									<div>
										<a href="<c:url value="/common/companyDetailsEntry?id=${company.id }"/>" title="" class="job-name">${company.name }</a>
										<span title="" class="salary">${company.personScaleLow }~${company.personScaleHigh }人</span>
									</div>
									<div>
										<span title="" class="company">累计发布${company.jobCount }个职位</span>
									</div>
								</div>
								<div class="logo">
									<a href="<c:url value="/common/companyDetailsEntry?id=${company.id }"/>"><img src="<c:url value="/file/showPic?name=${company.logo }"/>" alt="" /></a>
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
	</body>

</html>