<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

	<head>
		<meta charset="UTF-8">
		<title>修改我的资料</title>
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
						<a href="<c:url value="/common/jobListEntry"/>">我是注册用户</a>
					</li>
					<li class="active">修改我的资料</li>
				</ol>
			</div>
			<div class="">
				<div>

					<form class="form-horizontal" method="post" enctype="multipart/form-data" action="<c:url value="/common/changeUserInfo"/>">
						<fieldset>

							<div id="legend" class="">
								<legend class="">修改我的资料</legend>
							</div>

							<div class="form-group">
								<label for="passwd" class="col-sm-2 control-label">昵称：</label>
								<div class="col-sm-4">
									<input type="text" class="form-control" id="nickname" name="nickname" placeholder="请输入昵称，20字以内" value="${user.nickname }"></input>
								</div>
							</div>

							<div class="form-group">
								<label for="avatar" class="col-sm-2 control-label">上传头像：</label>
								<div class="col-sm-4">
									<input type="file" name="avatar" id="avatar" value="" placeholder="请上传公司logo" />
								</div>
							</div>

							<div class="form-group">
								<div class="col-sm-4 col-sm-offset-2">
									<button type="submit" class="btn btn-success" id="changeUserInfoBtn">修改我的资料</button>&nbsp;&nbsp;&nbsp;
									<button type="reset" class="btn btn-success">重置</button>
								</div>
							</div>

						</fieldset>
					</form>

				</div>
				<div>
					<form class="form-horizontal" method="post" action="<c:url value="/common/changePasswd"/>">
						<fieldset>

							<div id="legend" class="">
								<legend class="">修改密码</legend>
							</div>
							
							<div class="form-group">
								<label for="passwd" class="col-sm-2 control-label">旧密码：</label>
								<div class="col-sm-4">
									<input type="password" class="form-control" id="oldPasswd" name="oldPasswd" placeholder="请输入密码，20个字符以内"></input>
								</div>
							</div>
							
							<div class="form-group">
								<label for="passwd" class="col-sm-2 control-label">新密码：</label>
								<div class="col-sm-4">
									<input type="password" class="form-control" id="newPasswd" name="newPasswd" placeholder="请输入密码，20个字符以内"></input>
								</div>
							</div>
							
							<div class="form-group">
								<label for="passwd" class="col-sm-2 control-label">重复新密码：</label>
								<div class="col-sm-4">
									<input type="password" class="form-control" id="confirmNewPasswd" name="confirmNewPasswd" placeholder="请输入密码，20个字符以内"></input>
								</div>
							</div>

							<div class="form-group">
								<div class="col-sm-4 col-sm-offset-2">
									<button type="submit" class="btn btn-success" id="changePasswdBtn">修改密码</button>&nbsp;&nbsp;&nbsp;
									<button type="reset" class="btn btn-success">重置</button>
									<input type="hidden" name="tipMsg" id="tipMsg" value="${tipMsg }"/>
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
		<script type="text/javascript" src="<c:url value="/js/visitor/register.js"/>"></script>
		<script type="text/javascript" src="<c:url value="/js/commons/userInfo.js"/>"></script>
		
	</body>

</html>