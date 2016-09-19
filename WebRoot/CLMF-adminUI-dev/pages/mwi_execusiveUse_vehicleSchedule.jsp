<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">

	<head>

		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<meta name="description" content="">
		<meta name="author" content="">

		<title>车辆调度之专属用车</title>

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
						<p class="text-capitalize"><span class="fa fa-user-md fa-2x mr10"></span>专属用车</p>
					</div>

					<div class="panel-body">
						<ul id="myTab" class="nav nav-pills">
							<li class="active"><a href="#guest" data-toggle="tab"> 嘉宾信息 </a></li>
							<li><a href="#driver" data-toggle="tab">司机信息</a></li>
							<li><a href="#vehicle" data-toggle="tab">车辆信息</a></li>
						</ul>

						<div id="myTabContent" class="tab-content">

							<!-- /.嘉宾 -->
							<div class="tab-pane fade in active" id="guest">
							
							<form action="" method="post">
							<!-- page -->
							<input type="hidden" class="pageIndex" name="pageNumber" value='<c:out value="${pageNumber}" default="1"/>'>
							<input type="hidden" class="pageSize" name="pageSize" value='<c:out value="${pageSize}" default="10"/>'>
							<input type="hidden" class="totalPages" name="totalPage" value='<c:out value="${totalPage}" default="1"/>'>
							<!-- page -->

								<div class="panel panel-success">

									<!-- /.panel-heading -->
									<div class="panel-body">

										<table class="table table-responsive table-hover">
											<caption>
												<div class="pull-left query">
													<span>
														嘉宾姓名：
														<input type="text" name="select_guest_name" placeholder="请输入嘉宾姓名" />
													</span>
													<span>
														英文姓名：
														<input type="text" name="select_guest_name" placeholder="请输入英文姓名" />
													</span>
													<span>
														联系电话：
														<input type="text" name="select_guest_name" placeholder="请输入联系电话" />
													</span>
													<span>
														分配状态：
														<select>
															<option>全部</option>
															<option>已分配</option>
															<option>未分配</option>
														</select>
													</span>
													<span>
														<button type="submit" class="btn btn-primary">查询<b class="fa fa-search ml5"></b></button>
														<button type="button" class="btn btn-primary ad_query_button">高级查询</button>
													</span>
													<span>
														<label>记录总数：<b class="red-text">10000</b>条</label>
													</span>
													<span class="fr">
														<a href="distributeCar_modal.html" class="btn btn-primary" data-toggle="modal" data-target="#chose_staff">分配车辆</a>
													</span>
												</div>
												<div class="pull-left ad_query">
													<span>
														单位职务：
														<input type="text" name="select_guest_name" placeholder="请输入单位职务" />
													</span>
													<span>
														国籍：
														<select>
															<option>所有国家</option>
														</select>
													</span>
													<span>
														嘉宾类别：
														<select>
															<option>不限</option>
															<option>省长</option>
															<option>市长</option>
															<option>县长</option>
														</select>
													</span>
												</div>
											</caption>
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
													<th width="15%">指定司机</th>
													<th width="15%">指定车辆</th>
													<th>分配状态</th>
												</tr>
											</thead>
											<tbody>
												<tr>
													<td><input type="checkbox"></td>
													<td>001</td>
													<td>林岸森</td>
													<td>json</td>
													<td>15626497625</td>
													<td>广东省省长</td>
													<td>中国</td>
													<td>省长</td>
													<td class="staff" width="15%" style="position: absolute;">
														史锐鑫(18826418523)
														<div class="table-tooltip">
															<span>史锐鑫(18826418523)</span>
															<span>史锐鑫(18826418523)</span>
															<span>史锐鑫(18826418523)</span>
														</div>
													</td>
													<td class="staff" width="15%" style="position: relative;">
														SUV(GY0010)
														<div class="table-tooltip" style="position: absolute;">
															<span>SUV(GY0010)</span>
															<span>SUV(GY0010)</span>
															<span>SUV(GY0010)</span>
														</div>
													</td>
													<td>已分配</td>
												</tr>

												<tr>
													<td><input type="checkbox"></td>
													<td>001</td>
													<td>林岸森</td>
													<td>json</td>
													<td>15626497625</td>
													<td>广东省省长</td>
													<td>中国</td>
													<td>省长</td>
													<td class="staff" width="15%" style="position: absolute;">
														史锐鑫(18826418523)
														<div class="table-tooltip">
															<span>史锐鑫(18826418523)</span>
															<span>史锐鑫(18826418523)</span>
															<span>史锐鑫(18826418523)</span>
														</div>
													</td>
													<td class="staff" width="15%" style="position: relative;">
														SUV(GY0010)
														<div class="table-tooltip" style="position: absolute;">
															<span>SUV(GY0010)</span>
															<span>SUV(GY0010)</span>
															<span>SUV(GY0010)</span>
														</div>
													</td>
													<td>已分配</td>
												</tr>
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

							<!-- /.指定车辆 -->
							<div class="tab-pane fade" id="driver">
							
							<form action="" method="post">
							<!-- page -->
							<input type="hidden" class="pageIndex" name="pageNumber" value='<c:out value="${pageNumber}" default="1"/>'>
							<input type="hidden" class="pageSize" name="pageSize" value='<c:out value="${pageSize}" default="10"/>'>
							<input type="hidden" class="totalPages" name="totalPage" value='<c:out value="${totalPage}" default="1"/>'>
							<!-- page -->

								<div class="panel panel-primary">

									<div class="panel-body">

										<table class="table table-responsive table-hover">
											<caption>
												<div class="pull-left query">
													<span>
														司机姓名：
														<input type="text" name="select_guest_name" placeholder="请输入司机姓名" />
													</span>
													<span>
														联系电话：
														<input type="text" name="select_guest_name" placeholder="请输入联系电话" />
													</span>
													<span>
														驾照类型：
														<select>
															<option>不限</option>
															<option>A型</option>
															<option>B型</option>
															<option>C型</option>
															<option>D型</option>
														</select>
													</span>
													<span>
														分配状态：
														<select>
															<option>全部</option>
															<option>已分配</option>
															<option>未分配</option>
														</select>
													</span>
													<span>
														<button class="btn btn-primary">查询<b class="fa fa-search ml5"></b></button>
													</span>
													<span>
														<label>记录总数：<b class="red-text">10000</b>条</label>
													</span>
												</div>
											</caption>
											<thead>
												<tr>
													<th>序号</th>
													<th>司机编号</th>
													<th>司机姓名</th>
													<th>联系电话</th>
													<th>驾照类型</th>
													<th width="15%">负责嘉宾</th>
													<th width="15%">负责车辆</th>
													<th>分配状态</th>
												</tr>
											</thead>
											<tbody>
												<tr>
													<td>1</td>
													<td>1111</td>
													<td>林岸森</td>
													<td>13333333333</td>
													<td>D</td>
													<td class="staff" width="15%" style="position: absolute;">
														史锐鑫(18826418523)
														<div class="table-tooltip">
															<span>史锐鑫(18826418523)</span>
															<span>史锐鑫(18826418523)</span>
															<span>史锐鑫(18826418523)</span>
														</div>
													</td>
													<td class="staff" width="15%" style="position: relative;">
														SUV(GY0010)
														<div class="table-tooltip" style="position: absolute;">
															<span>SUV(GY0010)</span>
															<span>SUV(GY0010)</span>
															<span>SUV(GY0010)</span>
														</div>
													</td>
													<td>已分配</td>
												</tr>
												<tr>
													<td>1</td>
													<td>1111</td>
													<td>林岸森</td>
													<td>13333333333</td>
													<td>D</td>
													<td class="staff" width="15%" style="position: absolute;">
														史锐鑫(18826418523)
														<div class="table-tooltip">
															<span>史锐鑫(18826418523)</span>
															<span>史锐鑫(18826418523)</span>
															<span>史锐鑫(18826418523)</span>
														</div>
													</td>
													<td class="staff" width="15%" style="position: relative;">
														SUV(GY0010)
														<div class="table-tooltip" style="position: absolute;">
															<span>SUV(GY0010)</span>
															<span>SUV(GY0010)</span>
															<span>SUV(GY0010)</span>
														</div>
													</td>
													<td>已分配</td>
												</tr>
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

							<!-- /.乘车人员 -->
							<div class="tab-pane fade" id="vehicle">
							<form action="" method="post">
							<!-- page -->
							<input type="hidden" class="pageIndex" name="pageNumber" value='<c:out value="${pageNumber}" default="1"/>'>
							<input type="hidden" class="pageSize" name="pageSize" value='<c:out value="${pageSize}" default="10"/>'>
							<input type="hidden" class="totalPages" name="totalPage" value='<c:out value="${totalPage}" default="1"/>'>
							<!-- page -->

								<div class="panel panel-primary">

									<!-- /.panel-heading -->
									<div class="panel-body">

										<table class="table table-responsive table-hover">
											<caption>
												<div class="pull-left query">
													<span>
														车辆编号：
														<input type="text" name="select_guest_name" placeholder="请输入车辆编号" />
													</span>
													<span>
														车牌号：
														<input type="text" name="select_guest_name" placeholder="请输入车牌号" />
													</span>
													<span>
														车型：
														<input type="text" name="select_guest_name" placeholder="请输入车型" />
													</span>
													<span>
														分配状态：
														<select>
															<option>全部</option>
															<option>已分配</option>
															<option>未分配</option>
														</select>
													</span>
													<span>
														<button class="btn btn-primary">查询<b class="fa fa-search ml5"></b></button>
													</span>
													<span>
														<label>记录总数：<b class="red-text">10000</b>条</label>
													</span>
												</div>
											</caption>
											<thead>
												<tr>
													<th>序号</th>
													<th>车辆编号</th>
													<th>车牌号</th>
													<th>车型</th>
													<th width="15%">负责嘉宾</th>
													<th width="15%">分配司机</th>
													<th>分配状态</th>
												</tr>
											</thead>
											<tbody>
												<tr>
													<td>1</td>
													<td>1111</td>
													<td>林岸森</td>
													<td>13333333333</td>
													<td class="staff" width="15%" style="position: absolute;">
														史锐鑫(18826418523)
														<div class="table-tooltip">
															<span>史锐鑫(18826418523)</span>
															<span>史锐鑫(18826418523)</span>
															<span>史锐鑫(18826418523)</span>
														</div>
													</td>
													<td class="staff" width="15%" style="position: relative;">
														锐鑫(18826418523)
														<div class="table-tooltip" style="position: absolute;">
															<span>史锐鑫(18826418523)</span>
															<span>史锐鑫(18826418523)</span>
															<span>史锐鑫(18826418523)</span>
														</div>
													</td>
													<td>已分配</td>
												</tr>

												<tr>
													<td>1</td>
													<td>1111</td>
													<td>林岸森</td>
													<td>13333333333</td>
													<td class="staff" width="15%" style="position: absolute;">
														史锐鑫(18826418523)
														<div class="table-tooltip">
															<span>史锐鑫(18826418523)</span>
															<span>史锐鑫(18826418523)</span>
															<span>史锐鑫(18826418523)</span>
														</div>
													</td>
													<td class="staff" width="15%" style="position: relative;">
														锐鑫(18826418523)
														<div class="table-tooltip" style="position: absolute;">
															<span>史锐鑫(18826418523)</span>
															<span>史锐鑫(18826418523)</span>
															<span>史锐鑫(18826418523)</span>
														</div>
													</td>
													<td>已分配</td>
												</tr>
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

						</div>
					</div>

				</div>

			</div>

		</div>
		<!-- /.row -->

		<!-- /#page-wrapper -->
		<div id="chose_staff" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="top:50px !important;">
			<div class="modal-dialog" style="width: 1600px;">
				<div class="modal-content"></div>
				<!-- /.modal-content -->
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