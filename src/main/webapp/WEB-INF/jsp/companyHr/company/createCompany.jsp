<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

	<head>
		<meta charset="UTF-8">
		<title>新建公司</title>
		<link rel="stylesheet" type="text/css" href="<c:url value="/plugins/bootstrap-3.3.5-dist/css/bootstrap-theme.css"/>" />
		<link rel="stylesheet" type="text/css" href="<c:url value="/plugins/bootstrap-3.3.5-dist/css/bootstrap.css"/>" />
		<link rel="stylesheet" type="text/css" href="<c:url value="/plugins/bootstrap-slider/css/bootstrap-slider.css"/>" />
		<link rel="stylesheet" type="text/css" href="<c:url value="/plugins/bootstrap-fileinput/css/fileinput.css"/>" />
		<link rel="stylesheet" type="text/css" href="<c:url value="/css/commons.css"/>"/>
		<link rel="stylesheet" type="text/css" href="<c:url value="/css/companyHr/company/createCompany.css"/>" />
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
					<li class="active">创建公司</li>
				</ol>
			</div>
			<div class="">
				<div>

					<form class="form-horizontal" method="post" enctype="multipart/form-data" action="<c:url value="/companyHr/createCompany"/>">
						<fieldset>

							<div id="legend" class="">
								<legend class="">创建公司</legend>
							</div>
							
							<div class="form-group">
								<label for="name" class="col-sm-2 control-label">公司名：</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" id="name" name="company.name" placeholder="20字以内">
								</div>
							</div>
							
							<div class="form-group">
								<label for="person_scale" class="col-sm-2 control-label">人数规模：</label>
								<div class="col-sm-10">
									<b>创业公司</b>
									<input id="person_scale" name="person_scale" type="text" class="" value="" data-slider-min="10" data-slider-max="1000" data-slider-step="1" data-slider-value="[100,500]"/>
									<b>行业巨头</b>
								</div>
							</div>
							
							<div class="form-group">
								<label for="logo" class="col-sm-2 control-label">公司Logo：</label>
								<div class="col-sm-10">
									<!--<input type="text" class="form-control" id="logo" name="logo" placeholder="50字以内">-->
										<input type="file" name="logo" id="logo" value="" placeholder="请上传公司logo"/>
								</div>
							</div>
							
							<div class="form-group">
								<label for="contact" class="col-sm-2 control-label">公司负责人联系方式：</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" id="contact" name="company.contact" placeholder="请输入有效的联系方式，50字以内">
								</div>
							</div>
							
							<div class="form-group">
								<label for="descContent" class="col-sm-2 control-label">公司描述：</label>
								<div class="col-sm-10">
									<textarea type="text" class="form-control" id="descContent" name="company.desc_content" placeholder="请输入职位描述，3000字以内"></textarea>
								</div>
							</div>
							
							<div class="form-group">
								<div class="col-sm-4 col-lg-offset-5">
									<button class="btn btn-success" type="submit" id="createCompanyBtn">创建公司</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									<button class="btn btn-success" type="reset">重置</button>
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
		<script type="text/javascript" src="<c:url value="/js/companyHr/company/createCompany.js"/>"></script>
		
	</body>

</html>