<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

	<head>
		<meta charset="UTF-8">
		<title>我创建的公司</title>
		<link rel="stylesheet" type="text/css" href="<c:url value="/plugins/bootstrap-3.3.5-dist/css/bootstrap-theme.css"/>" />
		<link rel="stylesheet" type="text/css" href="<c:url value="/plugins/bootstrap-3.3.5-dist/css/bootstrap.css"/>" />
		<link rel="stylesheet" type="text/css" href="<c:url value="/plugins/bootstrap-slider/css/bootstrap-slider.css"/>" />
		<link rel="stylesheet" type="text/css" href="<c:url value="/plugins/bootstrap-fileinput/css/fileinput.css"/>" />
		<link rel="stylesheet" type="text/css" href="<c:url value="/css/commons.css"/>"/>
		<link rel="stylesheet" type="text/css" href="<c:url value="/css/companyHr/company/myCompany.css"/>"/>
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
					<li class="active">我创建的公司</li>
				</ol>
			</div>
			<div class="">
				<div>

					<form class="form-horizontal">
						<fieldset>

							<div id="legend" class="">
								<legend class="">我创建的公司</legend>
							</div>

							<table class="table table-hover" id="companyList">
								<thead>
									<tr>
										<th>公司名称</th>
										<th>公司规模</th>
										<th>累计发布职位数</th>
										<th>公司描述</th>
										<th>操作</th>
									</tr>
								</thead>
								<tbody>
									
									<c:forEach items="${page.list}" var="item">
										<tr>
											<td>
												<a target="_blank" href="<c:url value="/common/companyDetailsEntry?id=${item.id}"/>" class="job-name">${item.briefName}</a>
											</td>
											<td>
												<span class="company-name">${item.personScaleLow}~${item.personScaleHigh}人</span>
											</td>
											<td>${item.jobCount}</td>
											<td>${item.briefDescContent}</td>
											<td>
												<div class="btn-group">
													<a target="_blank" href="<c:url value="/companyHr/editCompanyEntry?id=${item.id}"/>" class="btn btn-success btn-sm" id="editBtn">编辑</a>
													<button type="button" class="btn btn-success btn-sm" name="delBtn" data-location="<c:url value="/companyHr/deleteCompany?id=${item.id}&pageNumber=${page.pageNumber }"/>">删除</button>
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
			<c:set var="paginationLocation" value="/companyHr/myCompanyEntry" />
			<%@include file="/WEB-INF/jsp/commons/pagination/pagination.jspf" %>

			<%--引入页脚 --%>
			<%@include file="/WEB-INF/jsp/commons/footer/footer.jspf" %>

		<script type="text/javascript" src="<c:url value="/plugins/jquery/jquery-2.2.3.js"/>"></script>
		<script type="text/javascript" src="<c:url value="/plugins/bootstrap-3.3.5-dist/js/bootstrap.js"/>"></script>
		<script type="text/javascript" src="<c:url value="/plugins/bootstrap-slider/js/bootstrap-slider.js"/>"></script>
		<script type="text/javascript" src="<c:url value="/plugins/bootstrap-fileinput/js/fileinput.js"/>"></script>
		<script type="text/javascript" src="<c:url value="/plugins/layer/layer.js"/>"></script>
		<script type="text/javascript" src="<c:url value="/js/commons.js"/>"></script>
		<script type="text/javascript" src="<c:url value="/js/companyHr/company/myCompany.js"/>"></script>
	</body>

</html>