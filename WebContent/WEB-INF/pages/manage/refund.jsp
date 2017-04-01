<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <title>SpringMVC 用户管理</title>

    <!-- 新 Bootstrap 核心 CSS 文件 -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/js/bootstrap3.3.5/css/bootstrap.min.css">

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="//cdn.bootcss.com/html5shiv/3.7.2/html5shiv.min.js"></script>
    <script src="//cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body>
<div class="container">

    <h3>所有发放不成功</h3>


    <div>${msg}</div>
    <table class="table table-bordered table-striped">
        <tr>
            <th>学号</th>
            <th>姓名</th>
            <th>学院</th>
            <th>贷款年度</th>
            <th>贷款金额</th>
            <th>抵缴金额</th>
            <th>发放金额</th>
            <th>发放日期</th>
            <th>是否成功</th>
            <th>备注</th>
            <th>操作</th>
        </tr>

        <c:forEach items="${loanList}" var="loan">
            <tr>
                <td>${loan.stuId}</td>
                <td>${loan.stuName}</td>
                <td>${loan.stuDepart}</td>
                <td>${loan.year}</td>
                <td>${loan.loanNum}</td>
                <td>${loan.tuitionNum}</td>
                <td>${loan.refundNum}</td>
                <td>${loan.date}</td>
                <td>
                    <c:if test="${loan.success==1}">成功</c:if>
                    <c:if test="${loan.success==0}">失败</c:if>
                </td>
                <td>${loan.remark}</td>
                <td>
                    <a href="refund/${loan.id}" type="button" class="btn btn-sm btn-success">发放</a>
                </td>
            </tr>
        </c:forEach>
    </table>
</div>

<!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
<script src="${pageContext.request.contextPath}/js/jquery-easyui-1.5/jquery.min.js"></script>

<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
<script src="${pageContext.request.contextPath}/js/bootstrap3.3.5/js/bootstrap.min.js"></script>
</body>
</html>