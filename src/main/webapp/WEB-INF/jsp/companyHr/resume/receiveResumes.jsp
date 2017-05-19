<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

	<head>
		<meta charset="UTF-8">
		<title>我收到的简历</title>
		<link rel="stylesheet" type="text/css" href="<c:url value="/plugins/bootstrap-3.3.5-dist/css/bootstrap-theme.css"/>" />
		<link rel="stylesheet" type="text/css" href="<c:url value="/plugins/bootstrap-3.3.5-dist/css/bootstrap.css"/>" />
		<link rel="stylesheet" type="text/css" href="<c:url value="/plugins/bootstrap-slider/css/bootstrap-slider.css"/>" />
		<link rel="stylesheet" type="text/css" href="<c:url value="/plugins/bootstrap-fileinput/css/fileinput.css"/>" />
		<link rel="stylesheet" type="text/css" href="<c:url value="/css/commons.css"/>"/>
	</head>

	<body>

		<%--引入导航栏 --%>
		<%@include file="/WEB-INF/jsp/commons/nav/nav.jspf" %>

		<div class="container">
			<!-- 面包屑 -->
			<div>
				<ol class="breadcrumb">
					<li>
						<a href="<c:url value="/indexEntry"/>">首页</a>
					</li>
					<li>
						<a href="<c:url value="/common/jobListEntry"/>">我是企业方</a>
					</li>
					<li class="active">我收到的简历</li>
				</ol>
			</div>
			<div class="">
				<div>

					<form class="form-horizontal">
						<fieldset>

							<div id="legend" class="">
								<legend class="">我收到的简历</legend>
							</div>

							<table class="table table-hover">
								<thead>
									<tr>
										<th>职位名称</th>
										<th>收到谁的简历</th>
										<th>简历名称</th>
										<th>投递时间</th>
										<th>操作</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${page.list }" var="resumeDeliver">
										<tr>
											<td>
												<a target="_blank" href="<c:url value="/common/jobDetailsEntry?id=${resumeDeliver.job.id }"/>" class="job-name">${resumeDeliver.job.name }</a>
											</td>
											<td>
												<span class="company-name">${resumeDeliver.resume.user.nickname }</span>
											</td>
											<td><a href="<c:url value="/jobHunter/downloadResume?id=${resumeDeliver.resume.id}"/>">${resumeDeliver.resume.name }</a></td>
											<td>${resumeDeliver.createTime}</td>
											<td>
												<div class="btn-group">
													<c:choose>
													
														<c:when test="${resumeDeliver.result==0 }">
															<button type="button" class="btn btn-success btn-sm" name="refuseBtn" data-location="<c:url value="/companyHr/refuseResumeDeliver?id=${resumeDeliver.id }&pageNumber=${page.pageNumber }"/>">不合适</button>
															<button type="button" class="btn btn-success btn-sm" name="inviteInterviewBtn" data-location="<c:url value="/companyHr/inviteInterviewEntry?id=${resumeDeliver.id }"/>">邀请面试</button>
														</c:when>
														
														<c:when test="${resumeDeliver.result==1 }">
															<span>已拒绝</span>
														</c:when>
														
														<c:when test="${resumeDeliver.result==2 }">
															<span>已邀请</span>
														</c:when>
														
													</c:choose>
													
												</div>
											</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</fieldset>
					</form>
				</div>
			</div>
			
			<!-- 引入分页 -->
			<c:set var="paginationLocation" value="/companyHr/receiveResumeEntry" />
			<%@include file="/WEB-INF/jsp/commons/pagination/pagination.jspf" %>

			<%--引入页脚 --%>
			<%@include file="/WEB-INF/jsp/commons/footer/footer.jspf" %>

		<script type="text/javascript" src="<c:url value="/plugins/jquery/jquery-2.2.3.js"/>"></script>
		<script type="text/javascript" src="<c:url value="/plugins/bootstrap-3.3.5-dist/js/bootstrap.js"/>"></script>
		<script type="text/javascript" src="<c:url value="/plugins/bootstrap-slider/js/bootstrap-slider.js"/>"></script>
		<script type="text/javascript" src="<c:url value="/plugins/bootstrap-fileinput/js/fileinput.js"/>"></script>
		<script type="text/javascript" src="<c:url value="/plugins/layer/layer.js"/>"></script>
		<script type="text/javascript" src="<c:url value="/js/commons.js"/>"></script>
		<script type="text/javascript" src="<c:url value="/js/companyHr/resume/receiveResumes.js"/>"></script>
	</body>

</html>