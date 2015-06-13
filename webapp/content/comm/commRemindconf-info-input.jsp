<%@page contentType="text/html;charset=UTF-8" %>
<%@include file="/taglibs.jsp" %>
<%pageContext.setAttribute("currentHeader", "common-home");%>
<%pageContext.setAttribute("currentMenu", "remind");%>
<!doctype html>
<html lang="zh">

<head>
    <%@include file="/common/meta.jsp" %>
    <title><spring:message code="commRemindconf-info.commRemindconf-info.input.title" text="编辑"/></title>
    <%@include file="/common/s.jsp" %>

    <link type="text/css" rel="stylesheet"
          href="${scopePrefix}/s/xthena/rypicker/rypicker.css">
    <script type="text/javascript"
            src="${scopePrefix}/s/xthena/rypicker/rypicker.js"></script>
    <script type="text/javascript">
        $(function () {
            $("#commRemindconf-infoForm").validate({
                submitHandler: function (form) {
                    bootbox.animate(false);
                    var box = bootbox.dialog('<div class="progress progress-striped active" style="margin:0px;"><div class="bar" style="width: 100%;"></div></div>');
                    form.submit();
                },
                errorClass: 'validate-error'
            });

            createryPicker({
                modalId: 'ryPicker',
                url: '${scopePrefix}/hr/commRy-simple-list.do'
            });

            loadRemindRy();
        })

        function loadRemindRy() {
            var type = '${model.fremindtytype}';
            $('#fremindry').html("");

            if (type == "全体") {
                $('#fremindry').append('<input id="commRemindconf-info_fremindry" type="text" disabled="disabled" name="fremindry" value="全体">');
            } else if (type == "部门") {
                loadDept();
            } else if (type == "岗位") {
                loadHrgw();
            } else if (type == "角色") {
                loadRole();
            } else {
                ryPicker();
            }

            $('#commRemindconf-info_fremindry [value=' + '${model.fremindry}' + ']').attr("selected", "selected");
        }

        function changeRemindType() {
            var type = $('#commRemindconf-info_fremindtytype :selected').val();
            $('#fremindry').html("");

            if (type == "全体") {
                $('#fremindry').append('<input id="commRemindconf-info_fremindry" type="text" disabled="disabled" name="fremindry" value="全体">');
            } else if (type == "部门") {
                loadDept();
            } else if (type == "岗位") {
                loadHrgw();
            } else if (type == "角色") {
                loadRole();
            } else {
                ryPicker();
                //$('#fremindry').append("全体");
            }

        }

        function ryPicker() {

            $('#fremindry').append('<div class="input-append ryPicker"> ' +
            '<input id="cwYiShou-info_foprator" type="hidden" name="fremindry" ' +
            'value=""> <input ' +
            'id="cwYiShou-info_userName" type="text" ' +
            'value="" disabled readonly ' +
            'class=" required" style="width: 175px;" value=""> <span ' +
            'class="add-on" style="padding-top: 2px; padding-bottom: 2px;"><i ' +
            'class="icon-user"></i></span> ' +
            '</div>');

            createryPicker({
                modalId: 'ryPicker',
                url: '${scopePrefix}/hr/commRy-simple-list.do'
            });

        }

        function loadDept() {
            $.ajax({
                url: '${scopePrefix}/comm/loadDept.do',
                contentType: 'application/x-www-form-urlencoded; charset=utf-8',
                type: 'POST',
                dataType: 'json',
                async: false,
                success: function (data) {
                    if (data) {
                        $('#fremindry').append('<select id="commRemindconf-info_fremindry" name="fremindry"></select>');
                        for (var i = 0; i < data.length; i++) {
                            $('#commRemindconf-info_fremindry').append('<option value="' + data[i].id + '">' + data[i].name + '</option>');
                        }
                    }
                },
                error: function () {
                    alert("加载失败！");
                }
            });
        }

        function loadRole() {
            $.ajax({
                url: '${scopePrefix}/comm/loadRole.do',
                contentType: 'application/x-www-form-urlencoded; charset=utf-8',
                type: 'POST',
                async: false,
                dataType: 'json',
                success: function (data) {
                    if (data) {
                        $('#fremindry').append('<select id="commRemindconf-info_fremindry" name="fremindry" ></select>');
                        for (var i = 0; i < data.length; i++) {
                            $('#commRemindconf-info_fremindry').append('<option value="' + data[i].id + '">' + data[i].name + '</option>');
                        }
                    }
                },
                error: function () {
                    alert("加载失败！");
                }
            });
        }


        function loadHrgw() {
            $.ajax({
                url: '${scopePrefix}/comm/loadHrGwbm.do',
                contentType: 'application/x-www-form-urlencoded; charset=utf-8',
                type: 'POST',
                async: false,
                dataType: 'json',
                success: function (data) {
                    if (data) {
                        $('#fremindry').append('<select id="commRemindconf-info_fremindry" name="fremindry" ></select>');
                        for (var i = 0; i < data.length; i++) {
                            $('#commRemindconf-info_fremindry').append('<option value="' + data[i].fid + '">' + data[i].fname + '</option>');
                        }
                    }
                },
                error: function () {
                    alert("加载失败！");
                }
            });
        }


    </script>
