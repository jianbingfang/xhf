<%@page contentType="text/html;charset=UTF-8"%>
<%@include file="/taglibs.jsp"%>
<%pageContext.setAttribute("currentHeader", "gcgl-home");%>
<%pageContext.setAttribute("currentMenu", "pjSubmit");%>
<!doctype html>
<html lang="zh">

  <head>
    <%@include file="/common/meta.jsp"%>
    <title><spring:message code="pjSubmit-info.pjSubmit-info.input.title" text="编辑"/></title>
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
    $("#pjSubmit-infoForm").validate({
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
		  <h4 class="title"><spring:message code="pjSubmit-info.pjSubmit-info.input.title" text="编辑" /></h4>
		</header>

		<div class="content content-inner">

<form id="pjSubmit-infoForm" method="post" action="pjSubmit-info-save.do" class="form-horizontal">
  <c:if test="${model != null}">
	  <input id="pjSubmit-info_id" type="hidden" name="fid" value="${model.fid}">
  </c:if>
			    	<div class="control-group">
				    <label class="control-label" for="pjSubmit-info_fxmid"><spring:message code="pjSubmit-info.pjSubmit-info.input.fxmid" text="项目"/></label>
					<div class="controls">
						<div class="input-append xmPicker">
							<input id="pjVisit-info_fxmid" type="hidden" name="fxmid"
								value="${model.fxmid}"> <input
							id="xmBxRecord-info_xmmc" type="text" value="${xmMap[model.fxmid].fxmname}" disabled
							class=" required" style="width: 175px;" value=""> <span
							class="add-on" style="padding-top: 2px; padding-bottom: 2px;"><i
							class="icon-th-list"></i></span>
						</div>
				    </div>
				  </div>
			    	<div class="control-group">
				    <label class="control-label" for="pjSubmit-info_fjiangx"><spring:message code="pjSubmit-info.pjSubmit-info.input.fjiangx" text="所报奖项"/></label>
					<div class="controls">
					  	 <input id="pjSubmit-info_fjiangx" type="text" name="fjiangx" value="${model.fjiangx}" size="" class="text required" minlength="" maxlength="">	
				    </div>
				  </div>
			    	<div class="control-group">
				    <label class="control-label" for="pjSubmit-info_fry"><spring:message code="pjSubmit-info.pjSubmit-info.input.fry" text="所报人员"/></label>
					<div class="controls">
				      	<textarea id="pjSubmit-info_fry"  name="fry"  class="form-control" rows="6"  style="width: 560px" class="text  "  minlength="" maxlength="500">${model.fry}</textarea>
				    </div>
				  </div>
			    	<div class="control-group">
				    <label class="control-label" for="pjSubmit-info_fsubdate"><spring:message code="pjSubmit-info.pjSubmit-info.input.fsubdate" text="证书移交时间"/></label>
					<div class="controls">
				      	 <div class="input-append datepicker date" style="padding-left: 0px;">
					    	<input id="pjSubmit-info_fsubdate" type="text" name="fsubdate" value="${model.fsubdate}" size="40" class="text "   style="background-color:white;cursor:default; width: 175px;">
					 		 <span class="add-on" style="padding-top: 2px; padding-bottom: 2px;"><i class="icon-calendar"></i></span>
					 	 </div>
				    </div>
				  </div>
			    	<div class="control-group">
				    <label class="control-label" for="pjSubmit-info_fyijiaorenid"><spring:message code="pjSubmit-info.pjSubmit-info.input.fyijiaorenid" text="移交人"/></label>
					<div class="controls">
							<div class="input-append ryPicker">
									<input id="ryBxRecord-info_fzhuchiren" type="hidden" name="fyijiaorenid"
										value="${model.fyijiaorenid}"> <input
										id="ryBxRecord-info_userName" type="text" value="${ryMap[model.fyijiaorenid].fname}"
										disabled class=" required" style="width: 175px;" value="">
									<span class="add-on"
										style="padding-top: 2px; padding-bottom: 2px;"><i
										class="icon-user"></i></span>
								</div>
				    </div>
				  </div>
			    	<div class="control-group">
				    <label class="control-label" for="pjSubmit-info_fmemo"><spring:message code="pjSubmit-info.pjSubmit-info.input.fmemo" text="备注"/></label>
					<div class="controls">
				      	<textarea id="pjSubmit-info_fmemo"  name="fmemo"  class="form-control" rows="6"  style="width: 560px" class="text  "  minlength="" maxlength="500">${model.fmemo}</textarea>
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
