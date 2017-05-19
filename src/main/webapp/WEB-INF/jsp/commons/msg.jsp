<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

	<head>
		<meta charset="UTF-8">
		<title>我收到的消息</title>
		<link rel="stylesheet" type="text/css" href="<c:url value="/plugins/bootstrap-3.3.5-dist/css/bootstrap-theme.css"/>" />
		<link rel="stylesheet" type="text/css" href="<c:url value="/plugins/bootstrap-3.3.5-dist/css/bootstrap.css"/>" />
		<link rel="stylesheet" type="text/css" href="<c:url value="/css/commons.css"/>"/>
		<link rel="stylesheet" type="text/css" href="<c:url value="/css/commons/msg.css"/>"/>
	</head>

	<body>

		<%--引入导航栏 --%>
		<c:set var="active" value="3"/>
		<%@include file="/WEB-INF/jsp/commons/nav/nav.jspf" %>

		<div class="container">
			<div class="">
				<h4>我收到的消息：</h4></div>
			<div>
				<ul class="list-group">
					<c:forEach items="${page.list }" var="msg">
						<li class="list-group-item">
							<div>
								<c:choose>
									<c:when test="${msg.isHaveRead==1 }"><span class="have-read"></span></c:when>
									<c:when test="${msg.isHaveRead==0 }"><span class="unread"></span></c:when>
								</c:choose>
								<span class="msg-content" data-location="<c:url value="/common/readMsg?id=${msg.id }"/>">${msg.msgContent }</span>
							</div>
							<div>
								<span class="receive-time">${msg.createTime }</span>
							</div>
						</li>
					</c:forEach>
				</ul>
			</div>
		</div>
		
		<!-- 引入分页 -->
		<c:set var="paginationLocation" value="/common/msgListEntry" />
		<%@include file="/WEB-INF/jsp/commons/pagination/pagination.jspf" %>

		<%--引入页脚 --%>
		<%@include file="/WEB-INF/jsp/commons/footer/footer.jspf" %>

		<script type="text/javascript" src="<c:url value="/plugins/jquery/jquery-2.2.3.js"/>"></script>
		<script type="text/javascript" src="<c:url value="/plugins/bootstrap-3.3.5-dist/js/bootstrap.js"/>"></script>
		<script type="text/javascript" src="<c:url value="/plugins/layer/layer.js"/>"></script>
		<script type="text/javascript" src="<c:url value="/js/commons.js"/>"></script>
		<script type="text/javascript" src="<c:url value="/js/commons/msg.js"/>"></script>
	</body>

</html>