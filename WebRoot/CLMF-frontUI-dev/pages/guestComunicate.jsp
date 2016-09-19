<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

	<head>

		<meta charset="utf-8">
		<title>嘉宾社交互访</title>
		<!-- Mobile Meta -->
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<!-- Favicon -->
		<link rel="stylesheet" href="http://apps.bdimg.com/libs/bootstrap/3.3.0/css/bootstrap.min.css">

		<!-- Font Awesome CSS -->
		<link rel="stylesheet" href="${contextPath}/CLMF-frontUI-dev/font-awesome-4.3.0/css/font-awesome.css" />
		<!-- Plugins -->
		<link rel="stylesheet" href="${contextPath}/CLMF-frontUI-dev/css/animations.css">
		<!-- Worthy core CSS file -->
		<link rel="stylesheet" href="${contextPath}/CLMF-frontUI-dev/css/style.css">
		<link rel="stylesheet" href="${contextPath}/CLMF-frontUI-dev/css/cotmer.css">
	</head>

	<body>
		<!-- 社交互访开始 -->
		<div class="row">
			<div class="col-md-offset-1 col-md-10">
				<hr style="line-height: 3px; color: #265A88;margin-top:10px;">
				
				<div class="filters text-left info">
					<ul class="nav nav-justified nav-tabs">
						<li><a href="${contextPath}/invite/getInvite" target="page-wrapper1">收到邀约历史</a>
						</li>
						<li><a href="${contextPath}/invite/sendedInvite" target="page-wrapper1">发出邀约历史</a>
						</li>
						<li><a href="${contextPath}/invite/sendInvite" target="page-wrapper1">发送邀约</a>
						</li>
						<li><a href="${contextPath}/contact/myFriends" target="page-wrapper1">我的联系人</a>
						</li>
						<li><a href="${contextPath}/contact/findFriends" target="page-wrapper1">寻找联系人</a>
						</li>
						<li><a href="${contextPath}/contact/myInfo" target="page-wrapper1">@我的</a>
						</li>
					</ul>
				</div>
				<div id="page-iframe1">
					<iframe id="" src="${contextPath}/invite/getInvite" name="page-wrapper1" width="100%"  style="padding: 0 10px 100px 10px;" scrolling="auto" frameborder="0" seamless></iframe>
				</div>
			</div>
		</div>
		<!-- 社交互访结束 -->
		<script src="${contextPath}/CLMF-frontUI-dev/bootstrap-3.3.4-dist/bootstrap-3.3.4-dist/js/jquery.js"></script>
		<script src="${contextPath}/CLMF-frontUI-dev/bootstrap-3.3.4-dist/bootstrap-3.3.4-dist/js/bootstrap.min.js"></script>
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
		
	</body>

</html>