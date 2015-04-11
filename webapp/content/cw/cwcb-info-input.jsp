<%@page contentType="text/html;charset=UTF-8"%>
<%@include file="/taglibs.jsp"%>
<%pageContext.setAttribute("currentHeader", "cw-home");%>
<%pageContext.setAttribute("currentMenu", "cw-hs");%>
<!doctype html>
<html lang="zh">

  <head>
    <%@include file="/common/meta.jsp"%>
    <title><spring:message code="cwcb-info.cwcb-info.input.title" text="编辑"/></title>
    <%@include file="/common/s.jsp"%>
    <link type="text/css" rel="stylesheet"
	href="${scopePrefix}/s/xthena/xmpicker/xmpicker.css">
<script type="text/javascript"
	src="${scopePrefix}/s/xthena/xmpicker/xmpicker.js"></script>
	
		
	 <link type="text/css" rel="stylesheet"
	href="${scopePrefix}/s/xthena/htpicker/htpicker.css">
<script type="text/javascript"
	src="${scopePrefix}/s/xthena/htpicker/htpicker.js"></script>
	
    <script type="text/javascript">
$(function() {
    $("#cwcb-infoForm").validate({
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
    
	createhtPicker({
		modalId : 'htPicker',
		url : '${scopePrefix}/sckf/ht-simple-list.do'
	});
})
    </script>
  </head>

  <body>
    <%@include file="/header.jsp"%>

    <div class="row-fluid">
	  <%@include file="/menu/cw-workspace.jsp"%>

	  <!-- start of main -->
      <section id="m-main" class="span10">

      <article class="m-widget">
        <header class="header">
		  <h4 class="title"><spring:message code="cwcb-info.cwcb-info.input.title" text="编辑" /></h4>
		</header>

		<div class="content content-inner">

<form id="cwcb-infoForm" method="post" action="cwcb-info-save.do" class="form-horizontal">
  <c:if test="${model != null}">
	  <input id="cwcb-info_id" type="hidden" name="fid" value="${model.fid}">
  </c:if>
			    	<div class="control-group">
				    <label class="control-label" for="cwcb-info_fxmid"><spring:message code="cwcb-info.cwcb-info.input.fxmid" text="项目名称"/></label>
					<div class="controls">
					  	<div class="input-append htPicker">
								<input id="cwcb-info_fxmid" type="hidden" name="fxmid"
									value="${model.fxmid}"> <input
									id="cwcb-info_fxmidname" type="text" value="${htMap[model.fxmid].fhtname}" disabled
									class=" required" style="width: 175px;" value=""> <span
									class="add-on" style="padding-top: 2px; padding-bottom: 2px;"><i
									class="icon-th-list"></i></span>
							</div>
				    </div>
				  </div>
			    	<div class="control-group">
				    <label class="control-label" for="cwcb-info_fchengben"><spring:message code="cwcb-info.cwcb-info.input.fchengben" text="成本金额"/></label>
					<div class="controls">
					  	 <input id="cwcb-info_fchengben" type="number" name="fchengben" value="${model.fchengben}" size="" class="number required" minlength="" maxlength="">	
				    </div>
				  </div>
			    	<div class="control-group">
				    <label class="control-label" for="cwcb-info_fdate"><spring:message code="cwcb-info.cwcb-info.input.fdate" text="发生时间"/></label>
					<div class="controls">
				      	 <div class="input-append datepicker date" style="padding-left: 0px;">
					    	<input id="cwcb-info_fdate" type="text" name="fdate" value="${model.fdate}" size="40" class="text "   style="background-color:white;cursor:default; width: 175px;">
					 		 <span class="add-on" style="padding-top: 2px; padding-bottom: 2px;"><i class="icon-calendar"></i></span>
					 	 </div>
				    </div>
				  </div>
			    	<div class="control-group">
				    <label class="control-label" for="cwcb-info_fmemo"><spring:message code="cwcb-info.cwcb-info.input.fmemo" text="备注"/></label>
					<div class="controls">
				      	<textarea id="cwcb-info_fmemo"  name="fmemo"  class="form-control" rows="6"  style="width: 560px" class="text  "  minlength="" maxlength="200">${model.fmemo}</textarea>
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
