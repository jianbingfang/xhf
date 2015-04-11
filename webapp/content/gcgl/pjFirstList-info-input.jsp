<%@page contentType="text/html;charset=UTF-8"%>
<%@include file="/taglibs.jsp"%>
<%pageContext.setAttribute("currentHeader", "gcgl-home");%>
<%pageContext.setAttribute("currentMenu", "gcgl-xmgl");%>
<!doctype html>
<html lang="zh">

  <head>
    <%@include file="/common/meta.jsp"%>
    <title><spring:message code="pjFirstList-info.pjFirstList-info.input.title" text="编辑"/></title>
    <%@include file="/common/s.jsp"%>
    <script type="text/javascript">
$(function() {
    $("#pjFirstList-infoForm").validate({
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
	  <%@include file="/menu/gcgl-workspace.jsp"%>

	  <!-- start of main -->
      <section id="m-main" class="span10">
      <article class="m-widget">
        <header class="header">
		  <h4 class="title"><spring:message code="pjFirstList-info.pjFirstList-info.input.title" text="编辑" /></h4>
		</header>

		<div class="content content-inner">

<form id="pjFirstList-infoForm" method="post" action="pjFirstList-info-save.do" class="form-horizontal">
  <c:if test="${model != null}">
	  <input id="pjFirstList-info_id" type="hidden" name="fid" value="${model.fid}">
  </c:if>
			    	<div class="control-group">
				    <label class="control-label" for="pjFirstList-info_fcheckcode"><spring:message code="pjFirstList-info.pjFirstList-info.input.fcheckcode" text="检查代码"/></label>
					<div class="controls">
					  	 <input id="pjFirstList-info_fcheckcode" type="text" name="fcheckcode" value="${model.fcheckcode}" size="" class="text required" minlength="" maxlength="">	
				    </div>
				  </div>
			    	<div class="control-group">
				    <label class="control-label" for="pjFirstList-info_fcheckname"><spring:message code="pjFirstList-info.pjFirstList-info.input.fcheckname" text="检查名称"/></label>
					<div class="controls">
					  	 <input id="pjFirstList-info_fcheckname" type="text" name="fcheckname" value="${model.fcheckname}" size="" class="text required" minlength="" maxlength="">	
				    </div>
				  </div>
			    	<div class="control-group">
				    <label class="control-label" for="pjFirstList-info_fcheckresult"><spring:message code="pjFirstList-info.pjFirstList-info.input.fcheckresult" text="检查结果"/></label>
					<div class="controls">
				      	<textarea id="pjFirstList-info_fcheckresult"  name="fcheckresult"  class="form-control" rows="6"  style="width: 560px" class="text  "  minlength="" maxlength="500">${model.fcheckresult}</textarea>
				    </div>
				  </div>
			    	<div class="control-group">
				    <label class="control-label" for="pjFirstList-info_fcheckinfo"><spring:message code="pjFirstList-info.pjFirstList-info.input.fcheckinfo" text="检查结果说明"/></label>
					<div class="controls">
				      	<textarea id="pjFirstList-info_fcheckinfo"  name="fcheckinfo"  class="form-control" rows="6"  style="width: 560px" class="text  "  minlength="" maxlength="500">${model.fcheckinfo}</textarea>
				    </div>
				  </div>
			    	<div class="control-group">
				    <label class="control-label" for="pjFirstList-info_fiswarn"><spring:message code="pjFirstList-info.pjFirstList-info.input.fiswarn" text="特殊提醒"/></label>
					<div class="controls">
					  	 <input id="pjFirstList-info_fiswarn" type="text" name="fiswarn" value="${model.fiswarn}" size="" class="text required" minlength="" maxlength="">	
				    </div>
				  </div>
			    	<div class="control-group">
				    <label class="control-label" for="pjFirstList-info_fxmid"><spring:message code="pjFirstList-info.pjFirstList-info.input.fxmid" text="项目id"/></label>
					<div class="controls">
					  	<input id="pjFirstList-info_fxmid" type="text" name="fxmid" value="${model.fxmid}" size="" class="number   " minlength="" maxlength="">
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
