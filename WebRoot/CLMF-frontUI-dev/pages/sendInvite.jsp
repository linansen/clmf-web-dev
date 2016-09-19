<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

	<head>

		<meta charset="utf-8">
		<title>发送邀约</title>
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
		<!--会议日程开始-->
		<div class="row ml10 mr10">
			<!--收到邀约历史开始-->
			<div class="col-md-12 row-body guest-comunicate-center">
					<table class="table table-striped table-responsive table-bordered table-hover ">
						<form action="${contextPath}/invite/sendInvite" method="post" class="pageForm">
						<!-- page -->
						<input type="hidden" class="pageIndex" name="pageNumber" value="${pageNumber}">
						<input type="hidden" class="pageSize" name="pageSize" value="${pageSize}">
						<input type="hidden" class="totalPages" name="totalPage" value="${totalPage}">
						<!-- page -->
							<caption>
								<div id="query">
									
									<span>
										姓名：
										<input type="text" placeholder="邀约人姓名" name="chineseName" value="${chineseName}"/>
									</span>
									<span>
										单位：
										<input type="text" placeholder="邀约人单位" onblur="" name="organName" value="${organName}"/>
									</span>
									<span>
										职务：
										<input type="text" placeholder="邀约人职务" name="post" value="${post}"/>
									</span>
									<span>
										<button type="submit" class="btn btn-primary">
											查询<b class="fa fa-search ml5"></b>
										</button>
									</span>
								</div>
							</caption>
						</form>
						<thead>
							<tr>
								<th>
									<label>全选
										<input type="checkbox" class="checkAll">
									</label>
								</th>
								<th>序号</th>
								<th>邀约人</th>
								<th>邀约人单位</th>
								<th>邀约人职务</th>
								<th>操作</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${guestList4Invite.list}" var="gl4il" varStatus="status">
								<tr>
									<td>
										<input type="checkbox">
									</td>
									<td>${status.index + 1}</td>
									<td style="text-align: center;">${gl4il.chinese_name}&nbsp;</td>
									<td>${gl4il.ch_organ_name }</td>
									<td>${gl4il.post }</td>
									<td>
										<button type="button" onclick="sendInvite('${gl4il.id}')" class="btn btn-sm btn-primary" data-toggle="modal" data-target="#sendModal${gl4il.id}">发出邀约</button>
											<div class="modal fade" id="sendModal${gl4il.id}" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="margin-top:15%;">
												<div class="modal-dialog">
												<form action="${contextPath}/invite/sentInvite" method="post">
													<div class="modal-content">
														<div class="modal-header" style="border-radius:6px 6px 0 0 ;">
															<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
																&times;
															</button>
															<h5>
															<span class="fa fa-send-o"></span>&nbsp;发邀请
														</h5>
														</div>
														<div class="modal-body">
															<table class="table table-striped table-condensed  table-hover table-bordered">
																<thead></thead>
																<tbody>
																	<tr>
																		<td style="text-align: center;">发邀约人:</td>
																		<td>
																			<input type="hidden" name="invite.from_user_id" value="${me.id}">
																			<input type="text" name="invitation" value="${me.chinese_name}" readonly="readonly" />
																		</td>
																	</tr>
																	<tr>
																		<td style="text-align: center;">被邀约人:</td>
																		<td>
																			<input type="hidden" name="invite.to_user_id" value="${gl4il.id}" readonly="readonly" />
																			<input type="text" value="${gl4il.chinese_name}" readonly="readonly" />
																		</td>
																	</tr>
																	<tr>
																		<td style="text-align: center;">邀约主题:</td>
																		<td>
																			<input type="text" name="invite.title" />
																		</td>
																	</tr>
																	<tr>
																		<td style="text-align: center;">邀约内容:</td>
																		<td>
																			<textarea name="invite.content" rows="4" cols="50"></textarea>
																		</td>
																	</tr>
									
																	<tr>
																		<td colspan="2" class="text-center">
																			<button type="submit" class="btn btn-primary">发送邀请</button>
																		</td>
																	</tr>
																</tbody>
															</table>
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
							<div class="pull-left mt25 ml20">
								跳到第
								<input type="number" name="select_guest_name" style="width: 70px !important;" value="${pageNumber}"/>
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
			<!--发送邀约结束结束-->
		</div>
		<!--会议日程结束-->
		<!-- 模态框（Modal） -->
		

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
		<script type="text/javascript" src="${contextPath}/CLMF-frontUI-dev/js/custom.js"></script>
		<script type="text/javascript" src="${contextPath}/CLMF-frontUI-dev/js/valid.js"></script>
		
		<script type="text/javascript" src="${contextPath}/CLMF-frontUI-dev/plugins/paginator/paginator.min.js"></script>
		
		<script src="${contextPath}/CLMF-frontUI-dev/js/page/page.js"></script>
		<script type="text/javascript">
			function getProjectName(){
				var pathName = window.document.location.pathname;
				var projectName = pathName.substring(0,pathName.substr(1).indexOf('/')+1);
				return projectName;
			}
			
			function sendInvite(id){
				
			}
		</script>
		
	</body>

</html>