<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

	<head>
		<meta charset="utf-8">
		<title>新闻中心</title>
		<link rel="stylesheet" href="${contextPath}/CLMF-frontUI-dev/bootstrap-3.3.4-dist/bootstrap-3.3.4-dist/css/bootstrap.css" />
		<link rel="stylesheet" href="${contextPath}/CLMF-frontUI-dev/css/animate.css" />
		<link rel="stylesheet" href="${contextPath}/CLMF-frontUI-dev/css/style.css" />
		<link rel="stylesheet" href="${contextPath}/CLMF-frontUI-dev/font-awesome-4.3.0/css/font-awesome.css" />
		<link rel="stylesheet" href="${contextPath}/CLMF-frontUI-dev/css/cotmer.css" />
	</head>
	<script type="text/javascript">
		function findByNewsId(id){
			$.post("${contextPath}/front_index/findByNewsId/"+id, function(data){
					$(".modal-title").html(data.news.new_title);
					$(".title").html(data.news.new_title);
					$(".content").html(data.news.news_content);
					//$("#col-md-6 img").attr("src", data.news.news_imgurl);
				});
		
		
		}
		
	
	
	</script>
	<body>
		<div class="row">
			<form action="#">
			<!-- page -->
			<input type="hidden" class="pageIndex" name="pageNumber" value='1'>
			<input type="hidden" class="pageSize" name="pageSize" value='10'>
			<input type="hidden" class="totalPages" name="totalPage" value='10'>
			<!-- page -->
			
			<div class="col-md-11 web-design" style="margin-bottom: 0 !important;">
				<c:forEach items="${pageList.list}" var="pl">
					<div class="panel panel-primary col-md-offset-1 margin-tb-2">
						<div class="panel-heading" style="height:40px !important;">
							<p  class="text-capitalize" onclick="findByNewsId('${pl.id}');" style="cursor: pointer;" data-toggle="modal" data-target="#newsModal">${pl.new_title}</p>
						</div>
		
						<div class="panel-body">
							<p class="text-capitalize">${pl.new_title}</p>
						</div>
					</div>
				</c:forEach>
				<!-- <div class="panel panel-primary col-md-offset-1 margin-tb-2">
					<div class="panel-heading" style="height:40px !important;">
						<p class="text-capitalize" style="cursor: pointer;" data-toggle="modal" data-target="#newsModal">林岸森-中山大学研究生</p>
					</div>
	
					<div class="panel-body panel-primary">
						<p class="text-capitalize">林岸森-中山大学研究生</p>
					</div>
				</div>
				<div class="panel panel-primary col-md-offset-1 margin-tb-2">
					<div class="panel-heading" style="height:40px !important;">
						<p class="text-capitalize" style="cursor: pointer;" data-toggle="modal" data-target="#newsModal">林岸森-中山大学研究生</p>
					</div>
	
					<div class="panel-body panel-primary">
						<p class="text-capitalize">林岸森-中山大学研究生</p>
					</div>
				</div>
				<div class="panel panel-primary col-md-offset-1 margin-tb-2">
					<div class="panel-heading" style="height:40px !important;">
						<p class="text-capitalize" style="cursor: pointer;" data-toggle="modal" data-target="#newsModal">林岸森-中山大学研究生</p>
					</div>
	
					<div class="panel-body panel-primary">
						<p class="text-capitalize">林岸森-中山大学研究生</p>
					</div>
				</div> -->
				<div class="panel panel-primary col-md-offset-1 margin-tb-2">
					<div class="panel-footer">
						<div class="navbar navbar-primary navbar-link">
							<div class="pull-left mt10 ml10">
								展示：
								<select name="select_items">
									<option value="10">10</option>
									<option value="20">20</option>
									<option value="50">50</option>
									<option value="100">100</option>
									<option value="500">500</option>
								</select>
								数据
							</div>
							<div class="pull-left mt10 ml20">
								跳到第
								<input type="number" name="select_guest_name" style="width: 70px !important;"/>
								页
								<button class="btn btn-primary btn-sm">go</button>
							</div>
							<div class="pull-left mt15 ml20">
								<a href="#">升序</a>
								<a href="#">降序</a>
							</div>
							<div class="nav nav-tabs nav-tabs-justified pull-right">
								<ul class="paginator nav nav-tabs nav-tabs-justified pull-right">
								</ul>
							</div>
		
						</div>
		
					</div>
				</div>
			</div>
			</form>
			<!-- 资料下载结束 -->
		</div>
		<!--新闻详细 模态对话框 -->
		<div class="modal fade" id="newsModal" tabindex="-1" role="dialog" aria-labelledby="project-1-label" aria-hidden="true">
			<div class="modal-dialog modal-lg">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
						</button>
						<h4 class="modal-title" id="project-1-label" id="newsTitle"></h4>
					</div>
					<div class="modal-body">
						<h3 class="title"></h3>
						<div class="row">
							<div class="col-md-6">
								<p class="content"></p>
							</div>
							<div class="col-md-6">
								<img src="${contextPath}/CLMF-frontUI-dev/images/portfolio-1.jpg" alt="">
							</div>
						</div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-sm btn-default" data-dismiss="modal">Close</button>
					</div>
				</div>
			</div>
		</div>
	<!-- Modal end -->

		<!-- JavaScript files placed at the end of the document so the pages load faster
		================================================== -->
		<!-- Jquery and Bootstap core js files -->
		<!-- JavaScript files placed at the end of the document so the pages load faster
		================================================== -->
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