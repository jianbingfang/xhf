<%@page contentType="text/html;charset=UTF-8"%>
<%@include file="/taglibs.jsp"%>
<%pageContext.setAttribute("currentHeader", "gh-home");%>
<%pageContext.setAttribute("currentMenu", "gh-xw");%>
<!doctype html>
<html lang="zh">

  <head>
    <%@include file="/common/meta.jsp"%>
    <title><spring:message code="news-info.news-info.input.title" text="编辑"/></title>
    <%@include file="/common/s.jsp"%>
    	<script type="text/javascript" src="${ctx}/s/ckeditor/ckeditor.js"></script>
    <link type="text/css" rel="stylesheet"
	href="${scopePrefix}/s/xthena/rypicker/rypicker.css">
<script type="text/javascript"
	src="${scopePrefix}/s/xthena/rypicker/rypicker.js"></script>
    <script type="text/javascript">
$(function() {
    $("#news-infoForm").validate({
        submitHandler: function(form) {
			bootbox.animate(false);
			var box = bootbox.dialog('<div class="progress progress-striped active" style="margin:0px;"><div class="bar" style="width: 100%;"></div></div>');
            form.submit();
        },
        errorClass: 'validate-error'
    });
    createryPicker({
		modalId : 'ryPicker',
		url : '${scopePrefix}/hr/commRy-simple-list.do'
	});
    var editor = CKEDITOR.replace('news-info_fmemo');
	// editorObj.config.filebrowserImageUploadUrl = dir + "core/connector/" + ckfinder.ConnectorLanguage + "/connector." + ckfinder.ConnectorLanguage + "?command=QuickUpload&type=" + ( imageType || 'Images' ) ;
	editor.config.filebrowserImageUploadUrl = "${scopePrefix}/comm/editor-article-uploadImage.do";
	editor.config.height = 800;
})
    </script>
  </head>

  <body>
    <%@include file="/header.jsp"%>

    <div class="row-fluid">
	 	   <%@include file="/menu/gh-workspace.jsp"%>

	  <!-- start of main -->
      <section id="m-main" class="span10">

      <article class="m-widget">
        <header class="header">
		  <h4 class="title"><spring:message code="news-info.news-info.input.title" text="编辑" /></h4>
		</header>

		<div class="content content-inner">

<form id="news-infoForm" method="post" action="gh-news-info-input.do?ftype=4" class="form-horizontal">
  <c:if test="${model != null}">
	  <input id="news-info_id" type="hidden" name="fid" value="${model.fid}">
  </c:if>
			    	<div class="control-group">
				    <label class="control-label" for="news-info_fname"><spring:message code="news-info.news-info.input.fname" text="新闻标题"/></label>
					<div class="controls">
					  	 <input id="news-info_fname" type="text" name="fname" value="${model.fname}" size="" class="text required" minlength="" maxlength="">	
				    </div>
				  </div>
			    	<div class="control-group">
				    <label class="control-label" for="news-info_fdate"><spring:message code="news-info.news-info.input.fdate" text="发文时间"/></label>
					<div class="controls">
				      	 <div class="input-append datepicker date" style="padding-left: 0px;">
					    	<input id="news-info_fdate" type="text" name="fdate" value="${model.fdate}" size="40" class="text "   style="background-color:white;cursor:default; width: 175px;">
					 		 <span class="add-on" style="padding-top: 2px; padding-bottom: 2px;"><i class="icon-calendar"></i></span>
					 	 </div>
				    </div>
				  </div>
			    	<div class="control-group">
				    <label class="control-label" for="news-info_fbjren"><spring:message code="news-info.news-info.input.fbjren" text="编辑人"/></label>
					<div class="controls">
					  	<div class="input-append ryPicker">
									<input id="ryBxRecord-info_fryid" type="hidden" name="fbjren"
										value="${model.fbjren}"> <input
										id="ryBxRecord-info_userName" type="text" value="${ryMap[model.fbjren].fname}"
										disabled class=" required" style="width: 175px;" value="">
									<span class="add-on"
										style="padding-top: 2px; padding-bottom: 2px;"><i
										class="icon-user"></i></span>
								</div>
				    </div>
				  </div>
			    	<div class="control-group">
				    <label class="control-label" for="news-info_fmemo"><spring:message code="news-info.news-info.input.fmemo" text="正文"/></label>
					<div class="controls">
				      	<textarea id="news-info_fmemo"  name="fmemo"  class="form-control" rows="6"  style="width: 560px" class="text  "  minlength="" maxlength="400">${model.fmemo}</textarea>
				    </div>
				  </div>
			    <%-- 	<div class="control-group">
				    <label class="control-label" for="news-info_fmemo1"><spring:message code="news-info.news-info.input.fmemo1" text="备注1"/></label>
					<div class="controls">
				      	<textarea id="news-info_fmemo1"  name="fmemo1"  class="form-control" rows="6"  style="width: 560px" class="text  "  minlength="" maxlength="400">${model.fmemo1}</textarea>
				    </div>
				  </div>
			    	<div class="control-group">
				    <label class="control-label" for="news-info_fmemo2"><spring:message code="news-info.news-info.input.fmemo2" text="备注2"/></label>
					<div class="controls">
				      	<textarea id="news-info_fmemo2"  name="fmemo2"  class="form-control" rows="6"  style="width: 560px" class="text  "  minlength="" maxlength="400">${model.fmemo2}</textarea>
				    </div>
				  </div> --%>
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
