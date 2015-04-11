<%@page contentType="text/html;charset=UTF-8"%>
<%@include file="/taglibs.jsp"%>
<%pageContext.setAttribute("currentHeader", "jl-home");%>
<%pageContext.setAttribute("currentMenu", "xgdwContact");%>
<!doctype html>
<html lang="zh">

  <head>
    <%@include file="/common/meta.jsp"%>
    <title><spring:message code="xgdwContact-info.xgdwContact-info.input.title" text="编辑"/></title>
    <%@include file="/common/s.jsp"%>
    <script type="text/javascript">
$(function() {
    $("#xgdwContact-infoForm").validate({
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

    <div class="row-fluid">

	  <!-- start of main -->

      <article class="m-widget">
        <header class="header">
		  <h4 class="title"><spring:message code="xgdwContact-info.xgdwContact-info.input.title" text="编辑" /></h4>
		</header>

		<div class="content content-inner">

<form id="xgdwContact-infoForm" method="post" action="xgdwContact-info-save.do" class="form-horizontal">
  <c:if test="${model != null}">
	  <input id="xgdwContact-info_id" type="hidden" name="fid" value="${model.fid}">
  </c:if>
			    	<div class="control-group">
				    <label class="control-label" for="xgdwContact-info_fdwname"><spring:message code="xgdwContact-info.xgdwContact-info.input.fdwname" text="单位名称"/></label>
					<div class="controls">
					  	 <input id="xgdwContact-info_fdwname" type="text" name="fdwname" value="${model.fdwname}" size="" class="text required" minlength="" maxlength="">	
				    </div>
				  </div>
			    	<div class="control-group">
				    <label class="control-label" for="xgdwContact-info_fcontactname"><spring:message code="xgdwContact-info.xgdwContact-info.input.fcontactname" text="联系人姓名"/></label>
					<div class="controls">
					  	 <input id="xgdwContact-info_fcontactname" type="text" name="fcontactname" value="${model.fcontactname}" size="" class="text " minlength="" maxlength="">	
				    </div>
				  </div>
			    	<div class="control-group">
				    <label class="control-label" for="xgdwContact-info_ftel"><spring:message code="xgdwContact-info.xgdwContact-info.input.ftel" text="电话"/></label>
					<div class="controls">
					  	 <input id="xgdwContact-info_ftel" type="text" name="ftel" value="${model.ftel}" size="" class="text " minlength="" maxlength="">	
				    </div>
				  </div>
			    	<div class="control-group">
				    <label class="control-label" for="xgdwContact-info_fmail"><spring:message code="xgdwContact-info.xgdwContact-info.input.fmail" text="邮箱"/></label>
					<div class="controls">
					  	 <input id="xgdwContact-info_fmail" type="text" name="fmail" value="${model.fmail}" size="" class="text " minlength="" maxlength="">	
				    </div>
				  </div>
			    	<%-- <div class="control-group">
				    <label class="control-label" for="xgdwContact-info_fdwid"><spring:message code="xgdwContact-info.xgdwContact-info.input.fdwid" text="单位id"/></label>
					<div class="controls">
					  	<input id="xgdwContact-info_fdwid" type="text" name="fdwid" value="${model.fdwid}" size="" class="number   " minlength="" maxlength="">
				    </div>
				  </div> --%>
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

	  <!-- end of main -->
	</div>

  </body>

</html>
