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

		<title>新闻发布</title>

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
	
	
	
		<script type="text/javascript">
			function getProjectName(){
				var pathName = window.document.location.pathname;
				var projectName = pathName.substring(0,pathName.substr(1).indexOf('/')+1);
				return projectName;
			}
			
			function findByCatId(id){
				$.post(getProjectName()+"/publishNews/findByCatId/"+id, function(data){
					$("#categoryId").val(data.newsCategory.id);
					$("#categoryName").val(data.newsCategory.category_name);
					$("textarea[name='admission_rules_description_update']").text(data.newsCategory.category_desc);
				});
			}
			
			function findByNewsId(id){
				$.post(getProjectName()+"/publishNews/findByNewsId/"+id, function(data){
					$("#newsId").val(data.news.id);
					$("#newsTitle").val(data.news.new_title);
					$("#newsResource").val(data.news.news_resource);
					$("#publishDate").val(data.news.publish_date);
					$("#validDate").val(data.news.valid_date);
					$("textarea[name='newsAbstract']").text(data.news.news_abstract);
					$("textarea[name='newsContent']").text(data.news.news_content);
					$("input[name='oldNewsImg']").val(data.news.news_imgurl);
					$("input[name='oldFileName']").val(data.news.img_name);
				});
			} 
			
			function deleteByNewsId(id){
				 window.location.href = "${contextPath}/publishNews/deleteByNewsId/"+id;
			}
			
			function deleteByCId(){
				var id=$("#categoryId").val();
				window.location.href = "${contextPath}/publishNews/deleteByCId/"+id;
			}
			
			function batchDel(){
				var str = "";
				$("input[name='checkbox_data']:checked").each(function(){
                	str += $(this).val()+",";
	            });
	            str = str.substring(0, str.length - 1);
				 /* $("#batchDelNews").submit(); */				
				window.location.href = "${contextPath}/publishNews/bathdelNews?newsId="+str; 
			}
			
			 function bathbind(){
				//新闻ID
				var str = "";
				$("input[name='checkbox_data']:checked").each(function(){
                	str += $(this).val()+",";
	            });
				/* //类别ID	
				var str1 = "";
				$("input[name='catId']:checked").each(function(){
                	str1 += $(this).val()+",";
	            });
				alert("类别ID"+str1); */
				$("#hid_id1").val(str);
			}
			
			
			
		</script>
	
	
	
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
						<h4><span class="fa fa-eye-slash"></span>&nbsp;新闻发布管理</h4>
					</div>

					<div class="panel-body">

						<div id="setting_area" class="col-lg-6 setting_area">
							<button class="mt15 ml20 mb10 btn btn-primary" id="dining_rights_setting">新闻类别创建</button>
							<div style="display: none;" id="dining_rights_setting_detail">
								<form id="addForm" action="${contextPath}/publishNews/saveCategory" method="post">
									<table class="table table-bordered table-responsive table-striped">
										<tbody>
											<tr>
												<td class="tdTextAlign">新闻类别名称:</td>
												<td>
													<input class="tdWidth" type="text" placeholder="请输入新闻类别名称" onblur="" name="admission_rules_standard_name" />&nbsp;
												</td>
											</tr>
											<tr>
												<td class="tdTextAlign">类别描述：</td>
												<td>
													<textarea name="admission_rules_description" rows="5" cols="50" class="tdWidth"></textarea>
												</td>
											</tr>
											<tr>
												<td colspan="2" class="text-center">
													<button type="submit" class="btn btn-sm btn-primary">创建新闻类别</button>
												</td>
											</tr>
										</tbody>

									</table>
								</form>

							</div>

							</span>

						</div>

						<div id="show_area" class="panel panel-default width49 fl show_area">

							<div class="panel-heading">
								<h5 class="panel-title">
                        				已有的新闻类别
                        			</h5>
							</div>
							<div class="panel-body">
								<c:forEach items="${catList}" var="cl">
								<button class="btn btn-default btn-sm mr5" data-toggle="modal" onclick="findByCatId('${cl.id}')" title="" data-placement="bottom" data-target="#newsKindDetail">${cl.category_name}</button>
								</c:forEach>
							</div>
						</div>

						<div id="tabs" class="col-lg-12 mt20">
							<div class="text-right mb5">
								<button type="button" onclick="bathbind();" class="btn btn-primary" data-target="#bathnewsSetting" data-toggle="modal">批量设置新闻类别</button>
							</div>
							<div class="tab-pane">
								<form  action="${contextPath}/publishNews" method="post">
								<!-- page -->
								<input type="hidden" class="pageIndex" name="currentPage" value='<c:out value="${currentPage}" default="1"/>'>
								<input type="hidden" class="pageSize" name="currentSize" value='<c:out value="${currentSize}" default="10"/>'>
								<input type="hidden" class="totalPages" name="totalPage" value='<c:out value="${totalPage}" default="1"/>'>
								<!-- page -->

								<div class="panel panel-default">
									<div class="panel-body">
										<table class="table table-condensed table-hover table-responsive">
											<caption>
												<div class="pull-left query" id="">
													<span>
	                                              		新闻标题：
														<input type="text" placeholder="请输入新闻标题" onblur="" value="${newsTitle}" name="newsTitle"/>
	                                              	</span>
													<span>
	                                              		绑定状态：
	                                              		<select name="isbind">
	                                              			<!-- <option value="">全部</option>
	                                              			 <option value="1">已绑定</option>
	                                              			<option value="0">未绑定</option>  -->
	                                              		
		                                              		<c:choose>
																	<c:when test="${isbind == 1}">
																		<option value="">全部</option>
																		<option selected="selected" value="1">已绑定</option>
																		<option value="0">未绑定</option>
																	</c:when>
																	<c:when test="${isbind == 0}">
																		<option value="">全部</option>
					                                              		<option value="1">已绑定</option>
																		<option selected="selected" value="0">未绑定</option>
																	</c:when>
																	<c:otherwise>
																		<option value="">全部</option>
				                                              			<option value="1">已绑定</option>
				                                              			<option value="0">未绑定</option>
																	</c:otherwise>
															</c:choose>
	                                              		</select>
	                                              	</span>
													<span>
	                                              		发布状态：
	                                              		<select name="pubStatus">
	                                              			<!-- <option value="">全部</option>
	                                              			<option value="1">发布中</option>
	                                              			<option value="2">未到期</option>
	                                              			<option value="3">已过期</option> -->
		                                              		<c:choose>
																	<c:when test="${pubStatus == 1}">
																		<option value="">全部</option>
																		<option selected="selected" value="1">发布中</option>
																		<option value="2">未发布</option>
	                                              						<option value="3">已过期</option>
																	</c:when>
																	<c:when test="${pubStatus == 2}">
																		<option  value="">全部</option>
																		<option  value="1">发布中</option>
																		<option  selected="selected"  value="2">未发布</option>
	                                              						<option  value="3">已过期</option>
																	</c:when>
																	<c:when test="${pubStatus == 3}">
																		<option  value="">全部</option>
																		<option  value="1">发布中</option>
																		<option  value="2">未发布</option>
	                                              						<option  selected="selected" value="3">已过期</option>
																	</c:when>
																	
																	<c:otherwise>
																		<option value="">全部</option>
				                                              			<option value="1">发布中</option>
				                                              			<option value="2">未发布</option>
				                                              			<option value="3">已过期</option>
																	</c:otherwise>
															</c:choose>
	                                              		</select>
	                                              	</span>
													<!-- <span>
	                                              		新闻类别：
	                                              		<select>
	                                              			<option>全部</option>
	                                              			<option>新闻类别A</option>
	                                              			<option>新闻类别B</option>
	                                              		</select>
	                                              	</span> -->
													<span>
	                                              		<button  class="btn btn-primary" type="submit">
															查询<b class="fa fa-search ml5"></b>
														</button>
														<button type="button" class="btn btn-primary" id="ad_query_button">高级查询</button>
	                                              	</span>
													<span>
														<label>记录总数：<b class="red-text">10000</b>条</label>
													</span>
													<span class="pull-right">
														<button type="button" class="btn btn-success" data-toggle="modal" data-target="#newsDetail">增加新闻<b class="fa fa-plus ml5"></b></button>
														<button type="button" class="btn btn-danger" data-toggle="modal" data-target="#bathdelNews">批量删除<b class="fa fa-remove ml5"></b></button>
													</span>
												</div>
												<div class="pull-left" id="ad_query">
													<span>
														发布时间：
														<input type="text" name="publishDate" value="${publishDate}" placeholder="请选择发布时间" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd',readOnly:true})"/>
													</span>
													<span>
														有效时间：
														<input type="text" name="validDate" value="${validDate}" placeholder="请选择有效时间" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd',readOnly:true})" />
													</span>
													<span>
	                                              		新闻来源：
														<input type="text" placeholder="新闻来源" value="${newsResource}" onblur="" name="newsResource"/>
	                                              	</span>														
													<span>
	                                              		新闻简介：
														<input type="text" placeholder="新闻简介" value="${newsAbstract}" onblur="" name="newsAbstract"/>
	                                              	</span>														
													<span>
														新闻内容：
														<input type="text" name="newsContent" value="${newsContent}" placeholder="请输入新闻内容" />
													</span>														
												</div>
											</caption>
											<thead>
												<tr>
													<th>
														<label>全选
															<input type="checkbox" class="checkAll">
														</label>
													</th>
													<th>序号</th>
													<th>新闻标题</th>
													<th>新闻来源</th>
													<th width="15%">图片名称</th>
													<th width="15%">新闻类别</th>
													<th>发布状态</th>
													<th>绑定状态</th>
													<th>操作</th>
												</tr>
											</thead>
											<tbody>
												<c:forEach items="${pageList.list}" var="pl">
												<tr>
													<td>
														<input type="checkbox" name="checkbox_data" value="${pl.id}">
													</td>
													<td>${pl.id}</td>
													<td>${pl.new_title}</td>
													<td>${pl.news_resource}</td>
													<td class="staff" width="15%" style="position: absolute;">
														${pl.img_name}
														<!-- <div class="table-tooltip">
															<span>史锐鑫.jpg</span>
															<span>史锐鑫.jpg</span>
															<span>史锐鑫.jpg</span>
														</div> -->
													</td>
													<td class="staff" width="15%" style="position: relative;">
														${pl.categoryList[0].category_name}
														<div class="table-tooltip" style="position: absolute;">
															<c:forEach items="${pl.categoryList}" var="plcl">
																<span>${plcl.category_name}</span>
															</c:forEach>
														</div>
													</td>
													
													<c:choose>
														<c:when test="${pl.publish_date <= curdate && pl.valid_date >= curdate}"><td>发布中</td></c:when>
														<c:when test="${pl.publish_date > curdate}"><td>未发布</td></c:when>
														<c:when test="${pl.valid_date < curdate}"><td>已过期</td></c:when>
														<c:otherwise></c:otherwise>
													</c:choose>
													
													
													<td>
														<c:if test="${pl.is_bind_category==1}">
												        		已绑定
												        </c:if>
												        <c:if test="${pl.is_bind_category==0}">
												        		未绑定
												        </c:if>
													</td>
													<td>
														<button  type="button" class="btn btn-sm btn-success" onclick="findByNewsId('${pl.id}')" data-toggle="modal" data-target="#newsDetail">编辑<span class="fa fa-edit ml5"></span></button>
														<button type="button"  class="btn btn-sm btn-danger" data-toggle="modal" data-target="#delNew${pl.id}">删除<span class="fa fa-remove ml5"></span></button>
														<button type="button" onclick="javaScript:$('#hid_id').val(${pl.id});" class="btn btn-sm btn-primary" data-toggle="modal" data-target="#newsSetting">类别设置<span class="fa fa-skype ml5"></span></button>
														
														
														<div class="modal fade" id="delNew${pl.id}" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="margin-top:15%;display:none">
															<div class="modal-dialog">
																<div class="modal-content">
																	<div class="modal-header">
																		<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
																			&times;
																		</button>
																		<h4 class="modal-title" id="myModalLabel">
																									删除新闻
																		</h4>
																	</div>
																	<div class="modal-body text-center">
																		<div class="text-center text-info">
																			确定要删除这条新闻吗？
																		</div>
																		<div class="text-center mt20">
																			<button type="button" onclick="deleteByNewsId('${pl.id}')" class="btn btn-danger mr10">确定</button>
																			<button type="button" class="btn btn-success" data-dismiss="modal" aria-hidden="true">取消</button>
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
									<div class="panel-footer ">
										<div class="navbar navbar-default navbar-link">
											<div class="pull-left mt25 ml10">
												展示：
												<select name="select_items" class="pageSizeSelect">
													<c:choose>
														<c:when test="${currentSize == 10}"><option selected="selected" value="10">10</option></c:when>
														<c:otherwise><option value="10">10</option></c:otherwise>
													</c:choose>
													<c:choose>
														<c:when test="${currentSize == 20}"><option selected="selected" value="20">20</option></c:when>
														<c:otherwise><option value="20">20</option></c:otherwise>
													</c:choose>
													<c:choose>
														<c:when test="${currentSize == 50}"><option selected="selected" value="50">50</option></c:when>
														<c:otherwise><option value="50">50</option></c:otherwise>
													</c:choose>
													<c:choose>
														<c:when test="${currentSize == 100}"><option selected="selected" value="100">100</option></c:when>
														<c:otherwise><option value="100">100</option></c:otherwise>
													</c:choose>
													<c:choose>
														<c:when test="${currentSize == 500}"><option selected="selected" value="500">500</option></c:when>
														<c:otherwise><option value="500">500</option></c:otherwise>
													</c:choose>
												</select>
												数据
											</div>
											<div class="pull-left mt25 ml20">
												跳到第
												<input type="number" name="select_guest_name" style="width: 70px !important;" value="${currentPage}"/>
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
			<!-- /.col-lg-12 -->
		</div>
		<!-- /.row -->
		<div class="modal fade" id="bathdelNews" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="margin-top:15%;display:none">
			<form id="batchDelNews" action="${contextPath}/publishNews/bathdelNews" method="post">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" onclick="batchDel();" class="close" data-dismiss="modal" aria-hidden="true">
							&times;
						</button>
						<h4 class="modal-title" id="myModalLabel">
													批量删除
						</h4>
					</div>
					<div class="modal-body text-center">
						<div class="text-center text-info">
							确定要删除这些新闻吗？
						</div>
						<div class="text-center mt20">
							<button type="button" onclick="batchDel();" class="btn btn-danger mr10">确定</button>
							<button class="btn btn-success" data-dismiss="modal" aria-hidden="true">取消</button>
						</div>
					</div>
				</div>
				<!-- /.modal-content -->
			</div>
			<!-- /.modal -->
			</form>
		</div>
		
		<!-- /#page-wrapper -->
		<!-- 模态框（Modal） -->
		<div id="newsSetting" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-body" style="padding: 0px;">
						<form id="bindCategory" action="${contextPath}/publishNews/bindCategory" method="post">
						<div class="panel panel-primary">
							<div class="panel-heading" style="height: 50px;">
								<input type="hidden" name="newsId" value="" id="hid_id" />
								<div class="pull-left">
									<h5><span class="fa fa-check-square-o"></span>&nbsp;新闻类别设置</h5>
								</div>
								<div class="pull-right btn-group-sm ">
									<button type="submit" class="btn btn-success btn-sm">
										<div class="fa fa-save"></div>&nbsp;保存
									</button>

									<button class="btn btn-info btn-sm" data-dismiss="modal"><span class="fa fa-power-off"></span>&nbsp;关闭
									</button>
								</div>
							</div>
							<div class="panel-body">
								<div class="add-guest-kind">
									<div>
										<span>
											已有新闻类别：
											
											<c:forEach items="${catList}" var="cl">
												<a class="btn btn-default principle"><label><input type="checkbox" name="catId" value="${cl.id}" >${cl.category_name}</label></a>
											</c:forEach>
										</span>
									</div>
								</div>
							</div>
						</div>
						</form>
					</div>
				</div>
				<!-- /.modal-content -->
			</div>
		</div>
		
		<!-- 批量设置 -->
		<div id="bathnewsSetting" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-body" style="padding: 0px;">
						<form id="bathbindCategory" action="${contextPath}/publishNews/bathbindCategory" method="post">
						<div class="panel panel-primary">
							<div class="panel-heading" style="height: 50px;">
								<input type="hidden" name="newsId" value="" id="hid_id1" />
								<div class="pull-left">
									<h5><span class="fa fa-check-square-o"></span>&nbsp;批量新闻类别设置</h5>
								</div>
								<div class="pull-right btn-group-sm ">
									<button type="submit"  class="btn btn-success btn-sm">
										<div class="fa fa-save"></div>&nbsp;保存
									</button>

									<button class="btn btn-info btn-sm" data-dismiss="modal"><span class="fa fa-power-off"></span>&nbsp;关闭
									</button>
								</div>
							</div>
							<div class="panel-body">
								<div class="add-guest-kind">
									<div>
										<span>
											已有新闻类别：
											
											<c:forEach items="${catList}" var="cl">
												<a class="btn btn-default principle"><label><input type="checkbox"  name="catId" value="${cl.id}" >${cl.category_name}</label></a>
											</c:forEach>
										</span>
									</div>
								</div>
							</div>
						</div>
						</form>
					</div>
				</div>
				<!-- /.modal-content -->
			</div>
		</div>
		
		
		<div id="newsDetail" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-body" style="padding: 0px;">
						<form id="addNews" action="${contextPath}/publishNews/saveNews" method="post" enctype="multipart/form-data">
						<input id="newsId"  name="newsId" class="tdWidth"  type="hidden" />
						<div class="panel panel-primary">
							<div class="panel-heading" style="height: 50px;">
								<div class="pull-left">
									<h5><span class="fa fa-check-square-o"></span>&nbsp;新闻编辑</h5>
								</div>
								
								<div class="pull-right btn-group-sm ">
									<button type="submit" class="btn btn-success btn-sm">
										<div class="fa fa-save"></div>&nbsp;保存
									</button>
									<button class="btn btn-info btn-sm" data-dismiss="modal"><span class="fa fa-power-off"></span>&nbsp;关闭
									</button>
								</div>
							</div>
							<div class="panel-body">
								<table class="table table-striped table-bordered table-responsive table-hover">
									<tbody>
										<tr>
											<td class="tdTextAlign"><b class="red-text">*</b>新闻标题:</td>
											<td>
												<input class="tdWidth" id="newsTitle" type="text" placeholder="请输入新闻标题" onblur="" name="newsTitle" />&nbsp;
											</td>
										</tr>
										<tr>
											<td class="tdTextAlign">新闻来源:</td>
											<td>
												<input class="tdWidth" id="newsResource" type="text" placeholder="请输入新闻来源" onblur="" name="newsResource" />&nbsp;
											</td>
										</tr>
										<tr>
											<td class="tdTextAlign">发布时间:</td>
											<td>
												<input class="tdWidth" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd',readOnly:true})" id="publishDate" type="text" placeholder="请选择发布时间" onblur="" name="publishDate" />&nbsp;
											</td>
										</tr>
										<tr>
											<td class="tdTextAlign">有效时间:</td>
											<td>
												<input class="tdWidth" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd',readOnly:true})" id="validDate" type="text" placeholder="请选择有效时间" onblur="" name="validDate" />&nbsp;
											</td>
										</tr>
										<tr>
											<td class="tdTextAlign">新闻简介:</td>
											<td>
												<textarea class="tdWidth" onblur=""  name="newsAbstract" ></textarea>&nbsp;
											</td>
										</tr>
										<tr>
											<td class="tdTextAlign"><b class="red-text">*</b>新闻内容：</td>
											<td>
												<textarea name="newsContent" rows="5" cols="50" class="tdWidth" id="newsContent"></textarea>
											</td>
										</tr>
										<tr>
											<td class="tdTextAlign">上传图片：</td>
											<td>
												<input type="file" name="newImg" value="" class="pull-left">
												<input type="hidden" name="oldNewsImg" value="" />
												<input type="hidden" name="oldFileName" value="" />
												<button class="btn btn-sm btn-primary pull-left">上传</button>
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
		<div id="newsKindDetail" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog">

				<div class="modal-content">

					<div class="modal-body" style="padding: 0px;">

						<div class="panel panel-primary">
						<form id="addForm" action="${contextPath}/publishNews/updateCategory" method="post">
							<div class="panel-heading" style="height: 50px;">

								<div class="pull-left">
									<h5><span class="fa fa-check-square-o mr5"></span>新闻类别编辑</h5>
								</div>
						
								<div class="pull-right btn-group-sm ">
									<button type="submit" class="btn btn-success btn-sm">保存
										<div class="fa fa-save ml5"></div>
									</button>
									<button type="button" onclick="deleteByCId();" class="btn btn-danger btn-sm">删除
										<div class="fa fa-remove ml5"></div>
									</button>
									<button class="btn btn-info btn-sm" data-dismiss="modal">关闭<span class="fa fa-power-off ml5"></span>
									</button>
								</div>
							</div>
							<div class="panel-body">
								<table class="table table-striped table-bordered table-hover " cellspacing="2" width="80%">
									<tbody>
										<tr>
											<td class="tdTextAlign">新闻类别名称:
											<input id="categoryId"  name="categoryId" class="tdWidth"  type="hidden" />
											</td>
											
											<td>
												<input id="categoryName" class="tdWidth" type="text" placeholder="请输入新闻类别名称" onblur="" name="admission_rules_standard_name_update" />&nbsp;
											</td>
										</tr>
										<tr>
											<td class="tdTextAlign">类别描述：</td>
											<td>
												<textarea  name="admission_rules_description_update" rows="5" cols="50" class="tdWidth"></textarea>
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
				$("#dining_rights_setting").click(function() {
					$("#dining_rights_setting_detail").fadeToggle(300);
				});
				$('input.publishTime').val(getNow());
			});
		</script>
	</body>

</html>
