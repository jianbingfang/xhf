<%@page contentType="text/html;charset=UTF-8"%>
<%@include file="/taglibs.jsp"%>
<%pageContext.setAttribute("currentHeader", "gcgl-home");%>
<%pageContext.setAttribute("currentMenu", "pjJcry");%>
<!doctype html>
<html lang="zh">

  <head>
    <%@include file="/common/meta.jsp"%>
    <title><spring:message code="pjJcry-info.pjJcry-info.input.title" text="编辑"/></title>
    <%@include file="/common/s.jsp"%>
    <script type="text/javascript">
$(function() {
    $("#pjJcry-infoForm").validate({
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
		  <h4 class="title"><spring:message code="pjJcry-info.pjJcry-info.input.title" text="编辑" /></h4>
		</header>

		<div class="content content-inner">

<form id="pjJcry-infoForm" method="post" action="pjJcry-info-save.do" class="form-horizontal">
  <c:if test="${model != null}">
	  <input id="pjJcry-info_id" type="hidden" name="fid" value="${model.fid}">
  </c:if>
			    	<div class="control-group">
				    <label class="control-label" for="pjJcry-info_fjcid"><spring:message code="pjJcry-info.pjJcry-info.input.fjcid" text="进场id"/></label>
					<div class="controls">
					  	<input id="pjJcry-info_fjcid" type="text" name="fjcid" value="${model.fjcid}" size="" class="number   " minlength="" maxlength="">
				    </div>
				  </div>
			    	<div class="control-group">
				    <label class="control-label" for="pjJcry-info_fryid"><spring:message code="pjJcry-info.pjJcry-info.input.fryid" text="人员id"/></label>
					<div class="controls">
					  	<input id="pjJcry-info_fryid" type="text" name="fryid" value="${model.fryid}" size="" class="number   " minlength="" maxlength="">
				    </div>
				  </div>
			    	<div class="control-group">
				    <label class="control-label" for="pjJcry-info_fry"><spring:message code="pjJcry-info.pjJcry-info.input.fry" text="人员"/></label>
					<div class="controls">
				      	<textarea id="pjJcry-info_fry"  name="fry"  class="form-control" rows="6"  style="width: 560px" class="text  "  minlength="" maxlength="500">${model.fry}</textarea>
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
