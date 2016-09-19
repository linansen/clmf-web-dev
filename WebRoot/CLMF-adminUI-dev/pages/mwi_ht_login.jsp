<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<html>
<!DOCTYPE html>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <title>登录(Login)</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="">
        <meta name="author" content="">
        <link rel="stylesheet" href="${contextPath}/CLMF-adminUI-dev/dist/css/reset.css">
    	<link rel="stylesheet" href="${contextPath}/CLMF-adminUI-dev/dist/css/styleforadmin.css">
    </head>
    <body style="background: url('${contextPath}/CLMF-adminUI-dev/images/loginBg.jpg') no-repeat;">
        <div class="page-container">
            <h1>后台管理登录(Login)</h1>
            <form action="${contextPath}/admin_login/login" method="post">
                <input type="text" name="username" class="username" placeholder="请输入您的用户名！">
                <input type="password" name="password" class="password" placeholder="请输入您的用户密码！">
                <input type="Captcha" class="Captcha" name="Captcha" class="Captcha" placeholder="请输入验证码！">
                <button type="submit" class="submit_button">登录</button>
            </form>
        </div>
        <!-- Javascript -->
      	<script src="${contextPath}/CLMF-adminUI-dev/bower_components/jquery/dist/jquery.min.js"></script>
      	<script src="${contextPath}/CLMF-adminUI-dev/dist/js/login.js"></script>
    </body>
</html>

