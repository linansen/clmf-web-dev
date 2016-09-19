<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>

<html lang="en">

	<head>

		<meta charset="utf-8">
		<title>第八届世界华文传媒论坛</title>
		<!-- Mobile Meta -->
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<!-- Favicon -->
		<link rel="stylesheet" href="http://apps.bdimg.com/libs/bootstrap/3.3.0/css/bootstrap.min.css">

		<!-- Font Awesome CSS -->
		<link rel="stylesheet" href="${contextPath}/CLMF-frontUI-dev/font-awesome-4.3.0/css/font-awesome.css" />
		<!-- Plugins -->
		<link href="${contextPath}/CLMF-frontUI-dev/css/animations.css" rel="stylesheet">
		<!-- Worthy core CSS file -->
		<link href="${contextPath}/CLMF-frontUI-dev/css/style.css" rel="stylesheet">
		<link href="${contextPath}/CLMF-frontUI-dev/css/cotmer.css" rel="stylesheet">
		<c:if test='${param.register==1}'>
			<script type="text/javascript">
				alert("注册申请提交成功！");
			</script>
		</c:if>
	</head>

	<body>

		<!-- header start -->
		<!-- ================ -->
		<header class="header fixed navbar navbar-fixed-top fixed-header-on">

			<div class="container" style="width: 1600px;">

				<div class="row">

					<div class="col-lg-4 col-md-5 col-sm-12">

						<!-- header-left start -->
						<!-- ================ -->
						<div class="left clearfix" style="width: 80%;">

							<!-- logo -->
							<div class="logo smooth-scroll  ">

								<div class="site-name">
									<a href="#banner">
										<img id="logo" src="${contextPath}/CLMF-frontUI-dev/images/logo.png" alt="Worthy" style="width:314px;height:58px;"/>
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
										<div class="navbar-header">

											<button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#navbar-collapse-1">

												<span class="sr-only">Toggle navigation</span>
												<span class="icon-bar"></span>
												<span class="icon-bar"></span>
												<span class="icon-bar"></span>

											</button>

										</div>

										<!-- Collect the nav links, forms, and other content for toggling -->
										<div class="collapse navbar-collapse scrollspy smooth-scroll" id="navbar-collapse-1" style="margin-top: 18px;">

											<ul class="nav  nav-tabs " style="border-bottom: hidden 0px ;">

												<li><a href="#portfolio" style="color:  coral; font: '微软雅黑';font-size: 16px;"><i class="fa fa-eye "></i>&nbsp;华文视角</a>
												</li>
												<li><a href="#services" style="color: coral;font: '微软雅黑';font-size: 16px;"><i class="fa fa-calendar "></i>&nbsp;会议日程</a>
												</li>
												<li><a href="#about" style="color: coral;font: '微软雅黑';font-size: 16px;"><i class="fa  fa-camera "></i>&nbsp;贵阳大观</a>
												</li>
												<li><a href="#clients" style="color: coral;font: '微软雅黑';font-size: 16px;"><i class="fa fa-user "></i>&nbsp;与会嘉宾</a>
												</li>
												<li><a href="#contact" style="color: coral;font: '微软雅黑';font-size: 16px;"><i class="fa fa-phone "></i>&nbsp;联系我们</a>
												</li>

												<li><a href="${contextPath}/front_index/visitorDownload" data-toggle="modal" data-target="#download-data" style="color: coral;font: '微软雅黑';font-size: 16px;"><i class="fa fa-download "></i>&nbsp;资料下载</a>
												</li>
												<c:choose>
													<c:when test="${guestId != null}">
														<li><a href="${contextPath}/guest_infor" style="color: coral;font: '微软雅黑';font-size: 16px;"><i class="fa fa-circle-o-notch"></i>&nbsp;个人中心</a></li>
													</c:when>
													<c:otherwise>
														<li><a href="#" style="color: coral;font: '微软雅黑';font-size: 16px;" data-toggle="modal" data-target="#loginer"><i class="fa fa-circle-o-notch"></i>&nbsp;注册登录</a></li>
													</c:otherwise>
												</c:choose>
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


		<!--背影 HOME CODE  START-->
		<div id="home">
			<!-- banner start -->
			<!-- ================ -->

			<div class="banner-caption">

				<div class="row-body">

					<div id="carousel-1" class="carousel slide" data-ride="carousel">

						<ol class="carousel-indicators">

							<li data-target="#carousel-1" data-slide-to="0" class="active"></li>
							<li data-target="#carousel-1" data-slide-to="1"></li>
							<li data-target="#carousel-1" data-slide-to="2"></li>
							<li data-target="#carousel-1" data-slide-to="3"></li>

						</ol>

						<div class="carousel-inner">

							<div class="item active" style="margin-top: 0px;">

								<img src="${contextPath}/CLMF-frontUI-dev/images/index-1.jpg" alt="" />

							</div>

							<div class="item" style="margin-top: 0px;">

								<img src="${contextPath}/CLMF-frontUI-dev/images/index-2.jpg" alt="" />

							</div>

							<div class="item" style="margin-top: 0px;">

								<img src="${contextPath}/CLMF-frontUI-dev/images/index-3.jpg" alt="" />

							</div>

							<div class="item" style="margin-top: 0px;">

								<img src="${contextPath}/CLMF-frontUI-dev/images/index-4.jpg" alt="" />

							</div>

							<a class="left carousel-control" href="#carousel-1" data-slide="prev">
								<span class="glyphicon glyphicon-chevron-left"></span>
							</a>
	
							<a class="right carousel-control" href="#carousel-1" data-slide="next">
								<span class="glyphicon glyphicon-chevron-right"></span>
							</a>
	
						</div>
	
					</div>
	
				</div>
				<!-- banner end -->
			</div>
		<!--HOME CODE ENDS-->
       </div>
		<!-- 新闻部分开始 -->
		<!-- ================ -->
		<div class="section">

			<div class="container">

				<h1 class="text-center title" id="portfolio">华文视角</h1>

				<div class="row object-visible">

					<div class="col-md-12">

						<!-- 对话模态框 start -->
						<div class="filters fliters-iframe text-left info">
							<ul class="nav nav-justified nav-tabs">
								
								<li class="active"><a href="${contextPath}/CLMF-frontUI-dev/pages/about_BBS.jsp" target="page-wrapper1">关于论坛</a></li>
								
								<li><a href="${contextPath}/CLMF-frontUI-dev/pages/news_broadcast.jsp" target="page-wrapper1">要闻播报</a></li>
								
								<c:forEach items="${catList}" var="cl">
								<li><a href="${contextPath}/front_index/news?categoryId=${cl.id}" target="page-wrapper1">${cl.category_name}</a></li>
								</c:forEach>
								
								<%-- <li><a href="${contextPath}/CLMF-frontUI-dev/pages/media_foucs.jsp" target="page-wrapper1">媒体聚焦</a></li>
								
								<li><a href="${contextPath}/CLMF-frontUI-dev/pages/dialog_bwn_person.jsp" target="page-wrapper1">人物对话间</a></li>
								
								<li><a href="${contextPath}/CLMF-frontUI-dev/pages/paper_highlight.jsp" target="page-wrapper1">论文集锦</a></li> --%>
								
							</ul>
						
						</div>
						<!-- isotope filters end -->

						<!-- portfolio items start -->
						<div id="page-iframe1">
				
							<iframe id="" src="" name="page-wrapper1" width="100%" height="100%" style="padding: 0 10px;" scrolling="auto" frameborder="0"></iframe>
						
						</div>
					</div>
				</div>
			</div>
		</div>

		<!-- 新闻部分结束 -->

		<!-- 会议日程开始 -->
		<!-- ================ -->
		<div class="section translucent-bg bg-image-1 ">

			<div class="container object-non-visible" data-animation-effect="fadeIn">

				<h1 id="services" class="text-center title">会议日程</h1>

				<div class="space"></div>

				<div class="row col-md-offset-1 col-md-11">
					<div class="col-sm-12 col-lg-6  col-md-6">

						<div class="media">
							<div class="media-right">
								<i class="fa fa-recycle fa-2x"></i>
							</div>
							<div class="media-body text-left">
								<h4 class="media-heading">8月21日 星期五</h4>
								<p style="margin-top: 14px; margin-left: 18px;">08:00-24:00&nbsp;&nbsp;论坛报到</p>
							</div>
						</div>

						<div class="media">
							<div class="media-right">
								<i class="fa fa-recycle fa-2x"></i>
							</div>
							<div class="media-body text-left">
								<h4 class="media-heading">8月22日 星期六</h4>
								<p style="margin-top: 14px; margin-left: 18px;">08:00-08:30 &nbsp;&nbsp;论坛代表合影 </p>
								<p style="margin-top: 14px; margin-left: 18px;">09:00-09:50 &nbsp;&nbsp;论坛开幕式</p>
								<p style="margin-top: 14px; margin-left: 18px;">10:00-11:30 &nbsp;&nbsp;高端论坛&nbsp;
								</br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					话题：“互联网+”下的华文媒体 </p>
								<p style="margin-top: 14px; margin-left: 18px;">12:00-13:00 &nbsp;&nbsp;主题午餐
								</br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;主题：如何构建世界华文媒体资讯中心</p>
								<p style="margin-top: 14px; margin-left: 18px;">13:00-13:50 &nbsp;&nbsp;“走遍大地神州，醉美多彩贵州”
								</br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;民族民俗风情展</p>
								<p style="margin-top: 14px; margin-left: 18px;">14:00-16:40 &nbsp;&nbsp;专题演讲
								</br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;1."一带一路"与全球变局
								</br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;2.大数据改变世界 </p>
								<p style="margin-top: 14px; margin-left: 18px;line-height: 30px;">17:00-19:00 &nbsp;&nbsp;聚焦贵州--媒体见面会及欢迎招待会  </p>
						
							</div>

						</div>
						<div class="media">
							<div class="media-right">
								
							</div>
							<div class="media-body text-left">
								<h4 class="media-heading"></h4>
								
							</div>

						</div>

					</div>

					<div class="space visible-xs"></div>

					<div class="col-sm-12 col-lg-6 col-md-6">
						
						<div class="media">
							<div class="media-left">
								<i class="fa fa-recycle fa-2x"></i>
							</div>
							<div class="media-body">
								<h4 class="media-heading">8月23日 星期日</h4>
								<p style="margin-top: 14px; margin-left: 18px;line-height: 30px;">09:00-12:00&nbsp;&nbsp;主题分论坛：
								</br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;第一分论坛&nbsp;&nbsp;移动互联时代媒体的转型之道
								</br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;第二分论坛&nbsp;&nbsp;新媒体的传播力与品牌运营 </p>
								<p style="margin-top: 14px; margin-left: 18px; line-height: 30px;">14:30-15:50&nbsp;&nbsp;大会发言</p>
								<p style="margin-top: 14px; margin-left: 18px; line-height: 30px;">15:50-17:20 &nbsp;&nbsp;闭幕式</p>
								<p style="margin-top: 14px; margin-left: 18px;line-height: 30px;">20:00-22:00&nbsp;&nbsp;观看《多彩贵州风》文艺演出</p>
								</p>
							</div>
						</div>
						<div class="media">
							<div class="media-left">
								<i class="fa fa-recycle fa-2x"></i>
							</div>
							<div class="media-body">
								<h4 class="media-heading">8月24日 星期一</h4>
								<p style="margin-top: 14px; margin-left: 18px;line-height: 30px;">08:00-18:00 贵阳市内参访
							</div>
						</div>
	                   <div class="media">
							<div class="media-left">
								<i class="fa fa-recycle fa-2x"></i>
							</div>
							<div class="media-body">
								<h4 class="media-heading">8月25日星期二</h4>
								<p style="margin-top: 14px; margin-left: 18px;line-height: 30px;">10:00-12:30&nbsp;&nbsp;贵安分论坛
								</br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;主题：
								</br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;1.贵州旅游的世界角色
								</br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;2.贵州的转型升级与大数据发展</p>
							    <p style="margin-top: 14px; margin-left: 18px;line-height: 30px;">13:00- &nbsp;&nbsp;境外代表赴贵州省内及外地参访</p>
							</div>
						</div>
					</div>
				</div>

			</div>

		</div>
		<!-- 会议日程结束 -->

		<!-- 会议介绍开始 -->
		<div class="section clearfix object-non-visible   blue" data-animation-effect="fadeIn">
			<div class="container">
				<div class="row">

					<div class="col-md-offset-1 col-md-10">

						<h1 id="about" class="title text-center">贵阳 <span>大观</span></h1>
						<p class="lead text-center">贵阳：一个经济发展与生态保护双赢的新兴城市</p>
						<div class="space"></div>
						<div class="row">
							<div class="col-md-6">
								<div class="space"></div>
								<img src="${contextPath}/CLMF-frontUI-dev/images/gyLogo.jpg" alt="">
							</div>
							<div class="col-md-6">
								<p style="line-height: 32px; text-indent: 22px;">
									贵阳市因位于贵山之阳而得名，旧时盛产竹子，故简称筑。贵阳，地处贵州省中部，
									国土总面积为8034平方公里，东西宽113千米，南北长130千米，是贵州省省会城市，
									全省的政治、经济、科技、教育、文化中心，西南重要的交通枢纽和物流中心。现辖云岩、
									南明、花溪、乌当、白云、观山湖6个区和修文、息烽、开阳3个县及清镇市、
									4个国家级开发区（贵阳国家高新技术产业开发区、贵阳经济技术开发区、贵阳综合保税区、双龙临空经济区），
									总人口为472.18万人。<br>
									贵阳地处大西南腹地，苗、布依、侗等11个世居少数民族和谐共处，民俗风情独特。<br>
									贵阳，城中有山、山中有城、城在林中、林在城中。<br>
									贵阳，崇尚自然、精致和谐、厚德务实、追求卓越。<br>
									贵阳，知行合一、协力争先。</li>
								</p>
								
							</div>
						</div>
						<div class="space"></div>

						<div class="row">
						
							<div class="col-md-offset-1 col-md-11">

								<div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">
									<div class="panel panel-default">
										<div class="panel-heading" role="tab" id="headingOne">
											<h4 class="panel-title" style="">

												<a data-toggle="collapse" data-parent="#accordion" href="#collapseOne" aria-expanded="true" aria-controls="collapseOne" style="padding-left: 30px;">

													生态贵阳

												</a>

											</h4>
										</div>
										<div id="collapseOne" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="headingOne">
											<div class="panel-body">
												<P style="line-height: 32px; text-indent: 20px;">
													贵阳以生态良好著称，有“爽爽的贵阳”的美誉。
													贵阳气候属北亚热带湿润温和型，兼有高原性和季风性气候特点。
													由于受太平洋东南季风和印度洋西南季风的影响，
													夏季雨量充沛，这种温度与降水的配合，决定了贵阳的气候，夏无酷暑，
													冬无严寒，是消暑避寒之地，有“爽爽的贵阳”的美誉。
													贵阳空气清新，空气质量优良率达86%，森林覆盖率达45%，
													是世界上喀斯特地区植被保持最好的中心城市；纬度合适，
													位于北纬26度附近，非常适合人居；海拔适中，平均海拔1100米，
													为世界上紫外线辐射最低的城市之一。
												</P>
											</div>
										</div>
									</div>
									<div class="panel panel-default">
										<div class="panel-heading" role="tab" id="headingTwo">
											<h4 class="panel-title">

												<a class="collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo" style="padding-left: 30px;">
													创新贵阳
												</a>

											</h4>
										</div>
										<div id="collapseTwo" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingTwo">
											<div class="panel-body">
												<p style="text-indent: 20px; line-height: 32px;">
												2013年以来，贵阳市大力实施开放带动、创新驱动战略。
												以京筑创新驱动区域合作为契机，成立中关村贵阳科技园，统筹全市园区建设和产业发展，
												大力培育高新技术产业、现代制造业、高端服务业和都市现代农业。坚定不移以大数据带动产业转型升级、
												推动政府治理变革、助推保障和改善民生，推进“块数据”城市建设，取得了卓著成效。
												目前已经探索了“七个率先”，即率先创建国家级大数据产业发展集聚区、
												率先举办全球首个以大数据为主题的博览会和峰会、率先成立大数据交易所、率先建设全域公共免费WiFi城市、
												率先提出块数据理念并探索建设块上集聚的大数据公共平台、
												率先举办大数据商业模式创新大赛和草根创业大赛、率先成立大数据战略重点实验室。
												</p>
											</div>
										</div>
									</div>
									<div class="panel panel-default">
										<div class="panel-heading" role="tab" id="headingThree">
											<h4 class="panel-title">

												<a class="collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapseThree" aria-expanded="false" aria-controls="collapseThree" style="padding-left: 30px;">

													腾飞贵阳

												</a>

											</h4>
										</div>
										<div id="collapseThree" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingThree">
											<div class="panel-body">
												<P style="text-indent: 20px; line-height: 32px;">
												近年来，贵阳主要经济指标增速始终位居全国省会城市前列。2014年，
												完成生产总值2497.27亿元，增长13.9%；规模以上工业增加值636.06亿元，
												增长12.2%；全社会固定资产投资3489.41亿元，增长15.1%；公共财政预算收入331.59亿元
												，增长19.6%；城镇、农村常住居民人均可支配收入分别为24961元和10826元，
												增长9.4%和12.7%。2015年一季度，完成生产总值472.01亿元，增长11.6%；
												规模以上工业增加值166.51亿元，增长8.7%；全社会固定资产投资521.58亿元，
												增长21.1%；公共财政预算收入108.03亿元，增长8.3%；城镇、
												农村常住居民人均可支配收入分别为7937元和2861元，增长8.9%和11.8%。
                                               </P>
											</div>
										</div>
									</div>
								</div>
							</div>

						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- 会议介绍结束 -->


		<!-- 会议嘉宾开始 -->
		<!-- ================ -->
		<div class="section translucent-bg bg-image-2 pb-clear">

			<div class="container object-non-visible" data-animation-effect="fadeIn" style="width:80% !important;">

				<h1 id="clients" class="title text-center">与会嘉宾</h1>

				<div class="col-lg-12 col-lg-offset-1">
					<marquee class="" direction="up" behavior="scroll" scrollamount="6" style="height:500px;font-size:18px;">
						<div>
						<c:forEach items="${guestInfor}" var="li" varStatus="vs">
							<span class="col-md-6 mt5">
								<label class="mr20">${li.chinese_name}</label><label>${li.ch_organ_name}${li.post}</label>
							</span>
						</c:forEach>
						<span class="clearfix"></span>
						</div>
					</marquee>
				</div>
			</div>
		</div>
		<!-- 问卷调查结束 -->

		<!-- 联系我们start -->
		<!-- ================ -->
		<footer id="footer">
			<!-- .footer start -->
			<!-- ================ -->
			<div class="footer section">
				<div class="container">
					<h1 class="title text-center" id="contact">联系我们</h1>
					<div class="space"></div>
					<div class="row">
						<div class="col-sm-6">
							<div class="footer-content">
								<p class="large">关于本次论坛，您有任何需要咨询或帮助的事宜，请致电论坛秘书处。</p>
								<ul class="list-icons">
									<li><i class="fa fa-map-marker pr-10"></i> 中国贵州贵阳市金阳行政中心二期综合办公楼A区3层</li>
									<li><i class="fa fa-phone pr-10"></i> +86 851 87989091</li>
									<li><i class="fa fa-fax pr-10"></i> +86 851 87989091</li>
									<li><i class="fa fa-envelope-o pr-10"></i>guizhouluntan@chinanews.com.cn</li>
								</ul>
								<p class="pull-left" style="width: 50%;padding-left: 60px;">
									<img src="${contextPath}/CLMF-frontUI-dev/images/khd.png" style="width: 58%;">&nbsp;&nbsp;
								</p>
								<P>
									<img src="${contextPath}/CLMF-frontUI-dev/images/zxw.png" style="width: 23%;"/>
								</P>
							</div>
						</div>
						<div class="col-sm-6">
							<div class="footer-content">
								<form role="form" id="footer-form">
									<div class="form-group has-feedback">
										<label class="sr-only" for="name2">Name</label>
										<input type="text" class="form-control" id="name2" placeholder="姓名" name="name2" required>
									</div>
									<div class="form-group has-feedback">
										<label class="sr-only" for="email2">Email address</label>
										<input type="text" class="form-control" id="email2" placeholder="电子邮件" name="email2" required>
									</div>
									<div class="form-group has-feedback">
										<label class="sr-only" for="message2">Message</label>
										<textarea class="form-control" rows="8" id="message2" placeholder="信息" name="message2" required></textarea>
										<i class="fa fa-pencil form-control-feedback"></i>
									</div>
									<input type="button" value="发邮件" class="btn btn-default">
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- .footer end -->

			<div class="space"></div>
            <div class="space"></div>
			<!-- .subfooter start -->
			<!-- ================ -->
			<div class="subfooter">
				<div class="container">
					<div class="row">
						<div class="col-md-12">
							<p class="text-center">All rights reserved by
								<a target="" href="#">mwicloud.com</a>
							</p>
						</div>
					</div>
				</div>
			</div>
			<!-- .subfooter end -->

		</footer>
		<!-- 联系我们end -->

		<!--
		<!-- 登录模态框（Modal） -->
		<div class="modal fade" id="loginer" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×
						</button>
						<h4 class="modal-title" id="myModalLabel">

                           	<span class="fa-2x fa fa-user mr5" style="color: #C9302C;"></span>欢迎嘉宾登录

            			</h4>
					</div>

					<div class="modal-body ">

						<div class="container-fluid">
							<div class="tab-content" id="info_content">

								<div class="tab-pane  in active" id="login">

									<form action="${contextPath}/guest_login/login" class="form-horizontal row text-info" method="post">

										<div class="form-group">
											<label class="text-capitalize text-info control-label col-sm-3 col-lg-3 col-md-3" for="username">用户名：</label>
											<div class=" col-sm-8 col-lg-8 col-md-8">
												<input type="text" class="text-justify form-control" placeholder="Name" id="username" name="user_email" />
											</div>
										</div>

										<div class="form-group">
											<label class="text-capitalize  control-label col-sm-3 col-lg-3" for="password">密码：</label>
											<div class=" col-sm-8 col-lg-8 col-md-8">
												<input type="password" class="text-justify form-control" placeholder="Password" id="password" name="password" />
											</div>
										</div>
										<div class="form-group">
											<div class="col-sm-offset-2 col-sm-10">
												<div class="checkbox">
													<label>
														<input type="checkbox"> 请记住我
													</label>
												</div>
											</div>
										</div>

										<div class="form-group">
											<div class="col-lg-offset-2 col-lg-10 text-center">
												<button type="submit" class="btn btn-primary" />登录</button>
												<a href="${contextPath}/guest_register" target="_blank" class="btn btn-primary">注册</a>
												<a href="#" data-toggle="modal" data-target="#forgetPwd" />忘记密码？</a>
											</div>

										</div>

									</form>

								</div>

							</div>

						</div>

					</div>
					<!-- /.modal-dialog -->
				</div>
				<!-- /.modal -->
			</div>
		</div>

		<div class="modal fade" id="forgetPwd" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header" style="background: #265A88">
						<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×
						</button>
						<h4 class="modal-title" id="">

                         	密码重置

          			</h4>
					</div>

					<div class="modal-body ">

						<div class="container-fluid">
							<div class="tab-content" id="info_content">

								<div class="tab-pane  in active" id="">

									<form action="#" class="form-horizontal row text-info" method="post">

										<div class="form-group">
											<label class="text-capitalize text-info control-label col-sm-3 col-lg-3 col-md-3" for="username">用户名：</label>
											<div class=" col-sm-8 col-lg-8 col-md-8">
												<input type="text" class="text-justify form-control register-username" placeholder="Name" id="username" name="username" />
											</div>
										</div>

										<div class="form-group">
											<label class="text-capitalize  control-label col-sm-3 col-lg-3" for="password">注册邮箱：</label>
											<div class="col-sm-8 col-lg-8 col-md-8">
												<input type="text" class="text-justify form-control pull-left register-email" placeholder="请输入注册邮箱" id="" name="" />
												<button class="btn btn-sm btn-primary pull-left ml5 getSubCode" type="button">获取验证码</button>
											</div>
										</div>
										<div class="form-group">
											<label class="text-capitalize  control-label col-sm-3 col-lg-3" for="password">请输入验证码：</label>
											<div class=" col-sm-8 col-lg-8 col-md-8">
												<input type="text" class="text-justify form-control subCode" placeholder="请输入验证码" id="" name="" />
											</div>
										</div>

										<div class="form-group mt20">
											<div class="col-lg-12 text-center">
												<button type="button" class="btn btn-primary changePwd_btn" />确定</button>
												<button type="button" class="btn btn-primary" data-dismiss="modal" aria-hidden="true" />取消</button>
											</div>

										</div>

									</form>

								</div>

							</div>

						</div>

					</div>
					<!-- /.modal-dialog -->
				</div>
				<!-- /.modal -->
			</div>
		</div>

		<div id="download-data" class="modal fade modalRefresh" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog" style="width: 1000px;">

				<div class="modal-content">

				</div>
				<!-- /.modal-content -->
			</div>
		</div>
						<!-- /.modal -->
		<!-- JavaScript files placed at the end of the document so the pages load faster
