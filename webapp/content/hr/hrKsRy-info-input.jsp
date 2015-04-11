<%@page contentType="text/html;charset=UTF-8"%>
<%@include file="/taglibs.jsp"%>
<%pageContext.setAttribute("currentHeader", "hr-home");%>
<%pageContext.setAttribute("currentMenu", "hrKsRy");%>
<!doctype html>
<html lang="zh">

  <head>
    <%@include file="/common/meta.jsp"%>
    <link type="text/css" rel="stylesheet" href="${scopePrefix}/s/xthena/rypicker/rypicker.css">
    <script type="text/javascript" src="${scopePrefix}/s/xthena/rypicker/rypicker.js"></script>
    <title><spring:message code="hrKsRy-info.hrKsRy-info.input.title" text="编辑"/></title>
    <%@include file="/common/s.jsp"%>
    <script type="text/javascript">
$(function() {
    $("#hrKsRy-infoForm").validate({
        submitHandler: function(form) {
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
		  <h4 class="title"><spring:message code="hrKsRy-info.hrKsRy-info.input.title" text="编辑"/></h4>
		</header>

		<div class="content content-inner">

<form id="hrKsRy-infoForm" method="post" action="hrKsRy-info-save.do" class="form-horizontal">
  <c:if test="${model != null}">
	  <input id="hrKsRy-info_id" type="hidden" name="fid" value="${model.fid}">
  </c:if>
    	<div class="control-group">
	    <label class="control-label" for="hrKsRy-info_fname"><spring:message code="hrKsRy-info.hrKsRy-info.input.fname" text="姓名"/></label>
		<div class="controls">
			<div class="input-append ryPicker">
			 <input id="hrKsRy-info_fid" type="hidden" name="ffzr" value="${model.ffzr}">
			  <input id="hrKsRy-info_fname" type="text"  value="${model.fname}" disabled class=" required"  style="width: 175px;" value="">
			  <span class="add-on" style="padding-top: 2px; padding-bottom: 2px;"><i class="icon-user"></i></span>
		    </div>
	    </div>
	  </div>
    	<div class="control-group">
	    <label class="control-label" for="hrKsRy-info_fidcode"><spring:message code="hrKsRy-info.hrKsRy-info.input.fidcode" text="身份证号"/></label>
		<div class="controls">
		  <input id="hrKsRy-info_fidcode" type="text" name="fidcode" value="${model.fidcode}" size="" class="text required" minlength="" maxlength="">
	    </div>
	  </div>
    	<div class="control-group">
	    <label class="control-label" for="hrKsRy-info_ftel"><spring:message code="hrKsRy-info.hrKsRy-info.input.ftel" text="联系电话"/></label>
		<div class="controls">
		  <input id="hrKsRy-info_ftel" type="text" name="ftel" value="${model.ftel}" size="" class="text required" minlength="" maxlength="">
	    </div>
	  </div>
    	<div class="control-group">
	    <label class="control-label" for="hrKsRy-info_fxmid"><spring:message code="hrKsRy-info.hrKsRy-info.input.fxmid" text="所属项目"/></label>
		<div class="controls">
		  <input id="hrKsRy-info_fxmid" type="text" name="fxmid" value="${model.fxmid}" size="" class="text required" minlength="" maxlength="">
	    </div>
	  </div>
    	<div class="control-group">
	    <label class="control-label" for="hrKsRy-info_fzcxystatus"><spring:message code="hrKsRy-info.hrKsRy-info.input.fzcxystatus" text="注册协议签订情况"/></label>
		<div class="controls">
		  <input id="hrKsRy-info_fzcxystatus" type="text" name="fzcxystatus" value="${model.fzcxystatus}" size="" class="text required" minlength="" maxlength="">
	    </div>
	  </div>
    	<div class="control-group">
	    <label class="control-label" for="hrKsRy-info_fmemo"><spring:message code="hrKsRy-info.hrKsRy-info.input.fmemo" text="备注"/></label>
		<div class="controls">
		  <input id="hrKsRy-info_fmemo" type="text" name="fmemo" value="${model.fmemo}" size="" class="text required" minlength="" maxlength="">
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
