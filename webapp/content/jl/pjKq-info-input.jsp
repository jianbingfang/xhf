<%@page contentType="text/html;charset=UTF-8"%>
<%@include file="/taglibs.jsp"%>
<%pageContext.setAttribute("currentHeader", "jl-home");%>
<%pageContext.setAttribute("currentMenu", "jl-ry");%>
<!doctype html>
<html lang="zh">

  <head>
    <%@include file="/common/meta.jsp"%>
    <title><spring:message code="jl-pjKq-info.jl-pjKq-info.input.title" text="编辑"/></title>
    <%@include file="/common/s.jsp"%>
    <script type="text/javascript">
$(function() {
    $("#jl-pjKq-infoForm").validate({
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
    
    $('.monthpicker').datepicker({
		language: 'zh_CN',
		format: 'yyyymm',
		autoclose: true,
		startView: 1,
		minViewMode: 1
	});
})

function getFiles() {
		$.each($('.files').children(),function(index, node) {
				$('#kaqbiao').html('<a class="a a-link" target="_blank" href="'+$(node).data("fileUrl")+'" >'+$(node).data("fileName")+ "."	+ $(node).data("fileType")+'</a>'
						+'<input type="hidden" name="fkqname" value="'+$(node).data("fileName")+ "."+ $(node).data("fileType")+'">'
						+'<input type="hidden" name="fkqurl" value="'+$(node).data("fileUrl")+'">');
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
		  <h4 class="title"><spring:message code="jl-pjKq-info.jl-pjKq-info.input.title" text="编辑" /></h4>
		</header>

		<div class="content content-inner">

<form id="jl-pjKq-infoForm" method="post" action="jl-pjKq-info-save.do" class="form-horizontal">
  <c:if test="${model != null}">
	  <input id="jl-pjKq-info_id" type="hidden" name="fid" value="${model.fid}">
  </c:if>
			    	<div class="control-group">
				    <label class="control-label" for="jl-pjKq-info_fyearmonth"><spring:message code="jl-pjKq-info.jl-pjKq-info.input.fyearmonth" text="年月"/></label>
					<div class="controls">
				    	<div class="input-append monthpicker date"
								style="padding-left: 0px;">
								<input id="jljindugenzong-info_fyearmonth" type="text"
									name="fyearmonth" value="${model.fyearmonth}" size="40"
									class="text "
									style="background-color:white;cursor:default; width: 175px;">
								<span class="add-on"
									style="padding-top: 2px; padding-bottom: 2px;"><i
									class="icon-calendar"></i></span>
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

      </section>
	  <!-- end of main -->
	</div>

  </body>

</html>
