<%@page contentType="text/html;charset=UTF-8"%>
<%@include file="/taglibs.jsp"%>
<%pageContext.setAttribute("currentHeader", "gcgl-home");%>
<%pageContext.setAttribute("currentMenu", "gcgl-ny");%>

<%pageContext.setAttribute("fxmid", request.getParameter("fxmid"));%>
<!doctype html>
<html lang="zh">

  <head>
    <%@include file="/common/meta.jsp"%>
    <title><spring:message code="pjDc-info.pjDc-info.input.title" text="编辑"/></title>
    <%@include file="/common/s.jsp"%>
            <link type="text/css" rel="stylesheet"
	href="${scopePrefix}/s/xthena/xmpicker/xmpicker.css">
<script type="text/javascript"
	src="${scopePrefix}/s/xthena/xmpicker/xmpicker.js"></script>
	
	      	<link type="text/css" rel="stylesheet"
	href="${scopePrefix}/s/xthena/rypicker/rypicker.css">
<script type="text/javascript"
	src="${scopePrefix}/s/xthena/rypicker/rypicker.js"></script>
	
    <script type="text/javascript">
$(function() {
    $("#pjDc-infoForm").validate({
        submitHandler: function(form) {
			bootbox.animate(false);
			var box = bootbox.dialog('<div class="progress progress-striped active" style="margin:0px;"><div class="bar" style="width: 100%;"></div></div>');
            form.submit();
        },
        errorClass: 'validate-error'
    });
    
    
    createxmPicker({
		modalId : 'xmPicker',
		url : '${scopePrefix}/gcgl/pjXm-simple-list.do'
	});
    
    
    createryPicker({
		modalId : 'ryPicker',
		url : '${scopePrefix}/hr/commRy-simple-list.do'
	});
})
    </script>
  </head>

  <body>

    <div class="row-fluid">

	  <!-- start of main -->

      <article class="m-widget">
        <header class="header">
		  <h4 class="title"><spring:message code="pjDc-info.pjDc-info.input.title" text="编辑" /></h4>
		</header>

		<div class="content content-inner">

<form id="pjDc-infoForm" method="post" action="pjDc-info-save.do" class="form-horizontal">
  <c:if test="${model != null}">
	  <input id="pjDc-info_id" type="hidden" name="fid" value="${model.fid}">
  </c:if>
			    	<div class="control-group">
				    <label class="control-label" for="pjDc-info_fxmid"><spring:message code="pjDc-info.pjDc-info.input.fxmid" text="项目"/></label>
					<div class="controls">
						<div class="input-append xmPicker">
								<input id="xzChufa-info_fxmid" type="hidden" name="fxmid"
									value="${model.fxmid}"> <input
									id="xmBxRecord-info_xmmc" type="text" value="${xmMap[model.fxmid].fxmname}" disabled
									class=" required" style="width: 175px;" value=""> <span
									class="add-on" style="padding-top: 2px; padding-bottom: 2px;"><i
									class="icon-th-list"></i></span>
							</div>
				    </div>
				  </div>
			    	<div class="control-group">
				    <label class="control-label" for="pjDc-info_fdcdate"><spring:message code="pjDc-info.pjDc-info.input.fdcdate" text="督查日期"/></label>
					<div class="controls">
				      	 <div class="input-append datepicker date" style="padding-left: 0px;">
					    	<input id="pjDc-info_fdcdate" type="text" name="fdcdate" value="${model.fdcdate}" size="40" class="text "   style="background-color:white;cursor:default; width: 175px;">
					 		 <span class="add-on" style="padding-top: 2px; padding-bottom: 2px;"><i class="icon-calendar"></i></span>
					 	 </div>
				    </div>
				  </div>
			    	<div class="control-group">
				    <label class="control-label" for="pjDc-info_fdcry"><spring:message code="pjDc-info.pjDc-info.input.fdcry" text="督查人员"/></label>
					<div class="controls">
				      	<textarea id="pjDc-info_fdcry"  name="fdcry"  class="form-control" rows="6"  style="width: 560px" class="text  "  minlength="" maxlength="500">${model.fdcry}</textarea>
				    </div>
				  </div>
			    	<div class="control-group">
				    <label class="control-label" for="pjDc-info_fdczhuti"><spring:message code="pjDc-info.pjDc-info.input.fdczhuti" text="督查主题"/></label>
					<div class="controls">
					  	 <input id="pjDc-info_fdczhuti" type="text" name="fdczhuti" value="${model.fdczhuti}" size="" class="text required" minlength="" maxlength="">	
				    </div>
				  </div>
			    	<div class="control-group">
				    <label class="control-label" for="pjDc-info_fdccontent"><spring:message code="pjDc-info.pjDc-info.input.fdccontent" text="督查内容"/></label>
					<div class="controls">
				      	<textarea id="pjDc-info_fdccontent"  name="fdccontent"  class="form-control" rows="6"  style="width: 560px" class="text  "  minlength="" maxlength="500">${model.fdccontent}</textarea>
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
