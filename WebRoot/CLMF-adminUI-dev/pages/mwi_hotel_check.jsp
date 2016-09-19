<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

	<head>

		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<meta name="description" content="">
		<meta name="author" content="">

		<title>嘉宾酒店审核</title>

		<!-- Bootstrap Core CSS -->
		<link href="${contextPath}/CLMF-adminUI-dev/bower_components/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
				
		<link href="${contextPath}/CLMF-adminUI-dev/bower_components/metisMenu/dist/metisMenu.min.css" rel="stylesheet">
		<!-- Custom CSS -->
		<link href="${contextPath}/CLMF-adminUI-dev/dist/css/sb-admin-2.css" rel="stylesheet">
		<!-- Custom Fonts -->
		<link href="${contextPath}/CLMF-adminUI-dev/bower_components/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
		
		<link href="${contextPath}/CLMF-adminUI-dev/dist/css/mwi_tables/index.css" rel="stylesheet" type="text/css">
	</head>

	<body>

		<!-- Navigation -->

		<div class="row-header">
			<div class="col-lg-offset-2  col-lg-6">
				<h1 class="page-header"></h1>
			</div>
			<!-- /.col-lg-12 -->
		</div>

		<!-- /.row -->
		<div class="row-body">

			<div class="col-lg-12">
			
			<form action="${contextPath}/hotelAudit/getList" method="post">
			<!-- page -->
			<input type="hidden" class="pageIndex" name="currentPage" value='<c:out value="${pageList.pageNumber}" default="1"/>'>
			<input type="hidden" class="pageSize" name="currentSize" value='<c:out value="${pageList.pageSize}" default="10"/>'>
			<input type="hidden" class="totalPages" name="totalPage" value='<c:out value="${pageList.totalPage}" default="1"/>'>
			<!-- page -->

				<div class="panel panel-primary">

					<div class="panel-heading">
						<p><span class="fa fa-info-circle fa-2x mr5"></span>嘉宾酒店信息管理</p>
					</div>
					<!-- /.panel-heading -->
					<div class="panel-body">
						<table class="table table-striped table-hover table-bordered" cellspacing="2" width="80%">
							<caption>
								<div class="pull-left" id="query">
									<span>
										嘉宾姓名：
										<input type="text" name="chineseName" placeholder="请输入嘉宾姓名" value="${chineseName}"/>
									</span>
									<span>
										英文姓名：
										<input type="text" name="englishName" placeholder="请输入英文姓名" value="${englishName}"/>
									</span>
									<span>
										酒店名称：
										<select name="hotelId">
											<option value="0">不限</option>
											<c:forEach items="${hotelList}" var="hl">
												<c:choose>
													<c:when test="${hl.id == hotelId}">
														<option value="${hl.id}" selected="selected">${hl.hotel_name}</option>
													</c:when>
													<c:otherwise>
														<option value="${hl.id}">${hl.hotel_name}</option>
													</c:otherwise>
												</c:choose>
											</c:forEach>
										</select>
									</span>
									<span>
										房型：
										<select name="roomId">
											<option value="0">全部</option>
											<c:forEach items="${roomList}" var="rl">
												<c:choose>
													<c:when test="${rl.id == roomId}">
														<option value="${rl.id}" selected="selected">${rl.room_type_name}</option>
													</c:when>
													<c:otherwise>
														<option value="${rl.id}">${rl.room_type_name}</option>
													</c:otherwise>
												</c:choose>
											</c:forEach>
										</select>
									</span>
									<span>
										审核状态：
										<select name="auditStatus">
											<c:choose>
												<c:when test="${auditStatus == 0}">
													<option value="">全部</option>
													<option value="0" selected="selected">待审核</option>
													<option value="1">已通过</option>
													<option value="2">已拒绝</option>
												</c:when>
												<c:when test="${auditStatus == 1}">
													<option value="">全部</option>
													<option value="0">待审核</option>
													<option value="1" selected="selected">已通过</option>
													<option value="2">已拒绝</option>
												</c:when>
												<c:when test="${auditStatus == 2}">
													<option value="">全部</option>
													<option value="0">待审核</option>
													<option value="1">已通过</option>
													<option value="2" selected="selected">已拒绝</option>
												</c:when>
												<c:otherwise>
													<option value="" selected="selected">全部</option>
													<option value="0">待审核</option>
													<option value="1">已通过</option>
													<option value="2">已拒绝</option>
												</c:otherwise>
											</c:choose>
										</select>
									</span>
									<span>
										<button type="submit" class="btn btn-primary">查询<b class="fa fa-search ml5"></b></button>
										<button type="button" class="btn btn-primary" id="ad_query_button">高级查询</button>
									</span>
									<span>
										<label>记录总数：<b class="red-text">${pageList.totalRow}</b>条</label>
									</span>

								</div>
								<div class="pull-left" id="ad_query">
									<span>
										国籍：
										<select name="national">
											<option value="">请输选择国籍</option>
											<c:forEach items="${nationalList}" var="na">
												<c:choose>
													<c:when test="${na.national == national}">
														<option value="${na.national}" selected="selected">${na.national}</option>
													</c:when>
													<c:otherwise>
														<option value="${na.national}">${na.national}</option>
													</c:otherwise>
												</c:choose>
											</c:forEach>
										</select>
									</span>
									<span>
										单位：
										<input type="text" name="ch_organ_name" placeholder="请输入单位" value="${ch_organ_name}"/>
									</span>
									<span>
										职务：
										<input type="text" name="post" placeholder="请输入职务" value="${post}"/>
									</span>
									<span>
										性别：
										<select name="sex">
											<c:choose>
												<c:when test="${sex == 1}">
													<option value="">不限</option>
													<option value="1" selected="selected">男</option>
													<option value="2">女</option>
												</c:when>
												<c:when test="${sex == 2}">
													<option value="">不限</option>
													<option value="1">男</option>
													<option value="2" selected="selected">女</option>
												</c:when>
												<c:otherwise>
													<option value="" selected="selected">不限</option>
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
									<th>英文姓名</th>
									<th>性别</th>
									<th>国籍</th>
									<th>单位</th>
									<th>职务</th>
									<th>酒店名称</th>
									<th>房间类型</th>
									<th>房号</th>
									<th>入住时间</th>
                                    <th>审核状态</th>
									<th>操作</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${pageList.list}" var="li" varStatus="i">
									<tr>
										<td>${i.index + 1}</td>
										<td>${li.chinese_name}</td>
										<td>${li.english_name}</td>
										<td>${li.sex}</td>
										<td>${li.national}</td>
										<td>${li.ch_organ_name}</td>
										<td>${li.post}</td>
										<td>${li.hotel_name}</td>
										<td>${li.room_type_name}</td>
										<td>${li.room_num}</td>
										<td>${li.checkin_time}</td>
										<td>
											<c:choose>
												<c:when test="${li.status == 0}">待审核</c:when>
												<c:when test="${li.status == 1}">已通过</c:when>
												<c:when test="${li.status == 2}">已拒绝</c:when>
												<c:otherwise></c:otherwise>
											</c:choose>
										</td>
										<td>
											<a href='${contextPath}/hotelAudit/toHotelAudit?guestId=${li.guest_id}' class="btn btn-success" data-toggle="modal" data-target="#check_info_about_guest">审核<span class="fa fa-check ml5"></span></a>
											<button type="button" class="btn btn-default" data-toggle="modal" data-target="#edit_info_about_guest${li.hm_id}">住宿详情<span class="fa fa-edit ml5"></span></button>
											<button type="button" class="btn btn-danger" data-toggle="modal" data-target="#myModal${li.hm_id}">删除<span class="fa fa-remove ml5"></span></button>
											<div class="modal fade" id="myModal${li.hm_id}" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="margin-top:15%;">
												<div class="modal-dialog">
													<div class="modal-content">
														<div class="modal-header" style="border-radius:6px 6px 0 0 ;">
															<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
																&times;
															</button>
															<h4 class="modal-title" id="myModalLabel">
																						  删除嘉宾住宿信息
															</h4>
														</div>
														<div class="modal-body text-center">
															<div class="text-center text-info">
																确定要删除住宿信息吗？
															</div>
															<div class="text-center mt20">
																<button type="button" class="btn btn-danger mr10" onclick="javaScript:window.location.href='${contextPath}/hotelAudit/delete?hmId=${li.hm_id}';">确定</button>
																<button type="button" class="btn btn-success" data-dismiss="modal" aria-hidden="true">取消</button>
															</div>
														</div>
													</div>
													<!-- /.modal-content -->
												</div>
												<!-- /.modal -->
											</div>
											<div id="edit_info_about_guest${li.hm_id}" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
												<div class="modal-dialog">
													<div class="modal-content" >
														<div class="modal-body" style="padding: 0px;">
													           <div class="panel panel-primary">
													           	   <div class="panel-heading" style="height:60px;">
														                <div class="pull-left">
														                	<h5><span class="fa fa-building-o "></span>&nbsp;嘉宾酒店信息</h5>
														                </div>  	   	  	   
															         	<div class="pull-right btn-group-sm ">
																			<button type="button" class="btn btn-success btn-sm" data-dismiss="modal"><span class="fa fa-power-off mr5"></span>关闭</button>
																		</div>
												           	   		</div>
													              	<div class="panel-body">
																	  <table class="table table-striped table-bordered  table-hover table-responsive">
																		<tbody>
									                                        <tr>
									                                        	<td class="text-right">嘉宾姓名：</td>
									                                        	<td>${li.chinese_name}</td>
									                                        	<td class="text-right">英文姓名：</td>
									                                        	<td>${li.english_name}</td>
									                                        </tr>
									                                        <tr>
									                                        	<td class="text-right">性别：</td>
									                                        	<td>
									                                        		<c:choose>
									                                        			<c:when test="${li.sex == 1}">男</c:when>
									                                        			<c:when test="${li.sex == 2}">女</c:when>
									                                        			<c:otherwise></c:otherwise>
									                                        		</c:choose>
									                                        	</td>
									                                        	<td class="text-right">国籍：</td>
									                                        	<td>${li.national}</td>
									                                        </tr>
									                                        <tr>
									                                        	<td class="text-right">单位：</td>
									                                        	<td>${li.ch_organ_name}</td>
									                                        	<td class="text-right">职务：</td>
									                                        	<td>${li.post}</td>
									                                        </tr>
									                                        <tr>
									                                        	<td class="text-right">酒店名称：</td>
									                                        	<td>${li.hotel_name}</td>
									                                        	<td class="text-right">酒店地址：</td>
									                                        	<td>${li.hotel_addr}</td>
									                                        </tr>
																			<tr>
																				<td class="text-right">房间类型：</td>
																				<td>${li.room_type_name}</td>
																				<td class="text-right">房号：</td>
																				<td>${li.room_num}</td>
																			</tr>
									                                        <tr>
									                                        	<td class="text-right">入住时间：</td>
									                                        	<td>${li.checkin_time}</td>
									                                        	<td></td>
									                                        	<td></td>
									                                        </tr>
																			<tr>
																				<td class="text-right">同宿人员安排：</td>
																				<td>
																					<c:choose>
																						<c:when test="${li.with_roommate == 0}">不与其他人同宿</c:when>
																						<c:when test="${li.with_roommate == 1}">大会随机分配同宿人员</c:when>
																						<c:when test="${li.with_roommate == 2}">指定同宿人员</c:when>
																						<c:otherwise></c:otherwise>
																					</c:choose>
																				</td>
																				<td class="text-right">是否需要无烟楼层：</td>
																				<td>
																					<c:choose>
																						<c:when test="${li.is_smoking == 1}">吸烟楼层</c:when>
																						<c:when test="${li.is_smoking == 1}">不吸烟楼层</c:when>
																						<c:otherwise></c:otherwise>
																					</c:choose>
																				</td>
																			</tr>
																			<tr >
																				<td class="text-right">酒店审核状态：</td>
																				<td>
																					<c:choose>
																						<c:when test="${li.status == 0}">待审核</c:when>
																						<c:when test="${li.status == 1}">审核通过</c:when>
																						<c:when test="${li.status == 2}">审核拒绝</c:when>
																						<c:otherwise></c:otherwise>
																					</c:choose>
																				</td>
																				<td></td>
																				<td></td>
																			</tr>
																		</tbody>
																	</table>
													                </div>
													           </div>
														</div>
									
													</div>
													<!-- /.modal-content -->
												</div>
									        </div>
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
				</form>
				<!-- /.panel -->
			</div>
			<!-- /.col-lg-12 -->
		</div>
		<!-- /.row -->
	       
			<div id="check_info_about_guest" class="modal fade modalRefresh" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">

					</div>
				</div>
	        </div>
	        
			<!-- jQuery -->
			<script src="${contextPath}/CLMF-adminUI-dev/bower_components/jquery/dist/jquery.min.js"></script>
	
			<!-- Bootstrap Core JavaScript -->
			<script src="${contextPath}/CLMF-adminUI-dev/bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
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