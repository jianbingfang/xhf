<%@page contentType="text/html;charset=UTF-8"%>
<%@include file="/taglibs.jsp"%>
<%pageContext.setAttribute("currentHeader", "sckf-home");%>
<%pageContext.setAttribute("currentMenu", "ndFile");%>
<!doctype html>
<html lang="zh">

  <head>
    <%@include file="/common/meta.jsp"%>
    <title><spring:message code="ndFile-info.ndFile-info.input.title" text="编辑"/></title>
    <%@include file="/common/s.jsp"%>
    <script type="text/javascript">
$(function() {
    $("#ndFile-infoForm").validate({
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
	  <%@include file="/menu/sckf-workspace.jsp"%>

	  <!-- start of main -->
      <section id="m-main" class="span10">

      <article class="m-widget">
        <header class="header">
		  <h4 class="title"><spring:message code="ndFile-info.ndFile-info.input.title" text="编辑" /></h4>
		</header>

		<div class="content content-inner">

<form id="ndFile-infoForm" method="post" action="ndFile-info-save.do" class="form-horizontal">
  <c:if test="${model != null}">
	  <input id="ndFile-info_id" type="hidden" name="fid" value="${model.fid}">
  </c:if>
			    	<div class="control-group">
				    <label class="control-label" for="ndFile-info_ffilename"><spring:message code="ndFile-info.ndFile-info.input.ffilename" text="文件名"/></label>
					<div class="controls">
				      	<textarea id="ndFile-info_ffilename"  name="ffilename"  class="form-control" rows="6"  style="width: 560px" class="text  "  minlength="" maxlength="500">${model.ffilename}</textarea>
				    </div>
				  </div>
			    	<div class="control-group">
				    <label class="control-label" for="ndFile-info_fyear"><spring:message code="ndFile-info.ndFile-info.input.fyear" text=""/></label>
					<div class="controls">
					  	<input id="ndFile-info_fyear" type="text" name="fyear" value="${model.fyear}" size="" class="number   " minlength="" maxlength="">
				    </div>
				  </div>
			    	<div class="control-group">
				    <label class="control-label" for="ndFile-info_ffileurl"><spring:message code="ndFile-info.ndFile-info.input.ffileurl" text="文件路径"/></label>
					<div class="controls">
				      	<textarea id="ndFile-info_ffileurl"  name="ffileurl"  class="form-control" rows="6"  style="width: 560px" class="text  "  minlength="" maxlength="500">${model.ffileurl}</textarea>
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
