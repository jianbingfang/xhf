<%@page contentType="text/html;charset=UTF-8"%>
<%@include file="/taglibs.jsp"%>
<%pageContext.setAttribute("currentHeader", "jl-home");%>
<%pageContext.setAttribute("currentMenu", "jlZjSbcheck");%>
<!doctype html>
<html lang="zh">

  <head>
    <%@include file="/common/meta.jsp"%>
    <title><spring:message code="jlZjSbcheck-info.jlZjSbcheck-info.input.title" text="编辑"/></title>
    <%@include file="/common/s.jsp"%>
    <script type="text/javascript">
$(function() {
    $("#jlZjSbcheck-infoForm").validate({
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
	  <%@include file="/menu/jl-workspace.jsp"%>

	  <!-- start of main -->
      <section id="m-main" class="span10">

      <article class="m-widget">
        <header class="header">
		  <h4 class="title"><spring:message code="jlZjSbcheck-info.jlZjSbcheck-info.input.title" text="编辑" /></h4>
		</header>

		<div class="content content-inner">

<form id="jlZjSbcheck-infoForm" method="post" action="jlZjSbcheck-info-save.do" class="form-horizontal">
  <c:if test="${model != null}">
	  <input id="jlZjSbcheck-info_id" type="hidden" name="fid" value="${model.fid}">
  </c:if>
			    	<div class="control-group">
				    <label class="control-label" for="jlZjSbcheck-info_fyqid"><spring:message code="jlZjSbcheck-info.jlZjSbcheck-info.input.fyqid" text="仪器id"/></label>
					<div class="controls">
					  	<input id="jlZjSbcheck-info_fyqid" type="text" name="fyqid" value="${model.fyqid}" size="" class="number   " minlength="" maxlength="">
				    </div>
				  </div>
			    	<div class="control-group">
				    <label class="control-label" for="jlZjSbcheck-info_fcheckpoint"><spring:message code="jlZjSbcheck-info.jlZjSbcheck-info.input.fcheckpoint" text="检查重点"/></label>
					<div class="controls">
				      	<textarea id="jlZjSbcheck-info_fcheckpoint"  name="fcheckpoint"  class="form-control" rows="6"  style="width: 560px" class="text  "  minlength="" maxlength="500">${model.fcheckpoint}</textarea>
				    </div>
				  </div>
			    	<div class="control-group">
				    <label class="control-label" for="jlZjSbcheck-info_fcheckresult"><spring:message code="jlZjSbcheck-info.jlZjSbcheck-info.input.fcheckresult" text="检查结果"/></label>
					<div class="controls">
				      	<textarea id="jlZjSbcheck-info_fcheckresult"  name="fcheckresult"  class="form-control" rows="6"  style="width: 560px" class="text  "  minlength="" maxlength="500">${model.fcheckresult}</textarea>
				    </div>
				  </div>
			    	<div class="control-group">
				    <label class="control-label" for="jlZjSbcheck-info_fcheckdate"><spring:message code="jlZjSbcheck-info.jlZjSbcheck-info.input.fcheckdate" text="检查时间"/></label>
					<div class="controls">
				      	 <div class="input-append datepicker date" style="padding-left: 0px;">
					    	<input id="jlZjSbcheck-info_fcheckdate" type="text" name="fcheckdate" value="${model.fcheckdate}" size="40" class="text "   style="background-color:white;cursor:default; width: 175px;">
					 		 <span class="add-on" style="padding-top: 2px; padding-bottom: 2px;"><i class="icon-calendar"></i></span>
					 	 </div>
				    </div>
				  </div>
			    	<div class="control-group">
				    <label class="control-label" for="jlZjSbcheck-info_fjingbanrenid"><spring:message code="jlZjSbcheck-info.jlZjSbcheck-info.input.fjingbanrenid" text="经办人id"/></label>
					<div class="controls">
					  	<input id="jlZjSbcheck-info_fjingbanrenid" type="text" name="fjingbanrenid" value="${model.fjingbanrenid}" size="" class="number   " minlength="" maxlength="">
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
