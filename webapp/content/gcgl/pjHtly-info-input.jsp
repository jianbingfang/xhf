<%@page contentType="text/html;charset=UTF-8"%>
<%@include file="/taglibs.jsp"%>
<%pageContext.setAttribute("currentHeader", "gcgl-home");%>
<%pageContext.setAttribute("currentMenu", "gcgl-jlf");%>
<!doctype html>
<html lang="zh">

  <head>
    <%@include file="/common/meta.jsp"%>
    <title><spring:message code="pjHtly-info.pjHtly-info.input.title" text="编辑"/></title>
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
    $("#pjHtly-infoForm").validate({
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
	  <%@include file="/menu/gcgl-workspace.jsp"%>

	  <!-- start of main -->
      <section id="m-main" class="span10">

      <article class="m-widget">
        <header class="header">
		  <h4 class="title"><spring:message code="pjHtly-info.pjHtly-info.input.title" text="编辑" /></h4>
		</header>

		<div class="content content-inner">

<form id="pjHtly-infoForm" method="post" action="pjHtly-info-save.do" class="form-horizontal">
  <c:if test="${model != null}">
	  <input id="pjHtly-info_id" type="hidden" name="fid" value="${model.fid}">
  </c:if>
			    	<div class="control-group">
				    <label class="control-label" for="pjHtly-info_fxmid"><spring:message code="pjHtly-info.pjHtly-info.input.fxmid" text="项目"/></label>
					<div class="controls">
					  	<div class="input-append htPicker">
								<input id="pjMbzrs-info_fxmid" type="hidden" name="fxmid"
									value="${model.fxmid}"> <input
									id="xmBxRecord-info_xmmc" type="text" value="${htMap[model.fxmid].fhtname}" disabled
									class=" required" style="width: 175px;" value=""> <span
									class="add-on" style="padding-top: 2px; padding-bottom: 2px;"><i
									class="icon-th-list"></i></span>
							</div>
				    </div>
				  </div>
			    	<div class="control-group">
				    <label class="control-label" for="pjHtly-info_fhtje"><spring:message code="pjHtly-info.pjHtly-info.input.fhtje" text="合同金额"/></label>
					<div class="controls">
					  	 <input id="pjHtly-info_fhtje" type="text" name="fhtje" value="${model.fhtje}" size="" class="text " minlength="" maxlength="">	
				    </div>
				  </div>
			    	<div class="control-group">
				    <label class="control-label" for="pjHtly-info_fsjzsr"><spring:message code="pjHtly-info.pjHtly-info.input.fsjzsr" text="实际总收入"/></label>
					<div class="controls">
					  	 <input id="pjHtly-info_fsjzsr" type="text" name="fsjzsr" value="${model.fsjzsr}" size="" class="text " minlength="" maxlength="">	
				    </div>
				  </div>
			    	<div class="control-group">
				    <label class="control-label" for="pjHtly-info_flvyuelv"><spring:message code="pjHtly-info.pjHtly-info.input.flvyuelv" text="履约率"/></label>
					<div class="controls">
					  	 <input id="pjHtly-info_flvyuelv" type="text" name="flvyuelv" value="${model.flvyuelv}" size="" class="text required" minlength="" maxlength="">	
				    </div>
				  </div>
			    	<div class="control-group">
				    <label class="control-label" for="pjHtly-info_fpjjd"><spring:message code="pjHtly-info.pjHtly-info.input.fpjjd" text="工程进度"/></label>
					<div class="controls">
					  	 <input id="pjHtly-info_fpjjd" type="text" name="fpjjd" value="${model.fpjjd}" size="" class="text required" minlength="" maxlength="">	
				    </div>
				  </div>
			    	<div class="control-group">
				    <label class="control-label" for="pjHtly-info_fmemo"><spring:message code="pjHtly-info.pjHtly-info.input.fmemo" text="备注"/></label>
					<div class="controls">
					  	 <input id="pjHtly-info_fmemo" type="text" name="fmemo" value="${model.fmemo}" size="" class="text " minlength="" maxlength="">	
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
