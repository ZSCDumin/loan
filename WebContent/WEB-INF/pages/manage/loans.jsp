<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%--
  Created by IntelliJ IDEA.
  User: yangming
  Date: 16/8/22
  Time: 20:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>华南理工大学财务处收费科</title>
    <script src="${pageContext.request.contextPath}/js/jquery-easyui-1.5/jquery.min.js"></script>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/js/jquery-easyui-1.5/themes/default/easyui.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/js/jquery-easyui-1.5/themes/icon.css"/>
    <script src="${pageContext.request.contextPath}/js/jquery-easyui-1.5/jquery.easyui.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/jquery-easyui-1.5/locale/easyui-lang-zh_CN.js"></script>
    <script src="${pageContext.request.contextPath}/js/common.js"></script>
    <script>
        $(function () {

            //日期组件
            $("#date,#updateDate").datebox({
                required: true,
                missingMessage: "出生日期为必填!",
                editable: false
            });

            $("#year,#updateYear").numberbox({
                min: 2000,
                max: 2030,
                required: true,
                missingMessage: "年度为必填!",
                precision: 0
            });

            $("#loanNum,#tuitionNum,#refundNum,#updateLoanNum,#updateTuitionNum,#updateRefundNum").numberbox({
                min: 0,
                max: 150000,
                required: true,
                missingMessage: "金额为必填!",
                precision: 2
            });
            var flag;
            $('#t_user').datagrid({
                idField: 'id',    //只要创建表格就必须加idField
                title: '用户列表',
                //width: 'auto',
                height: 'auto',
                url: 'getList',
                fitColumns: true,
                striped: true,        //隔行变色
                loadMsg: '数据正在加载...',
                rownumbers: true,
                //singleSelect: true,
                remoteSort: false,
                /*frozenColumns: [[         //fitColumns  frozenColumns  不要一起使用

                 ]],*/
                columns: [[
                    {field: 'ok', title: '选择', width: 50, checkbox: true},
                    {field: 'stuId', title: '学号', width: 100, align: 'center'},
                    {field: 'stuName', title: '姓名', width: 100, align: 'center'},
                    {field: 'stuDepart', title: '学院', width: 100, align: 'center'},
                    {field: 'year', title: '年度', width: 100, align: 'center'},
                    {field: 'loanNum', title: '贷款金额', width: 100, align: 'center'},
                    {field: 'tuitionNum', title: '抵缴金额', width: 100, align: 'center'},
                    {field: 'refundNum', title: '发放金额', width: 100, align: 'center'},
                    {field: 'date', title: '发放日期', width: 100, align: 'center'},
                    {
                        field: 'success',
                        title: ' 是否成功',
                        width: 100,
                        align: 'center',
                        formatter: function (value, record, index) {
                            if (value == 1) {
                                return '成功';
                            } else if (value == 0) {
                                return '<span style=color:red>失败</span>';
                            }
                        }
                    },

                    {field: 'remark', title: '备注', width: 100, align: 'center'}
                ]],
                pagination: true,
                pageSize: 15,
                pageList: [15, 30, 50, 100],
                toolbar: [
                    {
                        text: '新增用户', iconCls: 'icon-add', handler: function () {
                        flag = 'add';
                        $('#myDialog').dialog({
                            title: '新增用户'
                        });

                        //$('#myForm').find('input[name!=sex]').val("");   //清空输入框
                        $('#myForm').get(0).reset();     //清空输入框
                        //$('#myForm').form('clear');
                        $('#myDialog').dialog('open');
                    }
                    },
                    {
                        text: '修改用户', iconCls: 'icon-edit', handler: function () {
                        flag = 'update';
                        var arr = $('#t_user').datagrid('getSelections');
                        if (arr.length != 1) {
                            $.messager.show({
                                title: '提示信息',
                                msg: '请选择1条数据进行修改!'
                            });
                            //$('#t_user').datagrid('unselectAll');
                        } else {
                            $('#updateDialog').dialog({
                                title: '修改用户'
                            });
                            $('#updateDialog').dialog('open');  //弹出form表单
                            $('#updateForm').get(0).reset();     //清空输入框
                            $('#updateForm').form('load', {
                                id: arr[0].id,
                                stuId: arr[0].stuId,
                                stuName: arr[0].stuName,
                                stuDepart: arr[0].stuDepart,
                                year: arr[0].year,
                                loanNum: arr[0].loanNum,
                                tuitionNum: arr[0].tuitionNum,
                                refundNum: arr[0].refundNum,
                                date: arr[0].date,
                                success: arr[0].success,
                                remark: arr[0].remark
                            });
                            //$('#t_user').datagrid('unselectAll');
                        }
                    }
                    },
                    {
                        text: '删除用户', iconCls: 'icon-remove', handler: function () {
                        flag = 'delete';
                        var arr = $('#t_user').datagrid('getSelections');
                        if (arr.length < 1) {
                            $.messager.show({
                                title: '提示信息',
                                msg: '请至少选择一条数据进行删除!'
                            });
                        } else {
                            $.messager.confirm('提示信息', '确认删除?', function (r) {
                                if (r) {
                                    var ids = '';
                                    for (var i = 0; i < arr.length; i++) {
                                        ids += arr[i].id + ',';
                                    }
                                    ids = ids.substring(0, ids.length - 1);
                                    $.post('deleteLoans', {ids: ids}, function (result) {
                                        //1、刷新数据表格
                                        $('#t_user').datagrid('reload');
                                        //清空idField
                                        $('#t_user').datagrid('unselectAll');
                                        //2、提示信息
                                        $.messager.show({
                                            title: '提示信息',
                                            msg: '操作成功'
                                        });

                                    });
                                } else {
                                    //$('#t_user').datagrid('unselectAll');
                                    return;
                                }
                            });

                        }
                    }
                    }
                ]
            });

            //ajax提交添加表单
            $("#btn1").click(function () {
                if ($('#myForm').form('validate')) {
                    $.ajax({
                        type: 'post',
                        url: 'saveLoan',
                        cache: false,
                        data: JSON.stringify(serializeForm($('#myForm'))),
                        contentType: 'application/json',
                        dataType: 'text',
                        success: function (result) {
                            //关闭窗口
                            $("#myDialog").dialog('close');
                            //刷新datagrid
                            $("#t_user").datagrid('reload');
                            //提示信息
                            var result = $.parseJSON(result);
                            $.messager.show({
                                title: result.status,
                                msg: result.message
                            });

                        },
                        error: function (result) {

                            var result = $.parseJSON(result);
                            $.messager.show({
                                title: result.status,
                                msg: result.message
                            });
                        }

                    });
                } else {
                    $.messager.show({
                        title: '提示信息!',
                        msg: '数据验证不通过,不能保存!'
                    });
                }
            });

            $('#btn2').click(function () {
                $('#myDialog').dialog('close');
            });

            //ajax提交修改表单
            $("#btn11").click(function () {
                if ($('#updateForm').form('validate')) {
                    $.ajax({
                        type: 'post',
                        url: 'saveLoan',
                        cache: false,
                        data: JSON.stringify(serializeForm($('#updateForm'))),
                        contentType: 'application/json',
                        dataType: 'text',
                        success: function (result) {
                            //关闭窗口
                            $("#updateDialog").dialog('close');
                            //刷新datagrid
                            $("#t_user").datagrid('reload');
                            //提示信息
                            var result = $.parseJSON(result);
                            $.messager.show({
                                title: result.status,
                                msg: result.message
                            });

                        },
                        error: function (result) {

                            var result = $.parseJSON(result);
                            $.messager.show({
                                title: result.status,
                                msg: result.message
                            });
                        }

                    });
                } else {
                    $.messager.show({
                        title: '提示信息!',
                        msg: '数据验证不通过,不能保存!'
                    });
                }
            });

            $('#btn22').click(function () {
                $('#updateDialog').dialog('close');
            });

            //查询
            $('#sbtn').click(function () {
                $('#t_user').datagrid('load', serializeForm($('#mySearch')));
            });

            $('#cbtn').click(function () {
                $('#mySearch').form('clear');
                $('#t_user').datagrid('load', {});
            });


            //js方法：表单序列化为json格式
            function serializeForm(form) {
                var obj = {};
                $.each(form.serializeArray(), function (index) {
                    if (obj[this['name']]) {
                        obj[this['name']] = obj[this['name']] + ',' + this['value'];
                    } else {
                        obj[this['name']] = this['value'];
                    }
                });
                return obj;
            }
        });
    </script>
