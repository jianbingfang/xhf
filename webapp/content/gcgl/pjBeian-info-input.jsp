<%@page contentType="text/html;charset=UTF-8" %>
<%@include file="/taglibs.jsp" %>
<%pageContext.setAttribute("currentHeader", "gcgl-home");%>
<%pageContext.setAttribute("currentMenu", "pjBeian");%>
<!doctype html>
<html lang="zh">

<head>
    <%@include file="/common/meta.jsp" %>
    <title><spring:message code="pjBeian-info.pjBeian-info.input.title" text="编辑"/></title>
    <%@include file="/common/s.jsp" %>

    <link type="text/css" rel="stylesheet"
          href="${scopePrefix}/s/xthena/rypicker/rypicker.css">
    <script type="text/javascript"
            src="${scopePrefix}/s/xthena/rypicker/rypicker.js"></script>

    <link type="text/css" rel="stylesheet"
          href="${scopePrefix}/s/xthena/xmpicker/xmpicker.css">
    <script type="text/javascript"
            src="${scopePrefix}/s/xthena/xmpicker/xmpicker.js"></script>

    <script type="text/javascript">
        $(function () {
            $("#pjBeian-infoForm").validate({
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


            createxmPicker({
                modalId: 'xmPicker',
                url: '${scopePrefix}/gcgl/pjXm-simple-list.do'
            });
        })
    </script>
</head>

<body>

<div class="row-fluid">

    <!-- start of main -->

    <article class="m-widget">
        <header class="header">
            <h4 class="title"><spring:message code="pjBeian-info.pjBeian-info.input.title" text="编辑"/></h4>
        </header>

        <div class="content content-inner">

            <form id="pjBeian-infoForm" method="post" action="pjBeian-info-save.do" class="form-horizontal">
                <c:if test="${model != null}">
                    <input id="pjBeian-info_id" type="hidden" name="fid" value="${model.fid}">
                </c:if>
                <%--<div class="control-group">
                    <label class="control-label" for="pjBeian-info_fpjcode"><spring:message
                            code="pjBeian-info.pjBeian-info.input.fpjcode" text="项目编号"/></label>

                    <div class="controls">
                        <input id="pjBeian-info_fpjcode" type="text" name="fpjcode" value="${model.fpjcode}" size=""
                               class="text required" minlength="" maxlength="">
                    </div>
                </div>--%>
                <div class="control-group">
                    <label class="control-label" for="pjBeian-info_fxmid"><spring:message
                            code="pjBeian-info.pjBeian-info.input.fxmid" text="项目id"/></label>

                    <div class="controls">

                        <div class="input-append xmPicker">
                            <input id="pjBeian-info_fxmid" type="hidden" name="fxmid"
                                   value="${model.fxmid}"> <input
                                id="xmBxRecord-info_xmmc" type="text" value="${xmMap[model.fxmid].fxmname}" disabled
                                class=" required" style="width: 175px;" value=""> <span
                                class="add-on" style="padding-top: 2px; padding-bottom: 2px;"><i
                                class="icon-th-list"></i></span>
                        </div>
                    </div>
                </div>
                <div class="control-group">
                    <label class="control-label" for="pjBeian-info_fbeiandate"><spring:message
                            code="pjBeian-info.pjBeian-info.input.fbeiandate" text="备案时间"/></label>

                    <div class="controls">
                        <div class="input-append datepicker date" style="padding-left: 0px;">
                            <input id="pjBeian-info_fbeiandate" type="text" name="fbeiandate"
                                   value="${model.fbeiandate}" size="40" class="text "
                                   style="background-color:white;cursor:default; width: 175px;">
                            <span class="add-on" style="padding-top: 2px; padding-bottom: 2px;"><i
                                    class="icon-calendar"></i></span>
                        </div>
                    </div>
                </div>
                <div class="control-group">
                    <label class="control-label" for="pjBeian-info_fjingshouren"><spring:message
                            code="pjBeian-info.pjBeian-info.input.fjingshouren" text="经手人"/></label>

                    <div class="controls">
                        <div class="input-append ryPicker">
                            <input id="pjMreport-info_fryid" type="hidden" name="fryid"
                                   value="${model.fjingshourenid}"> <input
                                id="ryBxRecord-info_userName" type="text" value="${ryMap[model.fjingshourenid].fname}"
                                disabled class=" required" style="width: 175px;" value="">
								<span class="add-on"
                                      style="padding-top: 2px; padding-bottom: 2px;"><i
                                        class="icon-user"></i></span>
                        </div>
                    </div>
                </div>
                <div class="control-group">
                    <label class="control-label" for="pjBeian-info_fmemo"><spring:message
                            code="pjBeian-info.pjBeian-info.input.fmemo" text="备注"/></label>

                    <div class="controls">
                        <textarea id="pjBeian-info_fmemo" name="fmemo" class="form-control" rows="6"
                                  style="width: 560px" class="text  " minlength=""
                                  maxlength="500">${model.fmemo}</textarea>
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

    <!-- end of main -->
</div>

</body>

</html>
