<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

	<head>
		<meta charset="UTF-8">
		<title>发布职位</title>
		<link rel="stylesheet" type="text/css" href="<c:url value="/plugins/bootstrap-3.3.5-dist/css/bootstrap-theme.css"/>" />
		<link rel="stylesheet" type="text/css" href="<c:url value="/plugins/bootstrap-3.3.5-dist/css/bootstrap.css"/>" />
		<link rel="stylesheet" type="text/css" href="<c:url value="/plugins/bootstrap-slider/css/bootstrap-slider.css"/>" />
		<link rel="stylesheet" type="text/css" href="<c:url value="/plugins/bootstrap-fileinput/css/fileinput.css"/>" />
		<link rel="stylesheet" type="text/css" href="<c:url value="/css/commons.css"/>"/>
		<link rel="stylesheet" type="text/css" href="<c:url value="/css/companyHr/job/releaseJob.css"/>"/>
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
					<li class="active">发布职位</li>
				</ol>
			</div>
			<div class="">
				<div>

					<form class="form-horizontal" method="post" action="<c:url value="/companyHr/releaseJob"/>">
						<fieldset>

							<div id="legend" class="">
								<legend class="">发布职位</legend>
							</div>
							
							<div class="form-group">
								<label for="name" class="col-sm-2 control-label">职位名：</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" id="name" name="job.name" placeholder="20字以内">
								</div>
							</div>
							
							<div class="form-group">
								<label for="salary" class="col-sm-2 control-label">月薪：</label>
								<div class="col-sm-10">
									<b>杨白劳</b>
									<input id="salary" name="salary" type="text" class="" value="" data-slider-min="0" data-slider-max="20000" data-slider-step="1000" data-slider-value="[5000,8000]"/>
									<b>薪资open</b>
								</div>
							</div>
							
							<div class="form-group">
								<label for="location" class="col-sm-2 control-label">工作位置：</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" id="location" name="job.location" placeholder="50字以内">
								</div>
							</div>
							
							<div class="form-group">
								<label for="workExperience" class="col-sm-2 control-label">工作经验要求：</label>
								<div class="col-sm-10">
									<!--<input type="text" class="form-control" id="work-experience" name="work-experience" placeholder="50字以内">-->
									<!--<input id="ex1" data-slider-id='work-experience' type="text" data-slider-min="0" data-slider-max="20" data-slider-step="1" data-slider-value="14"/>-->
									<b>无要求</b>
									<input id="workExperience" name="workExperience" type="text" class="" value="" data-slider-min="0" data-slider-max="10" data-slider-step="1" data-slider-value="[1,3]"/>
									<b>10年及以上</b>
								</div>
							</div>
							
							<div class="form-group">
								<label class="col-sm-2 control-label" for="education-require">学历要求：</label>
								<div class="col-sm-10">
									<select class="form-control" name="job.educationRequire">
										<option value="0">无要求</option>
										<option value="1">大专</option>
										<option value="2">本科</option>
										<option value="3">研究生</option>
										<option value="4">博士及以上</option>
									</select>
								</div>
							</div>

							<div class="form-group">
								<label for="contact" class="col-sm-2 control-label">联系方式：</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" id="contact" name="job.contact" placeholder="请输入有效的联系方式，50字以内">
								</div>
							</div>
							
							<div class="form-group">
								<label for="desc_content" class="col-sm-2 control-label">职位描述：</label>
								<div class="col-sm-10">
									<textarea type="text" class="form-control" id="descContent" name="job.descContent" placeholder="请输入职位描述，3000字以内"></textarea>
								</div>
							</div>
							
							<div class="form-group">
								<label class="col-sm-2 control-label" for="companyId">关联公司：</label>
								<div class="col-sm-10">
									<select class="form-control" id="companyId" name="job.companyId">
										<c:forEach items="${myCreatedCompany }" var="item">
											<option value="${item.id }">${item.name }</option>
										</c:forEach>
									</select>
								</div>
							</div>
							
							<div class="form-group">
								<div class="col-sm-4 col-lg-offset-5">
									<button class="btn btn-success" type="submit" id="releaseJobBtn">发布职位</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									<button class="btn btn-success" type="reset">重置</button>
								</div>
							</div>
							
							<div class="control-group">
								<div class="controls">
									
								</div>
							</div>

						</fieldset>
					</form>

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
		<script type="text/javascript" src="<c:url value="/js/companyHr/job/releaseJob.js"/>"></script>
	</body>

</html>