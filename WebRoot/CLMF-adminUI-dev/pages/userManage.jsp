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

		<title>权限管理</title>

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
		
		<link href="${contextPath}/CLMF-adminUI-dev/dist/js/tree/jquery.bonsai.css" rel="stylesheet">
		
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
						<h4><span class="fa fa-eye-slash"></span>&nbsp;权限管理</h4>
					</div>
					
					<div class="panel-body">
						<table class="table table-condensed table-hover table-responsive">
							<caption>
								<div class="pull-left query" id="">
                                  	<form action="${contextPath}/admin" method="post">
                                  		<span>
                                      		用户名：
											<input type="text" placeholder="请输入用户名" onblur="" name="userName" value="${userName}"/>
                                      	</span>
                                      	<span>
                                      		姓名：
											<input type="text" placeholder="请输入中文姓名" onblur="" name="realName" value="${realName}"/>
                                      	</span>
                                      	<span>
                                      		分配状态：
                                      		<select name="isBind">
                                      			<c:choose>
                                      				<c:when test="${isBind == 0}">
                                      					<option value="">全部</option>
		                                      			<option value="1">已分配</option>
		                                      			<option selected="selected" value="0">未分配</option>
                                      				</c:when>
                                      				<c:when test="${isBind == 1}">
                                      					<option value="">全部</option>
		                                      			<option selected="selected" value="1">已分配</option>
		                                      			<option value="0">未分配</option>
                                      				</c:when>
                                      				<c:otherwise>
                                      					<option selected="selected" value="">全部</option>
		                                      			<option value="1">已分配</option>
		                                      			<option value="0">未分配</option>
                                      				</c:otherwise>
                                      			</c:choose>
                                      			
                                      		</select>
                                      	</span>
                                      	<span>
                                      		<button class="btn btn-primary" type="submit">
												查询<b class="fa fa-search ml5"></b>
											</button>
                                      	</span>
                                      	<span>
											<label>记录总数：<b class="red-text">${count}</b>条</label>
										</span>
										<span class="pull-right">
											<button type="button" onclick="tobatchsetrole()" class="btn btn-primary" data-target="#roleSetting" data-toggle="modal">批量设置权限</button>
										</span>
									</form>
								</div>
							</caption>
							<thead>
								<tr>
									<th><label>全选<input type="checkbox" class="checkAll"></label></th>
									<th>序号</th>
									<th>用户名</th>
									<th>姓名</th>
									<th>分配状态</th>
									<th>分配角色</th>
									<th>操作</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${userPage.list}" var="upl" varStatus="s">
									<tr>
										<td><input name="ids" value="${upl.userId}" type="checkbox"></td>
										<td>${s.index+1}</td>
										<td>${upl.username}</td>
										<td>${upl.realname}</td>
										<c:choose>
											<c:when test="${upl.role_id == 0}"><td>未分配</td></c:when>
											<c:otherwise><td>已分配</td></c:otherwise>
										</c:choose>
										<td>${upl.role_name}</td>
										<td>
											<button class="btn btn-sm btn-primary" data-toggle="modal" data-target="#roleSetting${upl.userId}">分配角色<span class="fa fa-skype ml5"></span></button>
											<button type="button" class="btn btn-sm btn-danger" data-toggle="modal" data-target="#myModal${upl.userId}">删除用户<span class="fa fa-remove ml5"></span></button>
											<!-- 分配角色 -->
											<form action="${contextPath}/admin/addRole/${upl.userId}">
												<div id="roleSetting${upl.userId}" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
													<div class="modal-dialog">
														<div class="modal-content" >
															<div class="modal-body" style="padding: 0px;">
													           <div class="panel panel-primary">
													           	   <div class="panel-heading" style="height: 50px;">
													           	       <div class="pull-left">
														                	<h5><span class="fa fa-check-square-o"></span>&nbsp;用户角色分配</h5>
														                </div>  	   	  	   
															         	<div class="pull-right btn-group-sm ">
																			<button class="btn btn-info btn-sm"><div class="fa fa-save"></div>&nbsp;保存
																			</button>
																			
																			<button class="btn btn-info btn-sm" data-dismiss="modal"><span class="fa fa-power-off"></span>&nbsp;关闭
																			</button>
																		</div>
													           	   </div>
													              	<div class="panel-body">
									                             		<div class="add-guest-kind">
																			<div>
																				<span>
																					已有角色：
																					<c:forEach items="${roleList}" var="rl">
																						<c:choose>
																							<c:when test="${rl.id == upl.role_id}">
																								<a class="btn btn-default principle"><label><input checked="checked" name="set.roleId${upl.userId}" value="${rl.id}" type="radio" />${rl.role_name}</label></a>
																							</c:when>
																							<c:otherwise>
																								<a class="btn btn-default principle"><label><input name="set.roleId${upl.userId}" value="${rl.id}" type="radio" />${rl.role_name}</label></a>
																							</c:otherwise>
																						</c:choose>
																					</c:forEach>
																				</span>
																			</div>
																		</div>
													                </div>
													           </div>
															</div>
														</div>
														<!-- /.modal-content -->
													</div>
										        </div>
									        </form>
									        <!-- 删除用户 -->
									        <form action="${contextPath}/admin/delete/${upl.userId}">
										        <div class="modal fade" id="myModal${upl.userId}" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="margin-top:15%;">
													<div class="modal-dialog">
														<div class="modal-content">
															<div class="modal-header" style="border-radius:6px 6px 0 0 ;">
																<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
																	&times;
																</button>
																<h4 class="modal-title" id="myModalLabel">
																							  删除用户
																</h4>
															</div>
															<div class="modal-body text-center">
																<div class="text-center text-info">
																	确定要删除该用户吗？
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
			<!-- /.col-lg-12 -->
		</div>
		<!-- /.row -->
		<!-- /#page-wrapper -->
        <!-- 模态框（Modal） -->
        <!-- 批量分配角色 -->
        <form action="${contextPath}/admin/batchSetRole">
			<div id="roleSetting" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" 
			     aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content" >
						<div class="modal-body" style="padding: 0px;">
				           <div class="panel panel-primary">
				           	   <div class="panel-heading" style="height: 50px;">
				           	       <div class="pull-left">
					                	<h5><span class="fa fa-check-square-o"></span>&nbsp;用户角色分配</h5>
					                </div>  	   	  	   
						         	<div class="pull-right btn-group-sm ">
										<button class="btn btn-info btn-sm"><div class="fa fa-save"></div>&nbsp;保存
										</button>
										
										<button class="btn btn-info btn-sm" data-dismiss="modal"><span class="fa fa-power-off"></span>&nbsp;关闭
										</button>
									</div>
				           	   </div>
				           	   <input type="text" value="" name="userIds" />
				              	<div class="panel-body">
                             		<div class="add-guest-kind">
										<div>
											<span>
												已有角色：
												<c:forEach items="${roleList}" var="rl">
													<a class="btn btn-default principle"><label><input name="batch.roleId" value="${rl.id}" type="radio" />${rl.role_name}</label></a>
												</c:forEach>
											</span>
										</div>
									</div>
				                </div>
				           </div>
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
		
		<script src="${contextPath}/CLMF-adminUI-dev/dist/js/tree/jquery.bonsai.js"></script>
		
		<script type="text/javascript">
			function tobatchsetrole(){
				var idsArr = new Array();
				var idsStr = "";
				idsArr = document.getElementsByName("ids");
				for(var i=0; i<idsArr.length; i++){
					if(idsArr[i].checked){
						idsStr = idsStr + idsArr[i].value;
						idsStr = idsStr + ",";
					}
				}
				$("input[name='userIds']").val(idsStr);
			}
		</script>
		<!-- Page-Level Demo Scripts - Tables - Use for reference -->
	</body>
</html>