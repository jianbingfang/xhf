<%@page contentType="text/html;charset=UTF-8"%>
<%@include file="/taglibs.jsp"%>
<%pageContext.setAttribute("currentHeader", "gcgl-home");%>
<%pageContext.setAttribute("currentMenu", "gcgl-zjhy");%>
<!doctype html>
<html lang="zh">

  <head>
    <%@include file="/common/meta.jsp"%>
    <title><spring:message code="pjHuiyi-yt-info.pjHuiyi-yt-info.input.title" text="编辑"/></title>
    <%@include file="/common/s.jsp"%>
<script type="text/javascript" src="${ctx}/s/ckeditor/ckeditor.js"></script>
    <script type="text/javascript">
$(function() {
    $("#pjHuiyi-yt-infoForm").validate({
        submitHandler: function(form) {
			bootbox.animate(false);
			var box = bootbox.dialog('<div class="progress progress-striped active" style="margin:0px;"><div class="bar" style="width: 100%;"></div></div>');
            form.submit();
        },
        errorClass: 'validate-error'
    });
    
 	var editor = CKEDITOR.replace('pjHuiyi-yt-info_fhyyc');
	// editorObj.config.filebrowserImageUploadUrl = dir + "core/connector/" + ckfinder.ConnectorLanguage + "/connector." + ckfinder.ConnectorLanguage + "?command=QuickUpload&type=" + ( imageType || 'Images' ) ;
	editor.config.filebrowserImageUploadUrl = "${scopePrefix}/comm/editor-article-uploadImage.do"; 
    
	/* var editor = CKEDITOR.replace('pjHuiyi-yt-info_fhyjy');
	// editorObj.config.filebrowserImageUploadUrl = dir + "core/connector/" + ckfinder.ConnectorLanguage + "/connector." + ckfinder.ConnectorLanguage + "?command=QuickUpload&type=" + ( imageType || 'Images' ) ;
	editor.config.filebrowserImageUploadUrl = "${scopePrefix}/comm/editor-article-uploadImage.do";
     */
	 $("#confirmBtn").click(function() {
			getFiles();
		});
	});

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
	  <!-- start of main -->

      <article class="m-widget">
        <header class="header">
		  <h4 class="title"><spring:message code="pjHuiyi-yt-info.pjHuiyi-yt-info.input.title" text="编辑" /></h4>
		</header>

		<div class="content content-inner">
 <%@include file="../comm/comm-upload.jsp"%>
<form id="pjHuiyi-yt-infoForm" method="post" action="pjHuiyi-yt-info-save.do" class="form-horizontal">
  <c:if test="${model != null}">
	  <input id="pjHuiyi-yt-info_id" type="hidden" name="fid" value="${model.fid}">
  </c:if>
  <input id="pjHuiyi-yt-info_id" type="hidden" name="fhuiytype" value="总监研讨会">
					<div class="control-group">
						<div class="span5">
					    <label class="control-label" for="pjHuiyi-yt-info_fhyname"><spring:message code="pjHuiyi-yt-info.pjHuiyi-yt-info.input.fhyname" text="名称"/></label>
						<div class="controls">
							  	 <input id="pjHuiyi-yt-info_fhyname" type="text" name="fhyname" value="${model.fhyname}" size="" class="text " minlength="" maxlength="">	
					    </div>
					  </div>
	  
						<div class="span5">
					    <label class="control-label" for="pjHuiyi-yt-info_fhydate"><spring:message code="pjHuiyi-yt-info.pjHuiyi-yt-info.input.fhydate" text="时间"/></label>
						<div class="controls">
						      	 <div class="input-append datepicker date" style="padding-left: 0px;">
							    	<input id="pjHuiyi-yt-info_fhydate" type="text" name="fhydate" value="${model.fhydate}" size="40" class="text "   style="background-color:white;cursor:default; width: 175px;">
							 		 <span class="add-on" style="padding-top: 2px; padding-bottom: 2px;"><i class="icon-calendar"></i></span>
							 	 </div>
					    </div>
					    </div>
					    </div>
					   
					   
					<%--    <div class="control-group">
					    	<div class="span5">
					    <label class="control-label" for="pjHuiyi-yt-info_fycname"><spring:message code="pjHuiyi-yt-info.pjHuiyi-yt-info.input.fycname" text="会议议程文件名"/></label>
						<div class="controls">
							  	 <input id="pjHuiyi-yt-info_fycname" type="text" name="fycname" value="${model.fycname}" size="" class="text " minlength="" maxlength="">	
					    </div>
					  </div>
	 					 <div class="span5">
					    <label class="control-label" for="pjHuiyi-yt-info_fqdbname"><spring:message code="pjHuiyi-yt-info.pjHuiyi-yt-info.input.fqdbname" text="签到表名称"/></label>
						<div class="controls">
							  	 <input id="pjHuiyi-yt-info_fqdbname" type="text" name="fqdbname" value="${model.fqdbname}" size="" class="text required" minlength="" maxlength="">	
					    </div>
					    </div>
					    </div> --%>
	  
						<div class="control-group">
						<div class="span5">
					    <label class="control-label" for="pjHuiyi-yt-info_fhyaddr"><spring:message code="pjHuiyi-yt-info.pjHuiyi-yt-info.input.fhyaddr" text="地点"/></label>
						<div class="controls">
							  	 <input id="pjHuiyi-yt-info_fhyaddr" type="text" name="fhyaddr" value="${model.fhyaddr}" size="" class="text " minlength="" maxlength="">	
					    </div>
					  </div>
	  
					    </div>
					    
					   <div class="control-group">
					    <label class="control-label" for="pjHuiyi-yt-info_fhyyc"><spring:message code="pjHuiyi-yt-info.pjHuiyi-yt-info.input.fhyyc" text="会议议程"/></label>
						<div class="controls">
						      	<textarea id="pjHuiyi-yt-info_fhyyc"  name="fhyyc"  class="form-control" rows="6"  style="width: 560px" class="text"  minlength="" maxlength="500">${model.fhyyc}</textarea>
					    </div>
					    </div>
					    
	  
						<div class="control-group">
					    <label class="control-label" for="pjHuiyi-yt-info_fhyjy"><spring:message code="pjHuiyi-yt-info.pjHuiyi-yt-info.input.fhyjy" text="会议纪要"/></label>
							<div class="controls">
								<div style="float: left;" divfindex="0">
									<a id="fileShow" class="btn btn-link" href="${model.fycurl}">${model.fycname}</a>
											<input id="pjGuifantuji-info_ffilename" type="hidden" name="fycname" value="">
											<input id="pjGuifantuji-info_ffileurl" type="hidden" name="fycurl" value="">
								</div>
								<input type="button" class="btn a-link" value="点击上传"
									onclick="showUpload()">
							      	<%-- <textarea id="pjHuiyi-yt-info_fhyjy"  name="fhyjy"  class="form-control" rows="6"  style="width: 560px" class="text"  minlength="" maxlength="500">${model.fhyjy}</textarea> --%>
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

	  <!-- end of main -->
	  </section>
	</div>

  </body>

</html>