================================================== -->
		<!-- Jquery and Bootstap core js files -->

		<script src="http://apps.bdimg.com/libs/jquery/2.1.1/jquery.min.js"></script>
		<script src="http://apps.bdimg.com/libs/bootstrap/3.3.0/js/bootstrap.min.js"></script>
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
		
		<script>
			$('#page-iframe1 iframe').attr('src',$('.fliters-iframe ul.nav li').eq(0).find('a').attr('href'));
			$('.getSubCode').on('click',function(){
				var username = $('.register-username').val();
				var email = $('.register-email').val();
				var regex = /^[a-zA-Z0-9_-]+@[a-zA-Z0-9_-]+(\.[a-zA-Z0-9_-]+)+$/;
				if(!(username&&email)){
					alert("用户名和邮箱不能为空！");
				}else if(!(regex.test(email))){
					alert("邮箱格式不正确！");
				}else{
					//获取验证码
				}
			});
			$('.changePwd_btn').on('click',function(){
				var subCode = $(this).parents('form').find('input.subCode');
				var username = $('.register-username').val();
				var email = $('.register-email').val();
				if(!(subCode&&username&&email)){
					alert("输入不正确！");
				}else{
					$(this).parents('form').submit();
				}
			});
			
			$(function(){
				if(getCookie('responseCode') == 1){
					alert("消息发送成功！请等待主办方的回信。");
					delCookie('responseCode');
				}else if(getCookie('responseCode') == 0){
					alert("消息发送失败！请重试");
					delCookie('responseCode');
				}
			});
			
			function getCookie(name){
			    var arr,reg=new RegExp("(^| )"+name+"=([^;]*)(;|$)");
			    if(arr=document.cookie.match(reg))
			        return (arr[2]);
			    else
			        return null;
			}
			
			function delCookie(name){
			    var exp = new Date();
			    exp.setTime(exp.getTime() - 1);
			    var cval=getCookie(name);
			    if(cval!=null)
			        document.cookie= name + "="+cval+";expires="+exp.toGMTString();
			}
		</script>

	</body>

</html>