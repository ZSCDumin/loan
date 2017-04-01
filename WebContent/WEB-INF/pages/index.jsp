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
    <script src="${pageContext.request.contextPath}/js/html5shiv.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/respond.min.js"></script>
    <![endif]-->
</head>
<body>
<div class="container">
    <h1>助学贷款下发情况查询</h1>
    <hr/>
    <form:form action="loans" method="post" commandName="loan" role="form">
        <div class="form-group">
            <label for="stu_id">学号:</label>
            <input type="text" class="form-control" id="stu_id" name="stu_id" placeholder="输入学号:"/>
        </div>
        <div class="form-group">
            <button type="submit" class="btn btn-sm btn-success">查询</button>
        </div>
    </form:form>
    <div class="alert alert-warning">${msg}</div>
    <div class="alert alert-info alert-dismissable">
        <button type="button" class="close" data-dismiss="alert"
                aria-hidden="true">
            &times;
        </button>
        一、学生工作部（处）、党委研究生工作部分别负责本科、研究生国家助学贷款的申请、审核及贷后管理等工作。财务处负责全校学生国家助学贷款的发放工作。<br/>
        二、缓交、助学贷款的申请以及还款的相关政策，
        请查看http://student1.scut.edu.cn:8280/loanIndex.jsp?topDirId=298，如对助学贷款有任何的疑问，请咨询学生工作处陈老师（87110693）。<br/>
        三、校园地助学贷款、国开行生源地助学贷款的下发流程：
        校园地助学贷款、国开行生源地助学贷款下发后，学生工作处统一把到账名单交到财务处，先用于抵交学生的欠费，剩余金额将在一个月内自动发到学生在学校绑定的银行卡上。
        如果没发放成功，带上身份证或学生证到财务处收费科办理领取手续。<br/>
        四、<span style="color:red">此系统仅能查询校园地助学贷款及国开行生源地助学贷款。</span><br/>非国开行生源地助学贷款的领取流程：<br/>
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