<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
  <head>
    <title>资料下载</title>
	
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="description" content="this is my page">
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
    
    <!--<link rel="stylesheet" type="text/css" href="./styles.css">-->

  </head>
  
  <body>
    <div class="modal-content">
		<div class="modal-header" style="background-color: rgba(30,40,80,0.8); height: 50px;">
			<h5 class="modal-title pull-left white-text" id="myModalLabel">资料下载</h5>
			<div class="pull-right btn-group-sm ">
				<button class="btn btn-warning" data-dismiss="modal">关闭<span class="fa fa-power-off"></span></button>
			</div>
		</div>
		<div class="modal-body">
			<table class="table table-striped table-responsive table-hover">
				<thead>
					<tr>
						<th>文件名</th>
						<th>有效期</th>
						<th>文件大小</th>
						<th>上传者</th>
						<th>上传时间&nbsp;<span class="fa fa-upload"></span></th>
						<th>下载次数</th>
						<th>操作</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${visitorFile}" var="vf">
						<tr>
							<td><span class="fa fa-wordpress" style="color: #AFD9EE;"></span>&nbsp;${vf.file_name}</td>
							<td>${vf.valid_date }</td>
							<td>${vf.file_size}KB</td>
							<td><a href="#">${vf.uploader_name}</a></td>
							<td>${vf.upload_date }</td>
							<td>${vf.download_counte}次</td>
							<td colspan="1">
								<a href="${contextPath}/visitorFile/download/${vf.id}"> <span class="fa fa-download " style="color: #5DACE4;"></span></a>
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
  </body>
</html>

