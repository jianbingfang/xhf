<%@page contentType="text/html;charset=UTF-8"%>
<%@include file="/taglibs.jsp"%>
<%pageContext.setAttribute("currentHeader", "xz-home");%>
<%pageContext.setAttribute("currentMenu", "xzZjDxlist");%>
<!doctype html>
<html lang="zh">

  <head>
    <%@include file="/common/meta.jsp"%>
    <title><spring:message code="xzZjDxlist-info.xzZjDxlist-info.input.title" text="编辑"/></title>
    <%@include file="/common/s.jsp"%>
    <script type="text/javascript">
$(function() {
    $("#xzZjDxlist-infoForm").validate({
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
		  <h4 class="title"><spring:message code="xzZjDxlist-info.xzZjDxlist-info.input.title" text="编辑" /></h4>
		</header>

		<div class="content content-inner">

<form id="xzZjDxlist-infoForm" method="post" action="xzZjDxlist-info-save.do" class="form-horizontal">
  <c:if test="${model != null}">
	  <input id="xzZjDxlist-info_id" type="hidden" name="fid" value="${model.fid}">
  </c:if>
			    	<div class="control-group">
				    <label class="control-label" for="xzZjDxlist-info_ftype"><spring:message code="xzZjDxlist-info.xzZjDxlist-info.input.ftype" text="证件类型"/></label>
					<div class="controls">
					  	 <input id="xzZjDxlist-info_ftype" type="text" name="ftype" value="${model.ftype}" size="" class="text required" minlength="" maxlength="">	
				    </div>
				  </div>
			    	<div class="control-group">
				    <label class="control-label" for="xzZjDxlist-info_fzjid"><spring:message code="xzZjDxlist-info.xzZjDxlist-info.input.fzjid" text=""/></label>
					<div class="controls">
					  	<input id="xzZjDxlist-info_fzjid" type="text" name="fzjid" value="${model.fzjid}" size="" class="number   " minlength="" maxlength="">
				    </div>
				  </div>
			    	<div class="control-group">
				    <label class="control-label" for="xzZjDxlist-info_fname"><spring:message code="xzZjDxlist-info.xzZjDxlist-info.input.fname" text="证件名称"/></label>
					<div class="controls">
				      	<textarea id="xzZjDxlist-info_fname"  name="fname"  class="form-control" rows="6"  style="width: 560px" class="text  "  minlength="" maxlength="1,024">${model.fname}</textarea>
				    </div>
				  </div>
			    	<div class="control-group">
				    <label class="control-label" for="xzZjDxlist-info_fstate"><spring:message code="xzZjDxlist-info.xzZjDxlist-info.input.fstate" text="状态"/></label>
					<div class="controls">
					  	 <input id="xzZjDxlist-info_fstate" type="text" name="fstate" value="${model.fstate}" size="" class="text required" minlength="" maxlength="">	
				    </div>
				  </div>
			    	<div class="control-group">
				    <label class="control-label" for="xzZjDxlist-info_fupdatetime"><spring:message code="xzZjDxlist-info.xzZjDxlist-info.input.fupdatetime" text="更新时间"/></label>
					<div class="controls">
					  	<input id="xzZjDxlist-info_fupdatetime" type="text" name="fupdatetime" value="${model.fupdatetime}" size="" class="number   " minlength="" maxlength="">
				    </div>
				  </div>
			    	<div class="control-group">
				    <label class="control-label" for="xzZjDxlist-info_fmemo"><spring:message code="xzZjDxlist-info.xzZjDxlist-info.input.fmemo" text="备注"/></label>
					<div class="controls">
					  	 <input id="xzZjDxlist-info_fmemo" type="text" name="fmemo" value="${model.fmemo}" size="" class="text " minlength="" maxlength="">	
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
