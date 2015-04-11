<%@page contentType="text/html;charset=UTF-8"%>
<%@include file="/taglibs.jsp"%>
<%pageContext.setAttribute("currentHeader", "gcgl-home");%>
<%pageContext.setAttribute("currentMenu", "gcgl-xmda");%>
<!doctype html>
<html lang="zh">

  <head>
    <%@include file="/common/meta.jsp"%>
    <title><spring:message code="pjTemplate-info.pjTemplate-info.input.title" text="编辑"/></title>
    <%@include file="/common/s.jsp"%>
    <script type="text/javascript">
$(function() {
    $("#pjTemplate-infoForm").validate({
        submitHandler: function(form) {
			bootbox.animate(false);
			var box = bootbox.dialog('<div class="progress progress-striped active" style="margin:0px;"><div class="bar" style="width: 100%;"></div></div>');
            form.submit();
        },
        errorClass: 'validate-error'
    });
    
    var editor = CKEDITOR.replace('pjTemplate-info_fcontent');
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
<!-- 		<div class="row-fluid">
					<div class="span12">
						<ul class="breadcrumb">
							<li><a href="gcgl-home.do">工程管理</a> <span class="divider">/</span>
							</li>
							<li>项目竣工档案<span class="divider">/</span>
							</li>
							<li class="active">上传资料清单</li>
						</ul>
					</div>
				</div> -->
      <article class="m-widget">
        <header class="header">
		  <h4 class="title"><spring:message code="pjTemplate-info.pjTemplate-info.input.title" text="编辑" /></h4>
		</header>

		<div class="content content-inner">

<form id="pjTemplate-infoForm" method="post" action="pjTemplate-info-save.do" class="form-horizontal">
  <c:if test="${model != null}">
	  <input id="pjTemplate-info_id" type="hidden" name="fid" value="${model.fid}">
  </c:if>
  
						<div class="control-group">
					    <label class="control-label" for="pjTemplate-info_fname"><spring:message code="pjTemplate-info.pjTemplate-info.input.fname" text="资料名称"/></label>
						<div class="controls">
							  	 <input id="pjTemplate-info_fname" type="text" name="fname" value="${model.fname}" size="" class="text " minlength="" maxlength="">	
					    </div>
					  </div>
	  
						<div class="control-group">
					    <label class="control-label" for="pjTemplate-info_fcode"><spring:message code="pjTemplate-info.pjTemplate-info.input.fcode" text="资料代码"/></label>
						<div class="controls">
							  	 <input id="pjTemplate-info_fcode" type="text" name="fcode" value="${model.fcode}" size="" class="text " minlength="" maxlength="">	
					    </div>
					    </div>
	  
						<div class="control-group">
					    <label class="control-label" for="pjTemplate-info_fcontent"><spring:message code="pjTemplate-info.pjTemplate-info.input.fcontent" text="资料内容"/></label>
						<div class="controls">
							  	 <textarea id="pjTemplate-info_fcontent" type="text" name="fcontent"  size="" class="text " minlength="" maxlength="">${model.fcontent}</textarea>
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
