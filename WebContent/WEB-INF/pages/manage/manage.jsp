<%--
  Created by IntelliJ IDEA.
  User: cwc
  Date: 2016/8/17
  Time: 14:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>华南理工大学财务处收费科</title>
    <script src="${pageContext.request.contextPath}/js/jquery-easyui-1.5/jquery.min.js"></script>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/js/jquery-easyui-1.5/themes/default/easyui.css"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/js/jquery-easyui-1.5/themes/icon.css"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/common.css"/>
    <script src="${pageContext.request.contextPath}/js/jquery-easyui-1.5/jquery.easyui.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/jquery-easyui-1.5/locale/easyui-lang-zh_CN.js"></script>
    <script>
        $(function () {
           $('a[title]').click(function () {
               var src=$(this).attr('title');
               console.info(src);
               var title=$(this).html();
               console.info(title);
               if ($('#tt').tabs('exists',title)){
                   $('#tt').tabs('close',title);
                   $('#tt').tabs('add',{
                       title:title,
                        content:'<iframe frameborder=0 style="width: 100%;height: 100%" src='+src+'></iframe>',
                        closable:true
                    });
               }else {
                   $('#tt').tabs('add',{
                      title:title,
                       content:'<iframe frameborder=0 style="width: 100%;height: 100%" src='+src+'></iframe>',
                       closable:true
                   });
               }
           }) ;
        });
    </script>
</head>
<body>
<div id="cc" class="easyui-layout" style="width: 100%; height: 100%">
    <!--左侧菜单-->
    <div data-options="region:'west',title:'菜单',split:true" style="width: 15%">
        <div id="aa" class="easyui-accordion" fit="true">
            <div title="" data-options="iconCls:'icon-save',selected:true" style="padding: 10px">
                欢迎，${user.name}！<br/><br/><br/>
                <a title="manage/upload">批量添加</a><br/>
                <a title="manage/loans">全部信息</a><br/>
                <a title="manage/refund">发放不成功</a><br/>
                <br/><br/><br/>
                <a href="manage/quit">退出！</a>
            </div>
        </div>
    </div>

    <!--内容-->
    <div data-options="region:'center',title:'内容'" style="padding: 5px">
        <div id="tt" class="easyui-tabs" fit="true"></div>
    </div>
</div>

</body>
</html>
