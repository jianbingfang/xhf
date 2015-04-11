<%@page contentType="text/html;charset=UTF-8"%>
<%@include file="/taglibs.jsp"%>
<%pageContext.setAttribute("currentHeader", "gcgl-home");%>
<%pageContext.setAttribute("currentMenu", "gcgl-ny");%>
<!doctype html>
<html lang="zh">

  <head>
    <%@include file="/common/meta.jsp"%>
    <title><spring:message code="pjMreport-info.pjMreport-info.input.title" text="编辑"/></title>
    <%@include file="/common/s.jsp"%>
    
    
    	<link type="text/css" rel="stylesheet"
	href="${scopePrefix}/s/xthena/rypicker/rypicker.css">
<script type="text/javascript"
	src="${scopePrefix}/s/xthena/rypicker/rypicker.js"></script>
	
    <script type="text/javascript">
$(function() {
    $("#pjMreport-infoForm").validate({
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
		  <h4 class="title"><spring:message code="pjMreport-info.pjMreport-info.input.title" text="编辑" /></h4>
		</header>

		<div class="content content-inner">

<form id="pjMreport-infoForm" method="post" action="pjMreport-info-save.do" class="form-horizontal">
  <c:if test="${model != null}">
	  <input id="pjMreport-info_id" type="hidden" name="fid" value="${model.fid}">
  </c:if>
			    	<div class="control-group">
				    <label class="control-label" for="pjMreport-info_freportno"><spring:message code="pjMreport-info.pjMreport-info.input.freportno" text="序号"/></label>
					<div class="controls">
					  	 <input id="pjMreport-info_freportno" type="text" name="freportno" value="${model.freportno}" size="" class="text required" minlength="" maxlength="">	
				    </div>
				  </div>
			    	<div class="control-group">
				    <label class="control-label" for="pjMreport-info_fyearmonth"><spring:message code="pjMreport-info.pjMreport-info.input.fyearmonth" text="年月"/></label>
					<div class="controls">
					  	 <input id="pjMreport-info_fyearmonth" type="text" name="fyearmonth" value="${model.fyearmonth}" size="" class="text required" minlength="" maxlength="">	
				    </div>
				  </div>
			    	<div class="control-group">
				    <label class="control-label" for="pjMreport-info_fuploaddate"><spring:message code="pjMreport-info.pjMreport-info.input.fuploaddate" text="上传时间"/></label>
					<div class="controls">
				      	 <div class="input-append datepicker date" style="padding-left: 0px;">
					    	<input id="pjMreport-info_fuploaddate" type="text" name="fuploaddate" value="${model.fuploaddate}" size="40" class="text "   style="background-color:white;cursor:default; width: 175px;">
					 		 <span class="add-on" style="padding-top: 2px; padding-bottom: 2px;"><i class="icon-calendar"></i></span>
					 	 </div>
				    </div>
				  </div>
			    	<div class="control-group">
				    <label class="control-label" for="pjMreport-info_ffilename"><spring:message code="pjMreport-info.pjMreport-info.input.ffilename" text="文件名"/></label>
					<div class="controls">
					  	 <input id="pjMreport-info_ffilename" type="text" name="ffilename" value="${model.ffilename}" size="" class="text required" minlength="" maxlength="">	
				    </div>
				  </div>
			    	<div class="control-group">
				    <label class="control-label" for="pjMreport-info_fryid"><spring:message code="pjMreport-info.pjMreport-info.input.fryid" text="上传人"/></label>
					<div class="controls">
							<div class="input-append ryPicker">
									<input id="pjMreport-info_fryid" type="hidden" name="fryid"
										value="${model.fryid}"> <input
										id="ryBxRecord-info_userName" type="text" value="${ryMap[model.fryid].fname}"
										disabled class=" required" style="width: 175px;" value="">
									<span class="add-on"
										style="padding-top: 2px; padding-bottom: 2px;"><i
										class="icon-user"></i></span>
								</div>
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