</head>
<body>
<div id="lay" class="easyui-layout" style="width: 100%;height: 100%">
    <div region="center">
        <!--查询开始-->
        <form id="mySearch" method="post">
            <br/>
            学 号:<input name="stuId" value=""/>
            &nbsp;&nbsp;&nbsp;&nbsp;
            <a id="sbtn" class="easyui-linkbutton">查询</a>
            &nbsp;&nbsp;&nbsp;&nbsp;
            <a id="cbtn" class="easyui-linkbutton">清空</a>
        </form>
        <!--查询结束-->
        <!--datagrid-->
        <table id="t_user"></table>
    </div>
</div>

<!--添加开始-->
<div id="myDialog" class="easyui-dialog" style="width: 400px" closed="true" modal="true">
    <form:form id="myForm" method="post" commandName="loan" role="form">
        <table>
            <tbody>
            <tr>
                <td>学号:</td>
                <td><input type="text" name="stuId" value="" class="easyui-validatebox" required="true"
                           missingMessage="学号为必填!"/></td>
            </tr>
            <tr>
                <td>姓名:</td>
                <td><input type="text" name="stuName" value="" class="easyui-validatebox" required="true"
                           missingMessage="姓名为必填!"/></td>
            </tr>
            <tr>
                <td>学院:</td>
                <td><input type="text" name="stuDepart" value="" class="easyui-validatebox" required="true"
                           missingMessage="学院为必填!"/></td>
            </tr>
            <tr>
                <td>贷款年度:</td>
                <td><input id="year" type="number" name="year" value=""/></td>
            </tr>
            <tr>
                <td>贷款金额:</td>
                <td><input id="loanNum" type="number" name="loanNum" value=""/></td>
            </tr>
            <tr>
                <td>抵缴金额:</td>
                <td><input id="tuitionNum" type="number" name="tuitionNum" value=""/></td>
            </tr>
            <tr>
                <td>发放金额:</td>
                <td><input id="refundNum" type="number" name="refundNum" value=""/></td>
            </tr>
            <tr>
                <td>发放日期:</td>
                <td><input id="date" type="text" name="date" value=""/></td>
            </tr>
            <tr>
                <td>是否成功:</td>
                <td>成功<input type="radio" checked="checked" name="success" value="1"/></td>
                <td>失败<input type="radio" name="success" value="0"/></td>
            </tr>
            <tr>
                <td>备注:</td>
                <td><input type="text" name="remark" value=""/></td>
            </tr>
            <tr align="center">
                <td colspan="2">
                    <a id="btn1" class="easyui-linkbutton">保存</a>
                    <a id="btn2" class="easyui-linkbutton">关闭</a>
                </td>
            </tr>
            </tbody>
        </table>
    </form:form>
