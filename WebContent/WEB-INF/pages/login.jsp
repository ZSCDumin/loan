<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <title>华南理工大学财务处收费科</title>

    <!-- 新 Bootstrap 核心 CSS 文件 -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/js/bootstrap3.3.5/css/bootstrap.min.css">

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="/js/html5shiv.min.js"></script>
    <script src="/js/respond.min.js"></script>
    <![endif]-->
</head>
<body>
<div class="container">
    <h1>登录</h1>
    <hr/>
    <form:form action="manage" method="post" commandName="admin" role="form">
        <div class="form-group">
            <label for="adminName">用户名:</label>
            <input type="text" class="form-control" id="adminName" name="adminName" placeholder="用户名:"/>
        </div>
        <div class="form-group">
            <label for="adminPass">密码:</label>
            <input type="password" class="form-control" id="adminPass" name="adminPass" placeholder="密码:"/>
        </div>
        <div class="form-group">
            <button type="submit" class="btn btn-sm btn-success">登录</button>
        </div>
    </form:form>
    <div class="alert alert-warning">${msg}</div>
</div>

<!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
<script src="${pageContext.request.contextPath}/js/jquery-3.1.0.min.js"></script>

<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
<script src="${pageContext.request.contextPath}/js/bootstrap3.3.5/js/bootstrap.min.js"></script>
</body>
</html>