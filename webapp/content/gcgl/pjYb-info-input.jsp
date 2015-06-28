<%@page contentType="text/html;charset=UTF-8" %>
<%@include file="/taglibs.jsp" %>
<%pageContext.setAttribute("currentHeader", "gcgl-home");%>
<%pageContext.setAttribute("currentMenu", "gcgl-ny");%>
<!doctype html>
<html lang="zh">

<head>
    <%@include file="/common/meta.jsp" %>
    <title><spring:message code="pjYb-info.pjYb-info.input.title" text="编辑"/></title>
    <%@include file="/common/s.jsp" %>
    <script type="text/javascript">
        $(function () {
            $("#pjYb-infoForm").validate({
                submitHandler: function (form) {
                    bootbox.animate(false);
                    var box = bootbox.dialog('<div class="progress progress-striped active" style="margin:0px;"><div class="bar" style="width: 100%;"></div></div>');
                    form.submit();
                },
                errorClass: 'validate-error'
            });
            $("#confirmBtn").click(function () {
                getFiles();
            });

        })

        //在页面定义怎么使用 缓存数据
        function getFiles() {
            var filesIndex = $('#filesUl').children('li[litype="new"]').length;
            $
                    .each(
                    $('.files').children(),
                    function (index, node) {
                        $('#fileNameInput').val($(node).data("fileName") + "." + $(node).data("fileType"));
                        $('#fileUrlInput').val($(node).data("fileUrl"));
                        $('#fileShowa').attr('href', $(node).data("fileUrl"));
                        $('#fileShowa').html($(node).data("fileName") + "." + $(node).data("fileType"));
                    });
            $(".uploadModal").modal('hide');
        }
    </script>
</head>

<body>
<%@include file="/header.jsp" %>

<div class="row-fluid">
    <%@include file="/menu/gcgl-workspace.jsp" %>
    <%@include file="../comm/comm-upload.jsp" %>
    <!-- start of main -->
    <section id="m-main" class="span10">

        <article class="m-widget">
            <header class="header">
                <h4 class="title"><spring:message code="pjYb-info.pjYb-info.input.title" text="编辑"/></h4>
            </header>

            <div class="content content-inner">

                <form id="pjYb-infoForm" method="post" action="pjYb-info-save.do" class="form-horizontal">
                    <c:if test="${model != null}">
                        <input id="pjYb-info_id" type="hidden" name="fid" value="${model.fid}">
                    </c:if>
                    <%--<div class="control-group">
                        <label class="control-label" for="pjYb-info_fno"><spring:message
                                code="pjYb-info.pjYb-info.input.fno" text="序号"/></label>

                        <div class="controls">
                            <input id="pjYb-info_fno" type="text" name="fno" value="${model.fno}" size=""
                                   class="text required" minlength="" maxlength="">
                        </div>
                    </div>--%>
                    <div class="control-group">
                        <label class="control-label" for="pjYb-info_fyearmonth"><spring:message
                                code="pjYb-info.pjYb-info.input.fyearmonth" text="年月"/></label>

                        <div class="controls">
                            <input id="pjYb-info_fyearmonth" type="text" name="fyearmonth" value="${model.fyearmonth}"
                                   size="" class="text" minlength="" maxlength="">
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="control-label" for="pjYb-info_fuploaddate"><spring:message
                                code="pjYb-info.pjYb-info.input.fuploaddate" text="上传时间"/></label>

                        <div class="controls">
                            <div class="input-append datepicker date" style="padding-left: 0px;">
                                <input id="pjYb-info_fuploaddate" type="text" name="fuploaddate"
                                       value="${model.fuploaddate}" size="40" class="text "
                                       style="background-color:white;cursor:default; width: 175px;">
                                <span class="add-on" style="padding-top: 2px; padding-bottom: 2px;"><i
                                        class="icon-calendar"></i></span>
                            </div>
                        </div>
                    </div>
                    <%-- 	<div class="control-group">
                        <label class="control-label" for="pjYb-info_fuploadry"><spring:message code="pjYb-info.pjYb-info.input.fuploadry" text="上传人"/></label>
                        <div class="controls">
                              <input id="pjYb-info_fuploadry" type="text" name="fuploadry" value="${model.fuploadry}" size="" class="number   " minlength="" maxlength="">
                        </div>
                      </div> --%>
                    <div class="control-group">
                        <label class="control-label" for="pjYb-info_fmemo"><spring:message
                                code="pjYb-info.pjYb-info.input.fmemo" text="备注"/></label>

                        <div class="controls">
                            <textarea id="pjYb-info_fmemo" name="fmemo" class="form-control" rows="6"
                                      style="width: 560px" class="text  " minlength=""
                                      maxlength="500">${model.fmemo}</textarea>
                        </div>
                    </div>

                    <div class="control-group">
                        <label class="control-label" for="pjYb-info_ffilename"><spring:message
                                code="pjYb-info.pjYb-info.input.ffilename" text=""/>月报</label>

                        <div class="controls">
                            <div>
                                <div style="float: left;" divFIndex="0">
                                    <a class="btn btn-link" id="fileShowa"
                                       href="${model.ffileurl}">${model.ffilename}</a>
                                    <input id="fileNameInput" type="hidden" name="ffilename" value="${model.ffilename}">
                                    <input id="fileUrlInput" type="hidden" name="ffileurl" value="${model.ffileurl}">
                                </div>
                                <a class="btn btn-link" href="javaScript:void(0)" onclick="showUpload()">上传</a>
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
