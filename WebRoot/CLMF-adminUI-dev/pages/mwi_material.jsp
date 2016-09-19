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

		<title>游客资料</title>

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
			<div class="col-lg-offset-2  col-lg-6">
				<h1 class="page-header"></h1>
			</div>
			<!-- /.col-lg-12 -->
		</div>

		<!-- /.row -->
		<div class="row-body">

			<div class="col-lg-12">
				<form id="form" action="${contextPath}/visitorFile/uploadFile" method="post" enctype="multipart/form-data">
				<!-- page -->
				<input type="hidden" class="pageIndex" name="pageNumber" value='<c:out value="${pageNumber}" default="1"/>'>
				<input type="hidden" class="pageSize" name="pageSize" value='<c:out value="${pageSize}" default="10"/>'>
				<input type="hidden" class="totalPages" name="totalPage" value='<c:out value="${totalPage}" default="1"/>'>
				<!-- page -->

				<div class="panel panel-primary">

					<div class="panel-heading">
						
							<p class="text-capitalize">
								<span class="fa fa-info-circle fa-2x"></span>&nbsp;游客资料
								<span class="pull-right">
	                            	<input type="file" onchange="doSubmit()" style="display: none;" name="file" id="file"/><button type="button" onclick="openFileInput()" class="btn btn-success">上传&nbsp;<span class="fa fa-save"></span></button>
								<span class="pull-right mr20">
								</span>
	                            	<button type="button" onclick="batchDelete()" class="btn btn-danger" id="">批量删除&nbsp;<span class="fa fa-remove"></span></button>
								</span>
							</p>
						
					</div>

					<!-- /.panel-heading -->
					<div class="panel-body">

						<table class="table table-responsive table-hover guest-material-table">

							<thead style="background: #eee;">
								<tr>
									<th>全选<input type="checkbox" id="checkAll"></th>
									<th>文件名</th>
									<!-- <th>有效期</th> -->
									<th>文件大小</th>
									<th>上传者</th>
									<th>上传时间&nbsp;<span class="fa fa-upload"></span>
									</th>
									<th>下载次数</th>
									<th>操作</th>
								</tr>
							</thead>
							<tbody>
								<!-- pdf--- <span class="fa fa-pied-piper-alt" style="color: #AFD9EE;"></span> -->
								<!-- <span class="fa fa-file-pdf-o" style="color: #AC2925;"></span> -->
								<c:forEach items="${fileInfor.list}" var="ffl">
									<tr>
										<td><input name="fileCheckBox" value="${ffl.id}" type="checkbox"></td>
										<td><span class="fa fa-pied-piper-alt" style="color: #AFD9EE;"></span>&nbsp;${ffl.file_name}</td>
										<!-- <td>永久有效</td> -->
										<td>${ffl.file_size}KB</td>
										<td><a href="#">${ffl.uploader_name}</a></td>
										<td>${ffl.upload_date}</td>
										<td>${ffl.download_counte}</td>
										<td>
											<button type="button" onclick="donwload('${ffl.id}')" class="btn btn-success btn-sm" id="">下载&nbsp;<span class="fa fa-download" style="color: #fff;"></span></button>
											<button type="button" onclick="deleteFile('${ffl.id}')" class="btn btn-danger btn-sm ml10" id="">删除&nbsp;<span class="fa fa-remove" style="color: #fff;"></span></button>
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
			function openFileInput(){
				$("#file").click();
			}
			function doSubmit(){
				$("#form").submit();
			}
			function donwload(id){
				window.location.href = getProjectName()+"/visitorFile/download/"+id;
			}
			function deleteFile(id){
				window.location.href = getProjectName()+"/visitorFile/deleteFile/"+id;
			}
			
			function batchDelete(){
				var fileIdArr = new Array();
				fileIdArr = document.getElementsByName("fileCheckBox");
				var fileIdArrStr = "";
				
				for(var i=0; i<fileIdArr.length; i++){
					if( fileIdArr[i].checked){
						fileIdArrStr = fileIdArrStr + fileIdArr[i].value;
						fileIdArrStr = fileIdArrStr + ",";
					}
				}
				window.location.href = getProjectName()+"/visitorFile/batchDelete/"+fileIdArrStr;
			}
			
		</script>
	</body>

</html>