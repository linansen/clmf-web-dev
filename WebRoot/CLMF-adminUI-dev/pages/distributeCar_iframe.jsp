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
		<script type="text/javascript">
			
		</script>
		<title>人员分配</title>

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
		<div class="panel panel-primary col-lg-6">

			<div class="panel-body">

				<table class="table table-responsive table-hover" id="choseDriver">
					<caption>
						<div class="pull-left query">
							<span>
								<input type="text" name="select_guest_name" placeholder="司机姓名"/>
							</span>
							<span>
								<input type="text" name="select_guest_name" placeholder="联系电话" />
							</span>
							<span>
								<input type="text" placeholder="驾照类型">
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
						</div>
					</caption>
					<thead>
						<tr>
							<th><label>全选<input type="checkbox" class="checkAll"></label></th>
							<th>序号</th>
							<th>司机编号</th>
							<th>司机姓名</th>
							<th>联系方式</th>
							<th>驾照类型</th>
							<th>匹配状态</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td><input type="checkbox"></td>
							<td>001</td>
							<td>0001</td>
							<td class="chose_name">林岸森</td>
							<td>13333333333</td>
							<td>A型</td>
							<td>已分配</td>
						</tr>
						<tr>
							<td><input type="checkbox"></td>
							<td>001</td>
							<td>0001</td>
							<td class="chose_name">林岸森</td>
							<td>13333333333</td>
							<td>A型</td>
							<td>已分配</td>
						</tr>
						<tr>
							<td><input type="checkbox"></td>
							<td>001</td>
							<td>0001</td>
							<td class="chose_name">林岸森</td>
							<td>13333333333</td>
							<td>A型</td>
							<td>已分配</td>
						</tr>
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
						<input type="number" name="select_guest_name" style="width: 70px !important;"/>
						页
						<button class="btn btn-primary btn-sm">go</button>
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
		<div class="panel panel-primary col-lg-6">
			<!-- /.panel-heading -->
			<div class="panel-body">
				<table class="table table-responsive table-hover" id="choseCar">
					<caption>
						<div class="pull-left query">
							<span>
								<input type="text" name="select_guest_name" placeholder="车辆编号" />
							</span>
							<span>
								<input type="text" name="select_guest_name" placeholder="车型" />
							</span>
							<span>
								<input type="text" name="select_guest_name" placeholder="车牌号" />
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
						</div>
					</caption>
					<thead>
						<tr>
							<th><label>全选<input type="checkbox" class="checkAll"></label></th>
							<th>序号</th>
							<th>车辆编号</th>
							<th>车牌号</th>
							<th>车型</th>
							<th>分配状态</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td><input type="checkbox"></td>
							<td>001</td>
							<td>abc</td>
							<td>GC250</td>
							<td class="chose_name">SSS</td>
							<td>已分配</td>
						</tr>
						<tr>
							<td><input type="checkbox"></td>
							<td>001</td>
							<td>abc</td>
							<td>GC250</td>
							<td class="chose_name">SSS</td>
							<td>已分配</td>
						</tr>
						<tr>
							<td><input type="checkbox"></td>
							<td>001</td>
							<td>abc</td>
							<td>GC250</td>
							<td class="chose_name">SSS</td>
							<td>已分配</td>
						</tr>
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
						<input type="number" name="select_guest_name" style="width: 70px !important;"/>
						页
						<button class="btn btn-primary btn-sm">go</button>
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
		<div class="clearfix"></div>
		<!-- /.row -->
		
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
		
		<!-- page -->
		<script src="${contextPath}/CLMF-adminUI-dev/bower_components/paginator/paginator.min.js"></script>

		<script src="${contextPath}/CLMF-adminUI-dev/dist/js/page/page.js"></script>
		
		<!-- Page-Level Demo Scripts - Tables - Use for reference -->
	</body>

</html>
