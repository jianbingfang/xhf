<%@page contentType="text/html;charset=UTF-8"%>
<%@include file="/taglibs.jsp"%>
<%pageContext.setAttribute("currentHeader", "jl-home");%>
<%pageContext.setAttribute("currentMenu", "jl-ry");%>
<!doctype html>
<html lang="zh">

  <head>
    <%@include file="/common/meta.jsp"%>
    <title><spring:message code="jl-pjYdkh-info.jl-pjYdkh-info.input.title" text="编辑"/></title>
    <%@include file="/common/s.jsp"%>
    <script type="text/javascript">
$(function() {
    $("#jl-pjYdkh-infoForm").validate({
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

function getFiles() {
		
		$.each($('.files').children(),function(index, node) {
				$('#kaqbiao').html('<a class="a a-link" target="_blank" href="'+$(node).data("fileUrl")+'" >'+$(node).data("fileName")+ "."	+ $(node).data("fileType")+'</a>'
						+'<input type="hidden" name="ffilename" value="'+$(node).data("fileName")+ "."+ $(node).data("fileType")+'">'
						+'<input type="hidden" name="ffileurl" value="'+$(node).data("fileUrl")+'">');
			});
		$(".uploadModal").modal('hide');
	}

    </script>
  </head>

  <body>
    <%@include file="/header.jsp"%>

    <div class="row-fluid">
	  <%@include file="/menu/jl-workspace.jsp"%>
<%@include file="../comm/comm-upload.jsp"%>
	  <!-- start of main -->
      <section id="m-main" class="span10">

      <article class="m-widget">
        <header class="header">
		  <h4 class="title"><spring:message code="jl-pjYdkh-info.jl-pjYdkh-info.input.title" text="编辑" /></h4>
		</header>

		<div class="content content-inner">

<form id="jl-pjYdkh-infoForm" method="post" action="jl-pjYdkh-info-save.do" class="form-horizontal">
  <c:if test="${model != null}">
	  <input id="jl-pjYdkh-info_id" type="hidden" name="fid" value="${model.fid}">
  </c:if>
			    	<%-- <div class="control-group">
				    <label class="control-label" for="jl-pjYdkh-info_fkhno"><spring:message code="jl-pjYdkh-info.jl-pjYdkh-info.input.fkhno" text="序号"/></label>
					<div class="controls">
					  	 <input id="jl-pjYdkh-info_fkhno" readonly="readonly" type="text" name="fkhno" value="${model.fkhno}" size="" class="text " minlength="" maxlength="">	
				    </div>
				  </div> --%>
			    	<div class="control-group">
				    <label class="control-label" for="jl-pjYdkh-info_fyearmonth"><spring:message code="jl-pjYdkh-info.jl-pjYdkh-info.input.fyearmonth" text="年月"/></label>
					<div class="controls">
					  	 <input id="jl-pjYdkh-info_fyearmonth" type="text" name="fyearmonth" value="${model.fyearmonth}" size="" class="text " minlength="" maxlength="">	
				    </div>
				  </div>
			    	<div class="control-group">
				    <label class="control-label" for="jl-pjYdkh-info_fuploaddate"><spring:message code="jl-pjYdkh-info.jl-pjYdkh-info.input.fuploaddate" text="上传时间"/></label>
					<div class="controls">
					    	<input id="jl-pjYdkh-info_fuploaddate" type="text" name="fuploaddate" value="${model.fuploaddate}" size="40" class="text "  readonly="readonly" >
				    </div>
				  </div>
				  
				  <div class="control-group">
				    <label class="control-label" for="jl-pjYdkh-info_fry"><spring:message code="jl-pjYdkh-info.jl-pjYdkh-info.input.fry" text="上传人"/></label>
					<div class="controls">
					  	 <input id="jl-pjYdkh-info_fry" type="text" name="fry" value="${model.fry}"  readonly="readonly" class="text " minlength="" maxlength="">	
				    </div>
				  </div>
			    	
			    	
			    	<div class="control-group">
				    <label class="control-label" for="jl-pjKq-info_fkqname"><spring:message code="jl-pjKq-info.jl-pjKq-info.input.fkqname" text="考核表"/></label>
					<div id="kaqbiao" class="controls">
						 <c:if test="${model.ffilename != null}">
							  <a class="a a-link" target="_blank" href="${model.ffileurl}" >${model.ffilename}</a>
						  </c:if>
						  
						   <c:if test="${model.ffilename == null||model.ffilename == ''}">
							  <a class="btn" href="javascript:void(0)" onclick="showUpload()">上传</a>
						  </c:if>
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
