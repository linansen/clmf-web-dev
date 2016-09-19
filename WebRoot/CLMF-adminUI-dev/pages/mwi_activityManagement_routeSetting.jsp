<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

	<head>

		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<meta name="description" content="">
		<meta name="author" content="">

		<title>活动管理之活动报名之路线设置</title>

		<!-- Bootstrap Core CSS -->
		<link href="${contextPath}/CLMF-adminUI-dev/bower_components/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
		
		<!-- MetisMenu CSS -->
		<link href="${contextPath}/CLMF-adminUI-dev/bower_components/metisMenu/dist/metisMenu.min.css" rel="stylesheet">

		<!-- Custom CSS -->
		<link href="${contextPath}/CLMF-adminUI-dev/dist/css/sb-admin-2.css" rel="stylesheet">

		<!-- Custom Fonts -->
		<link href="${contextPath}/CLMF-adminUI-dev/bower_components/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">

		<link href="${contextPath}/CLMF-adminUI-dev/dist/css/mwi_tables/index.css" rel="stylesheet" type="text/css">
		
		<link  href="${contextPath}/CLMF-adminUI-dev/dist/css/mwi_tables/modal.css"  rel="stylesheet" type="text/css">
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
				<form action="${contextPath}/route" method="post">
				<!-- page -->
				<input type="hidden" class="pageIndex" name="pageNumber" value='<c:out value="${pageNumber}" default="1"/>'>
				<input type="hidden" class="pageSize" name="pageSize" value='<c:out value="${pageSize}" default="10"/>'>
				<input type="hidden" class="totalPages" name="totalPage" value='<c:out value="${totalPage}" default="1"/>'>
				<!-- page -->

				<div class="panel panel-primary">

					<div class="panel-heading">
						<h4><span class="fa fa-eye-slash mr5"></span>活动路线设置</h4>
					</div>

					<!-- /.panel-heading -->
					<div class="panel-body">
						<table id="route_info" class="table table-responsive table-hover table-bordered">
                        
							<caption>
								<div class="pull-left query">
									<span>
										路线内容：
										<select name="selectRoute" style="width:130px;">
											<option value="">不限</option>
											<c:forEach items="${onlyRouteList}" var="orl">
												<c:choose>
													<c:when test="${selectRouteId == orl.id}">
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
										活动日期：
										<input type="text" name="selectDate" value="${selectDate}" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd',readOnly:true})" placeholder="请选择活动日期" />
									</span>
									<span>
										<button class="btn btn-primary">查询<b class="fa fa-search ml5"></b></button>
									</span>
									<span class="pull-right">
										<button type="button" class="btn btn-success" data-toggle="modal" data-target="#routeDetail">创建活动路线</button>
										<button type="button" class="btn btn-danger" data-toggle="modal" data-target="#myModal">批量删除路线</button>
									</span>
								</div>
							</caption>
							<thead>

								<tr>
									<th><label>选择<input type="checkbox" class="checkAll"/></label></th>
									<th>路线编号</th>
									<th>路线别名</th>
									<th>路线名</th>
									<th width="30%">路线内容</th>
									<th>开始时间</th>
									<th>结束时间</th>
									<th>限定名额</th>
									<th>当前已报名额</th>
									<th>操作</th>
								</tr>

							</thead>
							<tbody>
								<c:forEach items="${routeList.list}" var="rl" varStatus="status">
									<tr>
										<td><input type="checkbox"></td>
										<td>${status.index+1}</td>
										<td>${rl.route_nicName}</td>
										<td>${rl.route_name}</td>
										<td width="30%">${rl.route_content}</td>
										<td>${rl.route_start_time}</td>
										<td>${rl.route_end_time}</td>
										<td>${rl.limit_num}</td>
										<td>${rl.regist_num}</td>
										<td>
											<button type="button" class="btn btn-sm btn-success" onclick="findById('${rl.id}')" data-toggle="modal" data-target="#routeDetail">编辑<span class="fa fa-edit fa-rotate-180 ml5"></span></button>
											<button type="button" class="btn btn-sm btn-danger" data-toggle="modal" data-target="#myModal${rl.id}">删除<span class="fa fa-remove ml5"></span></button>
											<div class="modal fade" id="myModal${rl.id}" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="margin-top:15%;">
												<div class="modal-dialog">
													<div class="modal-content">
														<div class="modal-header" style="border-radius:6px 6px 0 0 ;">
															<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
																&times;
															</button>
															<h4 class="modal-title" id="myModalLabel">
																						  删除路线
															</h4>
														</div>
														<div class="modal-body text-center">
															<div class="text-center text-info">
																确定要删除路线吗？
															</div>
															<div class="text-center mt20">
																<button class="btn btn-danger mr10" onclick="deleteById('${rl.id}');">确定</button>
																<button class="btn btn-success" data-dismiss="modal" aria-hidden="true">取消</button>
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

		</div>
		<!-- /#page-wrapper -->

		
		<div id="routeDetail" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" 
		     aria-hidden="true">
			<div class="modal-dialog">

				<div class="modal-content" >

					<div class="modal-body" style="padding: 0px;">
					
					<form action="${contextPath}/route/update" method="post">
					     
				           <div class="panel panel-primary">
				           	
				           	   <div class="panel-heading">
				           	   	 	<input type="hidden" name="edit.id" value="">
				           	       <div class="pull-left">
				                	  <h5><span class="fa fa-check-square-o mr5"></span>活动路线详细信息</h5>
				                   </div>  	   	  	   
						         	<div class="pull-right btn-group-sm ">
										<button class="btn btn-warning btn-sm">保存<div class="fa fa-save ml5"></div>
										</button>
										<button type="button" class="btn btn-danger btn-sm">删除<div class="fa fa-remove ml5"></div>
										</button>
										<button class="btn btn-info btn-sm" data-dismiss="modal">关闭<span class="fa fa-power-off ml5"></span>
										</button>
									</div>
									<div class="clearfix"></div>
				           	   	</div>
				              	<div class="panel-body">
									<table class="table table-striped table-bordered table-hover " cellspacing="2" width="80%">
										<tbody>
											<tr class="route_standard_name">
                        						<td class="tdTextAlign text-right">路线昵称:</td>
                        						<td >
                        							<input class="tdWidth" type="text" placeholder="请输入路线昵称" onblur="" name="edit.route_name"/>
                        						</td>
                        					</tr>
                        					<tr>
                        						<td class="tdTextAlign text-right">路线名:</td>
                        						<td >
                        							<input class="tdWidth" type="text" placeholder="请输入路线名" onblur="" name="edit.route_nicName"/>
                        						</td>
                        					</tr>
                        					<tr>
                        						<td class="tdTextAlign text-right">路线内容:</td>
                        						<td >
                        							<input class="tdWidth" type="text" placeholder="请输入路线内容" onblur="" name="edit.route_content"/>
                        						</td>
                        					</tr>
                        					<tr>
                        						<td class="tdTextAlign text-right">接收活动报名人数:</td>
                        						<td >
                        							<input class="tdWidth" type="text" placeholder="接收活动报名人数" onblur="" name="edit.limit_num"/>
                        						</td>
                        					</tr>
                        				    <tr>
                        						<td class="tdTextAlign text-right">活动开始时间:</td>
                        						<td >
                        							<input class="tdWidth" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd',readOnly:true})" type="text" placeholder="请输入活动开始时间" onblur="" name="edit.route_start_time"/>
                        						</td>
                        					</tr>
                        					<tr>
                        						<td class="tdTextAlign text-right">活动结束时间：</td>
                        						<td >
                        							<input class="tdWidth" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd',readOnly:true})" type="text" placeholder="请输入活动结束时间" onblur="" name="edit.route_end_time"/>
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
        </div>
        <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="margin-top:15%;">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header" style="border-radius:6px 6px 0 0 ;">
						<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
							&times;
						</button>
						<h4 class="modal-title" id="myModalLabel">
													 批量删除路线
						</h4>
					</div>
					<div class="modal-body text-center">
						<div class="text-center text-info">
							确定要删除选中的路线吗？
						</div>
						<div class="text-center mt20">
							<button class="btn btn-danger mr10" onclick="deleteById('${rl.id}');">确定</button>
							<button class="btn btn-success" data-dismiss="modal" aria-hidden="true">取消</button>
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

		<!-- Page-Level Demo Scripts - Tables - Use for reference -->
		<script type="text/javascript">
			$(document).ready(function() {
				$("[data-toggle='modal']").tooltip(); 
				$("#dining_rights_setting").click(function() {
					$("#dining_rights_setting_detail").fadeToggle(300);
				});
			});
			
			function getProjectName(){
				var pathName = window.document.location.pathname;
				var projectName = pathName.substring(0,pathName.substr(1).indexOf('/')+1);
				return projectName;
			}
			
			function findById(id){
				$.post(getProjectName()+"/route/findById/"+id, function(data){
					$("input[name='edit.id']").val(data.routeInfo.id);
					$("input[name='edit.route_name']").val(data.routeInfo.route_name);
					$("input[name='edit.route_nicName']").val(data.routeInfo.route_nicName);
					$("input[name='edit.route_content']").val(data.routeInfo.route_content);
					$("input[name='edit.limit_num']").val(data.routeInfo.limit_num);
					$("input[name='edit.route_start_time']").val(data.routeInfo.route_start_time);
					$("input[name='edit.route_end_time']").val(data.routeInfo.route_end_time);
				});
			}
			
			function deleteById(id){
				$.post(getProjectName()+"/route/delete/"+id);
			}
		</script>


	</body>

</html>
