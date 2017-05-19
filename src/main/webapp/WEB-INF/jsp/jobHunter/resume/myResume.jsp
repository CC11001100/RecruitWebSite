<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

	<head>
		<meta charset="UTF-8">
		<title>我的简历</title>
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
						<a href="<c:url value="/common/jobListEntry"/>">我是求职者</a>
					</li>
					<li class="active">我的简历</li>
				</ol>
			</div>
			<div class="">
				<div>

					<div class="form-horizontal">
						<fieldset>

							<div id="legend" class="">
								<legend class="">我的简历</legend>
							</div>

							<div class="">
								<h3>当前简历：</h3>
								
								<c:if test="${user.resume!=null}">
									<a href="<c:url value="/jobHunter/downloadResume?id=${user.resume.id}"/>">${user.resume.name }</a>
								</c:if>
								<c:if test="${user.resume==null}">
									<span>您还没有上传简历</span>
								</c:if>
								
								<h3>上传新简历</h3>
								<form method="post" enctype="multipart/form-data" action="<c:url value="/jobHunter/uploadNewResume"/>">
									<input type="file" name="uploadNewResume" id="uploadNewResume" value="" />
									<button type="submit" class="btn btn-success" id="uploadNewResumeBtn">上传新简历</button>
								</form>
							</div>

						</fieldset>
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
		<script type="text/javascript" src="<c:url value="/js/jobHunter/resume/myResume.js"/>"></script>
		
	</body>

</html>