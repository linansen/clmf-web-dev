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

		<title>活动管理之活动签到之权限管理</title>

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
						<h4><span class="fa fa-calculator"></span>&nbsp;活动签到-权限管理</h4>
					</div>
					
					<div class="panel-body">
						
                        <div id="setting_area" class="col-lg-6 setting_area">
                        		<button class="mt15 ml20 mb10 btn btn-primary" id="dining_rights_setting">入场规则标准创建</button>
                        		<div style="display: none;" id="dining_rights_setting_detail">
                        			<form action="${contextPath}/activity_check_manage/addCheckRule" method="post">
                        		     	<table class="table table-bordered table-responsive table-striped">
                        				<tbody>
                        					
                        					<tr>
                        						<td class="tdTextAlign">入场规则标准名称:</td>
                        						<td >
                        							<input class="tdWidth" type="text" placeholder="请输入入场规则标准名称" onblur="" name="checkRuleModel.stand_name"/>
                        						</td>
                        					</tr>
                        					<tr>
                        						<td class="tdTextAlign">入场地点:</td>
                        						<td >
                        							<input class="tdWidth" type="text" placeholder="请输入入场地点" onblur="" name="checkRuleModel.entry_address"/>
                        						</td>
                        					</tr>
                        					<tr>
                        						<td class="tdTextAlign">入场日期:</td>
                        						<td >
                        							<input class="tdWidth"  onfocus="WdatePicker({dateFmt:'yyyy-MM-dd',readOnly:true})" type="text" placeholder="请输入入场日期" onblur="" name="checkRuleModel.entry_date"/>
                        						</td>
                        					</tr>
                        					<tr>
                        						<td class="tdTextAlign">入场时间:</td>
                        						<td >
                        							<input class="tdWidth" onfocus="WdatePicker({dateFmt:'HH:mm:00',readOnly:true})" type="text" placeholder="请输入入场时间" onblur="" name="checkRuleModel.entry_date"/>
                        						</td>
                        					</tr>
                        					<tr>
                        						<td class="tdTextAlign">入场主题:</td>
                        						<td >
                        							<input class="tdWidth" type="text" placeholder="请输入入场主题" onblur="" name="checkRuleModel.entry_thema"/>
                        						</td>
                        					</tr>
                        				    <tr>
                        						<td class="tdTextAlign">入场方式:</td>
                        						<td >
                        							<input class="tdWidth" type="text" placeholder="请输入入场方式" onblur="" name="checkRuleModel.entry_type"/>
                        						</td>
                        					</tr>
                        					<tr>
                        						<td class="tdTextAlign">入场规则描述：</td>
                        						<td>
									               <textarea name="checkRuleModel.entry_description" rows="5" cols="50" class="tdWidth"></textarea>
                        						</td>
                        					</tr>
                        					<tr>
                        						<td colspan="2" class="text-center">
                        							<button  type="submit" class="btn btn-sm btn-primary">创建入场规则</button>
                        						</td>
                        					</tr>
                        				</tbody>
                        			</table>
                        		</form>
                        	</div>
                        </div>
                       
                        <div id="show_area" class="panel panel-default width49 fl show_area">
                        
                        		<div class="panel-heading">
                        			<h5 class= "panel-title">
                        				已创建的入场规则
                        			</h5>
                        		</div>
                        		<div class="panel-body">
                        			<c:forEach items="${checkRuleList}" var="crsl">
	                        			<button onclick="findCheckRuleStandById('${crsl.id}')" class="btn btn-default btn-sm mr5" data-toggle="modal"  title="${crsl.entry_address}--(${crsl.entry_date})--总人数${crsl.count}人" data-placement="bottom" data-target="#routeDetail">${crsl.stand_name}</button>
                        			</c:forEach>
                        		</div>
                        </div>
                        <div class="clearfix"></div>
                        <div id="tabs">
						<ul id="myTab" class="nav nav-pills" >
							<c:choose>
								<c:when test="${flag == 1}">
									<li class="active">
								</c:when>
								<c:otherwise>
									<li >
								</c:otherwise>
							</c:choose>
								<a href="${contextPath}/activity_check_manage?flag=1"> &nbsp;&nbsp;嘉宾 &nbsp;&nbsp;</a>
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
								<a href="${contextPath}/activity_check_manage?flag=2">工作人员</a>
							</li>

							<c:choose>
								<c:when test="${flag == 3}">
									<li class="active">
								</c:when>
								<c:otherwise>
									<li >
								</c:otherwise>
							</c:choose>
								<a href="${contextPath}/activity_check_manage?flag=3">志愿者</a>
							</li>
							<li class="pull-right">
								<c:choose>
									<c:when test="${flag == 1}">
										<button class="btn btn-success" onclick="batchReset('${flag}')" data-toggle="modal" data-target="#guest_admissionSetting">批量设置入场规则权限</button>
									</c:when>
									<c:otherwise>
										<button class="btn btn-success" onclick="batchReset('${flag}')" data-toggle="modal" data-target="#staff_admissionSetting">批量设置入场规则权限</button>
									</c:otherwise>
								</c:choose>
								
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
							
							<form action="${contextPath}/activity_check_manage?flag=1" method="post">
							<!-- page -->
							<input type="hidden" class="pageIndex" name="pageNumber" value='<c:out value="${pageNumber}" default="1"/>'>
							<input type="hidden" class="pageSize" name="pageSize" value='<c:out value="${pageSize}" default="10"/>'>
							<input type="hidden" class="totalPages" name="guestTotalPage" value='<c:out value="${guestTotalPage}" default="1"/>'>
							<!-- page -->
								<div class="panel panel-default">
									
									<div class="panel-body">
										<table class="table table-condensed table-hover table-responsive">
											<caption>
												<div class="query">
	                                              	<span>
	                                              		中文姓名：
														<input type="text" placeholder="请输入中文姓名" onblur="" value="${chineseName}" name="chineseName"/>
	                                              	</span>
	                                              	<span>
	                                              		英文姓名：
														<input type="text" placeholder="请输入英文姓名" onblur="" value="${englishName }" name="englishName"/>
	                                              	</span>
