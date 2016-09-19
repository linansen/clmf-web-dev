<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

	<head>

		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<meta name="description" content="">
		<meta name="author" content="">

		<title>用餐之人数统计</title>

		<!-- Bootstrap Core CSS -->
		<link href="${contextPath}/CLMF-adminUI-dev/bower_components/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">

		<!-- MetisMenu CSS -->
		<link href="${contextPath}/CLMF-adminUI-dev/bower_components/metisMenu/dist/metisMenu.min.css" rel="stylesheet">

		<!-- Custom CSS -->
		<link href="${contextPath}/CLMF-adminUI-dev/dist/css/sb-admin-2.css" rel="stylesheet">

		<!-- Custom Fonts -->
		<link href="${contextPath}/CLMF-adminUI-dev/bower_components/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">

		<link href="${contextPath}/CLMF-adminUI-dev/dist/css/mwi_tables/index.css" rel="stylesheet" type="text/css">

		<link href="${contextPath}/CLMF-adminUI-dev/dist/css/mwi_tables/modal.css" rel="stylesheet" type="text/css">

	</head>

	<body>

		<div class="row-header">

			<div class="col-lg-12">
				<h1 class="page-header"></h1>
			</div>
			<!-- /.col-lg-12 -->
		</div>

		<!-- /.row -->
		<div class="row-body">
		

			<div class="col-lg-12">

				<div class="panel panel-primary ">

					<div class="panel-heading">
						<h4><span class="fa fa-pagelines"></span>&nbsp;酒店用餐之人数统计</h4>
					</div>

					<div class="panel-body">

						<div id="tabs">
							<ul id="myTab" class="nav nav-tabs nav-tabs-justified">
								<c:choose>
									<c:when test="${flag == 1}">
										<li class="active">
									</c:when>
									<c:otherwise>
										<li >
									</c:otherwise>
								</c:choose>
									<a href="${contextPath}/dining"> &nbsp;&nbsp;嘉宾 &nbsp;&nbsp;</a>
								</li>
								
								<c:choose>
									<c:when test="${flag == 2}">
										<li class="active">
									</c:when>
									<c:otherwise>
										<li >
									</c:otherwise>
								</c:choose>
									<a href="${contextPath}/dining?flag=2">工作人员</a>
								</li>

								<c:choose>
									<c:when test="${flag == 3}">
										<li class="active">
									</c:when>
									<c:otherwise>
										<li >
									</c:otherwise>
								</c:choose>
									<a href="${contextPath}/dining?flag=3">志愿者</a>
								</li>

							</ul>

							<div id="myTabContent" class="tab-content">
								<c:choose>
									<c:when test="${flag == 1}">
										<div class="tab-pane fade in active" id="home">
									</c:when>
									<c:otherwise>
										<div class="tab-pane fade in" id="home">
									</c:otherwise>
								</c:choose>
								
								<form action="${contextPath}/dining?flag=1" method="post">
								<!-- page -->
								<input type="hidden" class="pageIndex" name="pageNumber" value='<c:out value="${pageNumber}" default="1"/>'>
								<input type="hidden" class="pageSize" name="pageSize" value='<c:out value="${pageSize}" default="10"/>'>
								<input type="hidden" class="totalPages" name="totalPage" value='<c:out value="${totalPage}" default="1"/>'>
								<!-- page -->

									<div class="panel panel-default col-lg-12">
										<div class="panel-title">
											<h5 style="" class="panel-title diningManageToll">本次用餐总人数为&nbsp;${guestDiningList.totalRow}&nbsp;人，已进餐人数为123人</h5>
										</div>
										<div class="panel-body">
											<table class="table table-condensed table-hover  table-bordered table-responsive">
												<caption>
												
													<div class="pull-left query">
														<span>
															用餐标准：
															<select name="" class="diningNorm">
																<option>不限</option>
																<option>标准A</option>
															</select>
														</span>
														<span>
															用餐日期：
															<input type="text" class="diningDate" placeholder="请输入用餐日期" name="dining_date" value="${dining_date}" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd',readOnly:true})"/>
														</span>
														<span>
															用餐时间：
															<input type="text" class="diningTime" placeholder="请输入用餐时间" name="dining_time" value="${dining_time}" onfocus="WdatePicker({dateFmt:'HH:mm:00',readOnly:true})"/>
														</span>
														<span>
															餐次：
															<input type="text" class="diningNum" placeholder="请输入用餐车次" onblur="" name="count" value="${count}" />
														</span>
														<span>
															用餐地点：
															<input type="text" class="diningAdress" placeholder="用餐地点" onblur="" name="dining_place" value="${dining_place}" />
														</span>
														<span>
															<button  class="btn btn-primary" type="submit">
																查询<b class="fa fa-search ml5"></b>
															</button>
														</span>
														<span>
															<label>总用餐人数：<b class="red-text diningSum">10000</b>人</label>
														</span>
														<span>
															<label>实际用餐人数：<b class="red-text diningCurrent">10000</b>人</label>
														</span>
													</div>
												</caption>
												<thead>
													<tr>
														<th>嘉宾姓名</th>
														<th>国籍</th>
														<th>单位</th>
														<th>职务</th>
														<th>用餐时间</th>
														<th>进入用餐次数</th>
														<th>用餐标准</th>
														<th>用餐地点</th>

													</tr>
												</thead>
												<tbody>
												<c:forEach items="${guestDiningList.list}" var="gl">
													<tr>
														<td>${gl.chinese_name}</td>
														<td>${gl.national}</td>
														<td>${gl.ch_organ_name}</td>
														<td>${gl.post}</td>
														<td>${gl.dining_date}</td>
														<td>${gl.count}</td>
														<td>${gl.dinning_stand_name}</td>
														<td>${gl.dining_place}</td>
														
													</tr>
												</c:forEach>

												</tbody>

											</table>
										</div>

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
															<c:when test="${pageSize == 200}"><option selected="selected" value="200">200</option></c:when>
															<c:otherwise><option value="200">200</option></c:otherwise>
														</c:choose>
														<c:choose>
															<c:when test="${pageSize == 500}"><option selected="selected" value="500">500</option></c:when>
															<c:otherwise><option value="500">500</option></c:otherwise>
														</c:choose>
													</select>
													数据
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

								</div>

									<c:choose>
									<c:when test="${flag == 2}">
										<div class="tab-pane fade in active" id="ios">
									</c:when>
									<c:otherwise>
										<div class="tab-pane fade in" id="ios">
									</c:otherwise>
								</c:choose>
								
								<form action="${contextPath}/dining?flag=2" method="post">
								<!-- page -->
								<input type="hidden" class="pageIndex" name="pageNumber" value='<c:out value="${pageNumber}" default="1"/>'>
								<input type="hidden" class="pageSize" name="pageSize" value='<c:out value="${pageSize}" default="10"/>'>
								<input type="hidden" class="totalPages" name="workertotalPage" value='<c:out value="${workertotalPage}" default="1"/>'>
								<!-- page -->
									
									<div class="panel panel-default">
										<div class="panel-title">

											<h5 style="" class="panel-title diningManageToll">本次用餐总人数为&nbsp;${workerDiningList.totalRow}&nbsp;人，已进餐人数为123人</h5>

										</div>
										<div class="panel-body">
											<table class="table table-condensed table-hover  table-bordered table-responsive">
												<caption>
													<div class="pull-left query">
														<span>
															用餐标准：
															<select name="" class="diningNorm">
																<option>不限</option>
															</select>
														</span>
														<span>
															用餐日期：
															<input type="text" class="diningDate" placeholder="请输入用餐日期" name="dining_date" value="${dining_date}" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd',readOnly:true})"/>
														</span>
														<span>
															用餐时间：
															<input type="text" class="diningTime" placeholder="请输入用餐时间" name="dining_time" value="${dining_time}" onfocus="WdatePicker({dateFmt:'HH:mm:00',readOnly:true})"/>
														</span>
														<span>
															餐次：
															<input type="text" class="diningNum" placeholder="请输入用餐车次" onblur="" name="count" value="${count}" />
														</span>
														<span>
															用餐地点：
															<input type="text" class="diningAdress" placeholder="用餐地点" onblur="" name="dining_place" value="${dining_place}" />
														</span>
														<span>
															<button  class="btn btn-primary" type="submit">
																查询<b class="fa fa-search ml5"></b>
															</button>
														</span>
														<span>
															<label>总用餐人数：<b class="red-text diningSum">10000</b>人</label>
														</span>
														<span>
															<label>实际用餐人数：<b class="red-text diningCurrent">10000</b>人</label>
														</span>
													</div>
												</caption>
												<thead>

													<tr>

														<th>工作人员姓名</th>
														<th>工作人员国籍</th>
														<th>团队</th>
														<th>单位</th>
														<th>职务</th>
														<th>用餐时间</th>
														<th>进入用餐次数</th>
														<th>用餐标准</th>
														<th>用餐地点</th>

													</tr>

												</thead>
												<tbody>
												<c:forEach items="${workerDiningList.list}" var="wl">
													<tr>
														<td>${wl.realname}</td>
														<td>${wl.national}</td>
														<td>${wl.group_name}</td>
														<td>${wl.unit}</td>
														<td>${wl.post}</td>
														<td>${wl.dining_time}</td>
														<td>${wl.count}</td>
														<td>${wl.dinning_stand_name}</td>
														<td>${wl.dining_place}</td>
													</tr>
												</c:forEach>
												</tbody>

											</table>
										</div>

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
															<c:when test="${pageSize == 200}"><option selected="selected" value="200">200</option></c:when>
															<c:otherwise><option value="200">200</option></c:otherwise>
														</c:choose>
														<c:choose>
															<c:when test="${pageSize == 500}"><option selected="selected" value="500">500</option></c:when>
															<c:otherwise><option value="500">500</option></c:otherwise>
														</c:choose>
													</select>
													数据
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

								</div>

								<c:choose>
									<c:when test="${flag == 3}">
										<div class="tab-pane fade in active" id="android">
									</c:when>
									<c:otherwise>
										<div class="tab-pane fade in" id="android">
									</c:otherwise>
								</c:choose>
								
								<form  action="${contextPath}/dining?flag=3" method="post">
								<!-- page -->
								<input type="hidden" class="pageIndex" name="pageNumber" value='<c:out value="${pageNumber}" default="1"/>'>
								<input type="hidden" class="pageSize" name="pageSize" value='<c:out value="${pageSize}" default="10"/>'>
								<input type="hidden" class="totalPages" name="postulanttotalPage" value='<c:out value="${postulanttotalPage}" default="1"/>'>
								<!-- page -->

									<div class="panel panel-default">
									
										<div class="panel-title">

											<h5 style="" class="panel-title diningManageToll">本次用餐总人数为&nbsp;${postulantDiningList.totalRow}&nbsp;人，已进餐人数为123人</h5>

										</div>
										<div class="panel-body">
											<table class="table table-condensed table-hover  table-bordered table-responsive">
												<caption>
													<div class="pull-left query">
														<span>
															用餐标准：
															<select name="" class="diningNorm">
																<option>不限</option>
															</select>
														</span>
														<span>
															用餐日期：
															<input type="text" class="diningDate" placeholder="请输入用餐日期" name="dining_date" value="${dining_date}" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd',readOnly:true})"/>
														</span>
														<span>
															用餐时间：
															<input type="text" class="diningTime" placeholder="请输入用餐时间" name="dining_time" value="${dining_time}" onfocus="WdatePicker({dateFmt:'HH:mm:00',readOnly:true})"/>
														</span>
														<span>
															餐次：
															<input type="text" class="diningNum" placeholder="请输入用餐车次" onblur="" name="count" value="${count}" />
														</span>
														<span>
															用餐地点：
															<input type="text" class="diningAdress" placeholder="用餐地点" onblur="" name="dining_place" value="${dining_place}" />
														</span>
														<span>
															<button  class="btn btn-primary" type="submit">
																查询<b class="fa fa-search ml5"></b>
															</button>
														</span>
														<span>
															<label>总用餐人数：<b class="red-text diningSum">10000</b>人</label>
														</span>
														<span>
															<label>实际用餐人数：<b class="red-text diningCurrent">10000</b>人</label>
														</span>
													</div>
												</caption>
												<thead>

													<tr>

														<th>志愿者姓名</th>
														<th>志愿者国籍</th>
														<th>团队</th>
														<th>学校</th>
														<th>专业</th>
														<th>用餐时间</th>
														<th>进入用餐次数</th>
														<th>用餐标准</th>
														<th>用餐地点</th>
													</tr>

												</thead>
												<tbody>
													<c:forEach items="${postulantDiningList.list}" var="pl">
														<tr>
	
															<td>${pl.realname}</td>
															<td>${pl.national}</td>
															<td>${pl.group_name}</td>
															<td>${pl.unit}</td>
															<td>${pl.skill}</td>
															<td>${pl.dining_time}</td>
															<td>${pl.count}</td>
															<td>${pl.dinning_stand_name}</td>
															<td>${pl.dining_place}</td>
														</tr>
													</c:forEach>

												</tbody>

											</table>
										</div>

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
															<c:when test="${pageSize == 200}"><option selected="selected" value="200">200</option></c:when>
															<c:otherwise><option value="200">200</option></c:otherwise>
														</c:choose>
														<c:choose>
															<c:when test="${pageSize == 500}"><option selected="selected" value="500">500</option></c:when>
															<c:otherwise><option value="500">500</option></c:otherwise>
														</c:choose>
													</select>
													数据
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

						</div>

					</div>
				</div>
				
			</div>
		</div>
			
			<!-- /.col-lg-12 -->
		<!-- /.row -->

		<!-- /#page-wrapper -->
		<!-- 模态框（Modal） -->

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
		
		<!-- page -->
		<script src="${contextPath}/CLMF-adminUI-dev/bower_components/paginator/paginator.min.js"></script>

		<script src="${contextPath}/CLMF-adminUI-dev/dist/js/page/page.js"></script>
		
		<script src="${contextPath}/CLMF-adminUI-dev/dist/js/mwi_tables/dining_management.js"></script>

		<!-- Page-Level Demo Scripts - Tables - Use for reference -->

	</body>

</html>