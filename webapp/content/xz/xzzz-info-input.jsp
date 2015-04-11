<%@page contentType="text/html;charset=UTF-8"%>
<%@include file="/taglibs.jsp"%>
<%pageContext.setAttribute("currentHeader", "xz-home");%>
<%pageContext.setAttribute("currentMenu", "xzzz");%>
<!doctype html>
<html lang="zh">

  <head>
    <%@include file="/common/meta.jsp"%>
    <title><spring:message code="xzzz-info.xzzz-info.input.title" text="编辑"/></title>
    <%@include file="/common/s.jsp"%>
    <script type="text/javascript">
$(function() {
    $("#xzzz-infoForm").validate({
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
	  <%@include file="/menu/xz-workspace.jsp"%>

	  <!-- start of main -->
      <section id="m-main" class="span10">

      <article class="m-widget">
        <header class="header">
		  <h4 class="title"><spring:message code="xzzz-info.xzzz-info.input.title" text="编辑" /></h4>
		</header>

		<div class="content content-inner">

<form id="xzzz-infoForm" method="post" action="xzzz-info-save.do" class="form-horizontal">
  <c:if test="${model != null}">
	  <input id="xzzz-info_id" type="hidden" name="fid" value="${model.fid}">
  </c:if>
			    	<div class="control-group">
				    <label class="control-label" for="xzzz-info_fzztype"><spring:message code="xzzz-info.xzzz-info.input.fzztype" text="资质类型"/></label>
					<div class="controls">
					  	 <input id="xzzz-info_fzztype" type="text" name="fzztype" value="${model.fzztype}" size="" class="text required" minlength="" maxlength="">	
				    </div>
				  </div>
			    	<div class="control-group">
				    <label class="control-label" for="xzzz-info_fddkh"><spring:message code="xzzz-info.xzzz-info.input.fddkh" text="动态考核"/></label>
					<div class="controls">
					  	 <input id="xzzz-info_fddkh" type="text" name="fddkh" value="${model.fddkh}" size="" class="text required" minlength="" maxlength="">	
				    </div>
				  </div>
			    	<div class="control-group">
				    <label class="control-label" for="xzzz-info_fzzsq"><spring:message code="xzzz-info.xzzz-info.input.fzzsq" text="资质申请"/></label>
					<div class="controls">
				      	<textarea id="xzzz-info_fzzsq"  name="fzzsq"  class="form-control" rows="6"  style="width: 560px" class="text  "  minlength="" maxlength="512">${model.fzzsq}</textarea>
				    </div>
				  </div>
			    	<div class="control-group">
				    <label class="control-label" for="xzzz-info_fzzgd"><spring:message code="xzzz-info.xzzz-info.input.fzzgd" text="资质管理规定"/></label>
					<div class="controls">
				      	<textarea id="xzzz-info_fzzgd"  name="fzzgd"  class="form-control" rows="6"  style="width: 560px" class="text  "  minlength="" maxlength="1000">${model.fzzgd}</textarea>
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
