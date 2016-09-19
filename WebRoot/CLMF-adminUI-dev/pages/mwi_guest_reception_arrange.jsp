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

		<title>接待安排</title>

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
			
			
				<form action="${contextPath}/reception" method="post">
				<!-- page -->
				<input type="hidden" class="pageIndex" name="pageNumber" value='<c:out value="${pageNumber}" default="1"/>'>
				<input type="hidden" class="pageSize" name="pageSize" value='<c:out value="${pageSize}" default="10"/>'>
				<input type="hidden" class="totalPages" name="totalPage" value='<c:out value="${totalPage}" default="1"/>'>
				<!-- page -->
				<div class="panel panel-primary">

					<div class="panel-heading">
						<p class="text-capitalize"><span class="fa fa-info-circle fa-2x mr5"></span>接待安排</p>
					</div>
					<!-- /.panel-heading -->
					<div class="panel-body">
						<div class="add-guest-kind">
							<div>
								<span class="edit_guest_kind_btn">
									嘉宾类别：
									<c:forEach items="${getGuestTypeList}" var="ggt">
										<button type="button" class="btn btn-default" onclick="editGuestType('${ggt.id}');" data-toggle="modal" data-target="#edit_guestKind">${ggt.type_name}</button>
									</c:forEach>
								</span>
								<span class="ml20">
									<button type="button" class="btn btn-primary" id="add_guest_kind_btn" data-toggle="modal" data-target="#add_guestKind">新增嘉宾类别</button>
								</span>
							</div>
							<div class="mt15">
								<span class="edit_principle_btn">
									接待标准：
									<c:forEach items="${receptionStandList}" var="recepStLi">
										<button type="button" class="btn btn-default" onclick="findByStandardId('${recepStLi.id}')" data-toggle="modal" data-target="#edit_principle">${recepStLi.stand_name}</button>
									</c:forEach>
								</span>
								<span class="ml20">
									<button type="button" class="btn btn-primary" id="add_principle_btn" data-toggle="modal" data-target="#add_principle">新增接待标准</button>
								</span>
							</div>
						</div>
						
						<table class="table table-striped table-hover" cellspacing="0" width="80%">
								
							<caption>
								<span class="pull-right mb5">
									<button type="button" onclick="toBatchSetGuestType()" class="btn btn-success" data-toggle="modal" data-target="#chose_guestKind">批量设置嘉宾类别</button>
									<button type="button" onclick="batchSetReceptionStandard();" class="btn btn-success" data-toggle="modal" data-target="#chose_principle">批量设置接待标准</button>
								</span>

								<div class="pull-left" id="query">
									<span>
										中文姓名：
										<input type="text" name="chineseName" value="${chineseName}" placeholder="请输入中文姓名" />
									</span>
									<span>
										英文姓名：
										<input type="text" name="englishName" value="${englishName}" placeholder="请输入英文姓名" />
									</span>
									<span>
										
									</span>
									<span>
										嘉宾类别：
										<select name="guestType">
											<option value="">不限</option>
											<c:forEach items="${getGuestTypeList}" var="ggt">
												<c:choose>
													<c:when test="${guestType ==  ggt.id}">
														<option selected="selected" value="${ggt.id}">${ggt.type_name}</option>	
													</c:when>
													<c:otherwise>
														<option value="${ggt.id}">${ggt.type_name}</option>
													</c:otherwise>
												</c:choose>
												
											</c:forEach>
										</select>
									</span>
									<span>
										接待标准：
										<select name="standardId">
											<option value="">不限</option>
											<c:forEach items="${receptionStandList}" var="rsl">
												<c:choose>
													<c:when test="${standardId ==  rsl.id}">
														<option selected="selected" value="${rsl.id}">${rsl.stand_name}</option>
													</c:when>
													<c:otherwise>
														<option value="${rsl.id}">${rsl.stand_name}</option>
													</c:otherwise>
												</c:choose>
												
											</c:forEach>
										</select>
									</span>
									<span>
										<c:choose>
											<c:when test="${bindGuestType == 0}">
												<label class="ml5"><input type="checkbox" checked="checked" name="bindGuestType" value="0">未设置嘉宾类别</label>
											</c:when>
											<c:otherwise>
												<label class="ml5"><input type="checkbox" name="bindGuestType" value="0">未设置嘉宾类别</label>
											</c:otherwise>
										</c:choose>
										
										<c:choose>
											<c:when test="${isBindReceptionStard == 0}">
												<label class="ml5"><input name="isBindReceptionStard" checked="checked" type="checkbox" value="0">未设置接待标准</label>
											</c:when>
											<c:otherwise>
												<label class="ml5"><input name="isBindReceptionStard" type="checkbox" value="0">未设置接待标准</label>
											</c:otherwise>
										</c:choose>
									</span>
									<span>
										<button class="btn btn-primary">查询<b class="fa fa-search ml5"></b></button>
										<button type="button" class="btn btn-primary" id="ad_query_button">高级查询</button>
									</span>
									<span>
										<label>记录总数：<b class="red-text">${count}</b>条</label>
									</span>
								</div>
								<div class="pull-left" id="ad_query">
									<span>
										国籍：
										<input type="text" name="national" value="${national}" placeholder="请输入国籍" />
									</span>
									<span>
										单位职务：
										<input type="text" name="post" value="${post}" placeholder="请输入单位职务" />
									</span>
								</div>
							</caption>
							<thead>
								<tr>
									<th><label>全选<input type="checkbox" id="checkAll"></label></th>
									<th>序号</th>
									<th>嘉宾姓名</th>
									<th>英文姓名</th>
									<th>国籍</th>
									<th>单位职务</th>
									<th>嘉宾类别</th>
									<th width="15%">接待标准</th>
									<th>操作</th>
								</tr>
							</thead>

							<tbody>
								<c:forEach items="${guestWithreceptionList.list}" var="gwrl" varStatus="status">
									<tr>
										<td><input value="${gwrl.guestId}" name="guestIdCheckbox" type="checkbox"></td>
										<td>${status.index+1}</td>
										<td>${gwrl.chinese_name}</td>
										<td>${gwrl.english_name}</td>
										<td>${gwrl.national}</td>
										<td>${gwrl.post}</td>
										<td>${gwrl.type_name}</td>
										<td class="staff" width="15%" style="position: absolute;">
											${gwrl.receptionList[0].stand_name}
											<div class="table-tooltip">
												<c:forEach items="${gwrl.receptionList}" var="gwrlrl" varStatus="status">
													<span>${gwrlrl.stand_name}</span>
												</c:forEach>
											</div>
										</td>
										<td>
											<button type="button" class="btn btn-success" data-toggle="modal" data-target="#chose_guestKind${gwrl.guestId}">设置嘉宾类别</button>
											<button type="button" class="btn btn-success" data-toggle="modal" data-target="#chose_principle${gwrl.guestId}">设置接待标准</button>
											<!-- 设置接待标准 -->
											<form action="${contextPath}/reception/setGuestReceptionStand/${gwrl.guestId}" method="post">
												<div id="chose_principle${gwrl.guestId}" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
													<div class="modal-dialog">
										
														<div class="modal-content">
										
															<div class="modal-header" style="background-color: rgba(30,40,80,0.8); height: 50px;">
																<h5 class="modal-title pull-left white-text" id="myModalLabel">接待标准选择</h5>
																<div class="pull-right btn-group-sm">
																	<button class="btn btn-warning">保存<span class="fa fa-chain"></span>
																	</button>
																	<button class="btn btn-info" data-dismiss="modal">关闭<span class="fa fa-power-off"></span>
																	</button>
																</div>
															</div>
															<div class="modal-body">
																<div class="add-guest-kind">
																	<div>
																		<span>
																			接待标准：
																			<c:forEach items="${receptionStandList}" var="rsl">
																				<a class="btn btn-default principle"><label><input value="${rsl.id}" name="set.receptionId" type="checkbox">${rsl.stand_name}</label></a>
																			</c:forEach>
																		</span>
																	</div>
																</div>
															</div>
														</div>
														<!-- /.modal-content -->
													</div>
												</div>
											</form>
											<!-- 设置嘉宾类别 -->
											<div id="chose_guestKind${gwrl.guestId}" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
												<div class="modal-dialog">
									
													<div class="modal-content">
									
														<div class="modal-header" style="background-color: rgba(30,40,80,0.8); height: 50px;">
															<h5 class="modal-title pull-left white-text" id="myModalLabel">嘉宾类别选择</h5>
															<div class="pull-right btn-group-sm">
																<button type="button" onclick="setGuestType('${gwrl.guestId}')" class="btn btn-warning">保存<span class="fa fa-chain"></span>
																</button>
																<button type="button" class="btn btn-warning" data-dismiss="modal">关闭<span class="fa fa-power-off"></span>
																</button>
															</div>
														</div>
														<div class="modal-body">
															<div class="add-guest-kind">
																<div>
																	<span>
																		嘉宾类别：
																		<c:forEach items="${getGuestTypeList}" var="ggtl">
																			<a class="btn btn-default guestKind"><label><input type="radio" value="${ggtl.id}" name="set.guestType">${ggtl.type_name}</label></a>
																		</c:forEach>
																	</span>
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
		
		<!-- 批量设置接待标准 -->
		<form action="${contextPath}/reception/batchSetGuestReceptionStand" method="post">
			<div id="chose_principle" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header" style="background-color: rgba(30,40,80,0.8); height: 50px;">
							<h5 class="modal-title pull-left white-text" id="myModalLabel">接待标准选择</h5>
							<div class="pull-right btn-group-sm">
								<input type="hidden" name="reception.guestIds" />
								<button class="btn btn-warning">保存<span class="fa fa-chain"></span>
								</button>
								<button class="btn btn-info" data-dismiss="modal">关闭<span class="fa fa-power-off"></span>
								</button>
							</div>
						</div>
						<div class="modal-body">
							<div class="add-guest-kind">
								<div>
									<span>
										接待标准：
										<c:forEach items="${receptionStandList}" var="rsl">
											<a class="btn btn-default principle"><label><input name="set.receptionIds" value="${rsl.id}" type="checkbox">${rsl.stand_name}</label></a>
										</c:forEach>
									</span>
								</div>
							</div>
						</div>
					</div>
					<!-- /.modal-content -->
				</div>
			</div>
		</form>
		
		<!-- 批量设置嘉宾类别 -->
		<div id="chose_guestKind" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					
					<div class="modal-header" style="background-color: rgba(30,40,80,0.8); height: 50px;">
						<h5 class="modal-title pull-left white-text" id="myModalLabel">嘉宾类别选择</h5>
						<div class="pull-right btn-group-sm">
							<input type="hidden" value="" name="batch.guestId" />
							<button type="button" onclick="batchSetGuestType()" class="btn btn-warning">保存<span class="fa fa-chain"></span>
							</button>
							<button type="button" class="btn btn-warning" data-dismiss="modal">关闭<span class="fa fa-power-off"></span>
							</button>
						</div>
					</div>
					<div class="modal-body">
						<div class="add-guest-kind">
							<div>
								<span>
									嘉宾类别：
									<c:forEach items="${getGuestTypeList}" var="ggtl">
										<a class="btn btn-default guestKind"><label><input type="radio" value="${ggtl.id}" name="batch.guestType">${ggtl.type_name}</label></a>
									</c:forEach>
								</span>
							</div>
						</div>
					</div>
				</div>
				<!-- /.modal-content -->
			</div>
		</div>
		
		<!-- 修改嘉宾类别 -->
		<form action="${contextPath}/guestType/update/">
			<div id="edit_guestKind" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
				<div class="modal-dialog">
					
					<div class="modal-content">
						<div class="modal-header" style="background-color: rgba(30,40,80,0.8); height: 50px;">
							<h5 class="modal-title pull-left white-text" id="myModalLabel1">嘉宾类别编辑</h5>
							<div class="pull-right btn-group-sm">
								<button class="btn btn-warning">保存<span class="fa fa-chain"></span></button>
								<button onclick="deleteById()" class="btn btn-danger">删除<span class="fa fa-remove"></span></button>
								<button class="btn btn-info" data-dismiss="modal">关闭<span class="fa fa-power-off"></span></button>
							</div>
						</div>
						<input type="hidden" name="edit_gType.id" value="">
						<div class="modal-body">
							<table class="table table-striped table-hover" cellspacing="0" width="80%">
									
								<tr>
									<td class="add_field_name text-right">嘉宾类别：</td>
									<td id="e_guestTypeName" class="field_name"></td>
								</tr>
								<tr class="ad_certificate">
									<td class="ad_certificate_name text-right">证件号前缀：</td>
									<td id="e_guestPrefix" class="ad_certificate_value"></td>
								</tr>
								<tr>
									<td class="text-right">描述：</td>
									<td><textarea name="edit_gType.desc" rows="10" cols="60"></textarea></td>
								</tr>
							</table>
						</div>
					</div>
					<!-- /.modal-content -->
				</div>
			</div>
		</form>
		<!-- 修改接送标准 -->
		<form action="${contextPath}/reception/updateReceptionStandard">
			<div id="edit_principle" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
				<div class="modal-dialog">
	
					<div class="modal-content">
	
						<div class="modal-header" style="background-color: rgba(30,40,80,0.8); height: 50px;">
							<h5 class="modal-title pull-left white-text" id="myModalLabel1">接待标准编辑</h5>
							<div class="pull-right btn-group-sm">
								<input type="hidden" name="upadteRs.id" >
								<button class="btn btn-warning">保存<span class="fa fa-chain"></span></button>
								<button onclick="deleteReceptionStandById()" class="btn btn-danger">删除<span class="fa fa-remove"></span></button>
								<button class="btn btn-info" data-dismiss="modal">关闭<span class="fa fa-power-off"></span></button>
							</div>
						</div>
						<div class="modal-body">
							<table class="table table-striped table-hover" cellspacing="0" width="80%">
								<tr>
									<td class="add_field_name text-right">接待标准：</td>
									<td id="editReceptionStardName" class="field_name"></td>
								</tr>
								<tr>
									<td class="text-right">描述：</td>
									<td><textarea name="upadteRs.description" rows="10" cols="60"></textarea></td>
								</tr>
							</table>
						</div>
					</div>
					<!-- /.modal-content -->
				</div>
			</div>
		</form>
		<!-- 添加嘉宾类别 -->
		<form action="${contextPath}/guestType/save" method="post">
			<div id="add_guestKind" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
				<div class="modal-dialog">
	
					<div class="modal-content">
	
						<div class="modal-header" style="background-color: rgba(30,40,80,0.8); height: 50px;">
							<h5 class="modal-title pull-left white-text" id="myModalLabel1">新增嘉宾类别</h5>
							<div class="pull-right btn-group-sm">
								<button class="btn btn-warning">保存<span class="fa fa-save"></span></button>
								<button class="btn btn-info" data-dismiss="modal">关闭<span class="fa fa-power-off"></span></button>
							</div>
						</div>
						<div class="modal-body">
							<table class="table table-striped table-hover" cellspacing="0" width="80%">
								<tr>
									<td class="add_field_name text-right">嘉宾类别：</td>
									<td class="field_name"><input type="text" name="gType.type_name" class="add_field" value=""></td>
								</tr>
								<tr class="ad_certificate">
									<td class="ad_certificate_name text-right">证件号前缀：</td>
									<td class="ad_certificate_value"><input type="text" name="gType.prefix" class="ad_certificate_input" value=""><label class="ml10">填写后不可修改，请慎重填写！</label></td>
								</tr>
								<tr>
									<td class="text-right">描述：</td>
									<td><textarea rows="10" name="gType.desc" cols="60"></textarea></td>
								</tr>
							</table>
						</div>
					</div>
					<!-- /.modal-content -->
				</div>
			</div>
		</form>
		<form action="${contextPath}/reception/addReceptionStandard" method="post">
			<div id="add_principle" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
				<div class="modal-dialog">
	
					<div class="modal-content">
	
						<div class="modal-header" style="background-color: rgba(30,40,80,0.8); height: 50px;">
							<h5 class="modal-title pull-left white-text" id="myModalLabel1">新增接待标准</h5>
							<div class="pull-right btn-group-sm">
								<button class="btn btn-warning">保存<span class="fa fa-save"></span></button>
								<button class="btn btn-info" data-dismiss="modal">关闭<span class="fa fa-power-off"></span></button>
							</div>
						</div>
						<div class="modal-body">
							<table class="table table-striped table-hover" cellspacing="0" width="80%">
								<tr>
									<td class="add_field_name text-right">接待标准：</td>
									<td class="field_name"><input type="text" name="reception_standard.stand_name" class="add_field" value=""></td>
								</tr>
								<tr>
									<td class="text-right">描述：</td>
									<td><textarea name="reception_standard.description" rows="10" cols="60"></textarea></td>
								</tr>
							</table>
						</div>
					</div>
					<!-- /.modal-content -->
				</div>
			</div>
		</form>
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
		
			function editGuestType(id){
				$.post(getProjectName()+"/guestType/findById/"+id, function(data){
					$("input[name='edit_gType.id']").val(data.guestType.id);
					$("#e_guestTypeName").text(data.guestType.type_name);
					$("#e_guestPrefix").text(data.guestType.prefix);
					$("textarea[name='edit_gType.desc']").text(data.guestType.desc);
				});
			}
			
			function deleteById(){
				var id = $("input[name='edit_gType.id']").val();
				$.post(getProjectName()+"/guestType/delete/"+id);
			}
			
			function findByStandardId(id){
				$.post(getProjectName()+"/reception/findStandardById/"+id, function(data){
					$("#editReceptionStardName").text(data.reception_standard.stand_name);
					$("textarea[name='upadteRs.description']").text(data.reception_standard.description);
					$("input[name='upadteRs.id']").val(data.reception_standard.id);
					
				});
			}
			
			function deleteReceptionStandById(){
				var id = $("input[name='upadteRs.id']").val();
				$.post(getProjectName()+"/reception/deleteReceptionStandard/"+id);
			}
			
			function setGuestType(id){
				var guestType = $("input[name='set.guestType']:checked").val();
				window.location.href = getProjectName()+"/reception/setGuestType/"+id+"-"+guestType;
			}
			
			function toBatchSetGuestType(){
				var guestIdArr = new Array();
				guestIdArr = document.getElementsByName("guestIdCheckbox");
				
				var guestIdArrStr = "";
				for(var i=0; i<guestIdArr.length; i++){
					if(guestIdArr[i].checked){
						guestIdArrStr = guestIdArrStr + guestIdArr[i].value;
						guestIdArrStr = guestIdArrStr + ",";
					}
				}
				$("input[name='batch.guestId']").val(guestIdArrStr);
				
			}

		</script>
		
		<script type="text/javascript">
			function batchSetGuestType(){
				var guestIdArrStr = $("input[name='batch.guestId']").val();
				var guestType = $("input[name='batch.guestType']:checked").val();
				window.location.href = getProjectName()+"/reception/batchSetGuestType/"+guestIdArrStr+"-"+guestType;
			}
			
			function batchSetReceptionStandard(){
				var guestIdArr = new Array();
				guestIdArr = document.getElementsByName("guestIdCheckbox");
				
				var guestIdArrStr = "";
				for(var i=0; i<guestIdArr.length; i++){
					if(guestIdArr[i].checked){
						guestIdArrStr = guestIdArrStr + guestIdArr[i].value;
						guestIdArrStr = guestIdArrStr + ",";
					}
				}
				$("input[name='reception.guestIds']").val(guestIdArrStr);
			}
			
		</script>
		
	</body>

</html>

















