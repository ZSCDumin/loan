<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <h1>助学贷款下发情况</h1>
    <hr/>

    <!-- 如果用户列表非空 -->
    <table class="table table-bordered table-striped">
        <tr>
            <th>学号</th>
            <th>姓名</th>
            <th>学院</th>
            <th>贷款年度</th>
            <th>贷款金额</th>
            <th>抵交金额</th>
            <th>发放金额</th>
            <th>发放日期</th>
            <th>是否成功</th>
            <th>备注说明</th>
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
                <td><c:if test="${loan.success==1}">是</c:if><c:if test="${loan.success==0}">否</c:if></td>
                <td><c:if test="${loan.success==1}">${loan.remark}</c:if><c:if
                        test="${loan.success==0}">请联系收费科：020-87114508</c:if></td>
            </tr>
        </c:forEach>
    </table>
    <div>
        <a class="btn btn-info btn-sm" href="/loan/" role="button">返回</a>
    </div>
    <div class="alert alert-info alert-dismissable">
        <button type="button" class="close" data-dismiss="alert"
                aria-hidden="true">
            &times;
        </button>

        一、校园地助学贷款、国开行生源地助学贷款的下发流程：
        校园地助学贷款、国开行生源地助学贷款下发后，学生工作处统一把到账名单交到财务处，先用于抵交学生的欠费，剩余金额将在一个月内自动发到学生在学校绑定的银行卡上。
        如果没发放成功，带上身份证或学生证到财务处收费科办理领取手续。<br/>
        二、非国开行生源地助学贷款的领取流程：<br/>
        1、到学生工作处填写《生源地贷款领取单》<br/>
        2、到财务处结算科闫老师处填写《外单位汇入款项通知单》<br/>
        3、将《生源地贷款领取单》、《外单位汇入款项通知单》一同交到财务处收费科。收费科老师填写《领条》并经学生签字后制作会计凭证。<br/>
        4、学生拿会计凭证复核后到结算科出纳窗口处领取贷款<br/>
    </div>
</div>


<!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
<script src="${pageContext.request.contextPath}/js/jquery-3.1.0.min.js"></script>

<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
<script src="${pageContext.request.contextPath}/js/bootstrap3.3.5/js/bootstrap.min.js"></script>
</body>
</html>