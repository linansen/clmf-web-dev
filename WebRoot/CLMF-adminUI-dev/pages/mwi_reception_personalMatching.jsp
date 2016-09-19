<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">

	<head>

		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<meta name="description" content="">
		<meta name="author" content="">

		<title>人员接待匹配</title>

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
			<div class="col-lg-offset-2  col-lg-8">
				<h1 class="page-header"></h1>
			</div>
			<!-- /.col-lg-12 -->
		</div>

		<!-- /.row -->
		<div class="row-body">

			<div class="col-lg-12">

				<div class="panel panel-primary">

					<div class="panel-heading">
						<p class="text-capitalize"><span class="fa fa-user-md fa-2x mr10"></span>人员匹配</p>
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
								<a href="${contextPath}/match?flag=1"> &nbsp;&nbsp;嘉宾 &nbsp;&nbsp;</a>
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
								<a href="${contextPath}/match?flag=2">工作人员</a>
							</li>

							<c:choose>
								<c:when test="${flag == 3}">
									<li class="active">
								</c:when>
								<c:otherwise>
									<li >
								</c:otherwise>
							</c:choose>
								<a href="${contextPath}/match?flag=3">志愿者</a>
							</li>
						</ul>
						<div id="myTabContent" class="tab-content">
							<!-- /.嘉宾 -->
							
							<c:choose>
								<c:when test="${flag == 1}">
									<div class="tab-pane fade in active" id="guest">
								</c:when>
								<c:otherwise>
									<div class="tab-pane fade in" id="guest">
								</c:otherwise>
							</c:choose>
							
								<div class="panel panel-success">
									<form action="" method="post">
			
									<!-- page -->
									<input type="hidden" class="pageIndex" name="pageNumber" value="1">
									<input type="hidden" class="pageSize" name="pageSize" value="10">
									<input type="hidden" class="totalPages" name="totalPage" value="10">
									<!-- page -->
									
									<!-- /.panel-heading -->
									<div class="panel-body">
										<table class="table table-responsive table-hover">
											<form action="${contextPath}/match" method="post">
												<caption>
													<div class="pull-left" id="query">
														<span>
															嘉宾姓名：
															<input type="text" name="chineseName" value="${chineseName}" placeholder="请输入嘉宾姓名" />
														</span>
														<span>
															英文姓名：
															<input type="text" name="englishName" value="${englishName}" placeholder="请输入英文姓名" />
														</span>
														<span>
															联系电话：
															<input type="text" name="phone" value="${phone}" placeholder="请输入联系电话" />
														</span>
														<span>
															分配状态：
															<select name="isMatched">
																<c:choose>
																	<c:when test="${isMatched == 1}">
																		<option value="">全部</option>
																		<option selected="selected" value="1">已分配</option>
																		<option value="0">未分配</option>
																	</c:when>
																	<c:when test="${isMatched == 0}">
																		<option value="">全部</option>
																		<option value="1">已分配</option>
																		<option selected="selected" value="0">未分配</option>
																	</c:when>
																	<c:otherwise>
																		<option selected="selected" value="">全部</option>
																		<option value="1">已分配</option>
																		<option value="0">未分配</option>
																	</c:otherwise>
																</c:choose>
															</select>
														</span>
														<span>
															<button class="btn btn-primary">查询<b class="fa fa-search ml5"></b></button>
															<button type="button" class="btn btn-primary" id="ad_query_button">高级查询</button>
														</span>
														<span>
															<label>记录总数：<b class="red-text">${count}</b>条</label>
														</span>
														<span class="fr">
															<a href="${contextPath}/match/toMatch" class="btn btn-primary chose_staff_btn" data-toggle="modal" data-target="#chose_staff">人员匹配</a>
														</span>
													</div>
													<div class="pull-left" id="ad_query">
														<span>
															单位职务：
															<input type="text" name="post" value="${post}" placeholder="请输入单位职务" />
														</span>
														<span>
															国籍：
															<select name="national">
																<option value="">全部</option>
																<c:forEach items="${allCountry}" var="country">
																	<c:choose>
																		<c:when test="${national == country.zh_country_name}">
																			<option selected="selected" value="${country.zh_country_name}">${country.zh_country_name}</option>
																		</c:when>
																		<c:otherwise>
																			<option value="${country.zh_country_name}">${country.zh_country_name}</option>
																		</c:otherwise>
																	</c:choose>
																	
																</c:forEach>
															</select>
														</span>
														<span>
															嘉宾类别：
															<select name="guestType">
																<option value="">不限</option>
																<c:forEach items="${guestTypeList}" var="guestTypeList">
																	<c:choose>
																		<c:when test="${guestType == guestTypeList.id}">
																			<option selected="selected" value="${guestTypeList.id}">${guestTypeList.type_name}</option>
																		</c:when>
																		<c:otherwise>
																			<option value="${guestTypeList.id}">${guestTypeList.type_name}</option>
																		</c:otherwise>
																	</c:choose>
																</c:forEach>
															</select>
														</span>
														<span>
															接待标准：
															<select name="receptionId">
																<option value="">不限</option>
																<c:forEach items="${receptionList}" var="recpl">
																	<c:choose>
																		<c:when test="${receptionId == recpl.id}">
																			<option selected="selected" value="${recpl.id}">${recpl.stand_name}</option>
																		</c:when>
																		<c:otherwise>
																			<option value="${recpl.id}">${recpl.stand_name}</option>
																		</c:otherwise>
																	</c:choose>
																</c:forEach>
															</select>
														</span>
													</div>
												</caption>
											</form>
											<thead>
												<tr>
													<th><label>选择<input type="checkbox" class="checkAll"></label></th>
													<th>序号</th>
													<th>嘉宾姓名</th>
													<th>英文姓名</th>
													<th>联系电话</th>
													<th>单位职务</th>
													<th>国籍</th>
													<th>嘉宾类别</th>
													<th width="15%">接待标准</th>
													<th width="15%">工作人员(联系方式)</th>
													<th width="15%">志愿者(联系方式)</th>
													<th>分配状态</th>
												</tr>
											</thead>
											<tbody>
												<c:forEach items="${guestPage.list}" var="gpl" varStatus="status">
													<tr>
														<td><input name="guestIds" value="${gpl.guestId}" type="checkbox"></td>
														<td>${status.index+1}</td>
														<td>${gpl.chinese_name}</td>
														<td>${gpl.english_name}</td>
														<td>${gpl.phone}</td>
														<td>${gpl.post}</td>
														<td>${gpl.national}</td>
														<td>${gpl.type_name}</td>
														<td class="staff" width="15%" style="position: absolute;">
															${gpl.receptionList[0].stand_name}
															<div class="table-tooltip">
																<c:forEach items="${gpl.receptionList}" var="gplrl">
																	<span>${gplrl.stand_name}</span>
																</c:forEach>
															</div>
														</td>
														<td class="staff" width="15%" style="position: relative;">
															${gpl.workerList[0].realname}(${gpl.workerList[0].phone})
															<div class="table-tooltip" style="position: absolute;">
																<c:forEach items="${gpl.workerList}" var="gplwl">
																	<span>${gplwl.realname}(${gplwl.phone})</span>
																</c:forEach>
															</div>
														</td>
														<td class="staff" width="15%" style="position: absolute;">
															${gpl.supporterList[0].realname}(${gpl.supporterList[0].phone})
															<div class="table-tooltip">
																<c:forEach items="${gpl.supporterList}" var="gplsl">
																	<span>${gplsl.realname}(${gplsl.phone})</span>
																</c:forEach>
															</div>
														</td>
														<c:choose>
															<c:when test="${gpl.is_matched == 1}"><td>已分配</td></c:when>
															<c:otherwise><td>未分配</td></c:otherwise>
														</c:choose>
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
												<select name="select_items">
													<option value="10">10</option>
													<option value="20">20</option>
													<option value="50">50</option>
													<option value="100">100</option>
													<option value="500">500</option>
												</select>
												数据
											</div>
											<div class="pull-left mt25 ml20">
												跳到第
												<input type="number" name="select_guest_name" style="width: 70px !important;"/>
												页
												<button class="btn btn-primary btn-sm">go</button>
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
									</form>
								</div>
								<!-- /.panel -->
							</div>

							<!-- /.工作人员组长 -->
							<c:choose>
								<c:when test="${flag == 2}">
									<div class="tab-pane fade in active" id="staff">
								</c:when>
								<c:otherwise>
									<div class="tab-pane fade in" id="staff">
								</c:otherwise>
							</c:choose>

								<div class="panel panel-primary">
									
			
									<!-- page -->
									<input type="hidden" class="pageIndex" name="pageNumber" value="1">
									<input type="hidden" class="pageSize" name="pageSize" value="10">
									<input type="hidden" class="totalPages" name="totalPage" value="10">
									<!-- page -->

									<div class="panel-body">

										<table class="table table-responsive table-hover">
											<form action="${contextPath}/match?flag=2" method="post">
												<caption>
													<div class="pull-left" id="query">
														<span>
															姓名：
															<input type="text" name="realName" value="${realName}" placeholder="请输入工作人员姓名" />
														</span>
														<span>
															单位：
															<input type="text" name="post" value="${post}" placeholder="请输入单位" />
														</span>
														<span>
															部门：
															<input type="text" name="post" value="${post}" placeholder="请输入部门" />
														</span>
														
														<span>
															工作组：

															<select name="groupName">
																<option value="">全部</option>
																<c:forEach items="${groupList}" var="gl">
																	<c:choose>
																		<c:when test="${groupName == gl.group_name}"><option selected="selected" value="${gl.group_name}">${gl.group_name}</option></c:when>
																		<c:otherwise><option value="${gl.group_name}">${gl.group_name}</option></c:otherwise>
																	</c:choose>
																</c:forEach>
															</select>
														</span>
														<span>
															分配状态：
															<select name="workingStatus">
																<c:choose>
																	<c:when test="${workingStatus ==1}">
																		<option value="">全部</option>
																		<option selected="selected" value="1">已分配</option>
																		<option value="0">未分配</option>
																	</c:when>
																	<c:when test="${workingStatus ==0}">
																		<option value="">全部</option>
																		<option value="1">已分配</option>
																		<option selected="selected" value="0">未分配</option>
																	</c:when>
																	<c:otherwise>
																		<option selected="selected" value="">全部</option>
																		<option value="1">已分配</option>
																		<option value="0">未分配</option>
																	</c:otherwise>
																</c:choose>
																
															</select>
														</span>
														<span>
															<button class="btn btn-primary">查询<b class="fa fa-search ml5"></b></button>
														</span>
														<span>
															<label>记录总数：<b class="red-text">${workerCount}</b>条</label>
														</span>
													</div>
												</caption>
											</form>
											<thead>
												<tr>
													<th>序号</th>
													<th>工作人员姓名</th>
													<th>单位</th>
													<th>部门</th>
													<th>工作组</th>
													<th width="15%">负责嘉宾</th>
													<th>分配状态</th>
												</tr>
											</thead>
											<tbody>
												<c:forEach items="${workerPage.list}" var="wpl" varStatus="s">
													<tr>
														<td>${s.index+1}</td>
														<td>${wpl.realname}</td>
														<td>${wpl.unit}</td>
														<td>${wpl.post}</td>
														<td>${wpl.work_group}</td>
														<td class="staff" width="15%" style="position: absolute;">
															${wpl.guestList[0].chinese_name}
															<div class="table-tooltip">
																<c:forEach items="${wpl.guestList}" var="wplgl">
																	<span>${wplgl.chinese_name}</span>
																</c:forEach>
															</div>
														</td>
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

									<div class="panel-footer ">
						
										<div class="navbar navbar-default navbar-link">
											<div class="pull-left mt25 ml10">
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
											<div class="pull-left mt25 ml20">
												跳到第
												<input type="number" name="select_guest_name" style="width: 70px !important;"/>
												页
												<button class="btn btn-primary btn-sm">go</button>
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

							<!-- /.志愿者人员 -->
							<c:choose>
								<c:when test="${flag == 3}">
									<div class="tab-pane fade in active" id="volunteer">
								</c:when>
								<c:otherwise>
									<div class="tab-pane fade in" id="volunteer">
								</c:otherwise>
							</c:choose>
							
								<div class="panel panel-danger">
									

									<!-- page -->
									<input type="hidden" class="pageIndex" name="pageNumber" value="2">
									<input type="hidden" class="pageSize" name="pageSize" value="10">
									<input type="hidden" class="totalPages" name="totalPage" value="10">
									<!-- page -->
									<!-- /.panel-heading -->
									<div class="panel-body">

										<table class="table table-responsive table-hover">
											<form action="${contextPath}/match?flag=3" method="post">
												<caption>
													<div class="pull-left" id="query">
														<span>
															志愿者姓名：
															<input type="text" name="realName" value="${realName}" placeholder="请输入志愿者姓名" />
														</span>
														<span>
															学校：
															<input type="text" name="unit" value="${unit}" placeholder="请输入志愿者学校" />
														</span>
														<span>
															专业：
															<input type="text" name="unit" value="${unit}" placeholder="请输入志愿者专业" />
														</span>
														<span>
															工作组：

															<select name="groupName">
																<option value="">全部</option>
																<c:forEach items="${groupList}" var="gl">
																
																	<c:choose>
																		<c:when test="${groupName == gl.group_name}"><option selected="selected" value="${gl.group_name}">${gl.group_name}</option></c:when>
																		<c:otherwise><option value="${gl.group_name}">${gl.group_name}</option></c:otherwise>
																	</c:choose>
																</c:forEach>
															</select>
														</span>
														<span>
															分配状态：
															<select name="workingStatus">
																<c:choose>
																	<c:when test="${workingStatus ==1}">
																		<option value="">全部</option>
																		<option selected="selected" value="1">已分配</option>
																		<option value="0">未分配</option>
																	</c:when>
																	<c:when test="${workingStatus ==0}">
																		<option value="">全部</option>
																		<option value="1">已分配</option>
																		<option selected="selected" value="0">未分配</option>
																	</c:when>
																	<c:otherwise>
																		<option selected="selected" value="">全部</option>
																		<option value="1">已分配</option>
																		<option value="0">未分配</option>
																	</c:otherwise>
																</c:choose>
															</select>
														</span>
														<span>
															<button class="btn btn-primary">查询<b class="fa fa-search ml5"></b></button>
														</span>
														<span>
															<label>记录总数：<b class="red-text">${supporterCount}</b>条</label>
														</span>
													</div>
												</caption>
											</form>
											<thead>
												<tr>
													<th>序号</th>
													<th>志愿者姓名</th>
													<th>学校</th>
													<th>专业</th>
													<th>工作组</th>
													<th width="15%">负责嘉宾</th>
													<th>分配状态</th>
												</tr>
											</thead>
											<tbody>
												<c:forEach items="${supporterPage.list}" var="spl" varStatus="s">
													<tr>
														<td>${s.index+1}</td>
														<td>${spl.realname}</td>
														<td>${spl.unit}</td>
														<td>${spl.post}</td>
														<td>${spl.work_group}</td>
														<td class="staff" width="15%" style="position: absolute;">
															${spl.guestList[0].chinese_name}
															<div class="table-tooltip">
																<c:forEach items="${spl.guestList}" var="splgl">
																	<span>${splgl.chinese_name}</span>
																</c:forEach>
															</div>
														</td>
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

									<div class="panel-footer ">
			
										<div class="navbar navbar-default navbar-link">
											<div class="pull-left mt25 ml10">
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
											<div class="pull-left mt25 ml20">
												跳到第
												<input type="number" name="select_guest_name" style="width: 70px !important;"/>
												页
												<button class="btn btn-primary btn-sm">go</button>
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

						</div>
					</div>

				</div>

			</div>

		</div>
		<!-- /.row -->
		<div id="chose_staff" class="modal fade getGuestIds" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="top:50px;">
			<div class="modal-dialog" style="width: 1600px;">
				<div class="modal-content">
					
				</div>
				<!-- /.modal-content -->
			</div>
		</div>

		<!-- /#page-wrapper -->

		<!-- jQuery -->
		<script src="${contextPath}/CLMF-adminUI-dev/bower_components/jquery/dist/jquery.min.js"></script>

		<!-- Bootstrap Core JavaScript -->
		<script src="${contextPath}/CLMF-adminUI-dev/bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
		<!-- Metis Menu Plugin JavaScript -->
		<script src="${contextPath}/CLMF-adminUI-dev/bower_components/metisMenu/dist/metisMenu.min.js"></script>

		<!-- Custom Theme JavaScript -->
		<script src="${contextPath}/CLMF-adminUI-dev/dist/js/sb-admin-2.js"></script>
		
		<script src="${contextPath}/CLMF-adminUI-dev/dist/js/mwi_tables/index.js"></script>
		
		<script src="${contextPath}/CLMF-adminUI-dev/dist/js/mwi_tables/personalMatch.js"></script>
		
		<script src="${contextPath}/CLMF-adminUI-dev/bower_components/paginator/paginator.min.js"></script>

		<script src="${contextPath}/CLMF-adminUI-dev/dist/js/page/page.js"></script>
		
		<script src="${contextPath}/CLMF-adminUI-dev/dist/js/mwi_tables/valid.js"></script>
		<!-- Page-Level Demo Scripts - Tables - Use for reference -->

	</body>

</html>
