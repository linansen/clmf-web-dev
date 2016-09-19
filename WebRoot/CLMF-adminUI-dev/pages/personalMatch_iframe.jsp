<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="en">

	<head>

		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<meta name="description" content="">
		<meta name="author" content="">
		<script type="text/javascript">
			
		</script>
		<title>人员分配</title>

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
		<div class="panel panel-primary col-lg-6">
			<form action="${contextPath}/match/toMatchIframe" method="post" name="staff">
			<!-- page -->
			<input type="hidden" class="pageNumber" name="pageNumber" value="<c:out value="${pageNumber}" default="1"/>">
			<input type="hidden" class="pageSize" name="pageSize" value="<c:out value="${pageSize}" default="10"/>">
			<input type="hidden" class="totalPages" name="workerTotalPage" value="<c:out value="${workerTotalPage}" default="1"/>">
			<!-- page -->
			<div class="panel-body">
				<table class="table table-responsive table-hover" id="choseStaff">
					<caption>
						<div class="pull-left" id="query">
							<span>
								姓名：
								<input type="text" name="w.realName" value="${wRealName}" placeholder="请输入工作人员姓名" />
							</span>
							<span>
								工作组：
								<input type="text" name="w.groupName" value="${wGroupName}" placeholder="请输入工作组名称" />
							</span>
							<span>
								分配状态：
								<select name="w.workingStatus">
									<option value="">全部</option>
									<option value="1">已分配</option>
									<option value="0">未分配</option>
								</select>
							</span>
							<span>
								<button type="submit" class="btn btn-primary">查询<b class="fa fa-search ml5"></b></button>
							</span>
						</div>
					</caption>
					<thead>
						<tr>
							<th><label>全选<input type="checkbox" class="checkAll"></label></th>
							<th>序号</th>
							<th>姓名</th>
							<th>单位职务</th>
							<th>工作组</th>
							<th>分配状态</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${workerPage.list}" var="wpl" varStatus="s">
							<tr>
								<td><input name="w.ids" value="${wpl.workerId}" type="checkbox"></td>
								<td>${s.index+1}</td>
								<td class="chose_name">${wpl.realname}</td>
								<td>${wpl.post}</td>
								<td>${wpl.work_group}</td>
								<c:choose>
									<c:when test="${wpl.working_state == 1}"><td>已分配</td></c:when>
									<c:otherwise><td>未分配</td></c:otherwise>
								</c:choose>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
			<!-- /.panel-body -->

			<div class="panel-footer" style="padding:0 !important;">
				<div class="navbar navbar-default navbar-link">
					<div class="pull-left mt25 ml10">
						展示：
						<select class="pageSizeSelect" name="select_items">
							<c:choose>
								<c:when test="${pageSize == 10}"><option selected="selected" value="10">10</option></c:when>
								<c:otherwise><option value="10">10</option></c:otherwise>
							</c:choose>
							<c:choose>
								<c:when test="${pageSize == 20}"><option selected="selected" value="20">20</option></c:when>
								<c:otherwise><option value="20">20</option></c:otherwise>
							</c:choose>
							<c:choose>
								<c:when test="${pageSize == 50}"><option selected="selected" value="50">50</option></c:when>
								<c:otherwise><option value="50">50</option></c:otherwise>
							</c:choose>
							<c:choose>
								<c:when test="${pageSize == 100}"><option selected="selected" value="100">100</option></c:when>
								<c:otherwise><option value="100">100</option></c:otherwise>
							</c:choose>
							<c:choose>
								<c:when test="${pageSize == 500}"><option selected="selected" value="500">500</option></c:when>
								<c:otherwise><option value="500">500</option></c:otherwise>
							</c:choose>
						</select>
						数据
					</div>
					<div class="pull-left mt25 ml20">
						跳到第
						<input type="number" name="select_guest_name" style="width: 70px !important;" value="${pageNumber}"/>
						页
						<button class="btn btn-primary btn-sm">go</button>
					</div>
					<div class="nav nav-tabs nav-tabs-justified pull-right">
						<ul class="paginator nav nav-tabs nav-tabs-justified pull-right">
						</ul>
					</div>

				</div>

			</div>
			</form>

		</div>
		<!-- /.panel -->
		<div class="panel panel-primary col-lg-6">
			<form action="${contextPath}/match/toMatchIframe" method="post">
			<!-- page -->
			<input type="hidden" class="pageNumber" name="pageNumber" value="<c:out value="${pageNumber}" default="1"/>">
			<input type="hidden" class="pageSize" name="pageSize" value="<c:out value="${pageSize}" default="10"/>">
			<input type="hidden" class="totalPages" name="workerTotalPage" value="<c:out value="${supporterTotalPage}" default="1"/>">
			<!-- page -->
			<!-- /.panel-heading -->
			<div class="panel-body">
				<table class="table table-responsive table-hover" id="choseSuppoter">
					<caption>
						<div class="pull-left" id="query">
							<span>
								姓名：
								<input type="text" name="s.realName" value="${sRealName}" placeholder="请输入志愿者姓名" />
							</span>
							<span>
								工作组：
								<input type="text" name="s.groupName" value="${sGroupName}" placeholder="请输入工作组" />
							</span>
							<span>
								分配状态：
								<select name="s.workingStatus">
									<option value="">全部</option>
									<option value="1">已分配</option>
									<option value="0">未分配</option>
								</select>
							</span>
							<span>
								<button type="submit" class="btn btn-primary">查询<b class="fa fa-search ml5"></b></button>
							</span>
						</div>
					</caption>
					<thead>
						<tr>
							<th><label>全选<input type="checkbox" class="checkAll"></label></th>
							<th>序号</th>
							<th>姓名</th>
							<th>大学</th>
							<th>工作组</th>
							<th>分配状态</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${supporterPage.list}" var="spl" varStatus="s" >
							<tr>
								<td><input name="s.ids" value="${spl.workerId}" type="checkbox"></td>
								<td>${s.index+1}</td>
								<td class="chose_name">${spl.realname}</td>
								<td>${spl.unit}</td>
								<td>${spl.work_group}</td>
								<c:choose>
									<c:when test="${spl.working_state == 1}"><td>已分配</td></c:when>
									<c:otherwise><td>未分配</td></c:otherwise>
								</c:choose>
							</tr>
						</c:forEach>
					</tbody>
				</table>

			</div>
			<!-- /.panel-body -->

			<div class="panel-footer" style="padding:0 !important;">
		
				<div class="navbar navbar-default navbar-link">
					<div class="pull-left mt25 ml10">
						展示：
						<select class="pageSizeSelect" name="select_items">
							<c:choose>
								<c:when test="${pageSize == 10}"><option selected="selected" value="10">10</option></c:when>
								<c:otherwise><option value="10">10</option></c:otherwise>
							</c:choose>
							<c:choose>
								<c:when test="${pageSize == 20}"><option selected="selected" value="20">20</option></c:when>
								<c:otherwise><option value="20">20</option></c:otherwise>
							</c:choose>
							<c:choose>
								<c:when test="${pageSize == 50}"><option selected="selected" value="50">50</option></c:when>
								<c:otherwise><option value="50">50</option></c:otherwise>
							</c:choose>
							<c:choose>
								<c:when test="${pageSize == 100}"><option selected="selected" value="100">100</option></c:when>
								<c:otherwise><option value="100">100</option></c:otherwise>
							</c:choose>
							<c:choose>
								<c:when test="${pageSize == 500}"><option selected="selected" value="500">500</option></c:when>
								<c:otherwise><option value="500">500</option></c:otherwise>
							</c:choose>
						</select>
						数据
					</div>
					<div class="pull-left mt25 ml20">
						跳到第
						<input type="number" name="select_guest_name" style="width: 70px !important;" value="${pageNumber}"/>
						页
						<button class="btn btn-primary btn-sm">go</button>
					</div>
					<div class="nav nav-tabs nav-tabs-justified pull-right">
						<ul class="paginator nav nav-tabs nav-tabs-justified pull-right">
						</ul>
					</div>

				</div>

			</div>
			</form>

		</div>
		<div class="clearfix"></div>
		<!-- /.row -->
		
		<!-- /#page-wrapper -->
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
