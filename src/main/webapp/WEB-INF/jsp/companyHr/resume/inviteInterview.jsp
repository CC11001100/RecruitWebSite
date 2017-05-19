<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

	<head>
		<meta charset="UTF-8">
		<title>邀请面试</title>
		<link rel="stylesheet" type="text/css" href="<c:url value="/plugins/bootstrap-3.3.5-dist/css/bootstrap-theme.css"/>" />
		<link rel="stylesheet" type="text/css" href="<c:url value="/plugins/bootstrap-3.3.5-dist/css/bootstrap.css"/>" />
		<link rel="stylesheet" type="text/css" href="<c:url value="/plugins/bootstrap-slider/css/bootstrap-slider.css"/>" />
		<link rel="stylesheet" type="text/css" href="<c:url value="/plugins/bootstrap-fileinput/css/fileinput.css"/>" />
		<link rel="stylesheet" type="text/css" href="<c:url value="/css/commons.css"/>"/>
		<link rel="stylesheet" type="text/css" href="<c:url value="/css/companyHr/resume/inviteInterview.css"/>"/>
	</head>

	<body>

		<div class="container">
			<form class="form-horizontal" method="post" action="<c:url value="/companyHr/inviteInterview?id=${id }"/>" id="inviteInterviewForm">
				<fieldset>
					<div id="legend" class="">
						<legend class="">邀请面试</legend>
					</div>
					<div class="form-group">
						<label for="contact" class="col-sm-4 control-label inviteInterviewTitle">请输入面试邀请信息：</label>
						<div class="col-sm-12">
							<textarea type="text" class="form-control" id="inviteInterviewMsg" name="inviteInterviewMsg" placeholder="请输入面试邀请信息，比如面试时间、地点、联系方式等，字数在3000字以内"></textarea>
						</div>
					</div>
					<div class="form-group">
						<div class="col-sm-4 col-sm-offset-4">
							<button type="submit" class="btn btn-success" name="submitBtn" id="submitBtn">发出面试邀请</button>&nbsp;&nbsp;&nbsp;
							<button type="reset" class="btn btn-success" name="reset" id="reset">重置</button>
						</div>
					</div>
				</fieldset>
			</form>
		</div>

		<script type="text/javascript" src="<c:url value="/plugins/jquery/jquery-2.2.3.js"/>"></script>
		<script type="text/javascript" src="<c:url value="/plugins/bootstrap-3.3.5-dist/js/bootstrap.js"/>"></script>
		<script type="text/javascript" src="<c:url value="/plugins/bootstrap-slider/js/bootstrap-slider.js"/>"></script>
		<script type="text/javascript" src="<c:url value="/plugins/bootstrap-fileinput/js/fileinput.js"/>"></script>
		<script type="text/javascript" src="<c:url value="/plugins/layer/layer.js"/>"></script>
		<script type="text/javascript" src="<c:url value="/js/commons.js"/>"></script>
		<script type="text/javascript" src="<c:url value="/js/companyHr/resume/inviteInterview.js"/>"></script>
	</body>

</html>