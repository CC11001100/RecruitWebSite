<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

	<head>
		<meta charset="UTF-8">
		<title>职位列表</title>
		<link rel="stylesheet" type="text/css" href="<c:url value="/plugins/bootstrap-3.3.5-dist/css/bootstrap-theme.css"/>" />
		<link rel="stylesheet" type="text/css" href="<c:url value="/plugins/bootstrap-3.3.5-dist/css/bootstrap.css"/>" />
		<link rel="stylesheet" type="text/css" href="<c:url value="/css/commons.css"/>"/>
		<link rel="stylesheet" type="text/css" href="<c:url value="/css/commons/jobList.css"/>" />
	</head>

	<body>
		
		<%--引入导航栏 --%>
		<c:set var="active" value="2"/>
		<%@include file="/WEB-INF/jsp/commons/nav/nav.jspf" %>
		
		<div class="container">
			<!-- 条件栏 -->
			<div class="condition-box">
				<form method="post" action="<c:url value="/common/jobListEntry"/>">
					<div class="input-group">
						<input type="hidden" name="pageNumber" value="${page.pageNumber }" />
						<input type="text" class="form-control" aria-label="..." placeholder="输入关键词，20字以内" name="keyword" id="keyword" value="${keyword }">
						<div class="input-group-btn">
							<button type="submit" class="btn btn-primary" id="keyworkSearchBtn">搜索</button>
						</div>
					</div>
				</form>
			</div>
			<!-- 结果栏 -->
			<div class="job-list">
				<ul class="list-group">
					<c:forEach items="${page.list }" var="job">
						<li class="list-group-item">
							<div class="job-info">
								<div class="title">
									<a target="_blank" href="<c:url value="/common/jobDetailsEntry?id=${job.id }"/>" class="job-name">${job.name }</a>
									<span class="salary">${job.salaryLowK}K~${job.salaryHighK}K</span>
								</div>
								<div class="misc">
									<span class="location">${job.location}</span>
									<span class="work-experience">${job.workExperienceLow}~${job.workExperienceHigh}年</span>
									<span class="education-require">${job.plainEducationRequire }</span>
								</div>
								<div>
									<span class="release-time">${job.createTime }</span>
								</div>
							</div>
							<div class="company-info">
								<div class="misc">
									<div>
										<a target="_blank" href="<c:url value="/common/companyDetailsEntry?id=${job.company.id }"/>" class="company-name">${job.company.name }</a>
									</div>
									<div>
										<span class="person-scale">${job.company.personScaleLow }~${job.company.personScaleHigh }人</span>
									</div>
								</div>
								<div class="logo">
									<a target="_blank" href="<c:url value="/common/companyDetailsEntry?id=${job.company.id }"/>"><img src="<c:url value="/file/showPic?name=${job.company.logo }"/>" alt="" /></a>
								</div>
							</div>
						</li>
					</c:forEach>
					<c:if test="${page.list.size()==0 }">
							<li class="list-group-item"><p class="noneResult">暂无搜索结果</p></li>
					</c:if>
				</ul>
			</div>
		</div>
			
		<!-- 引入分页 -->
		<c:set var="paginationLocation" value="/common/jobListEntry" />
		<c:set var="paginationParams" value="keyword=${keyword }" />
		<%@include file="/WEB-INF/jsp/commons/pagination/pagination.jspf" %>
		
		<%--引入页脚 --%>
		<%@include file="/WEB-INF/jsp/commons/footer/footer.jspf" %>
	
		<script type="text/javascript" src="<c:url value="/plugins/jquery/jquery-2.2.3.js"/>"></script>
		<script type="text/javascript" src="<c:url value="/plugins/bootstrap-3.3.5-dist/js/bootstrap.js"/>"></script>
		<script type="text/javascript" src="<c:url value="/plugins/layer/layer.js"/>"></script>
		<script type="text/javascript" src="<c:url value="/js/commons.js"/>"></script>
		<script type="text/javascript" src="<c:url value="/js/commons/jobList.js"/>"></script>
		
	</body>

</html>