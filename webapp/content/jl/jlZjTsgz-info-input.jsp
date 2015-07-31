<%@page contentType="text/html;charset=UTF-8" %>
<%@include file="/taglibs.jsp" %>
<%pageContext.setAttribute("currentHeader", "jl-home");%>
<%pageContext.setAttribute("currentMenu", "jlZjTsgz");%>
<!doctype html>
<html lang="zh">

<head>
    <%@include file="/common/meta.jsp" %>
    <title><spring:message code="jlZjTsgz-info.jlZjTsgz-info.input.title" text="编辑"/></title>
    <%@include file="/common/s.jsp" %>
    <script type="text/javascript">
        $(function () {
            $("#jlZjTsgz-infoForm").validate({
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

<div class="row-fluid">

    <!-- start of main -->

    <article class="m-widget">
        <header class="header">
            <h4 class="title"><spring:message code="jlZjTsgz-info.jlZjTsgz-info.input.title" text="编辑"/></h4>
        </header>

        <div class="content content-inner">

            <form id="jlZjTsgz-infoForm" method="post" action="jlZjTsgz-info-save.do" class="form-horizontal">
                <c:if test="${model != null}">
                    <input id="jlZjTsgz-info_id" type="hidden" name="fid" value="${model.fid}">
                </c:if>
                <div class="control-group">
                    <label class="control-label" for="jlZjTsgz-info_fname"><spring:message
                            code="jlZjTsgz-info.jlZjTsgz-info.input.fname" text="姓名"/></label>

                    <div class="controls">
                        <input id="jlZjTsgz-info_fname" type="text" name="fname" value="${model.fname}" size=""
                               class="text required" minlength="" maxlength="">
                    </div>
                </div>
                <div class="control-group">
                    <label class="control-label" for="jlZjTsgz-info_fgongz"><spring:message
                            code="jlZjTsgz-info.jlZjTsgz-info.input.fgongz" text="工种"/></label>

                    <div class="controls">
                        <select style="width: 100px;" class="form-control" id="jlZjTsgz-info_fgongz" name="fgongz"
                                value="${model.fgongz}" class="required ">
                            <option value=""></option>
                            <option value="电工"  <c:if test="${model.fgongz=='电工'}"> selected="selected"</c:if>>电工
                            </option>
                            <option value="电焊工" <c:if test="${model.fgongz=='电焊工'}"> selected="selected"</c:if>>电焊工
                            </option>
                            <option value="架子工"  <c:if test="${model.fgongz=='架子工'}"> selected="selected"</c:if>>架子工
                            </option>
                            <option value="塔吊司机" <c:if test="${model.fgongz=='塔吊司机'}"> selected="selected"</c:if>>塔吊司机
                            </option>
                            <option value="司索工"  <c:if test="${model.fgongz=='司索工'}"> selected="selected"</c:if>>司索工
                            </option>
                            <option value="信号工" <c:if test="${model.fgongz=='信号工'}"> selected="selected"</c:if>>信号工
                            </option>
                            <option value="机械操作工"  <c:if test="${model.fgongz=='机械操作工'}"> selected="selected"</c:if>>
                                机械操作工
                            </option>
                        </select>
                    </div>
                </div>
                <div class="control-group">
                    <label class="control-label" for="jlZjTsgz-info_fzjcode"><spring:message
                            code="jlZjTsgz-info.jlZjTsgz-info.input.fzjcode" text="证号"/></label>

                    <div class="controls">
                        <input id="jlZjTsgz-info_fzjcode" type="text" name="fzjcode" value="${model.fzjcode}" size=""
                               class="text " minlength="" maxlength="">
                    </div>
                </div>
                <div class="control-group">
                    <label class="control-label" for="jlZjTsgz-info_fexpdate"><spring:message
                            code="jlZjTsgz-info.jlZjTsgz-info.input.fexpdate" text="有效期"/></label>

                    <div class="controls">
                        <div class="input-append datepicker date" style="padding-left: 0px;">
                            <input id="jlZjTsgz-info_fexpdate" type="text" name="fexpdate" value="${model.fexpdate}"
                                   size="40" class="text " style="background-color:white;cursor:default; width: 175px;">
                            <span class="add-on" style="padding-top: 2px; padding-bottom: 2px;"><i
                                    class="icon-calendar"></i></span>
                        </div>
                    </div>
                </div>
                <div class="control-group">
                    <label class="control-label" for="jlZjTsgz-info_fmemo"><spring:message
                            code="jlZjTsgz-info.jlZjTsgz-info.input.fmemo" text="备注"/></label>

                    <div class="controls">
                        <input id="jlZjTsgz-info_fmemo" type="text" name="fmemo" value="${model.fmemo}" size=""
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

    <!-- end of main -->
</div>

</body>

</html>
