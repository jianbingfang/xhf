<%@page contentType="text/html;charset=UTF-8" %>
<%@include file="/taglibs.jsp" %>
<%pageContext.setAttribute("currentHeader", "gcgl-home");%>
<%pageContext.setAttribute("currentMenu", "gcgl-xmry");%>

<%pageContext.setAttribute("fxmid", request.getParameter("fxmid"));%>
<!doctype html>
<html lang="zh">

<head>
    <%@include file="/common/meta.jsp" %>
    <title><spring:message code="pjRy-info.pjRy-info.input.title" text="编辑"/></title>
    <%@include file="/common/s.jsp" %>

    <link type="text/css" rel="stylesheet"
          href="${scopePrefix}/s/xthena/xmpicker/xmpicker.css">
    <script type="text/javascript"
            src="${scopePrefix}/s/xthena/xmpicker/xmpicker.js"></script>

    <link type="text/css" rel="stylesheet"
          href="${scopePrefix}/s/xthena/rypicker/rypicker.css">
    <script type="text/javascript"
            src="${scopePrefix}/s/xthena/rypicker/rypicker.js"></script>


    <script type="text/javascript">
        $(function () {
            $("#pjRy-infoForm").validate({
                submitHandler: function (form) {
                    bootbox.animate(false);
                    var box = bootbox.dialog('<div class="progress progress-striped active" style="margin:0px;"><div class="bar" style="width: 100%;"></div></div>');
                    form.submit();
                },
                errorClass: 'validate-error'
            });

            createxmPicker({
                modalId: 'xmPicker',
                url: '${scopePrefix}/gcgl/pjXm-simple-list.do'
            });

            createryPicker({
                modalId: 'ryPicker',
                url: '${scopePrefix}/hr/commRy-simple-list.do'
            });
        })
    </script>
</head>

<body>

<%@include file="/header.jsp" %>
<div class="row-fluid">
    <%@include file="/menu/gcgl-workspace.jsp" %>
    <!-- start of main -->
    <section id="m-main" class="span10">
        <div class="row-fluid">
            <div class="span12">
                <ul class="breadcrumb">
                    <li><a href="gcgl-home.do">工程管理</a> <span class="divider">/</span>
                    </li>
                    <li>项目人员管理<span class="divider">/</span>
                    </li>
                    <li class="active">项目人员台账</li>
                </ul>
            </div>
        </div>
        <article class="m-widget">
            <header class="header">
                <h4 class="title"><spring:message code="pjRy-info.pjRy-info.input.title" text="编辑"/></h4>
            </header>

            <div class="content content-inner">

                <form id="pjRy-infoForm" method="post" action="pjRy-info-save.do" class="form-horizontal">
                    <c:if test="${model != null}">
                        <input id="pjRy-info_id" type="hidden" name="fid" value="${model.fid}">
                    </c:if>
                    <div class="control-group">
                        <label class="control-label" for="pjRy-info_fxmid"><spring:message
                                code="pjRy-info.pjRy-info.input.fxmid" text="项目"/></label>

                        <div class="controls">
                            <div class="input-append xmPicker">
                                <input id="xzChufa-info_fxmid" type="hidden" name="fxmid"
                                       value="${model.fxmid}"> <input
                                    id="xmBxRecord-info_xmmc" type="text" value="${xmMap[model.fxmid].fxmname}" disabled
                                    class=" required" style="width: 175px;" value=""> <span
                                    class="add-on" style="padding-top: 2px; padding-bottom: 2px;"><i
                                    class="icon-th-list"></i></span>
                            </div>
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="control-label" for="pjRy-info_fryid"><spring:message
                                code="pjRy-info.pjRy-info.input.fryid" text="姓名"/></label>

                        <div class="controls">
                            <div class="input-append ryPicker">
                                <input id="ryBxRecord-info_fzhuchiren" type="hidden" name="fryid"
                                       value="${model.fryid}"> <input
                                    id="ryBxRecord-info_userName" type="text" value="${ryMap[model.fryid].fname}"
                                    disabled class=" required" style="width: 175px;" value="">
									<span class="add-on"
                                          style="padding-top: 2px; padding-bottom: 2px;"><i
                                            class="icon-user"></i></span>
                            </div>
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="control-label" for="pjRy-info_fdrgw"><spring:message
                                code="pjRy-info.pjRy-info.input.fdrgw" text="岗位"/></label>

                        <div class="controls">
                            <select class="form-control" id="pjXm-info_fgangwei"
                                    name="fgangwei" value="${model.fgangwei}" class=" ">
                                <option value="总监"
                                        <c:if test="${model.fgangwei=='总监'}"> selected="selected" </c:if>>总监
                                </option>
                                <option value="总监代表"
                                        <c:if test="${model.fgangwei=='总监代表'}"> selected="selected" </c:if>>总监代表
                                </option>
                                <option value="专监"
                                        <c:if test="${model.fgangwei=='专监'}"> selected="selected" </c:if>>专监
                                </option>
                                <option value="监理员"
                                        <c:if test="${model.fgangwei=='监理员'}"> selected="selected" </c:if>>监理员
                                </option>
                            </select>
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="control-label" for="pjRy-info_fstartdate"><spring:message
                                code="pjRy-info.pjRy-info.input.fstartdate" text="进入项目时间"/></label>

                        <div class="controls">
                            <div class="input-append datepicker date" style="padding-left: 0px;">
                                <input id="pjRy-info_fstartdate" type="text" name="fstartdate"
                                       value="${model.fstartdate}" size="40" class="text "
                                       style="background-color:white;cursor:default; width: 175px;">
                                <span class="add-on" style="padding-top: 2px; padding-bottom: 2px;"><i
                                        class="icon-calendar"></i></span>
                            </div>
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="control-label" for="pjRy-info_fenddate"><spring:message
                                code="pjRy-info.pjRy-info.input.fenddate" text="离开项目时间"/></label>

                        <div class="controls">
                            <div class="input-append datepicker date" style="padding-left: 0px;">
                                <input id="pjRy-info_fenddate" type="text" name="fenddate" value="${model.fenddate}"
                                       size="40" class="text "
                                       style="background-color:white;cursor:default; width: 175px;">
                                <span class="add-on" style="padding-top: 2px; padding-bottom: 2px;"><i
                                        class="icon-calendar"></i></span>
                            </div>
                        </div>
                    </div>
                    <%--<div class="control-group">
                        <label class="control-label" for="pjRy-info_ftel"><spring:message
                                code="pjRy-info.pjRy-info.input.ftel" text="联系方式"/></label>

                        <div class="controls">
                            <input id="pjRy-info_ftel" type="text" name="ftel" value="${model.ftel}" size=""
                                   class="text " minlength="" maxlength="">
                        </div>
                    </div>--%>

                    <div class="control-group">
                        <label class="control-label" for="pjRy-info_fmemo"><spring:message
                                code="pjRy-info.pjRy-info.input.fmemo" text="备注"/></label>

                        <div class="controls">
                            <input id="pjRy-info_fmemo" type="text" name="fmemo" value="${model.fmemo}" size=""
                                   class="text " minlength="" maxlength="">
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
