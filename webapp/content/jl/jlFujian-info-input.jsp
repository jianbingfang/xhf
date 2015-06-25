<%@page contentType="text/html;charset=UTF-8" %>
<%@include file="/taglibs.jsp" %>
<%pageContext.setAttribute("currentHeader", "jl-home");%>
<%pageContext.setAttribute("currentMenu", "jlFujian");%>
<!doctype html>
<html lang="zh">

<head>
    <%@include file="/common/meta.jsp" %>
    <title><spring:message code="jlFujian-info.jlFujian-info.input.title" text="编辑"/></title>
    <%@include file="/common/s.jsp" %>
    <script type="text/javascript">
        $(function () {
            $("#jlFujian-infoForm").validate({
                submitHandler: function (form) {
                    bootbox.animate(false);
                    var box = bootbox.dialog('<div class="progress progress-striped active" style="margin:0px;"><div class="bar" style="width: 100%;"></div></div>');
                    form.submit();
                },
                errorClass: 'validate-error'
            });

        })
    </script>
</head>

<body>
<%@include file="/header.jsp" %>

<div class="row-fluid">
    <%@include file="/menu/jl-workspace.jsp" %>

    <!-- start of main -->
    <section id="m-main" class="span10">

        <article class="m-widget">
            <header class="header">
                <h4 class="title"><spring:message code="jlFujian-info.jlFujian-info.input.title" text="编辑"/></h4>
            </header>

            <div class="content content-inner">

                <form id="jlFujian-infoForm" method="post" action="jlFujian-info-save.do" class="form-horizontal">
                    <c:if test="${model != null}">
                        <input id="jlFujian-info_id" type="hidden" name="fid" value="${model.fid}">
                    </c:if>


                    <div class="control-group">
                        <div class="span5">
                            <label class="control-label" for="jlFujian-info_fname"><spring:message
                                    code="jlFujian-info.jlFujian-info.input.fname" text="附件名称"/></label>

                            <div class="controls">
                                <input id="jlFujian-info_fname" type="text" name="fname" value="${model.fname}" size=""
                                       class="text " minlength="" maxlength="">
                            </div>
                        </div>

                        <div class="span5">
                            <label class="control-label" for="jlFujian-info_furl"><spring:message
                                    code="jlFujian-info.jlFujian-info.input.furl" text="附件url"/></label>

                            <div class="controls">
                                <textarea id="jlFujian-info_furl" name="furl" class="form-control" rows="6"
                                          style="width: 560px" class="text  " minlength=""
                                          maxlength="500">${model.furl}</textarea>
                            </div>
                        </div>
                    </div>

                    <div class="control-group">
                        <div class="span5">
                            <label class="control-label" for="jlFujian-info_fuploadry"><spring:message
                                    code="jlFujian-info.jlFujian-info.input.fuploadry" text="上传人"/></label>

                            <div class="controls">
                                <input id="jlFujian-info_fuploadry" type="text" name="fuploadry"
                                       value="${model.fuploadry}" size="" class="number   " minlength="" maxlength="">
                            </div>
                        </div>

                        <div class="span5">
                            <label class="control-label" for="jlFujian-info_fuploaddate"><spring:message
                                    code="jlFujian-info.jlFujian-info.input.fuploaddate" text="上传时间"/></label>

                            <div class="controls">
                                <div class="input-append datepicker date" style="padding-left: 0px;">
                                    <input id="jlFujian-info_fuploaddate" type="text" name="fuploaddate"
                                           value="${model.fuploaddate}" size="40" class="text "
                                           style="background-color:white;cursor:default; width: 175px;">
                                    <span class="add-on" style="padding-top: 2px; padding-bottom: 2px;"><i
                                            class="icon-calendar"></i></span>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="control-group">
                        <div class="span5">
                            <label class="control-label" for="jlFujian-info_finfo"><spring:message
                                    code="jlFujian-info.jlFujian-info.input.finfo" text="说明"/></label>

                            <div class="controls">
                                <textarea id="jlFujian-info_finfo" name="finfo" class="form-control" rows="6"
                                          style="width: 560px" class="text  " minlength=""
                                          maxlength="500">${model.finfo}</textarea>
                            </div>
                        </div>

                        <div class="span5">
                            <label class="control-label" for="jlFujian-info_ffileno"><spring:message
                                    code="jlFujian-info.jlFujian-info.input.ffileno" text="序号"/></label>

                            <div class="controls">
                                <input id="jlFujian-info_ffileno" type="text" name="ffileno" value="${model.ffileno}"
                                       size="" class="text " minlength="" maxlength="">
                            </div>
                        </div>
                    </div>

                    <div class="control-group">
                        <div class="span5">
                            <label class="control-label" for="jlFujian-info_ffiletype"><spring:message
                                    code="jlFujian-info.jlFujian-info.input.ffiletype" text="文件类型"/></label>

                            <div class="controls">
                                <input id="jlFujian-info_ffiletype" type="text" name="ffiletype"
                                       value="${model.ffiletype}" size="" class="text " minlength="" maxlength="">
                            </div>
                        </div>

                        <div class="span5">
                            <label class="control-label" for="jlFujian-info_ffujiantype"><spring:message
                                    code="jlFujian-info.jlFujian-info.input.ffujiantype" text="附件类型"/></label>

                            <div class="controls">
                                <input id="jlFujian-info_ffujiantype" type="text" name="ffujiantype"
                                       value="${model.ffujiantype}" size="" class="text " minlength="" maxlength="">
                            </div>
                        </div>
                    </div>

                    <div class="control-group">
                        <div class="span5">
                            <label class="control-label" for="jlFujian-info_fmainid"><spring:message
                                    code="jlFujian-info.jlFujian-info.input.fmainid" text="对应表id"/></label>

                            <div class="controls">
                                <input id="jlFujian-info_fmainid" type="text" name="fmainid" value="${model.fmainid}"
                                       size="" class="number   " minlength="" maxlength="">
                            </div>
                        </div>

                        <div class="span5">
                            <label class="control-label" for="jlFujian-info_fxmid"><spring:message
                                    code="jlFujian-info.jlFujian-info.input.fxmid" text="项目id"/></label>

                            <div class="controls">
                                <input id="jlFujian-info_fxmid" type="text" name="fxmid" value="${model.fxmid}" size=""
                                       class="number   " minlength="" maxlength="">
                            </div>
                        </div>
                    </div>

                    <div class="control-group">
                        <div class="span5">
                            <label class="control-label" for="jlFujian-info_fbiztype"><spring:message
                                    code="jlFujian-info.jlFujian-info.input.fbiztype" text="业务是类型"/></label>

                            <div class="controls">
                                <input id="jlFujian-info_fbiztype" type="text" name="fbiztype" value="${model.fbiztype}"
                                       size="" class="text " minlength="" maxlength="">
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
