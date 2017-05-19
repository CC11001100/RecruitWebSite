<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta charset="UTF-8">
		<title>首页</title>
		<link rel="stylesheet" type="text/css" href="plugins/bootstrap-3.3.5-dist/css/bootstrap-theme.css" />
		<link rel="stylesheet" type="text/css" href="plugins/bootstrap-3.3.5-dist/css/bootstrap.css" />
		<link rel="stylesheet" type="text/css" href="plugins/bootstrap-slider/css/bootstrap-slider.css" />
		<link rel="stylesheet" type="text/css" href="plugins/bootstrap-fileinput/css/fileinput.css" />
		<link rel="stylesheet" type="text/css" href="css/commons.css" />
	</head>

	<body>

		<%--引入导航栏 --%>
		<c:set var="active" value="1"></c:set>
		<%@include file="/WEB-INF/jsp/commons/nav/nav.jspf" %>

		<div class="container">
			<div class="">

				<!--<div class="jumbotron">
					<h1>Hello, world!</h1>
					<p>...</p>
					<p>
						<a class="btn btn-primary btn-lg" href="#" role="button">职位列表>></a>
					</p>
				</div>-->
				<div id="myCarousel" class="carousel slide">
					<!-- 轮播（Carousel）指标 -->
					<ol class="carousel-indicators">
						<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
						<li data-target="#myCarousel" data-slide-to="1"></li>
						<li data-target="#myCarousel" data-slide-to="2"></li>
					</ol>
					<!-- 轮播（Carousel）项目 -->
					<div class="carousel-inner">
						<div class="item active">
							<img src="img/slide1.jpg" alt="First slide">
						</div>
						<div class="item">
							<img src="img/slide2.jpg" alt="Second slide">
						</div>
						<div class="item">
							<img src="img/slide3.jpg" alt="Third slide">
						</div>
					</div>
					<!-- 轮播（Carousel）导航 -->
					<a class="carousel-control left" href="#myCarousel" data-slide="prev">&lsaquo;</a>
					<a class="carousel-control right" href="#myCarousel" data-slide="next">&rsaquo;</a>
				</div>

			</div>

			<%--引入页脚 --%>
			<%@include file="/WEB-INF/jsp/commons/footer/footer.jspf" %>

			<script type="text/javascript" src="plugins/jquery/jquery-2.2.3.js"></script>
			<script type="text/javascript" src="plugins/bootstrap-3.3.5-dist/js/bootstrap.js"></script>
			<script type="text/javascript" src="plugins/bootstrap-slider/js/bootstrap-slider.js"></script>
			<script type="text/javascript" src="plugins/layer/layer.js"></script>
			<script type="text/javascript" src="plugins/bootstrap-fileinput/js/fileinput.js"></script>
			<script type="text/javascript" src="js/commons.js"></script>
	</body>

</html>