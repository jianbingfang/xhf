<%@page contentType="text/html;charset=UTF-8"%>
<%@include file="/taglibs.jsp"%>
<%pageContext.setAttribute("currentHeader", "gcgl-home");%>
<%pageContext.setAttribute("currentMenu", "gcgl-jlb");%>
<!doctype html>
<html lang="zh">

  <head>
    <%@include file="/common/meta.jsp"%>
    <title><spring:message code="pjPxjcjlTemplat-info.pjPxjcjlTemplat-info.input.title" text="编辑"/></title>
    <%@include file="/common/s.jsp"%>
    <script type="text/javascript" src="${ctx}/s/ckeditor/ckeditor.js"></script>
    <script type="text/javascript">
$(function() {
    $("#pjPxjcjlTemplat-infoForm").validate({
        submitHandler: function(form) {
			bootbox.animate(false);
			var box = bootbox.dialog('<div class="progress progress-striped active" style="margin:0px;"><div class="bar" style="width: 100%;"></div></div>');
            form.submit();
        },
        errorClass: 'validate-error'
    });
    
	var editor = CKEDITOR.replace('pjPxjcjlTemplat-info_fcontent');
	// editorObj.config.filebrowserImageUploadUrl = dir + "core/connector/" + ckfinder.ConnectorLanguage + "/connector." + ckfinder.ConnectorLanguage + "?command=QuickUpload&type=" + ( imageType || 'Images' ) ;
	editor.config.filebrowserImageUploadUrl = "${scopePrefix}/comm/editor-article-uploadImage.do";
	editor.config.height = 800;
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
		  <h4 class="title"><spring:message code="pjPxjcjlTemplat-info.pjPxjcjlTemplat-info.input.title" text="编辑" /></h4>
		</header>

		<div class="content content-inner">

<form id="pjPxjcjlTemplat-infoForm" method="post" action="pjPxjcjlTemplat-info-save.do" class="form-horizontal">
  <c:if test="${model != null}">
	  <input id="pjPxjcjlTemplat-info_id" type="hidden" name="fid" value="${model.fid}">
  </c:if>
			    	<div class="control-group">
				    <label class="control-label" for="pjPxjcjlTemplat-info_fname"><spring:message code="pjPxjcjlTemplat-info.pjPxjcjlTemplat-info.input.fname" text="台账名称"/></label>
					<div class="controls">
					  	 <input id="pjPxjcjlTemplat-info_fname" type="text" name="fname" value="${model.fname}" size="" class="text" minlength="" maxlength="">
				    </div>
				  </div>
			    	<div class="control-group">
				    <label class="control-label" for="pjPxjcjlTemplat-info_fcontent"><spring:message code="pjPxjcjlTemplat-info.pjPxjcjlTemplat-info.input.fcontent" text="台账内容"/></label>
					<div class="controls">
				      	<textarea id="pjPxjcjlTemplat-info_fcontent"  name="fcontent"  class="form-control" rows="6"  style="width: 560px" class="text  "  minlength="" maxlength="4,000">${model.fcontent}</textarea>
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
