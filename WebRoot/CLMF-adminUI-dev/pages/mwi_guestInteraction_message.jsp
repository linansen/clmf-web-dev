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

		<title>嘉宾互动之短信发送</title>

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

			<!-- /.后台公布的短信 -->
			<div class="col-lg-12">

				<div class="panel panel-primary">

					<div class="panel-heading">
						<p class="text-capitalize"><span class="fa fa-envelope-o fa-rotate-180 fa-2x"></span>&nbsp;&nbsp;&nbsp;短信布告：</p>
					</div>

					<!-- /.panel-heading -->
					<div class="panel-body">

						<table class="table table-responsive table-bordered table-hover">
							<form method="post" action="${contextPath}/messageNotice">
								<caption>
									<div class="pull-left" id="query">
										<span>
											中文姓名：
											<input type="text" name="chineseName" value="${chineseName}" placeholder="请输入中文姓名">
										</span>
										<span>
											英文姓名：
											<input type="text" name="englishName" value="${englishName}" placeholder="请输入英文姓名">
										</span>
										<span>
											单位职务：
											<input type="text" name="post" value="${post}" placeholder="请输入单位职务">
										</span>
										<span>
											手机号码：
											<input type="text" name="phone" value="${phone}" placeholder="请输入手机号码">
										</span>
										<span>
											国籍：
											<select name="national">
												<option value="">全部</option>
												<c:forEach items="${country}" var="c">
													<c:choose>
														<c:when test="${national == c.zh_country_name}">
															<option selected="selected" value="${c.zh_country_name}">${c.zh_country_name}</option>
														</c:when>
														<c:otherwise>
															<option value="${c.zh_country_name}">${c.zh_country_name}</option>
														</c:otherwise>
													</c:choose>
												</c:forEach>
											</select>
										</span>
						     	        <span>
											<button class="btn btn-primary">查询<b class="fa fa-search ml5"></b></button>
										</span>
										<span>
											<label>记录总数：<b class="red-text">${count}</b>条</label>
										</span>
						     	        <span class=" pull-right">
											<button type="button" onclick="toBatchSend()" class="btn btn-success" data-toggle="modal" data-target="#message_send">批量推送短信</button>
										</span>
									</div>
								</caption>
							</form>
							<thead>
								<tr>
									<th><label>选择<input type="checkbox" class="checkAll"></label></th>
									<th>嘉宾姓名</th>
									<th>英文姓名</th>
									<th>手机号码</th>
									<th>国家</th>
									<th>参会类型</th>
									<th>参会身份</th>
									<th>发送短信数</th>
									<th>操作</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${guestPage.list}" var="gpl" varStatus="s">
									<tr>
										<td><input name="ids" value="${gpl.guestId}" type="checkbox"></td>
										<td id="cName${gpl.guestId}">${gpl.chinese_name}</td>
										<td>${gpl.english_name}</td>
										<td id="mobile${gpl.guestId}">${gpl.mobile}</td>
										<td>${gpl.national}</td>
										<td>贵阳华文论坛</td>
										<td>${gpl.type_name}</td>
										<td>${gpl.sendCount}</td>
										<td>
											<button class="btn btn-sm btn-warning" data-toggle="modal" data-target="#message_send${gpl.guestId}"><span class="fa fa-envelope fa-rotate-180 mr5"></span>发送短信</button>
											<!-- 短信发送 -->
											<div class="modal fade" id="message_send${gpl.guestId}" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
												<div class="modal-dialog">
													<div class="modal-content">
														<div class="modal-header">
															<button type="button" class="close" data-dismiss="modal" aria-hidden="true"> &times; </button>
															<h4 class="modal-title" id="myModalLabel"><span class="fa fa-envelope-square fa-2x"></span> 短信公布</h4>
														</div>
														<div class="modal-body">
															<div class="panel panel-primary">
																<div class=" panel-heading">
																	短信推送<span class="fa fa-envelope-square ml5"></span>
																</div>
																<div class="panel-body">
																	<form action="${contextPath}/messageNotice/sendSms/${gpl.mobile}-${gpl.guestId}" method="post">
																		<table class="table table-hover table-condensed table-responsive">
																			<tbody>
																				<tr>
																					<td>收件人：</td>
																					<td>
																						<button class="btn btn-default btn-sm mt5">${gpl.mobile}(${gpl.chinese_name})</button>
																					</td>
																				</tr>
																				<tr>
																					<td>短信标题:</td>
																					<td>
																						<input type="text" placeholder="请输入短信标题" name="message_title" />
																					</td>
																				</tr>
																				<tr>
																					<td>短信内容</td>
																					<td><textarea rows="7" cols="70" name="message_content"></textarea></td>
																				</tr>
																				<tr>
																					<td colspan="2" class="text-center">
																						<input type="submit" value="发送短信" id="only_send_message" class="btn btn-primary"/>
																					</td>
																				</tr>
																			</tbody>
																		</table>
																	</form>
																</div>
															</div>
														</div>
													</div>
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
								<input type="number" name="select_guest_name" style="width: 40px !important;"/>
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
				<!-- /.panel -->
			</div>
			<!-- /.col-lg-12 -->

		</div>
		<!-- /.row -->

		<!-- 邮件模态框（Modal） -->
		<div class="modal fade" id="message_send" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-hidden="true"> &times; </button>
						<h4 class="modal-title" id="myModalLabel"><span class="fa fa-envelope-square fa-2x"></span> 短信公布</h4>
					</div>
					<div class="modal-body">
						<div class="panel panel-primary">
							<div class=" panel-heading">
								短信推送<span class="fa fa-envelope-square ml5"></span>
							</div>
							<div class="panel-body">
								<form action="${contextPath}/messageNotice/batchSendSms" method="post">
									<table class="table table-hover table-condensed table-responsive">
										<tbody>
											<tr>
												<td>收件人：</td>
												<td id="contact">
													<!-- <button class="btn btn-default btn-sm mt5">13826666666(林岸森)</button>
													<button class="btn btn-default btn-sm mt5">13333333333(林岸森)</button> -->
												</td>
											</tr>
											<tr>
												<td>短信标题:</td>
												<td>
													<input type="text" placeholder="请输入短信标题" name="message_title" />
													<input type="hidden" name="guestIds">
													<input type="hidden" name="mobileNos">
												</td>
											</tr>
											<tr>
												<td>短信内容</td>
												<td><textarea rows="7" name="message_content" cols="70"></textarea></td>
											</tr>
											<tr>
												<td colspan="2" class="text-center">
													<input type="submit" value="发送短信" id="only_send_message" class="btn btn-primary"/>
												</td>
											</tr>
										</tbody>
									</table>
								</form>
							</div>

						</div>

					</div>

				</div>
				<!-- /.modal-content -->
			</div>
			<!-- /.modal -->
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
		<script type="text/javascript">
			function getProjectName(){
				var pathName = window.document.location.pathname;
				var projectName = pathName.substring(0,pathName.substr(1).indexOf('/')+1);
				return projectName;
			}
			
			
			function toBatchSend(){
				var idsArr = new Array();
				var checkedIds = new Array();
				var mobileNos = new Array();
				idsArr = document.getElementsByName("ids");
				for(var i=0; i<idsArr.length; i++){
					if(idsArr[i].checked){
						$("#contact").append(
							"<button class='btn btn-default btn-sm mt5'>"+$("#cName"+idsArr[i].value).text()+"("+$("#mobile"+idsArr[i].value).text()+")</button>"		
						);
						mobileNos.push($("#mobile"+idsArr[i].value).text());
						checkedIds.push(idsArr[i].value);
					}
				}
				$("input[name='mobileNos']").val(mobileNos.toString());
				$("input[name='guestIds']").val(checkedIds.toString());
			}
		
		</script>
	</body>

</html>
