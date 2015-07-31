<%@page contentType="text/html;charset=UTF-8" %>
<%@include file="/taglibs.jsp" %>
<%pageContext.setAttribute("currentHeader", "gcgl-home");%>
<%pageContext.setAttribute("currentMenu", "gcgl-xmry");%>
<!doctype html>
<html lang="zh">

<head>
    <%@include file="/common/meta.jsp" %>
    <title><spring:message code="pjKq-info.pjKq-info.input.title" text="编辑"/></title>
    <%@include file="/common/s.jsp" %>
    <script type="text/javascript">
        $(function () {
            $("#pjKq-infoForm").validate({
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
                    <li class="active">项目人员考勤</li>
                </ul>
            </div>
        </div>
        <article class="m-widget">
            <header class="header">
                <h4 class="title"><spring:message code="pjKq-info.pjKq-info.input.title" text="编辑"/></h4>
            </header>

            <div class="content content-inner">

                <form id="pjKq-infoForm" method="post" action="pjKq-info-save.do" class="form-horizontal">
                    <c:if test="${model != null}">
                        <input id="pjKq-info_id" type="hidden" name="fid" value="${model.fid}">
                    </c:if>
                    <%-- <div class="control-group">
                        <label class="control-label" for="pjKq-info_fkqno"><spring:message code="pjKq-info.pjKq-info.input.fkqno" text="序号"/></label>
                        <div class="controls">
                               <input id="pjKq-info_fkqno" type="text" name="fkqno" value="${model.fkqno}" size="" class="text required" minlength="" maxlength="">
                        </div>
                      </div> --%>
                    <div class="control-group">
                        <label class="control-label" for="pjKq-info_fxmid"><spring:message
                                code="pjKq-info.pjKq-info.input.fxmid" text="项目"/></label>

                        <div class="controls">
                            <input id="pjKq-info_fxmid" type="text" name="fxmid" value="${model.fxmid}" size=""
                                   class="number   " minlength="" maxlength="">
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="control-label" for="pjKq-info_fyearmonth"><spring:message
                                code="pjKq-info.pjKq-info.input.fyearmonth" text="年月"/></label>

                        <div class="controls">
                            <input id="pjKq-info_fyearmonth" type="text" name="fyearmonth" value="${model.fyearmonth}"
                                   size="" class="text required" minlength="" maxlength="">
                        </div>
                    </div>
                    <%-- <div class="control-group">
                    <label class="control-label" for="pjKq-info_fuploaddate"><spring:message code="pjKq-info.pjKq-info.input.fuploaddate" text="上传时间"/></label>
                    <div class="controls">
                           <div class="input-append datepicker date" style="padding-left: 0px;">
                            <input id="pjKq-info_fuploaddate" type="text" name="fuploaddate" value="${model.fuploaddate}" size="40" class="text "   style="background-color:white;cursor:default; width: 175px;">
                              <span class="add-on" style="padding-top: 2px; padding-bottom: 2px;"><i class="icon-calendar"></i></span>
                          </div>
                    </div>
                  </div>
                    <div class="control-group">
                    <label class="control-label" for="pjKq-info_fuploadid"><spring:message code="pjKq-info.pjKq-info.input.fuploadid" text="上传人id"/></label>
                    <div class="controls">
                          <input id="pjKq-info_fuploadid" type="text" name="fuploadid" value="${model.fuploadid}" size="" class="number   " minlength="" maxlength="">
                    </div>
                  </div>
                    <div class="control-group">
                    <label class="control-label" for="pjKq-info_fuploadry"><spring:message code="pjKq-info.pjKq-info.input.fuploadry" text="上传人"/></label>
                    <div class="controls">
                           <input id="pjKq-info_fuploadry" type="text" name="fuploadry" value="${model.fuploadry}" size="" class="text required" minlength="" maxlength="">
                    </div>
                  </div>
                    <div class="control-group">
                    <label class="control-label" for="pjKq-info_fkqname"><spring:message code="pjKq-info.pjKq-info.input.fkqname" text="考勤表名称"/></label>
                    <div class="controls">
                           <input id="pjKq-info_fkqname" type="text" name="fkqname" value="${model.fkqname}" size="" class="text required" minlength="" maxlength="">
                    </div>
                  </div>
                    <div class="control-group">
                    <label class="control-label" for="pjKq-info_fkqurl"><spring:message code="pjKq-info.pjKq-info.input.fkqurl" text="考勤表url"/></label>
                    <div class="controls">
                          <textarea id="pjKq-info_fkqurl"  name="fkqurl"  class="form-control" rows="6"  style="width: 560px" class="text  "  minlength="" maxlength="500">${model.fkqurl}</textarea>
                    </div>
                  </div> --%>
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
