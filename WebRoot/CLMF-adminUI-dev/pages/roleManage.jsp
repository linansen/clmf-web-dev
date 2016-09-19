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

		<title>角色管理</title>

		<!-- Bootstrap Core CSS -->
		<link href="${contextPath}/CLMF-adminUI-dev/bower_components/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">

		<!-- MetisMenu CSS -->
		<link href="${contextPath}/CLMF-adminUI-dev/bower_components/metisMenu/dist/metisMenu.min.css" rel="stylesheet">

		<!-- Custom CSS -->
		<link href="${contextPath}/CLMF-adminUI-dev/dist/css/sb-admin-2.css" rel="stylesheet">

		<!-- Custom Fonts -->
		<link href="${contextPath}/CLMF-adminUI-dev/bower_components/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">

		<!--<link rel="stylesheet" href="../assets/css/style.css" >-->
		<!--index.css-->
		<link rel="stylesheet" href="${contextPath}/CLMF-adminUI-dev/dist/css/mwi_tables/index.css">
			
		<link rel="stylesheet" href="${contextPath}/CLMF-adminUI-dev/dist/js/tree/zTreeStyle.css">

	</head>

	<body>
		<div class="row-header">
			<div class="col-lg-offset-2 col-lg-8">
				<h1 class="page-header"></h1>
			</div>
		</div>
		<!-- /.row -->
		<div class="row-body">
			<div class="col-lg-12">
				
			
				<!-- page -->
				<input type="hidden" class="pageIndex" name="pageNumber" value="2">
				<input type="hidden" class="pageSize" name="pageSize" value="10">
				<input type="hidden" class="totalPages" name="totalPage" value="10">
				<!-- page -->
				<div class="panel panel-primary">
					<div class="panel-heading">
						<p class="text-capitalize"><span class="fa fa-info-circle fa-2x"></span><span class="ml10">角色管理</span>
						</p>
					</div>
					<!-- /.panel-heading -->
					<div class="panel-body">
						<table class="table table-striped table-hover" cellspacing="0" width="80%">
							<form action="${contextPath}/role" method="post">
								<caption>
									<div class="pull-left query">
										<span>
											角色名：
											<input type="text" name="roleName" value="${roleName}" placeholder="请输入角色名">
										</span>
										<span>
											<button class="btn btn-primary">查询<b class="fa fa-search ml5"></b></button>
										</span>
										<span>
											<label>记录总数：<b class="red-text">10000</b>条</label>
										</span>
										<span class="pull-right">
											<button type="button" onclick="toAddRole()" class="btn btn-success" data-toggle="modal" data-target="#change_info">新增角色<b class="fa fa-plus ml5"></b></button>
											<button type="button" onclick="toDeleteRole()" class="btn btn-success" data-toggle="modal" data-target="#del_role">批量删除角色</button>
										</span>
									</div>
								</caption>
							</form>
							<thead class="text-center">
								<tr>
									<th><label>全选<input type="checkbox" class="checkAll"></label></th>
									<th>序号</th>
									<th>角色名</th>
									<th width="15%">菜单权限</th>
									<th>操作</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${rolePage.list}" var="rpl" varStatus="status">
									<tr>
										<td><input name="roleIds" value="${rpl.id}" type="checkbox"></td>
										<td>${status.index+1}</td>
										<td>${rpl.role_name}</td>
										<td class="staff" width="15%" style="position: absolute;">
											${rpl.privilegeList[0].privilege_name}
											<div class="table-tooltip">
												<c:forEach items="${rpl.privilegeList}" var="rplpl">
													<span>${rplpl.privilege_name}</span>
												</c:forEach>
											</div>
										</td>
										<td>
											<button type="button" onclick="toUpdate('${rpl.id}')" class="btn btn-sm btn-info changeTree" data-toggle="modal" data-target="#change_info">修改权限<span class="fa fa-edit ml5"></span></button>
											<button type="button" class="btn btn-sm btn-danger" data-toggle="modal" data-target="#myModal${rpl.id}">删除角色<span class="fa fa-remove ml5"></span></button>
											<!-- 删除角色 -->
											<form action="${contextPath}/role/delete/${rpl.id}" method="post">
												<div class="modal fade" id="myModal${rpl.id}" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="margin-top:15%;">
													<div class="modal-dialog">
														<div class="modal-content">
															<div class="modal-header" style="border-radius:6px 6px 0 0 ;">
																<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
																	&times;
																</button>
																<h4 class="modal-title" id="myModalLabel">
																							  删除角色
																</h4>
															</div>
															<div class="modal-body text-center">
																<div class="text-center text-info">
																	确定要删除该角色吗？
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
					<!-- /.panel-body -->
					<div class="panel-footer ">
						<div class="navbar navbar-default navbar-link">
							<div class="pull-left mt25 ml10">
								展示：
								<select name="select_items" class="pageSizeSelect">
									<option value="10">10</option>
									<option value="20">20</option>
									<option value="50">50</option>
									<option value="100">100</option>
									<option value="500">500</option>
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
					<!-- /.modal-content -->
				</div>
			</div>
			<!-- /.panel -->
		</div>
		<!-- /#page-wrapper -->
		<!-- 新建角色 -->
		<form action="${contextPath}/role/save" method="post">
			<div id="change_info" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="top:50px;">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header" style="background-color: rgba(30,40,80,0.8); height: 50px;">
							<h5 class="modal-title pull-left white-text" id="myModalLabel" data="set.title">新建角色信息</h5>
							<div class="pull-right btn-group-sm mb30">
								<input type="hidden" id="treeNode" name="add.privilegeIds" value="">
								<input type="hidden" name="set.roleId" value="" />
								<button class="btn btn-success" id="saveCheckNodes">保存<span class="fa fa-save"></span>
								</button>
								<button type="button" class="btn btn-warning" data-dismiss="modal">关闭<span class="fa fa-power-off"></span>
								</button>
							</div>
						</div>
						<div class="modal-body">
							<table class="table table-striped table-bordered table-responsive table-hover">
								<tr>
									<td class="text-right">角色名称：</td>
									<td><input type="text" name="add.roleName" class="tdWidth"></td>
								</tr>
								<tr>
									<td class="text-right">角色权限：</td>
									<td>
										<ul id="treeDemo" class="ztree"></ul>
									</td>
								</tr>
							</table>
						</div>
					</div>
				</div>
			</div>
		</form>
		
		
		
		
		<!-- 批量删除 -->
		<form action="${contextPath}/role/batchDelete" method="post">
			<div class="modal fade" id="del_role" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="margin-top:15%;">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header" style="border-radius:6px 6px 0 0 ;">
							<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
								&times;
							</button>
							<h4 class="modal-title" id="myModalLabel">
														  删除角色
							</h4>
							<input type="hidden" name="del.roleIds" value="" />
						</div>
						<div class="modal-body text-center">
							<div class="text-center text-info">
								确定要删除该角色吗？
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
		
		<script src="${contextPath}/CLMF-adminUI-dev/dist/js/tree/jquery.ztree.core-3.5.min.js"></script>
		<script src="${contextPath}/CLMF-adminUI-dev/dist/js/tree/jquery.ztree.excheck-3.5.min.js"></script>
		<!-- Page-Level Demo Scripts - Tables - Use for reference -->
		<script>
			function getProjectName(){
				var pathName = window.document.location.pathname;
				var projectName = pathName.substring(0,pathName.substr(1).indexOf('/')+1);
				return projectName;
			}
			/* initTree(); */
			var projectName = getProjectName();
			$.ajax({
				type: 'post',
				url : projectName +'/role/privilegeList',
				contentType : 'json',
				success: function(rel){
					initTree(rel.priList);
					var treeObj = $.fn.zTree.getZTreeObj("treeDemo");
					treeObj.expandAll(true);
				}
			});
			
			function toUpdate(id){
				$("input[name='set.roleId']").val(id);
				$("h5[data='set.title']").html("编辑角色信息");
				var treeObj = $.fn.zTree.getZTreeObj("treeDemo");
				$.ajax({
					type: 'post',
					url : getProjectName() +'/role/toUpdate/'+id,
					contentType : 'json',
					success: function(rel){
						$("input[name='add.roleName']").val(rel.data.roleInfor.role_name);
						var priList = rel.data.priList;
						for(var i=0;i<priList.length;i++){
							var id = priList[i].id;
							var node = treeObj.getNodeByTId("treeDemo_"+id);
							treeObj.checkNode(node, true, false);
							treeObj.expandNode(node, true, true, true);
						}
					}
				});
			}
			
			$('#saveCheckNodes').on('click',function(){
				var treeObj = $.fn.zTree.getZTreeObj("treeDemo");
				var nodes = treeObj.getCheckedNodes(true);
				var ids = [];
				for(var i=0;i<nodes.length;i++){
					var tId = nodes[i].tId;
					var id = (tId.split('_'))[1];
					ids.push(id);
				}
				$('#treeNode').val(ids.toString());
			});
			
			function initTree(nodeList){
				var setting =  {
					check: {
						enable: true
					},
					data: {
			            key: {
			                children: "children",
			                name: "privilege_name",
			                title: "",
			                url: "url"
			            },
			            simpleData: {
			                enable: 1,
			                idKey: "id",
			                pIdKey: "parent_id",
			                rootPId: null
			            }
		            }
				};
				var zNodes = nodeList;
				$.fn.zTree.init($("#treeDemo"), setting, zNodes);
			}
			
			function toDeleteRole(){
				var roleIdsArr = new Array();
				roleIdsArr = document.getElementsByName("roleIds");
				var roleIdsStr = "";
				for(var i=0; i<roleIdsArr.length; i++){
					if(roleIdsArr[i].checked){
						roleIdsStr = roleIdsStr + roleIdsArr[i].value;
						roleIdsStr = roleIdsStr + ",";
					}
				}
				$("input[name='del.roleIds']").val(roleIdsStr);
			}
			
			function toAddRole(){
				$("h5[data='set.title']").html("新建角色信息");
			}
			
		</script>
		
	</body>

</html>