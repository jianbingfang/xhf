<%@page contentType="text/html;charset=UTF-8"%>
<%@include file="/taglibs.jsp"%>
<%pageContext.setAttribute("currentHeader", "gcgl-home");%>
<%pageContext.setAttribute("currentMenu", "pjNyList");%>
<!doctype html>
<html lang="zh">

  <head>
    <%@include file="/common/meta.jsp"%>
    <title><spring:message code="pjNyList-info.pjNyList-info.input.title" text="编辑"/></title>
    <%@include file="/common/s.jsp"%>
    <script type="text/javascript">
$(function() {
    $("#pjNyList-infoForm").validate({
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
		  <h4 class="title"><spring:message code="pjNyList-info.pjNyList-info.input.title" text="编辑" /></h4>
		</header>

		<div class="content content-inner">

<form id="pjNyList-infoForm" method="post" action="pjNyList-info-save.do" class="form-horizontal">
  <c:if test="${model != null}">
	  <input id="pjNyList-info_id" type="hidden" name="fid" value="${model.fid}">
  </c:if>
			    	<div class="control-group">
				    <label class="control-label" for="pjNyList-info_fnyno"><spring:message code="pjNyList-info.pjNyList-info.input.fnyno" text="序号"/></label>
					<div class="controls">
					  	 <input id="pjNyList-info_fnyno" type="text" name="fnyno" value="${model.fnyno}" size="" class="text required" minlength="" maxlength="">	
				    </div>
				  </div>
			    	<div class="control-group">
				    <label class="control-label" for="pjNyList-info_fnyname"><spring:message code="pjNyList-info.pjNyList-info.input.fnyname" text="资料名称"/></label>
					<div class="controls">
					  	 <input id="pjNyList-info_fnyname" type="text" name="fnyname" value="${model.fnyname}" size="" class="text required" minlength="" maxlength="">	
				    </div>
				  </div>
			    	<div class="control-group">
				    <label class="control-label" for="pjNyList-info_fnynum"><spring:message code="pjNyList-info.pjNyList-info.input.fnynum" text="份数"/></label>
					<div class="controls">
					  	<input id="pjNyList-info_fnynum" type="text" name="fnynum" value="${model.fnynum}" size="" class="number   " minlength="" maxlength="">
				    </div>
				  </div>
			    	<div class="control-group">
				    <label class="control-label" for="pjNyList-info_fnymemo"><spring:message code="pjNyList-info.pjNyList-info.input.fnymemo" text="备注"/></label>
					<div class="controls">
				      	<textarea id="pjNyList-info_fnymemo"  name="fnymemo"  class="form-control" rows="6"  style="width: 560px" class="text  "  minlength="" maxlength="500">${model.fnymemo}</textarea>
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
