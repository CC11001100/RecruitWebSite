<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

	<head>
		<meta charset="UTF-8">
		<title>统计数据</title>
		<link rel="stylesheet" type="text/css" href="<c:url value="/plugins/bootstrap-3.3.5-dist/css/bootstrap-theme.css"/>" />
		<link rel="stylesheet" type="text/css" href="<c:url value="/plugins/bootstrap-3.3.5-dist/css/bootstrap.css"/>" />
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
					<li class="active">统计数据</li>
				</ol>
			</div>
			<div class="">
				<div>

					<form class="form-horizontal">
						<fieldset>

							<div id="legend" class="">
								<legend class="">当前平台统计数据</legend>
							</div>
							
							<div class="form-group">
								<label for="contact" class="col-sm-2 control-label">当前在线人数：</label>
								<div class="col-sm-10">
									<p class="form-control-static">${loginCount }人</p>
								</div>
							</div>
							
							<div class="form-group">
								<label for="contact" class="col-sm-2 control-label">总注册人数：</label>
								<div class="col-sm-10">
									<p class="form-control-static">${totalRegisterUserCount }人</p>
								</div>
							</div>
							
							<div class="form-group">
								<label for="contact" class="col-sm-2 control-label">总职位数：</label>
								<div class="col-sm-10">
									<p class="form-control-static">${totalJobCount }个</p>
								</div>
							</div>
							
							<div class="form-group">
								<label for="contact" class="col-sm-2 control-label">总公司数：</label>
								<div class="col-sm-10">
									<p class="form-control-static">${totalCompanyCount }个</p>
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
			<script type="text/javascript" src="<c:url value="/plugins/layer/layer.js"/>"></script>
			<script type="text/javascript" src="<c:url value="/js/commons.js"/>"></script>
	</body>

</html>