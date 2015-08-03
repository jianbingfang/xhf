<%@page contentType="text/html;charset=UTF-8" %>
<%@include file="/taglibs.jsp" %>
<%pageContext.setAttribute("currentHeader", "xz-home");%>
<%pageContext.setAttribute("currentMenu", "xz-wz");%>
<!doctype html>
<html lang="zh">

<head>
    <%@include file="/common/meta.jsp" %>
    <title><spring:message code="wzStorage-info.wzStorage-info.input.title" text="编辑"/></title>
    <%@include file="/common/s.jsp" %>

    <link type="text/css" rel="stylesheet"
          href="${scopePrefix}/s/xthena/xmpicker/xmpicker.css">
    <script type="text/javascript"
            src="${scopePrefix}/s/xthena/xmpicker/xmpicker.js"></script>
    <script type="text/javascript">
        $(function () {
            $("#wzStorage-infoForm").validate({
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

    <article class="m-widget">
        <header class="header">
            <h4 class="title"><spring:message code="wzStorage-info.wzStorage-info.input.title" text="进货登记"/></h4>
        </header>

        <div class="content content-inner">

            <form id="wzStorage-infoForm" method="post" action="wzStorage-info-save.do" class="form-horizontal">
                <c:if test="${model != null}">
                    <input id="wzStorage-info_id" type="hidden" name="fid" value="${model.fid}">
                </c:if>
                <div class="control-group">
                    <label class="control-label" for="wzStorage-info_fwzid"><spring:message
                            code="wzStorage-info.wzStorage-info.input.fwzid" text="物资名称"/></label>

                    <div class="controls">
                        <input id="ryBxRecord-info_fryid" type="hidden" name="fwzid"
                               value="${model.fwzid}">
                        <input id="wzStorage-info_fwzid" type="text" value="${wzMap[model.fwzid].fname}" size=""
                               class="text   " minlength="" maxlength="">
                    </div>
                </div>
                <div class="control-group">
                    <label class="control-label" for="wzStorage-info_fwzid"><spring:message
                            code="wzStorage-info.wzStorage-info.input.fwzid" text="规格"/></label>

                    <div class="controls">
                        <input id="wzStorage-info_fwzid" type="text" value="${wzMap[model.fwzid].fgg}" size=""
                               class="text   " minlength="" maxlength="">
                    </div>
                </div>

                <div class="control-group">
                    <label class="control-label" for="wzStorage-info_fnum"><spring:message
                            code="wzStorage-info.wzStorage-info.input.fnum" text="数量"/></label>

                    <div class="controls">
                        <input id="wzStorage-info_fnum" type="text" name="fnum" value="${model.fnum}" size=""
                               class="text required" minlength="" maxlength="">
                    </div>
                </div>
                <div class="control-group">
                    <label class="control-label" for="wzStorage-info_fprice"><spring:message
                            code="wzStorage-info.wzStorage-info.input.fprice" text="单价"/></label>

                    <div class="controls">
                        <input id="wzStorage-info_fprice" type="text" name="fprice" value="${wzMap[model.fwzid].fprice}"
                               size="" class="text required" minlength="" maxlength="">
                    </div>
                </div>
                <div class="control-group">
                    <label class="control-label" for="wzStorage-info_fjbr"><spring:message
                            code="wzStorage-info.wzStorage-info.input.fjbr" text="经办人"/></label>

                    <div class="controls">
                        <input id="wzStorage-info_fjbr" type="text" name="fjbr" value="${model.fjbr}" size=""
                               class="text   " minlength="" maxlength="20">
                    </div>
                </div>
                <div class="control-group">
                    <div class="span5">
                        <label class="control-label" for="wzStorage-info_fdate"><spring:message
                                code="wzStorage-info.wzStorage-info.input.fdate" text="时间"/></label>

                        <div class="controls">
                            <div class="input-append datepicker date"
                                 style="padding-left: 0px;">
                                <input id="wzStorage-info_fdate" type="text"
                                       name="fdate" value="${model.fdateString}" size="40"
                                       class="text "
                                       style="background-color:white;cursor:default; width: 175px;">
										<span class="add-on"
                                              style="padding-top: 2px; padding-bottom: 2px;"><i
                                                class="icon-calendar"></i></span>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="control-group">
                    <label class="control-label" for="wzStorage-info_fmemo"><spring:message
                            code="wzStorage-info.wzStorage-info.input.fmemo" text="说明"/></label>

                    <div class="controls">
                        <textarea id="wzStorage-info_fmemo" name="fmemo" class="form-control" rows="6"
                                  style="width: 560px" class="text  " minlength=""
                                  maxlength="200">${model.fmemo}</textarea>
                    </div>
                </div>
                <div class="control-group hidden">
                    <label class="control-label" for="wzStorage-info_ftype"><spring:message
                            code="wzStorage-info.wzStorage-info.input.ftype" text="类别"/></label>

                    <div class="controls">
                        <input id="wzStorage-info_ftype" type="text" name="ftype" value="1" size="" class="text   "
                               minlength="" maxlength="20">

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
