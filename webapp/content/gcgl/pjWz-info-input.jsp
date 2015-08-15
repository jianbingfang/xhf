<%@page contentType="text/html;charset=UTF-8" %>
<%@include file="/taglibs.jsp" %>
<%pageContext.setAttribute("currentHeader", "gcgl-home");%>
<%pageContext.setAttribute("currentMenu", "pjWz");%>
<!doctype html>
<html lang="zh">

<head>
    <%@include file="/common/meta.jsp" %>
    <title><spring:message code="pjWz-info.pjWz-info.input.title" text="编辑"/></title>
    <%@include file="/common/s.jsp" %>
    <link type="text/css" rel="stylesheet"
          href="${scopePrefix}/s/xthena/xmpicker/xmpicker.css">
    <script type="text/javascript"
            src="${scopePrefix}/s/xthena/xmpicker/xmpicker.js"></script>
    <script type="text/javascript">
        $(function () {
            $("#pjWz-infoForm").validate({
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
        })
    </script>
</head>

<body>

<div class="row-fluid">

    <!-- start of main -->

    <article class="m-widget">
        <header class="header">
            <h4 class="title"><spring:message code="pjWz-info.pjWz-info.input.title" text="编辑"/></h4>
        </header>

        <div class="content content-inner">

            <form id="pjWz-infoForm" method="post" action="pjWz-info-save.do" class="form-horizontal">
                <c:if test="${model != null}">
                    <input id="pjWz-info_id" type="hidden" name="fid" value="${model.fid}">
                </c:if>

                <div class="control-group">
                    <label class="control-label" for="pjWz-info_fxmid"><spring:message
                            code="pjWz-info.pjWz-info.input.fxmid" text="项目"/></label>

                    <div class="controls">
                        <div class="input-append xmPicker">
                            <input id="pjWz-info_fxmid" type="hidden"
                                   name="fxmid" value="${model.fxmid}">
                            <input
                                    id="xmBxRecord-info_xmmc" type="text"
                                    value="${xmMap[model.fxmid].fxmname}" disabled
                                    class=" required" style="width: 185px;"> <span
                                class="add-on" style="padding-top: 2px; padding-bottom: 2px;"><i
                                class="icon-th-list"></i></span>
                        </div>
                    </div>
                </div>

                <%--<div class="control-group">
                    <label class="control-label" for="pjWz-info_fwzid"><spring:message
                            code="pjWz-info.pjWz-info.input.fwzid" text="物资id"/></label>

                    <div class="controls">
                        <input id="pjWz-info_fwzid" type="text" name="fwzid" value="${model.fwzid}" size=""
                               class="number   " minlength="" maxlength="">
                    </div>
                </div>--%>
                <div class="control-group">
                    <label class="control-label" for="pjWz-info_fwzname"><spring:message
                            code="pjWz-info.pjWz-info.input.fwzname" text="物资名称"/></label>

                    <div class="controls">
                        <input id="pjWz-info_fwzname" type="text" name="fwzname" value="${model.fwzname}" size=""
                               class="text required" minlength="" maxlength="">
                    </div>
                </div>
                <div class="control-group">
                    <label class="control-label" for="pjWz-info_fnum"><spring:message
                            code="pjWz-info.pjWz-info.input.fnum" text="数量"/></label>

                    <div class="controls">
                        <input id="pjWz-info_fnum" type="text" name="fnum" value="${model.fnum}" size=""
                               class="number   " minlength="" maxlength="">
                    </div>
                </div>
                <div class="control-group">
                    <label class="control-label" for="pjWz-info_fwzcode"><spring:message
                            code="pjWz-info.pjWz-info.input.fwzcode" text="编号"/></label>

                    <div class="controls">
                        <input id="pjWz-info_fwzcode" type="text" name="fwzcode" value="${model.fwzcode}" size=""
                               class="text required" minlength="" maxlength="">
                    </div>
                </div>
                <div class="control-group">
                    <label class="control-label" for="pjWz-info_fwztype"><spring:message
                            code="pjWz-info.pjWz-info.input.fwztype" text="物品类型"/></label>

                    <div class="controls">
                        <input id="pjWz-info_fwztype" type="text" name="fwztype" value="${model.fwztype}" size=""
                               class="text required" minlength="" maxlength="">
                    </div>
                </div>
                <div class="control-group">
                    <label class="control-label" for="pjWz-info_fisassets"><spring:message
                            code="pjWz-info.pjWz-info.input.fisassets" text="是否为固定资产"/></label>

                    <div class="controls">
                        <input id="pjWz-info_fisassets" type="text" name="fisassets" value="${model.fisassets}" size=""
                               class="text required" minlength="" maxlength="">
                    </div>
                </div>
                <div class="control-group">
                    <label class="control-label" for="pjWz-info_fenddate"><spring:message
                            code="pjWz-info.pjWz-info.input.fenddate" text="离开项目时间"/></label>

                    <div class="controls">
                        <div class="input-append datepicker date" style="padding-left: 0px;">
                            <input id="pjWz-info_fenddate" type="text" name="fenddate" value="${model.fenddate}"
                                   size="40" class="text " style="background-color:white;cursor:default; width: 175px;">
                            <span class="add-on" style="padding-top: 2px; padding-bottom: 2px;"><i
                                    class="icon-calendar"></i></span>
                        </div>
                    </div>
                </div>
                <div class="control-group">
                    <label class="control-label" for="pjWz-info_fstartdate"><spring:message
                            code="pjWz-info.pjWz-info.input.fstartdate" text="进入项目时间"/></label>

                    <div class="controls">
                        <div class="input-append datepicker date" style="padding-left: 0px;">
                            <input id="pjWz-info_fstartdate" type="text" name="fstartdate" value="${model.fstartdate}"
                                   size="40" class="text " style="background-color:white;cursor:default; width: 175px;">
                            <span class="add-on" style="padding-top: 2px; padding-bottom: 2px;"><i
                                    class="icon-calendar"></i></span>
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

    <!-- end of main -->
</div>

</body>

</html>
