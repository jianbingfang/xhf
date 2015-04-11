<%@page contentType="text/html;charset=UTF-8"%>
<%@include file="/taglibs.jsp"%>
<%pageContext.setAttribute("currentHeader", "jl-home");%>
<%pageContext.setAttribute("currentMenu", "dwryzj");%>
<!doctype html>
<html lang="zh">

  <head>
    <%@include file="/common/meta.jsp"%>
    <title><spring:message code="dwryzj-info.dwryzj-info.input.title" text="编辑"/></title>
    <%@include file="/common/s.jsp"%>
    <script type="text/javascript">
$(function() {
    $("#dwryzj-infoForm").validate({
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
		  <h4 class="title"><spring:message code="dwryzj-info.dwryzj-info.input.title" text="编辑" /></h4>
		</header>

		<div class="content content-inner">

<form id="dwryzj-infoForm" method="post" action="dwryzj-info-save.do" class="form-horizontal">
  <c:if test="${model != null}">
	  <input id="dwryzj-info_id" type="hidden" name="fid" value="${model.fid}">
  </c:if>
			    	<div class="control-group">
				    <label class="control-label" for="dwryzj-info_fgw"><spring:message code="dwryzj-info.dwryzj-info.input.fgw" text="单位名称"/></label>
					<div class="controls">
					  	 <input id="dwryzj-info_fgw" type="text" name="fgw" value="${model.fgw}" size="" class="text required" minlength="" maxlength="">	
				    </div>
				  </div>
			    	<div class="control-group">
				    <label class="control-label" for="dwryzj-info_fdwname"><spring:message code="dwryzj-info.dwryzj-info.input.fdwname" text="岗位名称"/></label>
					<div class="controls">
					  	 <input id="dwryzj-info_fdwname" type="text" name="fdwname" value="${model.fdwname}" size="" class="text required" minlength="" maxlength="">	
				    </div>
				  </div>
			    	<div class="control-group">
				    <label class="control-label" for="dwryzj-info_fval"><spring:message code="dwryzj-info.dwryzj-info.input.fval" text="有无"/></label>
					<div class="controls">
				      	 <select class="form-control" id="dwryzj-info_fval" name="fval" value="${model.fval}" class=" " >
					    	 	<option value="有"  <c:if test="${model.fval}=='有'}"> selected="selected"  </c:if>>有</option>
					    	 	<option value="无"  <c:if test="${model.fval}=='无'}"> selected="selected"  </c:if>>无</option>
					 	</select>
				    </div>
				  </div>
			    	<div class="control-group">
				    <label class="control-label" for="dwryzj-info_fstatus"><spring:message code="dwryzj-info.dwryzj-info.input.fstatus" text="审核状态"/></label>
					<div class="controls">
				      	 <select class="form-control" id="dwryzj-info_fstatus" name="fstatus" value="${model.fstatus}" class=" " >
					    	 	<option value="通过"  <c:if test="${model.fstatus}=='通过'}"> selected="selected"  </c:if>>通过</option>
					    	 	<option value="不通过"  <c:if test="${model.fstatus}=='不通过'}"> selected="selected"  </c:if>>不通过</option>
					 	</select>
				    </div>
				  </div>
			    	<div class="control-group">
				    <label class="control-label" for="dwryzj-info_fmemo"><spring:message code="dwryzj-info.dwryzj-info.input.fmemo" text="备注"/></label>
					<div class="controls">
					  	 <input id="dwryzj-info_fmemo" type="text" name="fmemo" value="${model.fmemo}" size="" class="text " minlength="" maxlength="">	
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

	  <!-- end of main -->
	</div>

  </body>

</html>
