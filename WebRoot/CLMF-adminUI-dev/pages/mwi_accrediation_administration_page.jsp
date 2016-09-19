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

		<title>嘉宾报到之制证管理</title>

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

			<div class="col-lg-12">

				<div class="panel panel-primary">

					<div class="panel-heading">
						<p class="text-capitalize"><span class="fa fa-info-circle fa-2x mr5"></span>制证管理
							<span class="pull-right">
                                <button type="button" class="btn  btn-warning" onclick="toLost()" data-toggle="modal" data-target="#recheckCard"><span class="fa fa-reddit mr5"></span>挂失重办</button>
                                <button type="button" class="btn  btn-warning"><span class="fa fa-print mr5"></span>证件打印</button>
								<button type="button" class="btn  btn-warning" data-toggle="modal" data-target="#invokeCard"><span class="fa fa-ambulance mr5"></span>证件激活</button>
							</span>
						</p>
					</div>
					<!-- /.panel-heading -->
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
								<a href="${contextPath}/makeLicense?flag=1"> 嘉宾制证</a>
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
								<a href="${contextPath}/makeLicense?flag=2">工作人员</a>
							</li>
	
							<c:choose>
								<c:when test="${flag == 3}">
									<li class="active">
								</c:when>
								<c:otherwise>
									<li >
								</c:otherwise>
							</c:choose>
								<a href="${contextPath}/makeLicense?flag=3">志愿者</a>
							</li>
						
						</ul>
						<div id="myTabContent" class="tab-content">
							<c:choose>
								<c:when test="${flag == 1}">
									<div class="tab-pane fade in active" id="guest">
								</c:when>
								<c:otherwise>
									<div class="tab-pane fade in" id="guest">
								</c:otherwise>
							</c:choose>
								<div class="panel panel-success">
									<!-- /.panel-heading -->
									<div class="panel-body">
										<table class="table table-responsive table-hover table-striped">
											<form action="${contextPath}/makeLicense" method="post">
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
															证件号：
															<input type="text" name="licenseNum" value="${licenseNum}" placeholder="请输入证件号" />
														</span>
														<span>
															证件激活状态：
															<select name="isActive">
																<c:choose>
																	<c:when test="${isActive ==1}">
																		<option value="">全部</option>
																		<option selected="selected" value="1">已激活</option>
																		<option value="0">未激活</option>
																	</c:when>
																	<c:when test="${isActive ==0}">
																		<option value="">全部</option>
																		<option value="1">已激活</option>
																		<option selected="selected" value="0">未激活</option>
																	</c:when>
																	<c:otherwise>
																		<option value="">全部</option>
																		<option value="1">已激活</option>
																		<option value="0">未激活</option>
																	</c:otherwise>
																</c:choose>
																
															</select>
														</span>
														<span>
															<button class="btn btn-primary">查询<b class="fa fa-search ml5"></b></button>
															<button type="button" class="btn btn-primary ad_query_button">高级查询</button>
														</span>
														<span>
															<label>记录总数：<b class="red-text">${guestCount}</b>条</label>
														</span>
														<span class="fr">
															<a href="${contextPath}/makeLicense/toAdd?flag=4" class="btn btn-primary" data-toggle="modal" data-target="#add_info_about_guest">增加嘉宾信息</a>
														</span>
													</div>
													<div class="pull-left ad_query">
														<span>
															单位职务：
															<input type="text" name="post" value="${post}" placeholder="请输入单位职务" />
														</span>
														<span>
															嘉宾类别：
															<select name="guestType">
																<option value="">不限</option>
																<c:forEach items="${guestTypeList}" var="gtl">
																	<c:choose>
																		<c:when test="${guestType == gtl.id}"><option selected="selected" value="${gtl.id}">${gtl.type_name}</option></c:when>
																		<c:otherwise><option value="${gtl.id}">${gtl.type_name}</option></c:otherwise>
																	</c:choose>
																</c:forEach>
															</select>
														</span>
													</div>
												</caption>
											</form>
											<thead>
												<tr>
													<th><label>全选<input type="checkbox" class="checkAll"></label></th>
													<th>序号</th>
													<th>嘉宾姓名</th>
													<th>英文姓名</th>
													<th>单位职务</th>
													<th>嘉宾类别</th>
													<th>证件号</th>
													<th>证卡编码</th>
													<th>证件状态</th>
													<th>操作</th>
												</tr>
											</thead>
											<tbody>
												<c:forEach items="${guestPage.list}" var="gpl" varStatus="s">
													<tr>
														<td><input name="ids" value="${gpl.card_id}" type="checkbox"></td>
														<td>${s.index+1}</td>
														<td>${gpl.chinese_name}</td>
														<td>${gpl.english_name}</td>
														<td>${gpl.post}</td>
														<td>${gpl.type_name}</td>
														<td>${gpl.license_num}</td>
														<td>
															${gpl.cert_num}
														</td>
														<c:choose>
															<c:when test="${gpl.is_active == 1}"><td>激活</td></c:when>
															<c:otherwise><td>未激活</td></c:otherwise>
														</c:choose>
														<td>
															<a href="${contextPath}/guestInfo/toEditGuest?guestId=${gpl.guestId}&flag=3" class="btn btn-primary" data-toggle="modal" data-target="#add_info_about_guest">修改嘉宾信息</a>
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
									<div class="tab-pane fade in active" id="staff">
								</c:when>
								<c:otherwise>
									<div class="tab-pane fade in" id="staff">
								</c:otherwise>
							</c:choose>
								<div class="panel panel-success">
									<!-- /.panel-heading -->
									<div class="panel-body">
										<table class="table table-responsive table-hover table-striped">
											<form action="${contextPath}/makeLicense?flag=2" method="post">
												<caption>
													<div class="pull-left query">
														<span>
															工作人员姓名：
															<input type="text" name="realName" value="${realName}" placeholder="工作人员姓名" />
														</span>
														<span>
															职务：
															<input type="text" name="post" value="${post}" placeholder="工作人员职位" />
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
															证件号：
															<input type="text" name="licenseNum" value="${licenseNum}" placeholder="证件号" />
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
													<th><label>全选<input type="checkbox" class="checkAll"></label></th>
													<th>序号</th>
													<th>工作人员姓名</th>
													<th>职务</th>
													<th>工作组</th>
													<th>证件号</th>
													<th>证卡编码</th>
													<th>证件状态</th>
												</tr>
											</thead>
											<tbody>
												<c:forEach items="${workerPage.list}" var="wpl" varStatus="s">
													<tr>
														<td><input name="ids" value="${wpl.card_id}" type="checkbox"></td>
														<td>${s.index+1}</td>
														<td>${wpl.realname}</td>
														<td>${wpl.post}</td>
														<td>${wpl.work_group}</td>
														<td>${wpl.license_num}</td>
														<td>${wpl.cert_num}</td>
														<c:choose>
															<c:when test="${wpl.card_status == 1}"><td>激活</td></c:when>
															<c:otherwise><td>未激活</td></c:otherwise>
														</c:choose>
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
								<c:when test="${flag == 3}">
									<div class="tab-pane fade in active" id="volunteer">
								</c:when>
								<c:otherwise>
									<div class="tab-pane fade in" id="volunteer">
								</c:otherwise>
							</c:choose>
								<div class="panel panel-success">
									<!-- /.panel-heading -->
									<div class="panel-body">
										<table class="table table-responsive table-hover table-striped">
											<form action="${contextPath}/makeLicense?flag=3" method="post">
												<caption>
													<div class="pull-left query">
														<span>
															工作人员姓名：
															<input type="text" name="realName" value="${realName}" placeholder="志愿者姓名" />
														</span>
														<span>
															志愿者学校：
															<input type="text" name="unit" value="${unit}" placeholder="志愿者学校" />
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
															证件号：
															<input type="text" name="licenseNum" value="${licenseNum}" placeholder="证件号" />
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
													<th><label>全选<input type="checkbox" class="checkAll"></label></th>
													<th>序号</th>
													<th>志愿者姓名</th>
													<th>学校</th>
													<th>工作组</th>
													<th>证件号</th>
													<th>证卡编码</th>
													<th>证件状态</th>
												</tr>
											</thead>
											<tbody>
												<c:forEach items="${supporterPage.list}" var="spl" varStatus="s">
													<tr>
														<td><input name="ids" value="${spl.card_id}" type="checkbox"></td>
														<td>${s.index+1}</td>
														<td>${spl.realname}</td>
														<td>${spl.unit}1</td>
														<td>${spl.work_group}</td>
														<td>${spl.license_num}</td>
														<td>${spl.cert_num}</td>
														<c:choose>
															<c:when test="${spl.card_status == 1}"><td>激活</td></c:when>
															<c:otherwise><td>未激活</td></c:otherwise>
														</c:choose>
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
					<!-- /.panel-body -->
				</div>
				<!-- /.panel -->
			</div>
			<!-- /.col-lg-12 -->
		</div>
		<!-- /.row -->
		<div id="add_info_about_guest" class="modal fade modalRefresh" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
				</div>
				<!-- /.modal-content -->
			</div>
		</div>
		<!-- 挂失 -->
		<form action="${contextPath}/makeLicense/lost/${flag}">
			<div class="modal fade" id="recheckCard" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="margin-top:15%;">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header" style="border-radius:6px 6px 0 0 ;">
							<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
								&times;
							</button>
							<h4 class="modal-title" id="">挂失重办</h4>
							<input type="hidden" value="" name="lostIds" />
						</div>
						<div class="modal-body text-center">
							<div class="text-center text-info">
								确定要挂失吗？
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
		</form>
		
		<div class="modal fade" id="invokeCard" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="margin-top:15%;">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header" style="border-radius:6px 6px 0 0 ;">
						<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
							&times;
						</button>
						<h4 class="modal-title" id="">
													  证件激活
						</h4>
					</div>
					<div class="modal-body text-center">
						<div class="text-center text-info">
							确定要激活证件卡吗？
						</div>
						<div class="text-center mt20">
							<button class="btn btn-danger mr10" data-toggle="modal" data-target="#checkingCard">确定</button>
							<button class="btn btn-success" data-dismiss="modal" aria-hidden="true">取消</button>
						</div>
					</div>
				</div>
				<!-- /.modal-content -->
			</div>
			<!-- /.modal -->
		</div>
		<div class="modal fade" id="checkingCard" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="margin-top:15%;">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header" style="border-radius:6px 6px 0 0 ;">
						<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
							&times;
						</button>
						<h4 class="modal-title" id="">
													  证件激活
						</h4>
					</div>
					<div class="modal-body text-center">
						<div class="text-center text-info">
							证件正在激活，请稍后....
						</div>
					</div>
				</div>
				<!-- /.modal-content -->
			</div>
			<!-- /.modal -->
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
		
		<script src="${contextPath}/CLMF-adminUI-dev/bower_components/paginator/paginator.min.js"></script>

		<script src="${contextPath}/CLMF-adminUI-dev/dist/js/page/page.js"></script>
		
		<script src="${contextPath}/CLMF-adminUI-dev/dist/js/mwi_tables/valid.js"></script>
		<!-- Page-Level Demo Scripts - Tables - Use for reference -->
		<script type="text/javascript">
			$(function(){
				if(getCookie('editCode') == 1){
					alert("修改成功！");
					delCookie('editCode');
					alert("edit code111:-- "+getCookie('editCode'));
				}else if(getCookie('editCode') == 0){
					alert("修改失败！");
					delCookie('editCode');
				}else if(getCookie('addCode') == 1){
					alert("添加成功！");
					delCookie('addCode');
				}else if(getCookie('addCode') == 0){
					alert("添加失败！");
					delCookie('addCode');
				}
			});
			
			function getCookie(name){
			    var arr,reg=new RegExp("(^| )"+name+"=([^;]*)(;|$)");
			    if(arr=document.cookie.match(reg))
			        return (arr[2]);
			    else
			        return null;
			}
			
			function delCookie(name){
			    var exp = new Date();
			    exp.setTime(exp.getTime() - 1);
			    var cval=getCookie(name);
			    if(cval!=null)
			        document.cookie= name + "="+cval+";expires="+exp.toGMTString();
			}
		
			function getProjectName(){
				var pathName = window.document.location.pathname;
				var projectName = pathName.substring(0,pathName.substr(1).indexOf('/')+1);
				return projectName;
			}
			
			function toLost(){
				var idsArr = new Array();
				var idsStr = "";
				idsArr = document.getElementsByName("ids");
				for(var i=0; i<idsArr.length; i++){
					if(idsArr[i].checked && idsArr[i].value != 0){
						idsStr = idsStr + idsArr[i].value;
						idsStr = idsStr + ",";
					}
				}
				$("input[name='lostIds']").val(idsStr);
			}
			
			
		</script>
	</body>

</html>