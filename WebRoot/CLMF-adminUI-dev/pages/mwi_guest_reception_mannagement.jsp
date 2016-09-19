<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html lang="en">

	<head>

		<meta charset="utf-8">

		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1">

		<meta name="description" content="">
		<meta name="author" content="">

		<title>mwi接待管理之接送管理</title>
		<!-- Bootstrap Core CSS -->
		<link href="${contextPath}/CLMF-adminUI-dev/bower_components/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
		<!-- MetisMenu CSS -->
		<link href="${contextPath}/CLMF-adminUI-dev/bower_components/metisMenu/dist/metisMenu.min.css" rel="stylesheet">
		<!-- Custom CSS -->
		<link href="../dist/css/sb-admin-2.css" rel="stylesheet">
		<!-- Custom Fonts -->
		<link href="${contextPath}/CLMF-adminUI-dev/bower_components/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
		
		<link href="${contextPath}/CLMF-adminUI-dev/dist/css/mwi_tables/index.css" rel="stylesheet" type="text/css">
	</head>

	<body>

		<div class="row-header">
			<div class="col-lg-12">
				<h1 class="page-header"></h1>
			</div>
			<!-- /.col-lg-12 -->
		</div>

		<!-- /.row -->
		<div class="row-body">
			<div class="col-lg-12">
				<div class="panel panel-primary">
					<div class="panel-heading">
						<h4>接送管理</h4>
					</div>
					<div class="panel-body">
						<ul id="myTab" class="nav nav-pills">
							<c:choose>
								<c:when test="${flag == 1}">
									<li class="active">
								</c:when>
								<c:otherwise>
									<li >
								</c:otherwise>
							</c:choose>
								<a href="${contextPath}/transfer?flag=1"> 抵达信息</a>
								<input hidden="hidden" value="${flag}" id="flag" />
							</li>
							
							<c:choose>
								<c:when test="${flag == 2}">
									<li class="active">
								</c:when>
								<c:otherwise>
									<li >
								</c:otherwise>
							</c:choose>
								<a href="${contextPath}/transfer?flag=2">离开信息</a>
							</li>
						</ul>
						<div id="myTabContent" class="tab-content">
							<c:choose>
								<c:when test="${flag == 1}">
									<div class="tab-pane fade in active" id="home">
								</c:when>
								<c:otherwise>
									<div class="tab-pane fade in" id="home">
								</c:otherwise>
							</c:choose>
							
								<div class="panel panel-default">
									<div class="panel-body">
										<table class="table table-striped table-hover table-responsive">
											<form action="${contextPath}/transfer?flag=1" method="post">
												<caption>
													<div class="pull-left" id="query">
														<span>
															站点：
															<input type="text" name="arrivalStation" value="${arrivalStation}" placeholder="请输入站点" />
														</span>
														<span>
															抵达日期：
															<input type="text" name="arrivalDate" value="${arrivalDate}" placeholder="请输入抵达日期" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd',readOnly:true})"/>
														</span>
														<span>
															抵达时间：
															<input type="text" name="arrivalTime" value="${arrivalTime}" placeholder="请输入抵达时间" onfocus="WdatePicker({dateFmt:'HH:mm:00',readOnly:true})"/>
														</span>
														<span>
															班次：
															<input type="text" name="arrivalShiftNo" value="${arrivalShiftNo}" placeholder="请输入班次" />
														</span>
														<span>
															嘉宾姓名：
															<input type="text" name="chineseName" value="${chineseName}" placeholder="请输入嘉宾姓名" />
														</span>
														<span>
															<button class="btn btn-primary">查询<b class="fa fa-search ml5"></b></button>
														</span>
														<span>
															<label>记录总数：<b class="red-text">${count}</b>条</label>
														</span>
													</div>
												</caption>
											</form>
											<thead>
												<tr>
													<th>站点</th>
													<th>日期</th>
													<th>班次</th>
													<th>抵达时间</th>
													<th>嘉宾名字</th>
													<th>嘉宾职位</th>
													<th width="15%">工作人员(联系方式)</th>
													<th width="15%">志愿者(联系方式)</th>
													<th>备注</th>
												</tr>
											</thead>
											<tbody>
												<c:forEach items="${guestPage.list}" var="gpl">
													<tr>
														<td>${gpl.arrival_station}</td>
														<td>${gpl.arrival_date}</td>
														<td>${gpl.arrival_shift_no}</td>
														<td>${gpl.arrival_time}</td>
														<td>${gpl.chinese_name}</td>
														<td>${gpl.post}</td>
														<td class="staff" width="15%" style="position: absolute;">
															${gpl.workerList[0].realname}(${gpl.workerList[0].phone})
															<div class="table-tooltip">
																<c:forEach items="${gpl.workerList}" var="gplwl">
																	<span>${gplwl.realname}(${gplwl.phone})</span>
																</c:forEach>
															</div>
														</td>
														<td class="staff" width="15%" style="position: relative;">
															${gpl.supporterList[0].realname}(${gpl.supporterList[0].phone})
															<div class="table-tooltip" style="position: absolute;">
																<c:forEach items="${gpl.supporterList}" var="gplsl">
																	<span>${gplsl.realname}(${gplsl.phone})</span>
																</c:forEach>
															</div>
														</td>
														<td>
															<button class="btn btn-sm btn-primary" data-toggle="modal" data-target="#chose_principle${gpl.guestId}">选择接待标准</button>
															<button class="btn btn-sm btn-success" data-toggle="modal" data-target="#edit_arriveTime">行程信息更新</button>
															<form action="${contextPath}/transfer/setGuestReceptionStand/${gpl.guestId}" method="post">
																<div id="chose_principle${gpl.guestId}" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
																	<div class="modal-dialog">
																		<div class="modal-content">
																			<div class="modal-header" style="background-color: rgba(30,40,80,0.8); height: 50px;">
																				<h5 class="modal-title pull-left white-text" id="myModalLabel">接待标准选择</h5>
																				<div class="pull-right btn-group-sm">
																					<button class="btn btn-danger">保存<span class="fa fa-chain"></span>
																					</button>
																					<button class="btn btn-warning" data-dismiss="modal">关闭<span class="fa fa-power-off"></span>
																					</button>
																				</div>
																			</div>
																			<div class="add-guest-kind">
																				<div>
																					<span>
																						接待标准：
																						<c:forEach items="${receptionList}" var="rcpl" varStatus="s">
																							<a class="btn btn-default principle"><label><input name="receptionId" value="${rcpl.id}" type="checkbox">${rcpl.stand_name}</label></a>
																						</c:forEach>
																					</span>
																				</div>
																			</div>
																		</div>
																		<!-- /.modal-content -->
																	</div>
																</div>
															</form>
														</td>
													</tr>
												</c:forEach>
											</tbody>
										</table>
									</div>
								
									<div class="panel-footer ">
						
										<div class="navbar navbar-default navbar-link">
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
											<ul class="nav nav-tabs nav-tabs-justified pull-right">
												<li class="disabled"><a href="#">Previous</a>
												</li>
												<li class="active"><a href="#">1</a>
												</li>
												<li><a href="#">2</a>
												</li>
												<li><a href="#">3</a>
												</li>
												<li><a href="#">4</a>
												</li>
												<li><a href="#">5</a>
												</li>
												<li><a href="#">Next</a>
												</li>
											</ul>
				
										</div>
				
									</div>
								</div>

							</div>
							<c:choose>
								<c:when test="${flag == 2}">
									<div class="tab-pane fade in active" id="ios">
								</c:when>
								<c:otherwise>
									<div class="tab-pane fade in" id="ios">
								</c:otherwise>
							</c:choose>
								<div class="panel panel-default">
									<div class="panel-title">
									</div>
									<div class="panel-body">
										<table class="table table-striped table-hover table-responsive">
											<form action="${contextPath}/transfer?flag=2" method="post">
												<caption>
													<div class="pull-left" id="query">
														<span>
															站点：
															<input type="text" name="leaveStation" value="${leaveStation}" placeholder="请输入站点" />
														</span>
														<span>
															离开日期：
															<input type="text" name="leaveDate" value="${leaveDate}" placeholder="请输入离开日期" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd',readOnly:true})"/>
														</span>
														<span>
															班次：
															<input type="text" name="leaveShiftNo" value="${leaveShiftNo}" placeholder="请输入班次" />
														</span>
														<span>
															嘉宾姓名：
															<input type="text" name="chineseName" value="${chineseName}" placeholder="请输入嘉宾姓名" />
														</span>
														<span>
															<button class="btn btn-primary">查询<b class="fa fa-search ml5"></b></button>
														</span>
													</div>
												</caption>
											</form>
											<thead>
												<tr>
													<th>日期</th>
													<th>班次</th>
													<th>离开时间</th>
													<th>嘉宾名字</th>
													<th>职位</th>
													<th width="15%">接待标准</th>
													<th>离开站点</th>
												</tr>

											</thead>
											<tbody>
												<c:forEach items="${guestPage.list}" var="gpl">
													<tr>
														<td>${gpl.leave_date}</td>
														<td>${gpl.leave_shift_no}</td>
														<td>${gpl.leave_time}</td>
														<td>${gpl.chinese_name}</td>
														<td>${gpl.post}</td>
														<td class="staff" width="15%" style="position: absolute;">
															${gpl.receptionList[0].stand_name}
															<div class="table-tooltip">
																<c:forEach items="${gpl.receptionList}" var="gplrl">
																	<span>${gplrl.stand_name}</span>
																</c:forEach>
															</div>
														</td>
														<td>${gpl.leave_station}</td>
													</tr>
												</c:forEach>
											</tbody>
										</table>
									</div>
									<div class="panel-footer ">
						
										<div class="navbar navbar-default navbar-link">
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
											<ul class="nav nav-tabs nav-tabs-justified pull-right">
												<li class="disabled"><a href="#">Previous</a>
												</li>
												<li class="active"><a href="#">1</a>
												</li>
												<li><a href="#">2</a>
												</li>
												<li><a href="#">3</a>
												</li>
												<li><a href="#">4</a>
												</li>
												<li><a href="#">5</a>
												</li>
												<li><a href="#">Next</a>
												</li>
											</ul>
				
										</div>
				
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- /.row -->
		<div id="edit_arriveTime" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header" style="background-color: rgba(30,40,80,0.8); height: 50px;">
						<h5 class="modal-title pull-left white-text" id="myModalLabel1">行程信息编辑</h5>
						<div class="pull-right btn-group-sm">
							<button class="btn btn-warning">保存<span class="fa fa-chain"></span></button>
							<button class="btn btn-info" data-dismiss="modal">关闭<span class="fa fa-power-off"></span></button>
						</div>
					</div>
					<div class="modal-body">
						<table class="table table-striped table-hover" cellspacing="0" width="80%">
							<tr>
								<td class="add_field_name text-right">嘉宾姓名：</td>
								<td>是瑞星</td>
							</tr>
							<tr class="ad_certificate">
								<td class="ad_certificate_name text-right">日期：</td>
								<td>2015-05-05</td>
							</tr>
							<tr>
								<td class="text-right">班次：</td>
								<td>B180</td>
							</tr>
							<tr>
								<td class="text-right">抵达时间：</td>
								<td><input type="text" onfocus="WdatePicker({dateFmt:'HH:mm:00',readOnly:true})"></td>
							</tr>
						</table>
					</div>
				</div>
				<!-- /.modal-content -->
			</div>
		</div>
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
		
		<script src="${contextPath}/CLMF-adminUI-dev/bower_components/paginator/paginator.min.js"></script>

		<script src="${contextPath}/CLMF-adminUI-dev/dist/js/page/page.js"></script>
		
		<script src="${contextPath}/CLMF-adminUI-dev/dist/js/mwi_tables/valid.js"></script>
		<!-- Page-Level Demo Scripts - Tables - Use for reference -->


	</body>

</html>