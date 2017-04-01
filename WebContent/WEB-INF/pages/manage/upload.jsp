<%--
  Created by IntelliJ IDEA.
  User: yangming
  Date: 16/8/22
  Time: 15:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>上传</title>
</head>
<body>
<div>
    <form action="uploadExcl" enctype="multipart/form-data" method="post">
        选择文件:<input type="file" name="file"/><input type="submit" value="导入"/>
    </form>
</div>
<div>${msg}</div>

</body>
</html>