</head>

<body>
<%@include file="/header.jsp" %>

<div class="row-fluid">
    <%@include file="/menu/scope.jsp" %>

    <!-- start of main -->
    <section id="m-main" class="span10">

        <article class="m-widget">
            <header class="header">
                <h4 class="title"><spring:message code="commRemindconf-info.commRemindconf-info.input.title"
                                                  text="编辑"/></h4>
            </header>

            <div class="content content-inner">

                <form id="commRemindconf-infoForm" method="post" action="commRemindconf-info-save.do"
                      class="form-horizontal">
                    <c:if test="${model != null}">
                        <input id="commRemindconf-info_id" type="hidden" name="fid" value="${model.fid}">
                    </c:if>
                    <div class="control-group">
                        <div class="span5">
                            <label class="control-label" for="commRemindconf-info_fname"><spring:message
                                    code="commRemindconf-info.commRemindconf-info.input.fname" text="提醒名称"/></label>

                            <div class="controls">
                                <%--<input id="commRemindconf-info_fname" type="text" name="fname" value="${model.fname}"--%>
                                <%--size="" class="text" minlength="" maxlength="">--%>

                                <select id="commRemindconf-info_fname" name="fname" value="${model.fname}">
                                    <c:forEach items="${remindNameList}" var="remindName" varStatus="status">
                                        <c:choose>
                                            <c:when test="${remindName==model.fname}">
                                                <option value="${remindName}"
                                                        selected="selected">${remindName}</option>
                                            </c:when>
                                            <c:otherwise>
                                                <option value="${remindName}">${remindName}</option>
                                            </c:otherwise>
                                        </c:choose>
                                    </c:forEach>
                                </select>
                            </div>
                        </div>
                    </div>

                    <div class="control-group">
                        <div class="span5">
                            <label class="control-label" for="commRemindconf-info_fremindtytype"><spring:message
                                    code="commRemindconf-info.commRemindconf-info.input.fremindtytype"
                                    text="提醒类型"/></label>

                            <div class="controls">
                                <select id="commRemindconf-info_fremindtytype" name="fremindtytype"
                                        onchange="changeRemindType()">
                                    <option value="人员"  <c:if
                                            test="${model.fremindtytype=='人员'}"> selected="selected" </c:if>>人员
                                    </option>
                                    <option value="角色"  <c:if
                                            test="${model.fremindtytype=='角色'}"> selected="selected" </c:if>>角色
                                    </option>
                                    <option value="岗位"  <c:if
                                            test="${model.fremindtytype=='岗位'}"> selected="selected" </c:if>>岗位
                                    </option>
                                    <option value="部门"  <c:if
                                            test="${model.fremindtytype=='部门'}"> selected="selected" </c:if>>部门
                                    </option>
                                    <option value="全体"  <c:if
                                            test="${model.fremindtytype=='全体'}"> selected="selected" </c:if>>全体
                                    </option>
                                </select>
                            </div>
                        </div>

                        <div class="span5">
                            <label class="control-label" for="commRemindconf-info_fremindry"><spring:message
                                    code="commRemindconf-info.commRemindconf-info.input.fremindry" text="提醒"/></label>

                            <div class="controls" id="fremindry">
                                <div class="input-append ryPicker">
                                    <input id="hrShtc-info_fjsr" type="hidden" name="fremindry"
                                           value="${model.fremindry}" class="text required"> <input
                                        id="hrShtc-info_userName" type="text" value="${ryMap[model.fremindry].fname}"
                                        class=" text required" disabled style="width: 175px;" value="">
									<span class="add-on"
                                          style="padding-top: 2px; padding-bottom: 2px;"><i
                                            class="icon-user"></i></span>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="control-group">

                        <div class="span5">
                            <label class="control-label" for="commRemindconf-info_fbeforeunit"><spring:message
                                    code="commRemindconf-info.commRemindconf-info.input.fbeforeunit"
                                    text="提前时间单位"/></label>

                            <div class="controls">
                                <select id="commRemindconf-info_fremindtytype" name="fbeforeunit">
                                    <option value="年"  <c:if
                                            test="${model.fbeforeunit=='年'}"> selected="selected" </c:if>>年
                                    </option>
                                    <option value="月"  <c:if
                                            test="${model.fbeforeunit=='月'}"> selected="selected" </c:if>>月
                                    </option>
                                    <option value="天"  <c:if
                                            test="${model.fbeforeunit=='天'}"> selected="selected" </c:if>>天
                                    </option>
                                    <option value="小时"  <c:if
                                            test="${model.fbeforeunit=='小时'}"> selected="selected" </c:if>>小时
                                    </option>
                                    <option value="分钟"  <c:if
                                            test="${model.fbeforeunit=='分钟'}"> selected="selected" </c:if>>分钟
                                    </option>
                                </select>
                            </div>
                        </div>


                        <div class="span5">
                            <label class="control-label" for="commRemindconf-info_fbeforeval"><spring:message
                                    code="commRemindconf-info.commRemindconf-info.input.fbeforeval" text="提前量"/></label>

                            <div class="controls">
                                <input id="commRemindconf-info_fbeforeval" type="text" name="fbeforeval"
                                       value="${model.fbeforeval}" size="" class="number" minlength="" maxlength="">
                            </div>
                        </div>


                    </div>

                    <div class="control-group">
                        <div class="span5">
                            <label class="control-label" for="commRemindconf-info_fintervalunit"><spring:message
                                    code="commRemindconf-info.commRemindconf-info.input.fintervalunit"
                                    text="间隔时间单位"/></label>

                            <div class="controls">
                                <select id="commRemindconf-info_fintervalunit" name="fintervalunit">
                                    <option value="年"  <c:if
                                            test="${model.fintervalunit=='年'}"> selected="selected" </c:if>>年
                                    </option>
                                    <option value="月"  <c:if
                                            test="${model.fintervalunit=='月'}"> selected="selected" </c:if>>月
                                    </option>
                                    <option value="天"  <c:if
                                            test="${model.fintervalunit=='天'}"> selected="selected" </c:if>>天
                                    </option>
                                    <option value="小时"  <c:if
                                            test="${model.fintervalunit=='小时'}"> selected="selected" </c:if>>小时
                                    </option>
                                    <option value="分钟"  <c:if
                                            test="${model.fintervalunit=='分钟'}"> selected="selected" </c:if>>分钟
                                    </option>
                                </select>
                            </div>
                        </div>

                        <div class="span5">
                            <label class="control-label" for="commRemindconf-info_finterval"><spring:message
                                    code="commRemindconf-info.commRemindconf-info.input.finterval" text="间隔值"/></label>

                            <div class="controls">
                                <input id="commRemindconf-info_finterval" type="text" name="finterval"
                                       value="${model.finterval}" size="" class="number   " minlength="" maxlength="">
                            </div>
                        </div>
                    </div>

                    <div class="control-group">


                        <div class="span5">
                            <label class="control-label" for="commRemindconf-info_ftimes"><spring:message
                                    code="commRemindconf-info.commRemindconf-info.input.ftimes" text="提醒次数"/></label>

                            <div class="controls">
                                <input id="commRemindconf-info_ftimes" type="text" name="ftimes" value="${model.ftimes}"
                                       size="" class="number" minlength="" maxlength="">
                            </div>
                        </div>
                    </div>

                    <div class="control-group">
                        <div class="span5">
                            <label class="control-label" for="commRemindconf-info_fintervalunit"><spring:message
                                    code="commRemindconf-info.commRemindconf-info.input.fintervalunit"
                                    text="有效时间单位"/></label>

                            <div class="controls">
                                <select id="commRemindconf-info_fexpireunit" name="fexpireunit">
                                    <option value="年"  <c:if
                                            test="${model.fexpireunit=='年'}"> selected="selected" </c:if>>年
                                    </option>
                                    <option value="月"  <c:if
                                            test="${model.fexpireunit=='月'}"> selected="selected" </c:if>>月
                                    </option>
                                    <option value="天"  <c:if
                                            test="${model.fexpireunit=='天'}"> selected="selected" </c:if>>天
                                    </option>
                                    <option value="小时"  <c:if
                                            test="${model.fexpireunit=='小时'}"> selected="selected" </c:if>>小时
                                    </option>
                                    <option value="分钟"  <c:if
                                            test="${model.fexpireunit=='分钟'}"> selected="selected" </c:if>>分钟
                                    </option>
                                </select>
                            </div>
                        </div>

                        <div class="span5">
                            <label class="control-label" for="commRemindconf-info_finterval"><spring:message
                                    code="commRemindconf-info.commRemindconf-info.input.finterval"
                                    text="有效时间值"/></label>

                            <div class="controls">
                                <input id="commRemindconf-info_fexpireval" type="text" name="fexpireval"
                                       value="${model.fexpireval}" size="" class="number" minlength="" maxlength="">
                            </div>
                        </div>
                    </div>


                    <div class="control-group">
                        <div class="span5">
                            <label class="control-label" for="commRemindconf-info_ftable"><spring:message
                                    code="commRemindconf-info.commRemindconf-info.input.ftable" text="提醒链接"/></label>

                            <div class="controls">
                                <textarea id="commRemindconf-info_fremindurl" name="fremindurl" class="form-control"
                                          rows="6" style="width: 560px" class="text  ">${model.fremindurl}</textarea>
                            </div>
                        </div>
                    </div>


                    <%--<div class="control-group">--%>
                        <%--<div class="span5">--%>
                            <%--<label class="control-label" for="commRemindconf-info_ftable"><spring:message--%>
                                    <%--code="commRemindconf-info.commRemindconf-info.input.ftable" text="提醒sql"/></label>--%>

                            <%--<div class="controls">--%>
                                <%--<textarea id="commRemindconf-info_fsql" name="fsql" class="form-control" rows="6"--%>
                                          <%--style="width: 560px" class="text  ">${model.fsql}</textarea>--%>
                            <%--</div>--%>
                        <%--</div>--%>
                    <%--</div>--%>

                    <%--<div class="control-group">--%>
                        <%--<div class="span5">--%>
                            <%--<label class="control-label" for="commRemindconf-info_fexpiresql"><spring:message--%>
                                    <%--code="commRemindconf-info.commRemindconf-info.input.fexpiresql"--%>
                                    <%--text="失效sql"/></label>--%>

                            <%--<div class="controls">--%>
                                <%--<textarea id="commRemindconf-info_fexpiresql" name="fexpiresql" class="form-control"--%>
                                          <%--rows="6" style="width: 560px" class="text  ">${model.fexpiresql}</textarea>--%>
                            <%--</div>--%>
                        <%--</div>--%>
                    <%--</div>--%>

                    <div class="control-group">
                        <div class="span5">
                            <label class="control-label" for="commRemindconf-info_fcontent"><spring:message
                                    code="commRemindconf-info.commRemindconf-info.input.fcontent" text="提醒内容"/></label>

                            <div class="controls">
                                <textarea id="commRemindconf-info_fcontent" name="fcontent" class="form-control"
                                          rows="6" style="width: 560px" class="text  ">${model.fcontent}</textarea>
                            </div>
                        </div>
                    </div>

                    <div class="control-group">
                        <div class="controls">
                            <button type="submit" class="btn a-submit"><spring:message code='core.input.save'
                                                                                       text='保存'/></button>
                            &nbsp;
                            <button type="button" class="btn a-cancel" onclick="history.back();"><spring:message
                                    code='core.input.back' text='返回'/></button>
                        </div>
                    </div>
                </form>
            </div>
        </article>

    </section>
    <!-- end of main -->
</div>

</body>

</html>
