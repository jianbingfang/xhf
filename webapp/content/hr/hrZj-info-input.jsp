<%@page contentType="text/html;charset=UTF-8"%>
<%@include file="/taglibs.jsp"%>
<%pageContext.setAttribute("currentHeader", "hr-home");%>
<%pageContext.setAttribute("currentMenu", "commRy");%>
<!doctype html>
<html lang="zh">

  <head>
    <%@include file="/common/meta.jsp"%>
    <title><spring:message code="hrZj-info.hrZj-info.input.title" text="编辑"/></title>
    <%@include file="/common/s.jsp"%>
    <script type="text/javascript">
$(function() {
    $("#hrZj-infoForm").validate({
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
		  <h4 class="title"><spring:message code="hrZj-info.hrZj-info.input.title" text="编辑"/></h4>
		</header>

		<div class="content content-inner">

		<form id="hrZj-infoForm" method="post" action="hrZj-info-save.do" class="form-horizontal">
		  <c:if test="${model != null}">
			  <input id="hrZj-info_id" type="hidden" name="fid" value="${model.fid}">
		  </c:if>
    	<div class="control-group">
	    <label class="control-label" for="hrZj-info_fname"><spring:message code="hrZj-info.hrZj-info.input.fname" text="证件名称"/></label>
		<div class="controls">
		  <input id="hrZj-info_fname" type="text" name="fname" value="${model.fname}" size="" class="text required" minlength="" maxlength="">
	    </div>
	  </div>
    	<div class="control-group">
	    <label class="control-label" for="hrZj-info_fzy"><spring:message code="hrZj-info.hrZj-info.input.fzy" text="专业"/></label>
		<div class="controls">
		  <input id="hrZj-info_fzy" type="text" name="fzy" value="${model.fzy}" size="" class="text required" minlength="" maxlength="">
	    </div>
	  </div>
    	<div class="control-group">
	    <label class="control-label" for="hrZj-info_ftype"><spring:message code="hrZj-info.hrZj-info.input.ftype" text="证件类型"/></label>
		<div class="controls">
		  <input id="hrZj-info_ftype" type="text" name="ftype" value="${model.ftype}" size="" class="text required" minlength="" maxlength="">
	    </div>
	  </div>
    	<div class="control-group">
	    <label class="control-label" for="hrZj-info_fbfdw"><spring:message code="hrZj-info.hrZj-info.input.fbfdw" text="颁发单位"/></label>
		<div class="controls">
		  <input id="hrZj-info_fbfdw" type="text" name="fbfdw" value="${model.fbfdw}" size="" class="text required" minlength="" maxlength="">
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
