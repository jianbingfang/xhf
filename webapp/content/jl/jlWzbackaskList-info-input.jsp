<%@page contentType="text/html;charset=UTF-8"%>
<%@include file="/taglibs.jsp"%>
<%pageContext.setAttribute("currentHeader", "jl-home");%>
<%pageContext.setAttribute("currentMenu", "jl-cd");%>
<!doctype html>
<html lang="zh">

  <head>
    <%@include file="/common/meta.jsp"%>
    <title><spring:message code="jlWzbackaskList-info.jlWzbackaskList-info.input.title" text="编辑"/></title>
    <%@include file="/common/s.jsp"%>
        <link type="text/css" rel="stylesheet"
		href="${scopePrefix}/s/xthena/wzpicker/wzpicker.css">
	<script type="text/javascript"
		src="${scopePrefix}/s/xthena/wzpicker/wzpicker.js"></script>
    <script type="text/javascript">
$(function() {
    $("#jlWzbackaskList-infoForm").validate({
        submitHandler: function(form) {
			bootbox.animate(false);
			var box = bootbox.dialog('<div class="progress progress-striped active" style="margin:0px;"><div class="bar" style="width: 100%;"></div></div>');
            form.submit();
        },
        errorClass: 'validate-error'
    });
    
    createwzPicker({
		modalId : 'wzPicker',
		url : '${scopePrefix}/xz/wz-simple-list.do'
	});
    
    
})
    </script>
  </head>

  <body>
    <%@include file="/header.jsp"%>

    <div class="row-fluid">
	  <%@include file="/menu/jl-workspace.jsp"%>

	  <!-- start of main -->
      <section id="m-main" class="span10">

      <article class="m-widget">
        <header class="header">
		  <h4 class="title"><spring:message code="jlWzbackaskList-info.jlWzbackaskList-info.input.title" text="编辑" /></h4>
		</header>

		<div class="content content-inner">

<form id="jlWzbackaskList-infoForm" method="post" action="jlWzbackaskList-info-save.do" class="form-horizontal">
  <c:if test="${model != null}">
	  <input id="jlWzbackaskList-info_id" type="hidden" name="fid" value="${model.fid}">
  </c:if>
  <input id="jlWzbackaskList-info_fbackid" type="hidden" name="fbackid" value="${model.fbackid}" size="" class="number   " minlength="" maxlength="">
			    	
			    	<div class="control-group">
				    <label class="control-label" for="jlWzbackaskList-info_fwzid"><spring:message code="jlWzbackaskList-info.jlWzbackaskList-info.input.fwzid" text="物品"/></label>
					<div class="controls">
						<div class="input-append wzPicker">
							<input id="ryBxRecord-info_fwzname" type="hidden" name="fwzid"
								value="${model.fwzid}"> <input
								id="ryBxRecord-info_fwzname" type="text" value="${fwzname}"
								disabled class=" required" style="width: 175px;" value="">
							<span class="add-on"
								style="padding-top: 2px; padding-bottom: 2px;"><i
								class="icon-list"></i></span>
						</div>
				    </div>
				  </div>
			    	<div class="control-group">
				    <label class="control-label" for="jlWzbackaskList-info_fnum"><spring:message code="jlWzbackaskList-info.jlWzbackaskList-info.input.fnum" text="数量"/></label>
					<div class="controls">
					  	<input id="jlWzbackaskList-info_fnum" type="text" name="fnum" value="${model.fnum}" size="" class="number   " minlength="" maxlength="">
				    </div>
				  </div>
			    	<div class="control-group">
				    <label class="control-label" for="jlWzbackaskList-info_fmemo"><spring:message code="jlWzbackaskList-info.jlWzbackaskList-info.input.fmemo" text="备注"/></label>
					<div class="controls">
				      	<textarea id="jlWzbackaskList-info_fmemo"  name="fmemo"  class="form-control" rows="6"  style="width: 560px" class="text  "  minlength="" maxlength="500">${model.fmemo}</textarea>
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
