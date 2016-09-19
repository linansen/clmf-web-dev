<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

	<head>
		<meta charset="utf-8">
		<title>人物对话间</title>
		<link rel="stylesheet" href="${contextPath}/CLMF-frontUI-dev/bootstrap-3.3.4-dist/bootstrap-3.3.4-dist/css/bootstrap.css" />
		<link rel="stylesheet" href="${contextPath}/CLMF-frontUI-dev/css/animate.css" />
		<link rel="stylesheet" href="${contextPath}/CLMF-frontUI-dev/css/style.css" />
		<link rel="stylesheet" href="${contextPath}/CLMF-frontUI-dev/css/cotmer.css" />
		<link rel="stylesheet" href="${contextPath}/CLMF-frontUI-dev/font-awesome-4.3.0/css/font-awesome.css" />

	</head>
	
	<body>
		<div class="container">
			<c:set var="i" value="0"></c:set>
			<c:forEach items="${pageList.list}" var="pl">
				<c:choose>
					<c:when test="${i == 0}">
						<div class="row" style="margin-top: 24px;">
								<div class="col-lg-8 col-md-8">
									<h3 style="text-align: center;">
				                		   <a href="${contextPath}/front_index/findByNewsId/${pl.id}" target="_blank" style="color: #000000;">${pl.new_title}</a>
				                	</h3>
									<p style="line-height: 32px;width: 100%;text-indent:20px;" class="partNews">${pl.news_content}
									</p><a href="${contextPath}/front_index/findByNewsId/${pl.id}" target="_blank" style="color: red; cursor: hand;" class="pull-right">[详细]</a>
								</div>
								
								<div class="col-lg-4 col-md-4">
									<a href="${contextPath}/front_index/findByNewsId/${pl.id}" target="_blank">
										<img src="${pl.news_imgurl}" />
									</a>
								</div>
							</div>
						<c:set var="i" value="1"></c:set>
					</c:when>
					<c:otherwise>
							<div class="row" style="margin-top: 24px;">
								<div class="col-lg-4 col-md-4">
									<a href="${contextPath}/front_index/findByNewsId/${pl.id}" target="_blank"> 
								<img src="${pl.news_imgurl}" />
					
								</div>
								<div class="col-lg-8 col-md-8">
									<h3 style="text-align: center;">
				                		   <a href="${contextPath}/front_index/findByNewsId/${pl.id}" target="_blank" style="color: #000000;">${pl.new_title}</a>
				                	</h3>
									<p style="line-height: 32px;width: 100%;text-indent:20px;" class="partNews">${pl.news_content}
									</p><a href="${contextPath}/front_index/findByNewsId/${pl.id}" target="_blank" style="color: red; cursor: hand;" class="pull-right">[详细]</a>
								</div>
							</div>
						<c:set var="i" value="0"></c:set>
						
					</c:otherwise>
				</c:choose>
			</c:forEach>
				
				
	
			</div>
		</div>

		<!-- Jquery and Bootstap core js files -->
		<script src="http://libs.baidu.com/jquery/2.0.0/jquery.min.js"></script>
		<script src="http://libs.baidu.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>

		<!-- Modernizr javascript -->
		<script type="text/javascript" src="${contextPath}/CLMF-frontUI-dev/plugins/modernizr.js"></script>
		<!-- Isotope javascript -->
		<script type="text/javascript" src="${contextPath}/CLMF-frontUI-dev/plugins/isotope/isotope.pkgd.min.js"></script>
		<!-- Backstretch javascript -->
		<script type="text/javascript" src="${contextPath}/CLMF-frontUI-dev/plugins/jquery.backstretch.min.js"></script>
		<!-- Appear javascript -->
		<script type="text/javascript" src="${contextPath}/CLMF-frontUI-dev/plugins/jquery.appear.js"></script>
		<!-- Initialization of Plugins -->
		<script type="text/javascript" src="${contextPath}/CLMF-frontUI-dev/js/template.js"></script>
		<!-- Custom Scripts -->
		<script type="text/javascript" src="${contextPath}/CLMF-frontUI-dev/js/custom.js"></script>
		<script type="text/javascript" src="${contextPath}/CLMF-frontUI-dev/js/valid.js"></script>

		<script type="text/javascript" src="${contextPath}/CLMF-frontUI-dev/plugins/paginator/paginator.min.js"></script>
		<script type="text/javascript" src="${contextPath}/CLMF-frontUI-dev/js/page/page.js"></script>

	</body>

</html>