<%@page contentType="text/html;charset=UTF-8"%>
<%@include file="/taglibs.jsp"%>
<%pageContext.setAttribute("currentHeader", "gcgl-home");%>
<%pageContext.setAttribute("currentMenu", "gcgl-ny");%>
<!doctype html>
<html lang="zh">

  <head>
    <%@include file="/common/meta.jsp"%>
    <title><spring:message code="pjjx-info.pjjx-info.input.title" text="编辑"/></title>
    <%@include file="/common/s.jsp"%>
    
    	<link type="text/css" rel="stylesheet"
	href="${scopePrefix}/s/xthena/rypicker/rypicker.css">
<script type="text/javascript"
	src="${scopePrefix}/s/xthena/rypicker/rypicker.js"></script>
	
    <script type="text/javascript">
$(function() {
    $("#pjjx-infoForm").validate({
        submitHandler: function(form) {
			bootbox.animate(false);
			var box = bootbox.dialog('<div class="progress progress-striped active" style="margin:0px;"><div class="bar" style="width: 100%;"></div></div>');
            form.submit();
        },
        errorClass: 'validate-error'
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
		  <h4 class="title"><spring:message code="pjjx-info.pjjx-info.input.title" text="编辑" /></h4>
		</header>

		<div class="content content-inner">

<form id="pjjx-infoForm" method="post" action="pjjx-info-save.do" class="form-horizontal">
  <c:if test="${model != null}">
	  <input id="pjjx-info_id" type="hidden" name="fid" value="${model.fid}">
  </c:if>
			    	<div class="control-group">
				    <label class="control-label" for="pjjx-info_fjxno"><spring:message code="pjjx-info.pjjx-info.input.fjxno" text="序号"/></label>
					<div class="controls">
					  	 <input id="pjjx-info_fjxno" type="text" name="fjxno" value="${model.fjxno}" size="" class="text required" minlength="" maxlength="">	
				    </div>
				  </div>
				  
				    
			    <%-- 	<div class="control-group">
				    <label class="control-label" for="pjjx-info_fjingshourenid"><spring:message code="pjjx-info.pjjx-info.input.fjingshourenid" text="经手人"/></label>
					<div class="controls">
							<div class="input-append ryPicker">
									<input id="ryBxRecord-info_fryid" type="hidden" name="fjingshourenid"
										value="${model.fjingshourenid}"> <input
										id="ryBxRecord-info_userName" type="text" value="${ryMap[model.fjingshourenid].fname}"
										disabled class=" required" style="width: 175px;" value="">
									<span class="add-on"
										style="padding-top: 2px; padding-bottom: 2px;"><i
										class="icon-user"></i></span>
								</div>
				    </div>
				  </div> --%>
				  
			    	<div class="control-group">
				    <label class="control-label" for="pjjx-info_fjxqihao"><spring:message code="pjjx-info.pjjx-info.input.fjxqihao" text="期号"/></label>
					<div class="controls">
					  	 <input id="pjjx-info_fjxqihao" type="text" name="fjxqihao" value="${model.fjxqihao}" size="" class="text required" minlength="" maxlength="">	
				    </div>
				  </div>
			    	<div class="control-group">
				    <label class="control-label" for="pjjx-info_fjxdate"><spring:message code="pjjx-info.pjjx-info.input.fjxdate" text="发布时间"/></label>
					<div class="controls">
				      	 <div class="input-append datepicker date" style="padding-left: 0px;">
					    	<input id="pjjx-info_fjxdate" type="text" name="fjxdate" value="${model.fjxdate}" size="40" class="text "   style="background-color:white;cursor:default; width: 175px;">
					 		 <span class="add-on" style="padding-top: 2px; padding-bottom: 2px;"><i class="icon-calendar"></i></span>
					 	 </div>
				    </div>
				  </div>
			    	<div class="control-group">
				    <label class="control-label" for="pjjx-info_fmemo"><spring:message code="pjjx-info.pjjx-info.input.fmemo" text="备注"/></label>
					<div class="controls">
					  	 <textarea id="pjjx-info_fmemo" type="text" name="fmemo" rows="6"  style="width: 560px" size="" class="text " minlength="" maxlength="">${model.fmemo}	</textarea>
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
