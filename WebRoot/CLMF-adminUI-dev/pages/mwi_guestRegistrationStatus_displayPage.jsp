<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

	<head>

		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<meta name="description" content="">
		<meta name="author" content="">

		<title>嘉宾报到状态显示页面</title>

		<!-- Bootstrap Core CSS -->
		<link href="${contextPath}/CLMF-adminUI-dev/bower_components/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
		
		<!-- MetisMenu CSS -->
		<link href="${contextPath}/CLMF-adminUI-dev/bower_components/metisMenu/dist/metisMenu.min.css" rel="stylesheet">

		<!-- Custom CSS -->
		<link href="${contextPath}/CLMF-adminUI-dev/dist/css/sb-admin-2.css" rel="stylesheet">

		<!-- Custom Fonts -->
		<link href="${contextPath}/CLMF-adminUI-dev/bower_components/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">

		<link href="${contextPath}/CLMF-adminUI-dev/dist/css/mwi_tables/index.css" rel="stylesheet" type="text/css">
	</head>

	<body>

		<div class="row-header">
			<div class="col-lg-offset-2 col-lg-6">
				<h1 class="page-header"></h1>
			</div>
			<!-- /.col-lg-12 -->
		</div>

		<!-- /.row -->
		<div class="row-body">
		<form action="${contextPath}/checkArrive/receptionList" name="_form">
			<!-- page -->
			<input type="hidden" class="pageIndex" name="currentPage" value="${pageList.pageNumber}">
			<input type="hidden" class="pageSize" name="currentSize" value="${pageList.pageSize}">
			<input type="hidden" class="totalPages" name="totalPage" value="${pageList.totalPage}">
			<!-- page -->

			<div class="col-lg-12">

				<div class="panel panel-primary">

					<div class="panel-heading">
						<p class="text-capitalize"><span class="fa fa-info-circle fa-2x mr5"></span>嘉宾报到状态显示</p>
					</div>
					<!-- /.panel-heading -->
					<div class="panel-body">
						<table class="table table-responsive table-hover table-striped">
							<caption>
								
								<div class="pull-left" id="query">
									<span>
										姓名：
										<input type="text" name="chineseName" placeholder="请输入嘉宾名" value="${chineseName}"/>
									</span>
									<span>
										外文姓名：
										<input type="text" name="englishName" placeholder="请输入外文姓名" value="${englishName}"/>
									</span>
									<span>
										身份证/护照号：
										<input type="text" name="passportNo" placeholder="请输入嘉宾身份证号" value="${passportNo}" class="width150"/>
									</span>
									<span>
										手机号码：
										<input type="text" name="mobile" placeholder="请输入嘉宾名" value="${mobile}"/>
									</span>
									<span>
										抵达日期：
										<input type="text" name="arrivalDate" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd',readOnly:true})" value="${arrivalDate}"/>
									</span>
									<span>
										<button type="submit" class="btn btn-primary">查询<b class="fa fa-search ml5"></b></button>
										<button type="button" class="btn btn-primary" id="ad_query_button">高级查询</button>
									</span>
									<span class="pull-right">
										<a href="${contextPath}/checkArrive/getGuestApi" class="btn btn-primary mr5">嘉宾报到</a>
									</span>
								</div>
								<div class="pull-left" id="ad_query">
									<span>
										抵达时间：
										<input type="text" name="arrivalTime" onfocus="WdatePicker({dateFmt:'HH:mm:00',readOnly:true})" value="${arrivalTime}"/>
									</span>
									<span>
										抵达站点：
										<input type="text" name="arrivalStation" value="${arrivalStation}"/>
									</span>
									<span>
										国籍：
										<input type="text" name="national" value="${national}"/>
										<!-- <select name="national">
											<option value="China">中国</option>
											<option value="China">中国</option>
											<option value="China">中国</option>
											<option value="China">中国</option>
											<option value="China">中国</option>
											<option value="China">中国</option>
											<option value="China">中国</option>
											<option value="China">中国</option>
											<option value="China">中国</option>
										</select> -->
									</span>
									<span>
										单位职务：
										<input type="text" name="post" placeholder="请输入嘉宾名" value="${post}"/>
									</span>
									<span>
										电子邮件：
										<input type="text" name="email" placeholder="请输入电子邮件" value="${email}"/>
									</span>
									<span>
										性别：
										<select name="sex">
											<c:choose>
												<c:when test="${sex == 1}">
													<option value="1" selected="selected">男</option>
													<option value="2">女</option>
												</c:when>
												<c:when test="${sex == 2}">
													<option value="1">男</option>
													<option value="2" selected="selected">女</option>
												</c:when>
												<c:otherwise>
													<option value="">请选择性别</option>
													<option value="1">男</option>
													<option value="2">女</option>
												</c:otherwise>
											</c:choose>
										</select>
									</span>
								</div>
								
							</caption>
							<thead>
								<tr>
									<th>序号</th>
									<th>嘉宾姓名</th>
									<th>外文姓名</th>
									<th>国籍</th>
									<th>身份证号/护照号</th>
									<th>单位职务</th>
									<th>抵达日期</th>
									<th>抵达时间</th>
									<th>抵达站点</th>
									<th>报到状态</th>
									<th>证件状态</th>
									<th>操作</th>
								</tr>
							</thead>

							<tbody>
								<c:forEach items="${pageList.list}" var="li" varStatus="i">
								<tr class="red-text">
									<td>${i.index + 1}</td>
									<td>${li.chineseName}</td>
									<td>${li.englishName}</td>
									<td>${li.national}</td>
									<td>${li.passportNo}</td>
									<td>${li.post}</td>
									<td>${li.arrivalDate}</td>
									<td>${li.arrivalTime}</td>
									<td>${li.arrivalStation}</td>
									<td>
										<c:choose>
											<c:when test="${li.arrivalStatus == 0}">已报到</c:when>
											<c:when test="${li.arrivalStatus == 1}">未抵达</c:when>
											<c:otherwise>已抵达</c:otherwise>
										</c:choose>
									</td>
									<td>
										<c:choose>
											<c:when test="${li.cardStatus == 0}">未激活</c:when>
											<c:otherwise>已激活</c:otherwise>
										</c:choose>
									</td>
									<td>
										<!-- mwi_guestRegistration_page.html?name=林岸森 -->
										<a href="${contextPath}/checkArrive/receptionGuestInfor?guestId=${li.id}" class="btn btn-primary">嘉宾报到</a>
									</td>
								</tr>	
								</c:forEach>
							</tbody>

						</table>

					</div>
					<!-- /.panel-body -->

					<div class="panel-footer ">
						<div class="navbar navbar-default navbar-link">
							<div class="pull-left mt25 ml10">
								展示：
								<select class="pageSizeSelect">
									<c:choose>
										<c:when test="${pageList.pageSize == 10}"><option selected="selected" value="10">10</option></c:when>
										<c:otherwise><option value="10">10</option></c:otherwise>
									</c:choose>
									<c:choose>
										<c:when test="${pageList.pageSize == 25}"><option selected="selected" value="25">25</option></c:when>
										<c:otherwise><option value="25">25</option></c:otherwise>
									</c:choose>
									<c:choose>
										<c:when test="${pageList.pageSize == 100}"><option selected="selected" value="100">100</option></c:when>
										<c:otherwise><option value="100">100</option></c:otherwise>
									</c:choose>
								</select>
								数据
							</div>
							<div class="pull-left mt30 ml20">
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
				<!-- /.panel -->
			</div>
			</form>
			<!-- /.col-lg-12 -->
		</div>
		<!-- /.row -->

		<!-- jQuery -->
		<script src="${contextPath}/CLMF-adminUI-dev/bower_components/jquery/dist/jquery.min.js"></script>

		<!-- Bootstrap Core JavaScript -->
		<script src="${contextPath}/CLMF-adminUI-dev/bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
		
		<script src="${contextPath}/CLMF-adminUI-dev/bower_components/My97DatePicker/WdatePicker.js"></script>
		<!-- Metis Menu Plugin JavaScript -->
		<script src="${contextPath}/CLMF-adminUI-dev/bower_components/metisMenu/dist/metisMenu.min.js"></script>

		<!-- Custom Theme JavaScript -->
		<script src="${contextPath}/CLMF-adminUI-dev/dist/js/sb-admin-2.js"></script>

		<script src="${contextPath}/CLMF-adminUI-dev/dist/js/mwi_tables/index.js"></script>
		
		<!-- page -->
		<script src="${contextPath}/CLMF-adminUI-dev/bower_components/paginator/paginator.min.js"></script>

		<script src="${contextPath}/CLMF-adminUI-dev/dist/js/page/page.js"></script>
		<!-- Page-Level Demo Scripts - Tables - Use for reference -->
	</body>

</html>