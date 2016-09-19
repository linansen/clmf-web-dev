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

		<title>活动报名之报名管理</title>

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

			<!-- /.后台公布的邮件 -->
			<div class="col-lg-12">
			
				<div class="panel panel-primary">

					<div class="panel-heading">
						<p class="text-capitalize "><span class="fa fa-road fa-rotate-180 fa-2x mr5"></span>活动路线报名管理：</p>
					</div>

					<!-- /.panel-heading -->
					<div class="panel-body">

						<table class="table table-responsive table-hover">
						<form action="${contextPath}/activity_signup" method="post" class="form">
						<!-- page -->
						<input type="hidden" class="pageIndex" name="pageNumber" value='<c:out value="${pageNumber}" default="1"/>'>
						<input type="hidden" class="pageSize" name="pageSize" value='<c:out value="${pageSize}" default="10"/>'>
						<input type="hidden" class="totalPages" name="totalPage" value='<c:out value="${totalPage}" default="1"/>'>
						<!-- page -->
							<caption>
								<div class="pull-left query">
									<span>
										嘉宾姓名：
										<input type="text" name="chineseName" value="${chineseName}" placeholder="请输入嘉宾姓名" />
									</span>
									<span>
										英文姓名：
										<input type="text" name="englishName" value="${englishName}" placeholder="请输入英文姓名" />
									</span>
									<span>
										单位职务：
										<input type="text" name="post" value="${post}" placeholder="请输入单位职务" />
									</span>
									<span>
										国籍：
										<select>
											<option>所有国家</option>
										</select>
										<%-- <input type="text" name="national" value="${national}" placeholder="请输入国籍" /> --%>
									</span>
									<span>
										<button type="submit" class="btn btn-primary">查询<b class="fa fa-search ml5"></b></button>
										<!-- <button type="button" class="btn btn-primary ad_query_button">高级查询</button> -->
									</span>
									<span>
										<label>记录总数：<b class="red-text">${count}</b>条</label>
									</span>
									<span class="pull-right">
					     	        	 <button type="button" onclick="toBatchAudit()" class="btn btn-success" data-toggle="modal" data-target="#activity_route_details">批量审核<b class="fa fa-check ml5"></b></button>
					     	        	 <button type="button" class="btn btn-danger" data-toggle="modal" data-target="#delNotice">批量审核<b class="fa fa-remove ml5"></b></button>
									</span>
								</div>
								<div class="pull-left ad_query">
									<span>
										活动路线:
										<select name="routeId" id="activity_road">
											<option value="">不限</option>
											<c:forEach items="${onlyRouteList}" var="orl">
												<c:choose>
													<c:when test="${routeId == orl.id}">
														<option selected="selected" value="${orl.id}">${orl.route_nicName}：${orl.route_content}(${orl.route_name})</option>
													</c:when>
													<c:otherwise>
														<option value="${orl.id}">${orl.route_nicName}：${orl.route_content}(${orl.route_name})</option>
													</c:otherwise>
												</c:choose>
											</c:forEach>
										</select>
									</span>
									<span>
										路线审核状态：
										<select name="routeAuditStatus">
											<c:choose>
												<c:when test="${routeAuditStatus == 0}">
													<option value="">不限</option>
													<option selected="selected" value="0">待审核</option>
													<option value="1">审核通过</option>
													<option value="2">拒绝通过</option>
												</c:when>
												<c:when test="${routeAuditStatus == 1}">
													<option value="">不限</option>
													<option value="0">待审核</option>
													<option selected="selected" value="1">审核通过</option>
													<option value="2">拒绝通过</option>
												</c:when>
												<c:when test="${routeAuditStatus == 2}">
													<option value="">不限</option>
													<option value="0">待审核</option>
													<option value="1">审核通过</option>
													<option selected="selected" value="2">拒绝通过</option>
												</c:when>
												<c:otherwise>
													<option selected="selected" value="">不限</option>
													<option value="0">待审核</option>
													<option value="1">审核通过</option>
													<option value="2">拒绝通过</option>
												</c:otherwise>
											</c:choose>
										</select>
									</span>
									<span>
										活动日期：
										<input type="text" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd',readOnly:true})" name="selectDate" value="${selectDate}" placeholder="请选择活动日期">
									</span>
								</div>
							</caption>
							</form>
							<thead>
								<tr>
									<th>
										<label>选择<input type="checkbox" class="checkAll"></label>
									</th>
									<th>嘉宾姓名</th>
									<th>英文姓名</th>
									<th>国籍</th>
									<th>单位职务</th>
									<th style="width: 30%;">路线名</th>
									<th>审核状态</th>
									<th>操作</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${guestRouteList.list}" var="grll">
									<tr>
										<td><input type="checkbox" name="batch_audit_guestId" value="${grll.id}"></td>
										<td>${grll.chinese_name}</td>
										<td>${grll.english_name}</td>
										<td>${grll.national}</td>
										<td>${grll.post}</td>
										<td class="staff" width="30%" style="position: absolute;">
											<c:if test="${grll.routeList[0] != null}">
												(${grll.routeList[0].route_nicName})${grll.routeList[0].route_content}(${grll.routeList[0].route_start_time} ~ ${grll.routeList[0].route_end_time})
											</c:if>
											<div class="table-tooltip">
												<c:forEach items="${grll.routeList}" var="grllrl">
													<span>${grllrl.route_nicName}[${grllrl.route_content}](${grllrl.route_start_time} ~ ${grllrl.route_end_time})-限定名额(${grllrl.limit_num})-已报名(${grllrl.regist_num})</span>
												</c:forEach>
											</div>
										</td>
										<c:choose>
											<c:when test="${grll.routeList[0].route_audit_status == 1}"><td>审核通过</td></c:when>
											<c:when test="${grll.routeList[0].route_audit_status == 2}"><td>拒绝通过</td></c:when>
											<c:otherwise><td>待审核</td></c:otherwise>
										</c:choose>
										<td>
											<button onclick="toAuditRoute('${grll.id}')" type="button" class="btn btn-sm btn-success" data-toggle="modal" data-target="#activity_route_detail${grll.id}">
												审核<span class="fa fa-check-square-o fa-rotate-180 ml5"></span>
											</button>
											<button type="button" class="btn btn-sm btn-danger" data-toggle="modal" data-target="#delNotice">
												删除<span class="fa fa-remove ml5"></span>
											</button>
											<div class="modal fade" id="activity_route_detail${grll.id}" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="top:50px !important;">
												<form action="${contextPath}/activity_signup/auditRoute" method="post">
													<div class="modal-dialog" style="width:800px !important;">
														<div class="modal-content">
															<div class="modal-body">
																<div class="panel panel-primary">
																	<div class=" panel-heading">
																		<div class="pull-left">
																			<h5>路线审核<span class="fa fa-envelope-square ml5"></span></h5>
																		</div>
																		<div class="pull-right">
										                        			<button class="btn btn-sm btn-warning">保存<span class="fa fa-envelope fa-rotate-180 mr5"></span></button>
										                    				<button class="btn btn-info btn-sm" data-dismiss="modal">关闭<span class="fa fa-power-off ml5"></span></button>
																		</div>
																		<div class="clearfix"></div>
																	</div>
																	<div class="panel-body">
																		<table class="table table-hover table-condensed table-responsive" style="text-align:left !important;">
																			<tbody>
																				<tr>
																					<input type="hidden" value="${grll.id}" name="audit_guestId" />
																					<td width="25%">嘉宾名称:</td>
																					<td id="auditGuestName">${grll.chinese_name}</td>
																				</tr>
																				<tr>
																					<td>国籍:</td>
																					<td id="auditNational">${grll.national}</td>
																				</tr>
																				<tr>
																					<td>单位职务：</td>
																					<td id="auditPost">${grll.post}</td>
																				</tr>
																				<tr>
																					<td><button type="button" class="btn btn-sm btn-primary clearChooseLine">清空选择</button>路线内容:</td>
																					<td class="text-left">
																						<div>
																							<p>8月23号：</p>
																							<c:forEach items="${routeList}" var="rl">
																								<c:if test="${rl.route_start_time == '2015-08-23'}">
																									<c:choose>
																										<c:when test="${rl.id == grll.route_id}">
																											<p class="ml20"><label><input type="radio" name="audit_routeId1" checked="checked" value="${rl.id}">${rl.route_nicName }:${rl.route_content}(${rl.route_start_time}-${rl.route_end_time})-限定名额(${rl.limit_num})-已报名(${rl.regist_num})</label></p>		
																										</c:when>
																										<c:otherwise>
																											<p class="ml20"><label><input type="radio" name="audit_routeId1" value="${rl.id}">${rl.route_nicName }:${rl.route_content}(${rl.route_start_time}-${rl.route_end_time})-限定名额(${rl.limit_num})-已报名(${rl.regist_num})</label></p>
																										</c:otherwise>
																									</c:choose>
																									
																								</c:if>
																							</c:forEach>
																						</div>
																						<div>
																							<p>8月24号：</p>
																							<c:forEach items="${routeList}" var="rl">
																								<c:if test="${rl.route_start_time == '2015-08-24'}">
																									<c:choose>
																										<c:when test="${rl.id == grll.route_id}">
																											<p class="ml20"><label><input type="radio" name="audit_routeId1" checked="checked" value="${rl.id}">${rl.route_nicName }:${rl.route_content}(${rl.route_start_time}-${rl.route_end_time})-限定名额(${rl.limit_num})-已报名(${rl.regist_num})</label></p>		
																										</c:when>
																										<c:otherwise>
																											<p class="ml20"><label><input type="radio" name="audit_routeId1" value="${rl.id}">${rl.route_nicName }:${rl.route_content}(${rl.route_start_time}-${rl.route_end_time})-限定名额(${rl.limit_num})-已报名(${rl.regist_num})</label></p>
																										</c:otherwise>
																									</c:choose>
																									
																								</c:if>
																							</c:forEach>
																						</div>
																						<div>
																							<p>8月25号之后：</p>
																							<c:forEach items="${routeList}" var="rl">
																								<c:if test="${rl.route_start_time >= '2015-08-25'}">
																									<c:choose>
																										<c:when test="${rl.id == grll.route_id}">
																											<p class="ml20"><label><input type="radio" name="audit_routeId2" checked="checked" value="${rl.id}">${rl.route_nicName }:${rl.route_content}(${rl.route_start_time}-${rl.route_end_time})-限定名额(${rl.limit_num})-已报名(${rl.regist_num})</label></p>		
																										</c:when>
																										<c:otherwise>
																											<p class="ml20"><label><input type="radio" name="audit_routeId2" value="${rl.id}">${rl.route_nicName }:${rl.route_content}(${rl.route_start_time}-${rl.route_end_time})-限定名额(${rl.limit_num})-已报名(${rl.regist_num})</label></p>
																										</c:otherwise>
																									</c:choose>
																								</c:if>
																							</c:forEach>
																						</div>
																					</td>
																				</tr>
																				<tr>
																					<td>
																						审核是否通过：
																					</td>
																					<td colspan="">
																						<label class="mr10"><input type="radio" name="lineCheck" checked="checked">通过</label>
																						<label><input type="radio" name="lineCheck">不通过</label>
																					</td>
																				</tr>
																				<tr>
																					<td></td>
																					<td>
																						<label class="mr20"><input type="checkbox" name="if_message" checked="checked">发送微信给嘉宾</label>
																						<label><input type="checkbox" name="if_message" checked="checked">发送邮件给嘉宾</label>
																					</td>
																				</tr>
																				<tr>
																					<td></td>
																					<td colspan="">
																						<label class="mr20"><input type="checkbox" name="if_message" checked="checked">发送短信给工作人员和志愿者</label>
																						<label><input type="checkbox" name="if_message" checked="checked">发送微信给工作人员和志愿者</label>
																					</td>
																				</tr>
																			</tbody>
																		</table>
																	</div>
																</div>
															</div>
														</div>
													</form>
													<!-- /.modal-content -->
												</div>
												<!-- /.modal -->
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
								<select class="pageSizeSelect">
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
			<!-- /.col-lg-12 -->

		</div>
		<!-- /.row -->

		<!-- /#page-wrapper -->

		<!-- 邮件模态框（Modal） -->
		
		<div class="modal fade" id="activity_route_details" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="top:50px !important;">

			<div class="modal-dialog" style="width:800px !important;">
				<div class="modal-content">

					<div class="modal-body">
						<form action="${contextPath}/activity_signup/auditRoute" method="post">
						<div class="panel panel-primary">
							
							<div class=" panel-heading">
								路线审核<span class="fa fa-envelope-square ml5"></span>
								<span class="pull-right">
                        			<button class="btn btn-sm btn-warning">
                    				<span class="fa fa-envelope fa-rotate-180 mr5"></span>保存</button>
                    				<button class="btn btn-info btn-sm" data-dismiss="modal">关闭<span class="fa fa-power-off ml5"></span></button>
								</span>
							</div>
							<div class="panel-body">
									<table class="table table-hover table-condensed table-responsive">
										<tbody>
											<tr>
												<td colspan="2">
													<button type="button" class="btn btn-sm btn-primary clearChooseLine">清空选择</button>
												</td>
											</tr>
											<tr>
												<td width="20%">路线内容:</td>
												<td class="text-left">
													<div>
														<p>8月23号：</p>
														<c:forEach items="${routeList}" var="rl">
															<c:if test="${rl.route_start_time == '2015-08-23'}">
																<p class="ml20"><label><input type="radio" name="audit_routeId1" value="${rl.id}">${rl.route_nicName }:${rl.route_content}(${rl.route_start_time}-${rl.route_end_time})-限定名额(${rl.limit_num})-已报名(${rl.regist_num})</label></p>
															</c:if>
														</c:forEach>
													</div>
													<div>
														<p>8月24号：</p>
														<c:forEach items="${routeList}" var="rl">
															<c:if test="${rl.route_start_time == '2015-08-24'}">
																<p class="ml20"><label><input type="radio" name="audit_routeId1" value="${rl.id}">${rl.route_nicName }:${rl.route_content}(${rl.route_start_time}-${rl.route_end_time})-限定名额(${rl.limit_num})-已报名(${rl.regist_num})</label></p>
															</c:if>
														</c:forEach>
													</div>
													<input type="hidden" name="guestIds" />
													<div>
														<p>8月25号之后：</p>
														<c:forEach items="${routeList}" var="rl">
															<c:if test="${rl.route_start_time >= '2015-08-25'}">
																<p class="ml20"><label><input type="radio" name="audit_routeId2" value="${rl.id}">${rl.route_nicName }:${rl.route_content}(${rl.route_start_time}-${rl.route_end_time})-限定名额(${rl.limit_num})-已报名(${rl.regist_num})</label></p>
															</c:if>
														</c:forEach>
													</div>
													
												</td>
											</tr>
											<tr>
												<td>
													审核是否通过：
												</td>
												<td colspan="">
													<label class="mr10"><input type="radio" name="lineCheck" checked="checked">通过</label>
													<label><input type="radio" name="lineCheck">不通过</label>
												</td>
											</tr>
											<tr>
												<td></td>
												<td>
													<label class="mr20"><input type="checkbox" name="if_message" checked="checked">发送微信给嘉宾</label>
													<label><input type="checkbox" name="if_message" checked="checked">发送邮件给嘉宾</label>
												</td>
											</tr>
											<tr>
												<td></td>
												<td colspan="">
													<label class="mr20"><input type="checkbox" name="if_message" checked="checked">发送短信给工作人员和志愿者</label>
													<label><input type="checkbox" name="if_message" checked="checked">发送微信给工作人员和志愿者</label>
												</td>
											</tr>
										</tbody>
									</table>
							</div>

						</div>
						</form>

					</div>

				</div>
				<!-- /.modal-content -->
			</div>
			<!-- /.modal -->
		</div>
		<div class="modal fade" id="delNotice" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="margin-top:15%;">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header" style="border-radius:6px 6px 0 0 ;">
						<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
							&times;
						</button>
						<h4 class="modal-title" id="myModalLabel">
													  删除记录
						</h4>
					</div>
					<div class="modal-body text-center">
						<div class="text-center text-info">
							确定要删除这条记录吗？
						</div>
						<div class="text-center mt20">
							<button class="btn btn-danger mr10">确定</button>
							<button class="btn btn-success" data-dismiss="modal" aria-hidden="true">取消</button>
						</div>
					</div>
				</div>
				<!-- /.modal-content -->
			</div>
			<!-- /.modal -->
		</div>
		

		<!-- 邮件模态框（Modal） -->
		
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
		
		<script type="text/javascript">
			function getProjectName(){
				var pathName = window.document.location.pathname;
				var projectName = pathName.substring(0,pathName.substr(1).indexOf('/')+1);
				return projectName;
			}
			function toBatchAudit(){
				var guestIds = new Array();
				guestIds = document.getElementsByName("batch_audit_guestId");
				var guestIdsStr = "";
				
				for(var i=0; i<guestIds.length; i++){
					if( guestIds[i].checked){
						guestIdsStr = guestIdsStr + guestIds[i].value;
						guestIdsStr = guestIdsStr + ",";
					}
				}
				$("input[name='guestIds']").val(guestIdsStr);
			}
			$('.clearChooseLine').on('click',function(){
				var lineRadio = $(this).parents('tbody').find('input[type=radio]');
				console.log(lineRadio);
				for(var i=0;i<lineRadio.length;i++){
					$(lineRadio).eq(i).removeAttr('checked');
				}
			});
		</script>

	</body>

</html>