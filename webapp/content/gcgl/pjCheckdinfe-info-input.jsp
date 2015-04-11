<%@page contentType="text/html;charset=UTF-8"%>
<%@include file="/taglibs.jsp"%>
<%pageContext.setAttribute("currentHeader", "gcgl-home");%>
<%pageContext.setAttribute("currentMenu", "pjCheckdinfe");%>
<!doctype html>
<html lang="zh">

  <head>
    <%@include file="/common/meta.jsp"%>
    <title><spring:message code="pjCheckdinfe-info.pjCheckdinfe-info.input.title" text="编辑"/></title>
    <%@include file="/common/s.jsp"%>
    <script type="text/javascript">
$(function() {
    $("#pjCheckdinfe-infoForm").validate({
        submitHandler: function(form) {
			bootbox.animate(false);
			var box = bootbox.dialog('<div class="progress progress-striped active" style="margin:0px;"><div class="bar" style="width: 100%;"></div></div>');
            form.submit();
        },
        errorClass: 'validate-error'
    });
    
    $("#confirmBtn").click(function() {
		getFiles();
	});
})

function getFiles(){
	$.each($('.files').children(),
			function(index, node) {
		$('#fileShow').attr('href',$(node).data("fileUrl"));
		$('#fileShow').html($(node).data("fileName")+ "."+ $(node).data("fileType"));
		$('#pjGuifantuji-info_ffilename').val($(node).data("fileName")+ "."+ $(node).data("fileType"));
		$('#pjGuifantuji-info_ffileurl').val($(node).data("fileUrl"));
	});
	
	$(".uploadModal").modal('hide');
}
    </script>
  </head>

  <body>
    <%@include file="/header.jsp"%>

    <div class="row-fluid">
	  <%@include file="/menu/gcgl-workspace.jsp"%>

	  <!-- start of main -->
      <section id="m-main" class="span10">
  <%@include file="../comm/comm-upload.jsp"%>
      <article class="m-widget">
        <header class="header">
		  <h4 class="title"><spring:message code="pjCheckdinfe-info.pjCheckdinfe-info.input.title" text="编辑" /></h4>
		</header>

		<div class="content content-inner">

<form id="pjCheckdinfe-infoForm" method="post" action="pjCheckdinfe-info-save.do" class="form-horizontal">
  <c:if test="${model != null}">
	  <input id="pjCheckdinfe-info_id" type="hidden" name="fid" value="${model.fid}">
  </c:if>
			    	<div class="control-group">
				    <label class="control-label" for="pjCheckdinfe-info_fcheckcode"><spring:message code="pjCheckdinfe-info.pjCheckdinfe-info.input.fcheckcode" text="代码"/></label>
					<div class="controls">
					  	 <input id="pjCheckdinfe-info_fcheckcode" type="text" name="fcheckcode" value="${model.fcheckcode}" size="" class="text " minlength="" maxlength="">	
				    </div>
				  </div>
			    	<div class="control-group">
				    <label class="control-label" for="pjCheckdinfe-info_fcheckname"><spring:message code="pjCheckdinfe-info.pjCheckdinfe-info.input.fcheckname" text="检查名称"/></label>
					<div class="controls">
					  	 <input id="pjCheckdinfe-info_fcheckname" type="text" name="fcheckname" value="${model.fcheckname}" size="" class="text " minlength="" maxlength="">	
				    </div>
				  </div>
			    	<div class="control-group">
				    <label class="control-label" for="pjCheckdinfe-info_fresulttype"><spring:message code="pjCheckdinfe-info.pjCheckdinfe-info.input.fresulttype" text="结果类型"/></label>
					<div class="controls">
				      	 <select class="form-control" id="pjCheckdinfe-info_fresulttype" name="fresulttype" value="${model.fresulttype}" class=" " >
					    	 	<option value="选项"  <c:if test="${model.fresulttype}=='选项'}"> selected="selected"  </c:if>>选项</option>
					    	 	<option value="文字描述"  <c:if test="${model.fresulttype}=='文字描述'}"> selected="selected"  </c:if>>文字描述</option>
					 	</select>
				    </div>
				  </div>
			    	<div class="control-group">
				    <label class="control-label" for="pjCheckdinfe-info_fresultselect"><spring:message code="pjCheckdinfe-info.pjCheckdinfe-info.input.fresultselect" text="备选值"/></label>
					<div class="controls">
					  	 <input id="pjCheckdinfe-info_fresultselect" type="text" name="fresultselect" value="${model.fresultselect}" size="" class="text " minlength="" maxlength="">	
				    </div>
				  </div>
			    	<div class="control-group upload">
				    <label class="control-label" for="pjCheckdinfe-info_fchecktype"><spring:message code="pjCheckdinfe-info.pjCheckdinfe-info.input.fchecktype" text="检查类型"/></label>
					<div class="controls">
					  	<input id="pjCheckdinfe-info_fchecktype" type="text" name="fchecktype" value="${model.fchecktype}" size="" class="number   " minlength="" maxlength="">
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
