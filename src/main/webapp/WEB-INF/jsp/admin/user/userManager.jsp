<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

	<head>
		<meta charset="UTF-8">
		<title>用户管理</title>
		<link rel="stylesheet" type="text/css" href="<c:url value="/plugins/bootstrap-3.3.5-dist/css/bootstrap-theme.css"/>" />
		<link rel="stylesheet" type="text/css" href="<c:url value="/plugins/bootstrap-3.3.5-dist/css/bootstrap.css"/>" />
		<link rel="stylesheet" type="text/css" href="<c:url value="/css/commons.css"/>"/>
		<link rel="stylesheet" type="text/css" href="<c:url value="/css/admin/user/userManager.css"/>"/>
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
					<li class="active">用户管理</li>
				</ol>
			</div>
			<div class="">
				<div>

					<form class="form-horizontal">
						<fieldset>

							<div id="legend" class="">
								<legend class="">用户管理</legend>
							</div>

							<table class="table table-hover" id="userList">
								<thead>
									<tr>
										<th>用户昵称</th>
										<th>账号类型</th>
										<!-- <th>当前简历</th> -->
										<th>注册日期</th>
										<th>操作</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${page.list }" var="user">
										<tr>
											<td>
												<span><img class="avatar" src="<c:url value="/file/showPic?name=${user.avatar }"/>" alt="" /></span>
												<span class="nickname">${user.nickname }</span>
											</td>
											<td>
												<span class="company-name">求职者</span>
											</td>
											<!-- <td><a href="#" class="my-resume">我的简历</a></td> --> 
											<td>${user.createTime }</td>
											<td>
												<div class="btn-group">
													<c:choose>
													
														<c:when test="${user.isFreeze==0 }">
															<button type="button" class="btn btn-success btn-sm" name="freezeBtn" data-location="<c:url value="/admin/freezeUser?id=${user.id }&pageNumber=${page.pageNumber }"/>">封禁</button>
														</c:when>
														<c:when test="${user.isFreeze==1 }">
															<button type="button" class="btn btn-success btn-sm" name="unfreezeBtn" data-location="<c:url value="/admin/undoFreezeUser?id=${user.id }&pageNumber=${page.pageNumber }"/>">激活</button>
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
			<c:set var="paginationLocation" value="/admin/userManagerEntry" />
			<%@include file="/WEB-INF/jsp/commons/pagination/pagination.jspf" %>

			<%--引入页脚 --%>
			<%@include file="/WEB-INF/jsp/commons/footer/footer.jspf" %>

			<script type="text/javascript" src="<c:url value="/plugins/jquery/jquery-2.2.3.js"/>"></script>
			<script type="text/javascript" src="<c:url value="/plugins/bootstrap-3.3.5-dist/js/bootstrap.js"/>"></script>
			<script type="text/javascript" src="<c:url value="/plugins/layer/layer.js"/>"></script>
			<script type="text/javascript" src="<c:url value="/js/commons.js"/>"></script>
			<script type="text/javascript" src="<c:url value="/js/admin/user/userManager.js"/>"></script>
	</body>

</html>