<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>

<html lang="en">

	<head>

		<meta charset="utf-8">
		<title>嘉宾主页</title>
		<!-- Mobile Meta -->
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<!-- Favicon -->
		<link rel="stylesheet" href="http://apps.bdimg.com/libs/bootstrap/3.3.0/css/bootstrap.min.css">

		<!-- Font Awesome CSS -->
		<link rel="stylesheet" href="${contextPath}/CLMF-frontUI-dev/font-awesome-4.3.0/css/font-awesome.css" />
		<!-- Plugins -->
		<link rel="stylesheet" href="${contextPath}/CLMF-frontUI-dev/css/animations.css">
		<!-- Worthy core CSS file -->
		<link rel="stylesheet" href="${contextPath}/CLMF-frontUI-dev/css/style.css">
		<link rel="stylesheet" href="${contextPath}/CLMF-frontUI-dev/css/cotmer.css">
	</head>

	<body>

		<!-- header start -->
		<header class="header fixed navbar navbar-fixed-top fixed-header-on " style="position: absolute !important;">

			<div class="container">

				<div class="row">

					<div class="col-lg-4 col-md-5 col-sm-12">

						<!-- header-left start -->
						<!-- ================ -->
						<div class="left clearfix">

							<!-- logo -->
							<div class="logo smooth-scroll  ">

								<div class="site-name">
									<a href="${contextPath}/front_index">
										<img id="logo" src="${contextPath}/CLMF-frontUI-dev/images/logo.png" alt="Worthy" style="width: 15%; height: 15%;" /> 第八届世界华文传媒论坛
									</a>
								</div>

								<div class="site-slogan">
									<a target="_blank" href="${contextPath}/front_index" style="color:crimson ;">
										<strong>The Eighth Forum onthe Global Chinese Language Media </strong>
									</a>
								</div>

							</div>

						</div>
						<!-- header-left end -->

					</div>

					<div class="col-lg-8 col-md-7 col-sm-12">

						<!-- header-right start -->
						<!-- ================ -->
						<div class="right clearfix">

							<!-- main-navigation start -->
							<!-- ================ -->
							<div class="main-navigation animated">

								<!-- navbar start -->
								<!-- ================ -->
								<nav class="navbar navbar-default navbar-collapse" role="navigation">

									<div class="container-fluid">

										<!-- Toggle get grouped for better mobile display -->
										<!-- Collect the nav links, forms, and other content for toggling -->
										<div id="navbar-collapse-1">

											<p style="text-align: center; font-size:26px ;" class="lea">嘉宾个人中心</p>

											<ul class="nav nav-tabs" style="border-bottom: 0;margin-bottom: -100px;">
												<li>
													<a href="${contextPath}/front_index" style="color:  coral; font: '微软雅黑';font-size: 14px;">
														<i class="fa fa-user-md fa-2x mr5"></i>首页</a>
												</li>

												<li>
													<a href="${contextPath}/guest_infor/detail" target="page-wrapper" style="color:  coral; font: '微软雅黑';font-size: 14px;">
														<i class="fa fa-user-md fa-2x mr5"></i>嘉宾信息</a>
												</li>
												<li>
													<a href="${contextPath}/guest_infor/communicate" target="page-wrapper" style="color: coral;font: '微软雅黑';font-size: 14px;">
														<i class="fa  fa-bookmark fa-2x mr5"></i>社交互访</a>
												</li>
												<li>
													<a href="${contextPath}/guest_infor/meetingSchedule" target="page-wrapper" style="color: coral;font: '微软雅黑';font-size: 14px;">
														<i class="fa fa-file fa-2x mr5"></i>会议日程</a>
												</li>

												<li class="dropdown">

													<a href="#" class="dropdown-toggle" data-toggle="dropdown" style="color: coral;font-family: 'Microsoft Yahei';font-size: 14px; padding-top: 17px;">
														<span class="fa fa-chain mr5"></span>其他信息
														<b class="caret"></b>
													</a>

													<ul class="dropdown-menu">
														<li><a href="${contextPath}/guest_infor/download" target="page-wrapper">资料下载</a>
														</li>
													<li><a href="${contextPath}/guest_infor/cancelMeeting" target="page-wrapper">取消参会</a>
													</li>
														<li><a href="#" data-toggle="modal" data-target="#changePwd">修改密码</a>
														</li>
														<li><a href="${contextPath}/guest_login/logout">退出登录</a>
														</li>
													</ul>

												</li>

											</ul>

										</div>

									</div>
								</nav>
								<!-- navbar end -->

							</div>
							<!-- main-navigation end -->

						</div>
						<!-- header-right end -->

					</div>
				</div>
			</div>
		</header>
		<!-- header end -->

		<!--space空间开始-->
		<div class="default-bg space">
			<div class="container">
				<div class="row">
					<div class="col-md-8">
						<h1 class="text-center"></h1>
					</div>
				</div>
			</div>
		</div>
		<!--space空间结束-->

		<div id="page-iframe">
			<iframe id="" src="${contextPath}/guest_infor/detail" name="page-wrapper" width="100%"  style="" scrolling="no" frameborder="0" seamless></iframe>
		</div>

		

		<!-- 联系我们start -->
		<!-- ================ -->

		<!--底部开始-->
		<!-- ================ -->
		<footer id="footer" class="navbar navbar-fixed-bottom navbar-inverse mt30" style="position: relative;">
			<!--底部-->
			<div class="container" style="text-align: center;">

				<ul class="list-unstyled">

					<li style="color: rgba(255,0,0,0.6);">Copyright2015-2019 广州迈沃信息科技有限公司 All Rights Reserved</li>
				</ul>

			</div>

		</footer>
		<!-- 联系我们end -->
		<!--底部结束-->



       
		<div class="modal fade" id="changePwd" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×
						</button>
						<h4 class="modal-title" id="myModalLabel">

                           	<span class="fa-2x fa fa-user mr5" style="color: #C9302C;"></span>修改密码

            			</h4>
					</div>

					<div class="modal-body ">

						<div class="container-fluid">
							<div class="tab-content" id="info_content">

								<div class="tab-pane  in active" id="">

									<form action="${contextPath}/guest_infor/resetPassword" class="form-horizontal row text-info" method="post">

										<div class="form-group">
											<label class="text-capitalize text-info control-label col-sm-4 col-lg-4 col-md-4" for="username">旧密码：</label>
											<div class=" col-sm-8 col-lg-8 col-md-8">
												<input type="password" class="text-justify form-control lastPwd" placeholder="Name" id="username" name="originalPsw" />
											</div>
										</div>

										<div class="form-group">
											<label class="text-capitalize  control-label col-sm-4 col-lg-4" for="password">新密码：</label>
											<div class=" col-sm-8 col-lg-8 col-md-8">
												<input type="password" class="text-justify form-control newPwd" placeholder="Password" id="password" name="newPsw" />
											</div>
										</div>
										<div class="form-group">
											<label class="text-capitalize  control-label col-sm-4 col-lg-4" for="password">再次输入新密码：</label>
											<div class=" col-sm-8 col-lg-8 col-md-8">
												<label class="notSame_label" style="display:none;">两次输入的密码不一致</label>
												<input type="password" class="text-justify form-control newPwd-1" placeholder="Password" id="password" name="certPsw" />
											</div>
										</div>
										<div class="form-group">
											<div class="col-lg-12 text-center">
												<button type="button" class="btn btn-primary changePwd_btn"/>确定</button>
												<button type="button" class="btn btn-primary" data-dismiss="modal" aria-hidden="true">取消</button>
											</div>

										</div>

									</form>

								</div>

								
							</div>
							

						</div>

					</div>
					<!-- /.modal-dialog -->
				</div>
			</div>
		</div>
		<!-- <script src="http://libs.baidu.com/jquery/2.0.0/jquery.min.js"></script>
		<script src="http://libs.baidu.com/bootstrap/3.0.3/js/bootstrap.min.js"></script> -->
		<script src="${contextPath}/CLMF-frontUI-dev/bootstrap-3.3.4-dist/bootstrap-3.3.4-dist/js/jquery.js"></script>
		<script src="${contextPath}/CLMF-frontUI-dev/bootstrap-3.3.4-dist/bootstrap-3.3.4-dist/js/bootstrap.min.js"></script>
		<!-- Modernizr javascript -->
		<script type="text/javascript" src="${contextPath}/CLMF-frontUI-dev/plugins/modernizr.js"></script>
		<!-- Isotope javascript -->
		<script type="text/javascript" src="${contextPath}/CLMF-frontUI-dev/plugins/isotope/isotope.pkgd.min.js"></script>
		<!-- Backstretch javascript -->
		<script type="text/javascript" src="${contextPath}/CLMF-frontUI-dev/plugins/jquery.backstretch.min.js"></script>
		<!-- Appear javascript -->
		<script type="text/javascript" src="${contextPath}/CLMF-frontUI-dev/plugins/jquery.appear.js"></script>
		<!-- Initialization of Plugins -->
		<script type="text/javascript" src="${contextPath}/CLMF-frontUI-dev/js/template.js"></script>
		<!-- Custom Scripts -->
		<script type="text/javascript" src="${contextPath}/CLMF-frontUI-dev/js/custom.js"></script>
		<script type="text/javascript" src="${contextPath}/CLMF-frontUI-dev/js/valid.js"></script>
		<script type="text/javascript">
			$('.newPwd-1').on('blur',function(){
				var newPwd = $('.newPwd').val();
				var newPwd1 = $('.newPwd-1').val();
				if(newPwd != newPwd1){
					$('.notSame_label').show();
				}
			}).on('focus',function(){
				$('.notSame_label').hide();
			});
			
			$('.changePwd_btn').on('click',function(){
				var lastPwd = $('.lastPwd').val();
				var newPwd = $('.newPwd').val();
				var newPwd1 = $('.newPwd-1').val();
				if(!(lastPwd && newPwd)){
					alert("旧密码或新密码为空！");
				}else if(newPwd != newPwd1){
					alert("两次输入的密码不一致！");
				}else{
					$(this).parents('form').submit();
				}
			});
		</script>
	
	</body>



</html>