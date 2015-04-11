<%@page contentType="text/html;charset=UTF-8"%>
<%@include file="/taglibs.jsp"%>
<%pageContext.setAttribute("currentHeader", "gcgl-home");%>
<%pageContext.setAttribute("currentMenu", "gcgl-jlb");%>
<!doctype html>
<html lang="zh">

  <head>
    <%@include file="/common/meta.jsp"%>
    <title><spring:message code="pjGuifantuji-info.pjGuifantuji-info.input.title" text="编辑"/></title>
    <%@include file="/common/s.jsp"%>
    <script type="text/javascript">
$(function() {
    $("#pjGuifantuji-infoForm").validate({
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
	  <%@include file="/menu/gcgl-workspace.jsp"%>

	  <!-- start of main -->
      <section id="m-main" class="span10">

      <article class="m-widget">
        <header class="header">
		  <h4 class="title"><spring:message code="pjGuifantuji-info.pjGuifantuji-info.input.title" text="编辑" /></h4>
		</header>

		<div class="content content-inner">

<form id="pjGuifantuji-infoForm" method="post" action="pjGuifantuji-info-save.do" class="form-horizontal">
  <c:if test="${model != null}">
	  <input id="pjGuifantuji-info_id" type="hidden" name="fid" value="${model.fid}">
  </c:if>
			    	<div class="control-group">
				    <label class="control-label" for="pjGuifantuji-info_fname"><spring:message code="pjGuifantuji-info.pjGuifantuji-info.input.fname" text="名称"/></label>
					<div class="controls">
					  	 <input id="pjGuifantuji-info_fname" type="text" name="fname" value="${model.fname}" size="" class="text required" minlength="" maxlength="">	
				    </div>
				  </div>
			    	<%-- <div class="control-group">
				    <label class="control-label" for="pjGuifantuji-info_ftype"><spring:message code="pjGuifantuji-info.pjGuifantuji-info.input.ftype" text="类型"/></label>
					<div class="controls">
					  	 <select class="form-control" id="pjGuifantuji-info_ftype" name="ftype" value="${model.ftype}" class=" " >
					    	 	<option value="规范"  <c:if test="${model.ftype}=='规范'}"> selected="selected"  </c:if>>规范</option>
					    	 	<option value="图集"  <c:if test="${model.ftype}=='图集'}"> selected="selected"  </c:if>>图集</option>
					 	</select>
				    </div>
				  </div> --%>
			    	<div class="control-group">
				    <label class="control-label" for="pjGuifantuji-info_ffilename"><spring:message code="pjGuifantuji-info.pjGuifantuji-info.input.ffilename" text="文件名"/></label>
					<div class="controls">
					  	 <input id="pjGuifantuji-info_ffilename" type="text" name="ffilename" value="${model.ffilename}" size="" class="text " minlength="" maxlength="">	
				    </div>
				  </div>
			    	<div class="control-group">
				    <label class="control-label" for="pjGuifantuji-info_ffileurl"><spring:message code="pjGuifantuji-info.pjGuifantuji-info.input.ffileurl" text="文件url"/></label>
					<div class="controls">
				      	<textarea id="pjGuifantuji-info_ffileurl"  name="ffileurl"  class="form-control" rows="6"  style="width: 560px" class="text  "  minlength="" maxlength="512">${model.ffileurl}</textarea>
				    </div>
				  </div>
			    	<div class="control-group">
				    <label class="control-label" for="pjGuifantuji-info_finfo"><spring:message code="pjGuifantuji-info.pjGuifantuji-info.input.finfo" text="说明"/></label>
					<div class="controls">
				      	<textarea id="pjGuifantuji-info_finfo"  name="finfo"  class="form-control" rows="6"  style="width: 560px" class="text  "  minlength="" maxlength="512">${model.finfo}</textarea>
				    </div>
				  </div>
			    	<div class="control-group">
				    <label class="control-label" for="pjGuifantuji-info_fmemo"><spring:message code="pjGuifantuji-info.pjGuifantuji-info.input.fmemo" text="备注"/></label>
					<div class="controls">
				      	<textarea id="pjGuifantuji-info_fmemo"  name="fmemo"  class="form-control" rows="6"  style="width: 560px" class="text  "  minlength="" maxlength="512">${model.fmemo}</textarea>
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
