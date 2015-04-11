<%@page contentType="text/html;charset=UTF-8"%>
<%@include file="/taglibs.jsp"%>
<%pageContext.setAttribute("currentHeader", "gcgl-home");%>
<%pageContext.setAttribute("currentMenu", "pjFiles");%>
<!doctype html>
<html lang="zh">

  <head>
    <%@include file="/common/meta.jsp"%>
    <title><spring:message code="pjFiles-info.pjFiles-info.input.title" text="编辑"/></title>
    <%@include file="/common/s.jsp"%>
    <script type="text/javascript">
$(function() {
    $("#pjFiles-infoForm").validate({
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
		  <h4 class="title"><spring:message code="pjFiles-info.pjFiles-info.input.title" text="编辑" /></h4>
		</header>

		<div class="content content-inner">

<form id="pjFiles-infoForm" method="post" action="pjFiles-info-save.do" class="form-horizontal">
  <c:if test="${model != null}">
	  <input id="pjFiles-info_id" type="hidden" name="fid" value="${model.fid}">
  </c:if>
			    	<div class="control-group">
				    <label class="control-label" for="pjFiles-info_fimgname"><spring:message code="pjFiles-info.pjFiles-info.input.fimgname" text="图片名称"/></label>
					<div class="controls">
					  	 <input id="pjFiles-info_fimgname" type="text" name="fimgname" value="${model.fimgname}" size="" class="text required" minlength="" maxlength="">	
				    </div>
				  </div>
			    	<div class="control-group">
				    <label class="control-label" for="pjFiles-info_fimageurl"><spring:message code="pjFiles-info.pjFiles-info.input.fimageurl" text="图片url"/></label>
					<div class="controls">
				      	<textarea id="pjFiles-info_fimageurl"  name="fimageurl"  class="form-control" rows="6"  style="width: 560px" class="text  "  minlength="" maxlength="500">${model.fimageurl}</textarea>
				    </div>
				  </div>
			    	<div class="control-group">
				    <label class="control-label" for="pjFiles-info_fxmid"><spring:message code="pjFiles-info.pjFiles-info.input.fxmid" text="项目id"/></label>
					<div class="controls">
					  	<input id="pjFiles-info_fxmid" type="text" name="fxmid" value="${model.fxmid}" size="" class="number   " minlength="" maxlength="">
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
