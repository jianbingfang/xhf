<%@page contentType="text/html;charset=UTF-8"%>
<%@include file="/taglibs.jsp"%>
<%pageContext.setAttribute("currentHeader", "hr-home");%>
<%pageContext.setAttribute("currentMenu", "hrPzRy");%>
<!doctype html>
<html lang="zh">

  <head>
    <%@include file="/common/meta.jsp"%>
    <title><spring:message code="hrPzRy-info.hrPzRy-info.input.title" text="编辑"/></title>
    <%@include file="/common/s.jsp"%>
    <script type="text/javascript">
$(function() {
    $("#hrPzRy-infoForm").validate({
        submitHandler: function(form) {
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
 <%@include file="/header.jsp"%>

    <div class="row-fluid">
	  <%@include file="/menu/hr-workspace.jsp"%>

	  <!-- start of main -->
      <section id="m-main" class="span10">

      <article class="m-widget">
        <header class="header">
		  <h4 class="title"><spring:message code="hrPzRy-info.hrPzRy-info.input.title" text="编辑"/></h4>
		</header>

		<div class="content content-inner">

<form id="hrPzRy-infoForm" method="post" action="hrPzRy-info-save.do" class="form-horizontal">
  <c:if test="${model != null}">
	  <input id="hrPzRy-info_id" type="hidden" name="fid" value="${model.fid}">
  </c:if>
    	<div class="control-group">
	    <label class="control-label" for="hrPzRy-info_fry"><spring:message code="hrPzRy-info.hrPzRy-info.input.fry" text="人员"/></label>
		<div class="controls">
		  <input id="hrPzRy-info_fry" type="text" name="fry" value="${model.fry}" size="" class="text required" minlength="" maxlength="">
	    </div>
	  </div>
    	<div class="control-group">
	    <label class="control-label" for="hrPzRy-info_fryid"><spring:message code="hrPzRy-info.hrPzRy-info.input.fryid" text="人员id"/></label>
		<div class="controls">
		  <input id="hrPzRy-info_fryid" type="text" name="fryid" value="${model.fryid}" size="" class="text required" minlength="" maxlength="">
	    </div>
	  </div>
    	<div class="control-group">
	    <label class="control-label" for="hrPzRy-info_fpxdate"><spring:message code="hrPzRy-info.hrPzRy-info.input.fpxdate" text="培训时间"/></label>
		<div class="controls">
		  <input id="hrPzRy-info_fpxdate" type="text" name="fpxdate" value="${model.fpxdate}" size="" class="text required" minlength="" maxlength="">
	    </div>
	  </div>
    	<div class="control-group">
	    <label class="control-label" for="hrPzRy-info_fksresult"><spring:message code="hrPzRy-info.hrPzRy-info.input.fksresult" text="考试结果"/></label>
		<div class="controls">
		  <input id="hrPzRy-info_fksresult" type="text" name="fksresult" value="${model.fksresult}" size="" class="text required" minlength="" maxlength="">
	    </div>
	  </div>
    	<div class="control-group">
	    <label class="control-label" for="hrPzRy-info_fksfs"><spring:message code="hrPzRy-info.hrPzRy-info.input.fksfs" text="考试分数"/></label>
		<div class="controls">
		  <input id="hrPzRy-info_fksfs" type="text" name="fksfs" value="${model.fksfs}" size="" class="text required" minlength="" maxlength="">
	    </div>
	  </div>
    	<div class="control-group">
	    <label class="control-label" for="hrPzRy-info_fmemo"><spring:message code="hrPzRy-info.hrPzRy-info.input.fmemo" text="备注"/></label>
		<div class="controls">
		  <input id="hrPzRy-info_fmemo" type="text" name="fmemo" value="${model.fmemo}" size="" class="text required" minlength="" maxlength="">
	    </div>
	  </div>
 	<div class="control-group">
    <div class="controls">
      <button type="submit" class="btn a-submit"><spring:message code='core.input.save' text='保存'/></button>
	  &nbsp;
      <button type="button" class="btn a-cancel" onclick="history.back();"><spring:message code='core.input.back' text='返回'/></button>
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