</div>
<!--添加结束-->

<!--修改开始-->
<div id="updateDialog" class="easyui-dialog" style="width: 400px" closed="true" modal="true">
    <form:form id="updateForm" method="post" commandName="loan" role="form">
        <table>
            <tbody>
            <input type="hidden" id="id" name="id" value=""/>
            <tr>
                <td>学号:</td>
                <td><input type="text" name="stuId" value="" class="easyui-validatebox" required="true"
                           missingMessage="学号为必填!"/></td>
            </tr>
            <tr>
                <td>姓名:</td>
                <td><input type="text" name="stuName" value="" class="easyui-validatebox" required="true"
                           missingMessage="姓名为必填!"/></td>
            </tr>
            <tr>
                <td>学院:</td>
                <td><input type="text" name="stuDepart" value="" class="easyui-validatebox" required="true"
                           missingMessage="学院为必填!"/></td>
            </tr>
            <tr>
                <td>贷款年度:</td>
                <td><input id="updateYear" type="number" name="year" value=""/></td>
            </tr>
            <tr>
                <td>贷款金额:</td>
                <td><input id="updateLoanNum" type="number" name="loanNum" value=""/></td>
            </tr>
            <tr>
                <td>抵缴金额:</td>
                <td><input id="updateTuitionNum" type="number" name="tuitionNum" value=""/></td>
            </tr>
            <tr>
                <td>发放金额:</td>
                <td><input id="updateRefundNum" type="number" name="refundNum" value=""/></td>
            </tr>
            <tr>
                <td>发放日期:</td>
                <td><input id="updateDate" type="text" name="date" value=""/></td>
            </tr>
            <tr>
                <td>是否成功:</td>
                <td>成功<input type="radio" checked="checked" name="success" value="1"/></td>
                <td>失败<input type="radio" name="success" value="0"/></td>
            </tr>
            <tr>
                <td>备注:</td>
                <td><input type="text" name="remark" value=""/></td>
            </tr>
            <tr align="center">
                <td colspan="2">
                    <a id="btn11" class="easyui-linkbutton">保存</a>
                    <a id="btn22" class="easyui-linkbutton">关闭</a>
                </td>
            </tr>
            </tbody>
        </table>
    </form:form>
</div>
<!--添加结束-->
</body>
</html>