<%-- 	                                              	<span>
														单位：
														<input type="text" name="ch_organ_name" value="${ch_organ_name}" placeholder="请输入单位" />
													</span>
 --%>													<span>
														单位及职务：
														<input type="text" name="post" value="${post}" placeholder="请输入职务" />
													</span>
	                                              	<span>
														国籍：
														<select name="national">
															<option>所有国家</option>
														</select>
														<%-- <input type="text" name="national" value="${national}" placeholder="请输入国籍" /> --%>
													</span>
	                                              	<span>
	                                              		绑定状态：
	                                              		<select name="is_bind_activityCheckStandard">
	                                              			<c:choose>
	                                              				<c:when test="${is_bind_activityCheckStandard == 0}">
	                                              					<option value="">全部</option>
			                                              			<option selected="selected" value="0">未绑定</option>
			                                              			<option value="1">已绑定</option>
	                                              				</c:when>
	                                              				<c:when test="${is_bind_activityCheckStandard == 1}">
	                                              					<option value="">全部</option>
			                                              			<option value="0">未绑定</option>
			                                              			<option selected="selected" value="1">已绑定</option>
	                                              				</c:when>
	                                              				<c:otherwise>
	                                              					<option selected="selected" value="">全部</option>
			                                              			<option value="0">未绑定</option>
			                                              			<option value="1">已绑定</option>
	                                              				</c:otherwise>
	                                              			</c:choose>
	                                              			
	                                              		</select>
	                                              	</span>
	                                              	<span>
	                                              		<button  class="btn btn-primary" type="submit">
															查询<b class="fa fa-search ml5"></b>
														</button>
	                                              	</span>
	                                              	<span>
														<label>记录总数：<b class="red-text">${guestCount}</b>条</label>
													</span>
												</div>
											</caption>
											<thead>
												<tr>
													<th><label>全选<input type="checkbox" class="checkAll"/></label></th>
													<th>序号</th>
													<th>嘉宾姓名</th>
													<th>英文姓名</th>
									                <th>国籍</th>
									                <!-- <th>单位</th> -->
													<th>单位及职务</th>
													<th>绑定状态</th>
									                <th width="15%">入场标准名称</th>
									                <th>操作</th>
												</tr>
											</thead>
											<tbody>
												<c:forEach items="${guestWithActivityCheckList.list}" var="gwacl" varStatus="status">
													<tr>
														<td><input type="checkbox" name="guestResetCheckBox" value="${gwacl.id}" /></td>
														<td>${status.index+1}</td>
														<td>${gwacl.chinese_name}</td>
														<td>${gwacl.english_name}</td>
														<td>${gwacl.national}</td>
													    <%-- <td>${gwacl.ch_organ_name}</td> --%>
													    <td>${gwacl.post}</td>
													    <c:choose>
													    	<c:when test="${gwacl.is_bind_activityCheckStandard == 0}"><td>未绑定</td></c:when>
													    	<c:otherwise><td>绑定</td></c:otherwise>
													    </c:choose>
										                
										                <td class="staff" width="15%" style="position: absolute;">
															${gwacl.acitivityCheckList[0].stand_name}
															<div class="table-tooltip">
																<c:forEach items="${gwacl.acitivityCheckList}" var="gwaclacl" varStatus="status">
																	<span>${gwaclacl.stand_name}</span>
																</c:forEach>
															</div>
														</td>
														<td><button type="button" class="btn btn-sm btn-success" onclick="resetGuestCheckRule('${gwacl.id}')" data-toggle="modal" data-target="#guest_admissionSetting">入场规则设置<span class="fa fa-skype"></span></button></td>
													</tr>
												</c:forEach>
											</tbody>
										</table>
									</div>

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


							</div>
							
							
							<c:choose>
								<c:when test="${flag == 2}">
									<div class="tab-pane fade in active" id="ios">
								</c:when>
								<c:otherwise>
									<div class="tab-pane fade in" id="ios">
								</c:otherwise>
							</c:choose>

								<div class="panel panel-default">
								
									<form action="${contextPath}/activity_check_manage?flag=2" method="post">
									<!-- page -->
									<input type="hidden" class="pageIndex" name="pageNumber" value='<c:out value="${pageNumber}" default="1"/>'>
									<input type="hidden" class="pageSize" name="pageSize" value='<c:out value="${pageSize}" default="10"/>'>
									<input type="hidden" class="totalPages" name="workerTotalPage" value='<c:out value="${workerTotalPage}" default="1"/>'>
									<!-- page -->
									
									<div class="panel-body">
										<table class="table table-condensed table-hover table-responsive">
											<caption>
												<div class="query">
	                                              	<span>
	                                              		工作人员姓名：
														<input type="text" placeholder="请输入工作人员姓名" value="${realName}" onblur="" name="realName"/>
	                                              	</span>
	                                              	<span>
	                                              		性别：
	                                              		<select name="sex">
	                                              			<c:choose>
	                                              				<c:when test="${sex == 1}">
	                                              					<option value="">请选择性别</option>
			                                              			<option selected="selected" value="1">男</option>
			                                              			<option value="2">女</option>
	                                              				</c:when>
	                                              				<c:when test="${sex == 2}">
	                                              					<option value="">请选择性别</option>
			                                              			<option value="1">男</option>
			                                              			<option selected="selected" value="2">女</option>
	                                              				</c:when>
	                                              				<c:otherwise>
	                                              					<option selected="selected" value="">请选择性别</option>
			                                              			<option value="1">男</option>
			                                              			<option value="2">女</option>
	                                              				</c:otherwise>
	                                              			</c:choose>
	                                              		</select>
	                                              	</span>
	                                              	<span>
														单位：
														<input type="text" name="unit" value="${unit}" placeholder="请输入单位" />
													</span>
													<span>
														职务：
														<input type="text" name="workerPost" value="${workerPost}" placeholder="请输入职务" />
													</span>
	                                              	<span>
	                                              		工作组：
														<input type="text" placeholder="请输入工作组" value="${groupName}" onblur="" name="groupName"/>
	                                              	</span>
	                                              	<span>
	                                              		绑定状态：
	                                              		<select name="isBind">
	                                              			<c:choose>
	                                              				<c:when test="${isBind == 0}">
	                                              					<option value="">全部</option>
			                                              			<option selected="selected" value="0">未绑定</option>
			                                              			<option value="1">已绑定</option>
	                                              				</c:when>
	                                              				<c:when test="${isBind == 1}">
	                                              					<option value="">全部</option>
			                                              			<option value="0">未绑定</option>
			                                              			<option selected="selected" value="1">已绑定</option>
	                                              				</c:when>
	                                              				<c:otherwise>
	                                              					<option selected="selected" value="">全部</option>
			                                              			<option value="0">未绑定</option>
			                                              			<option value="1">已绑定</option>
	                                              				</c:otherwise>
	                                              			</c:choose>
	                                              			
	                                              		</select>
	                                              	</span>
	                                              	<span>
	                                              		<button  class="btn btn-primary" type="submit">
															查询<b class="fa fa-search ml5"></b>
														</button>
	                                              	</span>
	                                              	<span>
														<label>记录总数：<b class="red-text">${workerCount}</b>条</label>
													</span>
												</div>
											</caption>
											<thead>
												<tr>
													<th><label>全选<input type="checkbox" class="checkAll"/></label></th>
													<th>序号</th>
													<th>工作人员姓名</th>
									                <th>工作组</th>
									                <th>单位</th>
													<th>职务</th>
													<th>绑定状态</th>
									                <th width="15%">入场标准名称</th>
									                <th>操作</th>
												</tr>
											</thead>
											<tbody>
												<c:forEach items="${workerWithActivityCheckList.list}" var="wwacl" varStatus="status">
													<tr>
														<td><input name="workerResetCheckBox" value="${wwacl.workerId}" type="checkbox" /></td>
														<td>${status.index+1}</td>
														<td>${wwacl.realname}</td>
														<td>${wwacl.group_name}</td>
													    <td>${wwacl.unit}</td>
													    <td>${wwacl.post}</td>
													    <c:choose>
														    <c:when test="${wwacl.is_bind_checkStand==1}"><td>绑定</td></c:when>
													    	<c:otherwise><td>未绑定</td></c:otherwise>
													    </c:choose>
													    <td class="staff" width="15%" style="position: absolute;">
															${wwacl.acitivityCheckList[0].stand_name}
															<div class="table-tooltip">
																<c:forEach items="${wwacl.acitivityCheckList}" var="wwaclacl" varStatus="status">
																	<span>${wwaclacl.stand_name}</span>
																</c:forEach>
															</div>
														</td>
														<td><button type="button" class="btn btn-sm btn-success" onclick="resetWorkerCheckRule('${wwacl.workerId}')" data-toggle="modal" data-target="#staff_admissionSetting">入场规则设置<span class="fa fa-skype"></span></button></td>
													</tr>
												</c:forEach>
											</tbody>

										</table>
									</div>
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
									</form>

								</div>

							</div>

							<c:choose>
								<c:when test="${flag == 3}">
									<div class="tab-pane fade in active" id="android">
								</c:when>
								<c:otherwise>
									<div class="tab-pane fade in" id="android">
								</c:otherwise>
							</c:choose>
								<form action="${contextPath}/activity_check_manage?flag=3" method="post">
								<!-- page -->
								<input type="hidden" class="pageIndex" name="pageNumber" value='<c:out value="${pageNumber}" default="1"/>'>
								<input type="hidden" class="pageSize" name="pageSize" value='<c:out value="${pageSize}" default="10"/>'>
								<input type="hidden" class="totalPages" name="supporterTotalPage" value='<c:out value="${supporterTotalPage}" default="1"/>'>
								<!-- page -->
								<div class="panel panel-default">
									
									
									<div class="panel-body">
										<table class="table table-condensed table-hover table-responsive">
											<caption>
												<div class="query">
	                                              	<span>
	                                              		志愿者姓名：
														<input type="text" placeholder="请输入志愿者姓名" value="${realName}" onblur="" name="realName"/>
	                                              	</span>
	                                              	<span>
	                                              		性别：
	                                              		<select name="sex">
	                                              			<c:choose>
	                                              				<c:when test="${sex == 1}">
	                                              					<option value="">请选择性别</option>
			                                              			<option selected="selected" value="1">男</option>
			                                              			<option value="2">女</option>
	                                              				</c:when>
	                                              				<c:when test="${sex == 2}">
	                                              					<option value="">请选择性别</option>
			                                              			<option value="1">男</option>
			                                              			<option selected="selected" value="2">女</option>
	                                              				</c:when>
	                                              				<c:otherwise>
	                                              					<option selected="selected" value="">请选择性别</option>
			                                              			<option value="1">男</option>
			                                              			<option value="2">女</option>
	                                              				</c:otherwise>
	                                              			</c:choose>
	                                              		</select>
	                                              	</span>
	                                              	<span>
	                                              		学校：
														<input type="text" placeholder="请输入学校" value="${unit}" onblur="" name="unit"/>
	                                              	</span>
	                                              	<span>
	                                              		学院：
														<input type="text" placeholder="请输入学院" value="${workerPost}" onblur="" name="workerPost"/>
	                                              	</span>
	                                              	<span>
	                                              		工作组：
														<input type="text" placeholder="请输入团队" value="${groupName}" onblur="" name="groupName"/>
	                                              	</span>
	                                              	<span>
	                                              		绑定状态：
	                                              		<select name="isBind">
	                                              			<c:choose>
	                                              				<c:when test="${isBind == 0}">
	                                              					<option value="">全部</option>
			                                              			<option selected="selected" value="0">未绑定</option>
			                                              			<option value="1">已绑定</option>
	                                              				</c:when>
	                                              				<c:when test="${isBind == 1}">
	                                              					<option value="">全部</option>
			                                              			<option value="0">未绑定</option>
			                                              			<option selected="selected" value="1">已绑定</option>
	                                              				</c:when>
	                                              				<c:otherwise>
	                                              					<option selected="selected" value="">全部</option>
			                                              			<option value="0">未绑定</option>
			                                              			<option value="1">已绑定</option>
	                                              				</c:otherwise>
	                                              			</c:choose>
	                                              			
	                                              		</select>
	                                              	</span>
	                                              	<span>
	                                              		<button  class="btn btn-primary" type="submit">
															查询<b class="fa fa-search ml5"></b>
														</button>
	                                              	</span>
	                                              	<span>
														<label>记录总数：<b class="red-text">${supporterCount}</b>条</label>
													</span>
												</div>
											</caption>
											<thead>
												<tr>
													<th><label>全选<input type="checkbox" class="checkAll"></label></th>
													<th>序号</th>
													<th>志愿者姓名</th>
													<th>性别</th>
													<th>学校</th>
													<th>学院</th>
													<th>工作组</th>
													<th>绑定状态</th>
													<th width="15%">入场标准名称</th>
													<th>操作</th>
												</tr>
											</thead>
											<tbody>
												<c:forEach items="${supporterWithActivityCheckList.list}" var="swacl" varStatus="status">
													<tr>
														<td><input name="supporterResetCheckBox" value="${swacl.workerId}" type="checkbox" /></td>
														<td>${status.index+1}</td>
														<td>${swacl.realname}</td>
														 <c:choose>
														    <c:when test="${swacl.sex==1}"><td>男</td></c:when>
													    	<c:otherwise><td>女</td></c:otherwise>
													    </c:choose>
													    <td>${swacl.unit}</td>
													    <td>${swacl.post}</td>
														<td>${swacl.group_name}</td>
													    <c:choose>
														    <c:when test="${swacl.is_bind_checkStand==1}"><td>绑定</td></c:when>
													    	<c:otherwise><td>未绑定</td></c:otherwise>
													    </c:choose>
													    <td class="staff" width="15%" style="position: absolute;">
															${swacl.acitivityCheckList[0].stand_name}
															<div class="table-tooltip">
																<c:forEach items="${swacl.acitivityCheckList}" var="swaclacl" varStatus="status">
																	<span>${swaclacl.stand_name}</span>
																</c:forEach>
															</div>
														</td>
														<td><button type="button" class="btn btn-sm btn-success" onclick="resetSupporterCheckRule('${swacl.workerId}')" data-toggle="modal" data-target="#staff_admissionSetting">入场规则设置<span class="fa fa-skype"></span></button></td>
													</tr>
												</c:forEach>
											</tbody>
										</table>
									</div>
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
								
							</div>
							
						</div>
						
                      </div>
                      
					</div>
					
				</div>
				
			</div>
			<!-- /.col-lg-12 -->
		</div>
		<!-- /.row -->

		<!-- /#page-wrapper -->
        <!-- 模态框（Modal） -->
  

		<div id="guest_admissionSetting" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" 
		     aria-hidden="true">
			<div class="modal-dialog">

				<div class="modal-content" >

					<div class="modal-body" style="padding: 0px;">
					     
				           <div class="panel panel-primary">
				           	
				           	   <div class="panel-heading" style="height: 50px;">
				           	   	 <form name="resetCheckRuleForm" action="" method="post">
				           	       <div class="pull-left">
				                	  <h5><span class="fa fa-check-square-o"></span>&nbsp;入场规则设置</h5>
				                   </div>  	   	  	   
						         	<div class="pull-right btn-group-sm ">
										<button class="btn btn-warning btn-sm"><div class="fa fa-save"></div>&nbsp;保存
										</button>
										<button class="btn btn-info btn-sm" type="button" data-dismiss="modal"><span class="fa fa-power-off"></span>&nbsp;关闭
										</button>
									</div>
				           	   	</div>
				              	<div class="panel-body">
									<div class="add-guest-kind">
										<div>
											<span>
												<input type="hidden" name="reset_person_type" value="" />
												<input type="hidden" name="reset_person_id" value="" />
												选择入场标准：
												<c:forEach items="${checkRuleList}" var="crsl">
													<a class="btn btn-default principle" title="${crsl.entry_address}--(${crsl.entry_date})--总人数${crsl.count}人" data-placement="bottom"><label><input name="standardRuleId" value="${crsl.id}" type="checkbox">${crsl.stand_name}</label></a>
			                        			</c:forEach>
											</span>
										</div>
									</div>
	                    			 
		              					<table class="table table-striped table-bordered table-responsive table-hover">
											<tbody>
												<tr>
													<td>
														是否微信推送：
													</td>
													<td>
														<label><input type="radio" name="guest_send_weichat" value="guest_send_weichat_yes" />是</label>
														<label><input type="radio" name="austom_send_weichat" value="guest_send_weichat_no" />否</label>
													</td>
				
												</tr>
												<tr>
													<td>
														是否邮件通知：
													</td>
													<td>
														<label><input type="radio" name="guest_send_message" value="guest_send_message_yes" />是</label>
														<label><input type="radio" name="austom_send_message" value="guest_send_message_no" />否</label>
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
        </div>
        <div id="staff_admissionSetting" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" 
		     aria-hidden="true">
			<div class="modal-dialog">

				<div class="modal-content" >

					<div class="modal-body" style="padding: 0px;">
					     
				           <div class="panel panel-primary">
				           	
				           	   <div class="panel-heading" style="height: 50px;">
				           	   	 <form name="resetCheckRuleForm" action="" method="post">
				           	       <div class="pull-left">
				                	  <h5><span class="fa fa-check-square-o"></span>&nbsp;入场规则设置</h5>
				                   </div>  	   	  	   
						         	<div class="pull-right btn-group-sm ">
										<button class="btn btn-warning btn-sm"><div class="fa fa-save"></div>&nbsp;保存
										</button>
										<button class="btn btn-info btn-sm" type="button" data-dismiss="modal"><span class="fa fa-power-off"></span>&nbsp;关闭
										</button>
									</div>
				           	   	</div>
				              	<div class="panel-body">
									<div class="add-guest-kind">
										<div>
											<span>
												<input type="hidden" name="reset_person_type" value="" />
												<input type="hidden" name="reset_person_id" value="" />
												选择入场标准：
												<c:forEach items="${checkRuleList}" var="crsl">
													<a class="btn btn-default principle" title="${crsl.entry_address}--(${crsl.entry_date})--总人数${crsl.count}人" data-placement="bottom"><label><input name="standardRuleId" value="${crsl.id}" type="checkbox">${crsl.stand_name}</label></a>
			                        			</c:forEach>
											</span>
										</div>
									</div>
	                    			 
		              					<table class="table table-striped table-bordered table-responsive table-hover">
											<tbody>
												<tr>
													<td>
														是否邮件推送：
													</td>
													<td>
														<label><input type="radio" name="guest_send_weichat" value="guest_send_weichat_yes" />是</label>
														<label><input type="radio" name="austom_send_weichat" value="guest_send_weichat_no" />否</label>
													</td>
				
												</tr>
												<tr>
													<td>
														是否微信推送：
													</td>
													<td>
														<label><input type="radio" name="guest_send_weichat" value="guest_send_weichat_yes" />是</label>
														<label><input type="radio" name="austom_send_weichat" value="guest_send_weichat_no" />否</label>
													</td>
				
												</tr>
												<tr>
													<td>
														是否短信通知：
													</td>
													<td>
														<label><input type="radio" name="guest_send_message" value="guest_send_message_yes" />是</label>
														<label><input type="radio" name="austom_send_message" value="guest_send_message_no" />否</label>
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
        </div>
        <div id="routeDetail" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" 
		     aria-hidden="true">
			<div class="modal-dialog">

				<div class="modal-content" >

					<div class="modal-body" style="padding: 0px;">
					     
				           <div class="panel panel-primary">
				           <!-- 修改规则标准 -->
					           	<form action="${contextPath}/activity_check_manage/updateCheckRule" method="post">
					           	   <div class="panel-heading" style="height: 50px;">
					           	   	 	<input type="hidden" name="editCheckRuleStand.id">
					           	       <div class="pull-left">
					                	  <h5><span class="fa fa-check-square-o mr5"></span>活动路线详细信息</h5>
					                   </div>  	   	  	   
							         	<div class="pull-right btn-group-sm ">
											<button class="btn btn-warning btn-sm">保存<div class="fa fa-save ml5"></div>
											</button>
											<button onclick="delActivityRule()" type="button" class="btn btn-danger btn-sm">删除<div class="fa fa-remove ml5"></div>
											</button>
											<button class="btn btn-info btn-sm" data-dismiss="modal">关闭<span class="fa fa-power-off ml5"></span>
											</button>
										</div>
					           	   	</div>
					              	<div class="panel-body">
										<table class="table table-striped table-bordered table-hover " cellspacing="2" width="80%">
											<tbody>
												<tr>
	                        						<td class="tdTextAlign">入场规则标准名称:</td>
	                        						<td >
	                        							<input class="tdWidth" type="text" placeholder="请输入入场规则标准名称" onblur="" name="editCheckRuleStand.stand_name"/>&nbsp;
	                        						</td>
	                        					</tr>
	                        					
	                        					<tr>
	                        						<td class="tdTextAlign">入场地点:</td>
	                        						<td >
	                        							<input class="tdWidth" type="text" placeholder="请输入入场地点" onblur="" name="editCheckRuleStand.entry_address"/>&nbsp;
	                        						</td>
	                        					</tr>
	                        					
	                        					<tr>
	                        						<td class="tdTextAlign">入场日期:</td>
	                        						<td >
	                        							<input class="tdWidth" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd',readOnly:true})" type="text" placeholder="请输入入场日期" onblur="" name="editCheckRuleStand.entry_date"/>&nbsp;
	                        						</td>
	                        					</tr>
	                        					<tr>
	                        						<td class="tdTextAlign">入场时间:</td>
	                        						<td >
	                        							<input class="tdWidth" onfocus="WdatePicker({dateFmt:'HH:mm:00',readOnly:true})" type="text" placeholder="请输入入场时间" onblur="" name="editCheckRuleStand.entry_time"/>&nbsp;
	                        						</td>
	                        					</tr>
	                        					<tr>
	                        						<td class="tdTextAlign">入场主题:</td>
	                        						<td >
	                        							<input class="tdWidth" type="text" placeholder="请输入入场主题" onblur="" name="editCheckRuleStand.entry_thema"/>&nbsp;
	                        						</td>
	                        					</tr>
	                        					
	                        				    <tr>
	                        						<td class="tdTextAlign">入场方式:</td>
	                        						<td >
	                        							<input class="tdWidth" type="text" placeholder="请输入入场方式" onblur="" name="editCheckRuleStand.entry_type"/>&nbsp;
	                        						</td>
	                        					</tr>
	                        					
	                        					<tr>
	                        						<td class="tdTextAlign">入场规则描述：</td>
	                        						<td>
										               <textarea name="editCheckRuleStand.entry_description" rows="5" cols="50" class="tdWidth"></textarea>
	                        						</td>
	                        					</tr>
											</tbody>
										</table>
			                		</div>
		                		</form>
			            	</div>
						</div>
					</div>
				<!-- /.modal-content -->
			</div>
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
		<script type="text/javascript">
			$(document).ready(function() {
				$("[data-toggle='modal']").tooltip(); 
				$('.principle').tooltip();
				$("#dining_rights_setting").click(function() {
					$("#dining_rights_setting_detail").fadeToggle(300);
				});
			});
			
			function getProjectName(){
				var pathName = window.document.location.pathname;
				var projectName = pathName.substring(0,pathName.substr(1).indexOf('/')+1);
				return projectName;
			}
			
			function findCheckRuleStandById(id){
				$.post(getProjectName()+"/activity_check_manage/toUpdateCheckRule/"+id, function(data){
					$("input[name='editCheckRuleStand.id']").val(data.check_rule_standard.id);
					$("input[name='editCheckRuleStand.stand_name']").val(data.check_rule_standard.stand_name);
					$("input[name='editCheckRuleStand.entry_address']").val(data.check_rule_standard.entry_address);
					$("input[name='editCheckRuleStand.entry_date']").val(data.check_rule_standard.entry_date);
					$("input[name='editCheckRuleStand.entry_time']").val(data.check_rule_standard.entry_time);
					$("input[name='editCheckRuleStand.entry_thema']").val(data.check_rule_standard.entry_thema);
					$("input[name='editCheckRuleStand.entry_type']").val(data.check_rule_standard.entry_type);
					$("textarea[name='editCheckRuleStand.entry_description']").text(data.check_rule_standard.entry_description);
					
				});
			}
			
			//jinwoo
			function resetGuestCheckRule(id){
				$("input[name='reset_person_type']").val(1);
				$("input[name='reset_person_id']").val(id);
				document.resetCheckRuleForm.action = getProjectName()+"/activity_check_manage/updateCheckStandard?flag=1";
			}
			
			function resetWorkerCheckRule(id){
				$("input[name='reset_person_type']").val(2);
				$("input[name='reset_person_id']").val(id);
				document.resetCheckRuleForm.action = getProjectName()+"/activity_check_manage/updateCheckStandard?flag=2";
			}
			
			function resetSupporterCheckRule(id){
				$("input[name='reset_person_type']").val(2);
				$("input[name='reset_person_id']").val(id);
				document.resetCheckRuleForm.action = getProjectName()+"/activity_check_manage/updateCheckStandard?flag=3";
			}
			
			function batchReset(flag){
				alert(flag);
				var personIdArr = new Array();
				var personIdArrStr = "";
				if(flag == 1){
					$("input[name='reset_person_type']").val(1);
					personIdArr = document.getElementsByName("guestResetCheckBox");
					document.resetCheckRuleForm.action = getProjectName()+"/activity_check_manage/updateCheckStandard?flag="+flag;
				}
				if(flag == 2){
					$("input[name='reset_person_type']").val(2);
					personIdArr = document.getElementsByName("workerResetCheckBox");
					alert(personIdArr.length);
					document.resetCheckRuleForm.action = getProjectName()+"/activity_check_manage/updateCheckStandard?flag="+flag;
				}
				if(flag == 3){
					$("input[name='reset_person_type']").val(2);
					personIdArr = document.getElementsByName("supporterResetCheckBox");
					document.resetCheckRuleForm.action = getProjectName()+"/activity_check_manage/updateCheckStandard?flag="+flag;
				}
				
				for(var i=0; i<personIdArr.length; i++){
					if( personIdArr[i].checked){
						personIdArrStr = personIdArrStr + personIdArr[i].value;
						personIdArrStr = personIdArrStr + ",";
					}
				}
				$("input[name='reset_person_id']").val(personIdArrStr);
			}
			
			function delActivityRule(){
				var activityRuleId = $("input[name='editCheckRuleStand.id']").val();
				window.location.href = getProjectName()+"/activity_check_manage/deleteCheckRule/"+activityRuleId;
			}
		</script>


	</body>

</html>
