<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

	<head>
		<meta charset="UTF-8">
		<title>登录</title>
		<link rel="stylesheet" type="text/css" href="<c:url value="/plugins/bootstrap-3.3.5-dist/css/bootstrap-theme.css"/>" />
		<link rel="stylesheet" type="text/css" href="<c:url value="/plugins/bootstrap-3.3.5-dist/css/bootstrap.css"/>" />
		<link rel="stylesheet" type="text/css" href="<c:url value="/plugins/bootstrap-slider/css/bootstrap-slider.css"/>" />
		<link rel="stylesheet" type="text/css" href="<c:url value="/plugins/bootstrap-fileinput/css/fileinput.css"/>" />
		<link rel="stylesheet" type="text/css" href="<c:url value="/css/commons.css"/>"/>
		<link rel="stylesheet" type="text/css" href="<c:url value="/css/visitor/login.css"/>"/>
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
					<li class="active">登录</li>
				</ol>
			</div>
			<div class="">
				<div>

					<form class="form-horizontal" action="<c:url value="/visitor/login"/>" method="post">
					
						<fieldset>

							<div id="legend" class="">
								<legend class="">登录</legend>
							</div>
							
							<div class="form-group">
								<label for="username" class="col-sm-2 control-label">用户名：</label>
								<div class="col-sm-4">
									<input type="text" class="form-control" id="username" name="user.username" placeholder="请输入用户名" value="${username}"></input>
								</div>
							</div>
							
							<div class="form-group">
								<label for="passwd" class="col-sm-2 control-label">密码：</label>
								<div class="col-sm-4">
									<input type="password" class="form-control" id="passwd" name="user.passwd" placeholder="请输入密码"></input>
								</div>
							</div>
							
							<div class="form-group">
								<label for="passwd" class="col-sm-2 control-label">验证码：</label>
								<div class="col-sm-4">
									<img src="<c:url value="/visitor/getAuthCode"/>" alt="" id="authCodeImage"/>
									<input type="text" class="form-control" id="authCode" name="authCode" placeholder="请输入登录验证码"></input>
								</div>
							</div>
							
							<div class="form-group">
								<div class="col-sm-4 col-sm-offset-2">
									<button type="submit" class="btn btn-success" id="loginBtn">登录</button>&nbsp;&nbsp;&nbsp;
									<button type="reset" class="btn btn-success">重置</button>
									<!-- 验证码提示信息 -->
									<input type="hidden" name="authCodeMsg" id="authCodeMsg" value="${authCodeMsg}" />
								</div>
							</div>

						</fieldset>
					</form>

				</div>
				
		<%--引入页脚 --%>
		<%@include file="/WEB-INF/jsp/commons/footer/footer.jspf" %>

		<script type="text/javascript" src="<c:url value="/plugins/jquery/jquery-2.2.3.js"/>"></script>
		<script type="text/javascript" src="<c:url value="/plugins/bootstrap-3.3.5-dist/js/bootstrap.js"/>"></script>
		<script type="text/javascript" src="<c:url value="/plugins/bootstrap-slider/js/bootstrap-slider.js"/>"></script>
		<script type="text/javascript" src="<c:url value="/plugins/bootstrap-fileinput/js/fileinput.js"/>"></script>
		<script type="text/javascript" src="<c:url value="/plugins/layer/layer.js"/>"></script>
		<script type="text/javascript" src="<c:url value="/js/commons.js"/>"></script>
		<script type="text/javascript" src="<c:url value="/js/visitor/login.js"/>"></script>
	</body>

</html>