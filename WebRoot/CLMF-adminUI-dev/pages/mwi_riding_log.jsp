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
		<title>乘车记录</title>

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
			<form action="${contextPath}/ride_log" method="post">
			
			<!-- page -->
			<input type="hidden" class="pageIndex" name="pageNumber" value='<c:out value="${pageNumber}" default="1"/>'>
			<input type="hidden" class="pageSize" name="pageSize" value='<c:out value="${pageSize}" default="10"/>'>
			<input type="hidden" class="totalPages" name="totalPage" value='<c:out value="${totalPage}" default="1"/>'>
			<!-- page -->

			<div class="col-lg-12">

				<div class="panel panel-primary">

					<div class="panel-heading">
						<p class="text-capitalize"><span class="fa fa-info-circle fa-2x mr5"></span>乘车记录</p>
					</div>

					<!-- /.panel-heading -->
					<div class="panel-body">

						<table class="table table-striped table-hover" cellspacing="0" width="80%">

							<caption>
								<div class="pull-left" id="query">
										<span>
											日期：
											<input type="text" value="${rideDate}" name="select_date" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd',readOnly:true})" placeholder="请输入登车日期"/>
										</span>
										<span>
											路线：
											<select name="select_route_id" style="width:200px;">
												<c:forEach items="${routeList}" var="routel">
													<option value="${routel.id}">${routel.route_nicName}：${routel.route_content}(${routel.route_name})</option>
												</c:forEach>
											</select>
										</span>
										<span>
											第
											<input type="number" value="${ridSeq}" name="select_rid_seq" style="width: 70px !important;"/>
											次乘车
										</span>
										<span>
											嘉宾姓名：
											<input type="text" value="${guestName}" name="select_guest_name" placeholder="请输入嘉宾姓名" />
										</span>
										<span>
											上车状态：
											<select>
												<option>已上车</option>
												<option>未上车</option>
											</select>
										</span>
										<span>
											<button type="button" onclick="doSearch();" class="btn btn-primary">查询<b class="fa fa-search ml5"></b></button>
										</span>
									
								</div>
							</caption>
							

							<thead>

								<tr>
									<th>序号</th>
									<th>嘉宾姓名</th>
									<th>单位职务</th>
									<th>手机号码</th>
									<th>线路信息</th>
									<th width="15%">工作人员(联系方式)</th>
									<th width="15%">志愿者(联系方式)</th>
									<th>车辆编号</th>
									<th>乘车日期</th>
									<th>第几次乘车</th>
								</tr>

							</thead>
							<tbody>
								<c:forEach items="${pageList.list}" var="ll">
									<tr>
										<td>${ll.id}</td>
										<td>${ll.chinese_name}</td>
										<td>${ll.post}</td>
										<td>${ll.phone}</td>
										<td>${ll.routeContent}</td>
										<td class="staff" width="15%" style="position: absolute;">
											${ll.worker[0].realname}(${ll.worker[0].phone})
											<div class="table-tooltip">
												<c:forEach items="${ll.worker}" var="wl">
													<span>${wl.realname}(${wl.phone})</span>
												</c:forEach>
											</div>
										</td>
										<td class="staff" width="15%" style="position: relative;">
											${ll.surpporter[0].realname}(${ll.surpporter[0].phone})
											<div class="table-tooltip" style="position: absolute;">
												<c:forEach items="${ll.surpporter}" var="sl">
													<span>${sl.realname}(${sl.phone})</span>
												</c:forEach>
											</div>
										</td>
										<td>${ll.car_no}</td>
										<td>${ll.time}</td>
										<td>${ll.count}</td>
									</tr>
								</tbody>
							</c:forEach>
						</table>

					</div>
					<!-- /.panel-body -->

					
					<!-- setAttr("rideDate", rideDate);
					setAttr("routeId", routeId);
					setAttr("ridSeq", ridSeq);
					setAttr("guestName", guestName);
					setAttr("pageNumber", pageNumber);
					setAttr("pageSize", pageSize); -->
					<div class="panel-footer ">
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
										<c:when test="${pageSize == 200}"><option selected="selected" value="200">200</option></c:when>
										<c:otherwise><option value="200">200</option></c:otherwise>
									</c:choose>
									<c:choose>
										<c:when test="${pageSize == 500}"><option selected="selected" value="500">500</option></c:when>
										<c:otherwise><option value="500">500</option></c:otherwise>
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
		
		<script type="text/javascript">
			$(function(){
				alert(document.cookie);
				
			});
			
			function doSearch(){
				var select_date = $("input[name='select_date']").val();
				var select_route_id = $("select[name='select_route_id']").val();
				var select_rid_seq = $("input[name='select_rid_seq']").val();
				if(select_date == "" || select_rid_seq == ""){
					alert("请完整的输入日期和乘车次数！");
					return false;
				} else {
					$("form").submit();
				}
			}
			function pageSizeChange(){
				var pathName = window.document.location.pathname;
				var projectName = pathName.substring(0,pathName.substr(1).indexOf('/')+1);
				var rideDate = $("input[name='select_date']").val();
				var routeId = $("select[name='select_route_id']").val();
				var ridSeq = $("select[name='select_rid_seq']").val();
				var guestName = $("input[name='select_guest_name']").val();
				var pageSize = $("select[name='select_items']").val();
				window.location.href = projectName+"/ride_log?rideDate"+rideDate+"&routeId="+routeId+"&ridSeq"+ridSeq+"&guestName"+guestName;
			}
		</script>

		<!-- Page-Level Demo Scripts - Tables - Use for reference -->
	</body>

</html>
