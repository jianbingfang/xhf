<%@page contentType="text/html;charset=UTF-8"%>
<%@include file="/taglibs.jsp"%>
<%pageContext.setAttribute("currentHeader", "gcgl-home");%>
<%pageContext.setAttribute("currentMenu", "gcgl-jlb");%>
<!doctype html>
<html lang="zh">

  <head>
    <%@include file="/common/meta.jsp"%>
    <title><spring:message code="gcgl-jlFlFg-info.gcgl-jlFlFg-info.input.title" text="编辑"/></title>
    <%@include file="/common/s.jsp"%>
     <script type="text/javascript" src="${ctx}/s/ckeditor/ckeditor.js"></script>
    <script type="text/javascript">
$(function() {
    $("#gcgl-jlFlFg-infoForm").validate({
        submitHandler: function(form) {
			bootbox.animate(false);
			var box = bootbox.dialog('<div class="progress progress-striped active" style="margin:0px;"><div class="bar" style="width: 100%;"></div></div>');
            form.submit();
        },
        errorClass: 'validate-error'
    });
    

	var editor = CKEDITOR.replace('gcgl-jlFlFg-info_content');
	// editorObj.config.filebrowserImageUploadUrl = dir + "core/connector/" + ckfinder.ConnectorLanguage + "/connector." + ckfinder.ConnectorLanguage + "?command=QuickUpload&type=" + ( imageType || 'Images' ) ;
	editor.config.filebrowserImageUploadUrl = "${scopePrefix}/comm/editor-article-uploadImage.do";
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
		  <h4 class="title"><spring:message code="gcgl-jlFlFg-info.gcgl-jlFlFg-info.input.title" text="编辑" /></h4>
		</header>

		<div class="content content-inner">

<form id="gcgl-jlFlFg-infoForm" method="post" action="gcgl-jlFlFg-info-save.do" class="form-horizontal">
  <c:if test="${model != null}">
	  <input id="gcgl-jlFlFg-info_id" type="hidden" name="fid" value="${model.fid}">
  </c:if>
			    	<div class="control-group">
				    <label class="control-label" for="gcgl-jlFlFg-info_ftype"><spring:message code="gcgl-jlFlFg-info.gcgl-jlFlFg-info.input.ftype" text="分类"/></label>
					<div class="controls">
					  	 <input id="gcgl-jlFlFg-info_ftype" type="text" name="ftype" value="${model.ftype}" size="" class="text required" minlength="" maxlength="">	
				    </div>
				  </div>
			    	<div class="control-group">
				    <label class="control-label" for="gcgl-jlFlFg-info_fname"><spring:message code="gcgl-jlFlFg-info.gcgl-jlFlFg-info.input.fname" text="名称"/></label>
					<div class="controls">
					  	 <input id="gcgl-jlFlFg-info_fname" type="text" name="fname" value="${model.fname}" size="" class="text required" minlength="" maxlength="">	
				    </div>
				  </div>
				  	<div class="control-group">
				    <label class="control-label" for="gcgl-jlFlFg-info_content"><spring:message code="gcgl-jlFlFg-info.gcgl-jlFlFg-info.input.content" text="内容"/></label>
					<div class="controls">
					  	 <textarea id="gcgl-jlFlFg-info_content" type="text" name="content"  class="form-control" rows="6"   style="width: 560px" class="text  required">${model.content}</textarea>	
				    </div>
				  </div>
		<%-- 	    	<div class="control-group">
				    <label class="control-label" for="gcgl-jlFlFg-info_furl"><spring:message code="gcgl-jlFlFg-info.gcgl-jlFlFg-info.input.furl" text="连接"/></label>
					<div class="controls">
				      	<input id="gcgl-jlFlFg-info_furl"  name="furl"  class="form-control" value="${model.furl}" rows="6"  style="width: 560px" class="text  "  minlength="" maxlength="512">
				    </div>
				  </div>
			    	<div class="control-group">
				    <label class="control-label" for="gcgl-jlFlFg-info_fmemo"><spring:message code="gcgl-jlFlFg-info.gcgl-jlFlFg-info.input.fmemo" text="备注"/></label>
					<div class="controls">
				      	<input id="gcgl-jlFlFg-info_fmemo"  name="fmemo"  class="form-control" rows="6"  style="width: 560px" class="text  " value="${model.fmemo}" minlength="" maxlength="512">
				    </div>
				  </div> --%>
			   <%--  	<div class="control-group">
				    <label class="control-label" for="gcgl-jlFlFg-info_fisshow"><spring:message code="gcgl-jlFlFg-info.gcgl-jlFlFg-info.input.fisshow" text="是否显示"/></label>
					<div class="controls">
					  	 <input id="gcgl-jlFlFg-info_fisshow" type="text" name="fisshow" value="${model.fisshow}" size="" class="text required" minlength="" maxlength="">	
				    </div>
				  </div> --%>
			    	<div class="control-group">
				    <label class="control-label" for="gcgl-jlFlFg-info_forder"><spring:message code="gcgl-jlFlFg-info.gcgl-jlFlFg-info.input.forder" text="显示顺序"/></label>
					<div class="controls">
					  	 <input id="gcgl-jlFlFg-info_forder" type="text" name="forder" value="${model.forder}" size="" class="text required" minlength="" maxlength="">	
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
