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

		<title>活动管理之活动签到之人数统计</title>

		<!-- Bootstrap Core CSS -->
		<link href="${contextPath}/CLMF-adminUI-dev/bower_components/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
		
		<!-- MetisMenu CSS -->
		<link href="${contextPath}/CLMF-adminUI-dev/bower_components/metisMenu/dist/metisMenu.min.css" rel="stylesheet">

		<!-- Custom CSS -->
		<link href="${contextPath}/CLMF-adminUI-dev/dist/css/sb-admin-2.css" rel="stylesheet">

		<!-- Custom Fonts -->
		<link href="${contextPath}/CLMF-adminUI-dev/bower_components/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">

		<link href="${contextPath}/CLMF-adminUI-dev/dist/css/mwi_tables/index.css" rel="stylesheet" type="text/css">

		<link href="${contextPath}/CLMF-adminUI-dev/dist/css/mwi_tables/modal.css" rel="stylesheet" type="text/css">

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

				<div class="panel panel-primary ">

					<div class="panel-heading">
						<h4><span class="fa fa-pagelines"></span>&nbsp;签到人数统计</h4>
					</div>
					

					<div class="panel-body">
						<div id="tabs">
							
							<ul id="myTab" class="nav nav-tabs nav-tabs-justified">
								<c:choose>
									<c:when test="${flag == 1}">
										<li class="active">
									</c:when>
									<c:otherwise>
										<li >
									</c:otherwise>
								</c:choose>
									<a href="${contextPath}/activity_check_report?flag=1"> &nbsp;&nbsp;嘉宾 &nbsp;&nbsp;</a>
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
									<a href="${contextPath}/activity_check_report?flag=2">工作人员</a>
								</li>

								<c:choose>
									<c:when test="${flag == 3}">
										<li class="active">
									</c:when>
									<c:otherwise>
										<li >
									</c:otherwise>
								</c:choose>
									<a href="${contextPath}/activity_check_report?flag=3">志愿者</a>
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
								
								<form action="${contextPath}/activity_check_report?flag=1" method="post">
								<!-- page -->
								<input type="hidden" class="pageIndex" name="pageNumber" value='<c:out value="${pageNumber}" default="1"/>'>
								<input type="hidden" class="pageSize" name="pageSize" value='<c:out value="${pageSize}" default="10"/>'>
								<input type="hidden" class="totalPages" name="guestTotalPage" value='<c:out value="${guestTotalPage}" default="1"/>'>
								<!-- page -->
									<div class="panel panel-default col-lg-12">
										<!-- <div class="panel-title">
											<h5 style="" class="panel-title diningManageToll">本次签到总人数为&nbsp;&nbsp;&nbsp;人</h5>
										</div> -->
										<div class="panel-body">
											<table class="table table-condensed table-hover  table-bordered table-responsive">
												<caption>
													<div class="pull-left query">
														<span>
															入场标准：
															<select name="standRuleId" class="activityNorm">
																<option value="">不限</option>
																<c:forEach items="${checkRuleStand}" var="crs">
																	<c:choose>
																		<c:when test="${crs.id == standRuleId}">
																			<option selected="selected" value="${crs.id}">${crs.stand_name}</option>
																		</c:when>
																		<c:otherwise>
																			<option value="${crs.id}">${crs.stand_name}</option>
																		</c:otherwise>
																	</c:choose>
																	
																</c:forEach>
															</select>
														</span>
														<span>
															入场主题：
															<input type="text" placeholder="请输入入场主题" onblur="" name="entryThema" value="${entryThema}" class="activityNormDetail activityTheme"/>
														</span>
														<span>
		                                              		入场日期：
															<input type="text" placeholder="请输入入场日期" onblur="" name="entryDate" value="${entryDate}" class="activityNormDetail activityDate" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd',readOnly:true})"/>
		                                              	</span>
														<span>
		                                              		入场时间：
															<input type="text" placeholder="请输入入场时间" onblur="" name="entryTime" value="${entryTime}" class="activityNormDetail activityTime" onfocus="WdatePicker({dateFmt:'HH:mm:00',readOnly:true})"/>
		                                              	</span>
		                                              	<span>
		                                              		入场地点：
															<input type="text" placeholder="请输入入场地点" onblur="" name="entryAddress" value="${entryAddress}" class="activityNormDetail activityAdress"/>
		                                              	</span>
														<span>
		                                              		<button  class="btn btn-primary" type="submit">
																查询<b class="fa fa-search ml5"></b>
															</button>
		                                              	</span>
		                                              	<span>
															<label>总入场人数：<b class="red-text activitySum">10000</b>人</label>
														</span>
														<span>
															<label>实际入场人数：<b class="red-text activityCurrent">10000</b>人</label>
														</span>
													</div>
												</caption>
												<thead>
													<tr>
														<th>序号</th>
														<th>嘉宾姓名</th>
														<th>英文姓名</th>
														<th>国籍</th>
														<th>单位</th>
														<th>职务</th>
														<th>入场主题</th>
														<th>入场日期</th>
														<th>入场时间</th>
														<th>入场地点</th>
														<th>入场方式</th>
														<th>签到状态</th>
													</tr>
												</thead>
												<tbody>
													<c:forEach items="${guestList.list}" var="gl" varStatus="status">
														<tr>
															<td>${status.index+1}</td>
															<td>${gl.chinese_name}</td>
															<td>${gl.english_name}</td>
															<td>${gl.national}</td>
															<td>${gl.ch_organ_name}</td>
															<td>${gl.post}</td>
															<td>${gl.entry_thema}</td>
															<td>${gl.entry_date}</td>
															<td>${gl.entry_time}</td>
															<td>${gl.entry_address}</td>
															<td>${gl.entry_type}</td>
															<c:choose>
																<c:when test="${gl.check_status == 1}"><td>已签到</td></c:when>
																<c:otherwise><td>未签到</td></c:otherwise>
															</c:choose>
														</tr>
													</c:forEach>
												</tbody>
											</table>
										</div>

										<div class="panel-footer ">
											<div class="navbar navbar-default navbar-link">
												<div class="pull-left mt25 ml10">
													展示：
													<select name="select_items" class="pageSizeSelect">
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
									</form>

								</div>
								
								<c:choose>
									<c:when test="${flag == 2}">
										<div class="tab-pane fade in active" id="ios">
									</c:when>
									<c:otherwise>
										<div class="tab-pane fade in" id="ios">
									</c:otherwise>
								</c:choose>
								
								<form action="${contextPath}/activity_check_report?flag=2" method="post">
								<!-- page -->
								<input type="hidden" class="pageIndex" name="pageNumber" value='<c:out value="${pageNumber}" default="1"/>'>
								<input type="hidden" class="pageSize" name="pageSize" value='<c:out value="${pageSize}" default="10"/>'>
								<input type="hidden" class="totalPages" name="workerTotalPage" value='<c:out value="${workerTotalPage}" default="1"/>'>
								<!-- page -->
									
									<div class="panel panel-default">
									
										<!-- <div class="panel-title">
											<h5 style="" class="panel-title diningManageToll">本次签到总人数为&nbsp;&nbsp;&nbsp;人</h5>
										</div> -->
										<div class="panel-body">
											<table class="table table-condensed table-hover  table-bordered table-responsive">
												<caption>
													<div class="pull-left query">
														<span>
															入场标准：
															<select name="standRuleId" class="activityNorm">
																<option value="">不限</option>
																<c:forEach items="${checkRuleStand}" var="crs">
																	<c:choose>
																		<c:when test="${crs.id == standRuleId}">
																			<option selected="selected" value="${crs.id}">${crs.stand_name}</option>
																		</c:when>
																		<c:otherwise>
																			<option value="${crs.id}">${crs.stand_name}</option>
																		</c:otherwise>
																	</c:choose>
																	
																</c:forEach>
															</select>
														</span>
														<span>
															入场主题：
															<input type="text" placeholder="请输入入场主题" onblur="" name="entryThema" value="${entryThema}" class="activityNormDetail activityTheme"/>
														</span>
														<span>
		                                              		入场日期：
															<input type="text" placeholder="请输入入场日期" onblur="" name="entryDate" value="${entryDate}" class="activityNormDetail activityDate" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd',readOnly:true})"/>
		                                              	</span>
														<span>
		                                              		入场时间：
															<input type="text" placeholder="请输入入场时间" onblur="" name="entryTime" value="${entryTime}" class="activityNormDetail activityTime" onfocus="WdatePicker({dateFmt:'HH:mm:00',readOnly:true})"/>
		                                              	</span>
		                                              	<span>
		                                              		入场地点：
															<input type="text" placeholder="请输入入场地点" onblur="" name="entryAddress" value="${entryAddress}" class="activityNormDetail activityAdress"/>
		                                              	</span>
														<span>
		                                              		<button  class="btn btn-primary" type="submit">
																查询<b class="fa fa-search ml5"></b>
															</button>
		                                              	</span>
		                                              	<span>
															<label>总入场人数：<b class="red-text activitySum">10000</b>人</label>
														</span>
														<span>
															<label>实际入场人数：<b class="red-text activityCurrent">10000</b>人</label>
														</span>
													</div>
												</caption>
												<thead>
													<tr>
														<th>序号</th>
														<th>工作人员姓名</th>
														<th>国籍</th>
														<th>单位</th>
														<th>职务</th>
														<th>入场主题</th>
														<th>入场日期</th>
														<th>入场时间</th>
														<th>入场地点</th>
														<th>入场方式</th>
														<th>签到状态</th>
													</tr>
												</thead>
												<tbody>
													<c:forEach items="${workerList.list}" var="wl" varStatus="status">
														<tr>
															<td>${status.index+1}</td>
															<td>${wl.realname}</td>
															<td>${wl.national}</td>
															<td>${wl.unit}</td>
															<td>${wl.post}</td>
															<td>${wl.entry_thema}</td>
															<td>${wl.entry_date}</td>
															<td>${wl.entry_time}</td>
															<td>${wl.entry_address}</td>
															<td>${wl.entry_type}</td>
															<c:choose>
																<c:when test="${wl.check_status == 1}"><td>已签到</td></c:when>
																<c:otherwise><td>未签到</td></c:otherwise>
															</c:choose>
														</tr>
													</c:forEach>
												</tbody>
											</table>
										</div>
										<div class="panel-footer ">
											<div class="navbar navbar-default navbar-link">
												<div class="pull-left mt25 ml10">
													展示：
													<select name="select_items" class="pageSizeSelect">
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
									</form>

								</div>
								
								<c:choose>
									<c:when test="${flag == 3}">
										<div class="tab-pane fade in active" id="android">
									</c:when>
									<c:otherwise>
										<div class="tab-pane fade in" id="android">
									</c:otherwise>
								</c:choose>
									
								<form action="${contextPath}/activity_check_report?flag=3" method="post">
								<!-- page -->
								<input type="hidden" class="pageIndex" name="pageNumber" value='<c:out value="${pageNumber}" default="1"/>'>
								<input type="hidden" class="pageSize" name="pageSize" value='<c:out value="${pageSize}" default="10"/>'>
								<input type="hidden" class="totalPages" name="supporterTotalPage" value='<c:out value="${supporterTotalPage}" default="1"/>'>
								<!-- page -->

									<div class="panel panel-default">
										<!-- <div class="panel-title">
											<h5 style="" class="panel-title diningManageToll">本次签到总人数为&nbsp;&nbsp;&nbsp;人</h5>
										</div> -->
										<div class="panel-body">
											<table class="table table-condensed table-hover  table-bordered table-responsive">
												<caption>
													<div class="pull-left query">
														<span>
															入场标准：
															<select name="standRuleId" class="activityNorm">
																<option value="">不限</option>
																<c:forEach items="${checkRuleStand}" var="crs">
																	<c:choose>
																		<c:when test="${crs.id == standRuleId}">
																			<option selected="selected" value="${crs.id}">${crs.stand_name}</option>
																		</c:when>
																		<c:otherwise>
																			<option value="${crs.id}">${crs.stand_name}</option>
																		</c:otherwise>
																	</c:choose>
																	
																</c:forEach>
															</select>
														</span>
														<span>
															入场主题：
															<input type="text" placeholder="请输入入场主题" onblur="" name="entryThema" value="${entryThema}" class="activityNormDetail activityTheme"/>
														</span>
														<span>
		                                              		入场日期：
															<input type="text" placeholder="请输入入场日期" onblur="" name="entryDate" value="${entryDate}" class="activityNormDetail activityDate" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd',readOnly:true})"/>
		                                              	</span>
														<span>
		                                              		入场时间：
															<input type="text" placeholder="请输入入场时间" onblur="" name="entryTime" value="${entryTime}" class="activityNormDetail activityTime" onfocus="WdatePicker({dateFmt:'HH:mm:00',readOnly:true})"/>
		                                              	</span>
		                                              	<span>
		                                              		入场地点：
															<input type="text" placeholder="请输入入场地点" onblur="" name="entryAddress" value="${entryAddress}" class="activityNormDetail activityAdress"/>
		                                              	</span>
														<span>
		                                              		<button  class="btn btn-primary" type="submit">
																查询<b class="fa fa-search ml5"></b>
															</button>
		                                              	</span>
		                                              	<span>
															<label>总入场人数：<b class="red-text activitySum">10000</b>人</label>
														</span>
														<span>
															<label>实际入场人数：<b class="red-text activityCurrent">10000</b>人</label>
														</span>
													</div>
												</caption>
												<thead>
													<tr>
														<th>序号</th>
														<th>志愿者姓名</th>
														<th>国籍</th>
														<th>学校</th>
														<th>专业</th>
														<th>入场主题</th>
														<th>入场日期</th>
														<th>入场时间</th>
														<th>入场地点</th>
														<th>入场方式</th>
														<th>签到状态</th>
													</tr>
												</thead>
												<tbody>
													<c:forEach items="${supportList.list}" var="sl" varStatus="status">
														<tr>
															<td>${status.index+1}</td>
															<td>${sl.realname}</td>
															<td>${sl.national}</td>
															<td>${sl.unit}</td>
															<td>${sl.post}</td>
															<td>${sl.entry_thema}</td>
															<td>${sl.entry_date}</td>
															<td>${sl.entry_time}</td>
															<td>${sl.entry_address}</td>
															<td>${sl.entry_type}</td>
															<c:choose>
																<c:when test="${sl.check_status == 1}"><td>已签到</td></c:when>
																<c:otherwise><td>未签到</td></c:otherwise>
															</c:choose>
														</tr>
													</c:forEach>
												</tbody>

											</table>
										</div>

										<div class="panel-footer ">
											<div class="navbar navbar-default navbar-link">
												<div class="pull-left mt25 ml10">
													展示：
													<select name="select_items" class="pageSizeSelect">
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
									</form>

								</div>

							</div>
						</div>
					</div>

				</div>

			</div>
			<!-- /.col-lg-12 -->
		</div>
		<!-- /.row -->

		<!-- /#page-wrapper -->
		<!-- 模态框（Modal） -->

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
		
		<script src="${contextPath}/CLMF-adminUI-dev/dist/js/mwi_tables/activity.js"></script>
		
				<!-- page -->
		<script src="${contextPath}/CLMF-adminUI-dev/bower_components/paginator/paginator.min.js"></script>

		<script src="${contextPath}/CLMF-adminUI-dev/dist/js/page/page.js"></script>
	</body>

</html>