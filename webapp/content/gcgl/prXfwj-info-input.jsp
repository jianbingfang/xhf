<%@page contentType="text/html;charset=UTF-8"%>
<%@include file="/taglibs.jsp"%>
<%pageContext.setAttribute("currentHeader", "gcgl-home");%>
<%pageContext.setAttribute("currentMenu", "gcgl-ny");%>
<!doctype html>
<html lang="zh">

  <head>
    <%@include file="/common/meta.jsp"%>
    <title><spring:message code="prXfwj-info.prXfwj-info.input.title" text="编辑"/></title>
    <%@include file="/common/s.jsp"%>
    
        	<link type="text/css" rel="stylesheet"
	href="${scopePrefix}/s/xthena/rypicker/rypicker.css">
<script type="text/javascript"
	src="${scopePrefix}/s/xthena/rypicker/rypicker.js"></script>
	
	
    <script type="text/javascript">
$(function() {
    $("#prXfwj-infoForm").validate({
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
	 
	$("#confirmBtn").click(function() {
		getFiles();
	});
	
})

	//在页面定义怎么使用 缓存数据
	function getFiles() {
		var filesIndex = $('#filesUl').children('li[litype="new"]').length;
		$
				.each(
						$('.files').children(),
						function(index, node) {
							$('#fileNameInput').val($(node).data("fileName")+ "."+ $(node).data("fileType"));
							$('#fileUrlInput').val($(node).data("fileUrl"));
							$('#fileShowa').attr('href',$(node).data("fileUrl"));
							$('#fileShowa').html($(node).data("fileName")+ "."+ $(node).data("fileType"));
						});
		$(".uploadModal").modal('hide');
	}
    </script>
  </head>

  <body>

    <div class="row-fluid">
	<%@include file="../comm/comm-upload.jsp"%>
	  <!-- start of main -->

      <article class="m-widget">
        <header class="header">
		  <h4 class="title"><spring:message code="prXfwj-info.prXfwj-info.input.title" text="编辑" /></h4>
		</header>

		<div class="content content-inner">

<form id="prXfwj-infoForm" method="post" action="prXfwj-info-save.do" class="form-horizontal">
  <c:if test="${model != null}">
	  <input id="prXfwj-info_id" type="hidden" name="fid" value="${model.fid}">
  </c:if>
			    	<div class="control-group">
				    <label class="control-label" for="prXfwj-info_fwjno"><spring:message code="prXfwj-info.prXfwj-info.input.fwjno" text="序号"/></label>
					<div class="controls">
					  	 <input id="prXfwj-info_fwjno" type="text" name="fwjno" value="${model.fwjno}" size="" class="text required" minlength="" maxlength="">	
				    </div>
				  </div>
				  <div class="control-group">
				    <label class="control-label" for="prXfwj-info_fname"><spring:message code="prXfwj-info.prXfwj-info.input.fname" text="名称"/></label>
					<div class="controls">
						<input id="prXfwj-info_fname" type="text" name="fname" value="${model.fname}" size="" class="text required" minlength="" maxlength="">
							<%-- <div class="input-append ryPicker">
									<input id="ryBxRecord-info_fryid" type="hidden" name="fjingbanrenid"
										value="${model.fjingbanrenid}"> <input
										id="ryBxRecord-info_userName" type="text" value="${ryMap[model.fjingbanrenid].fname}"
										disabled class=" required" style="width: 175px;" value="">
									<span class="add-on"
										style="padding-top: 2px; padding-bottom: 2px;"><i
										class="icon-user"></i></span>
								</div> --%>
				    </div>
				  </div>
			    	<div class="control-group">
				    <label class="control-label" for="prXfwj-info_ffabudate"><spring:message code="prXfwj-info.prXfwj-info.input.ffabudate" text="日期"/></label>
					<div class="controls">
				      	 <div class="input-append datepicker date" style="padding-left: 0px;">
					    	<input id="prXfwj-info_ffabudate" type="text" name="ffabudate" value="${model.ffabudate}" size="40" class="text "   style="background-color:white;cursor:default; width: 175px;">
					 		 <span class="add-on" style="padding-top: 2px; padding-bottom: 2px;"><i class="icon-calendar"></i></span>
					 	 </div>
				    </div>
				  </div>
				  <div class="control-group">
				    <label class="control-label" for="prXfwj-info_ffilename"><spring:message code="prXfwj-info.prXfwj-info.input.ffilename" text="附件"/></label>
					<div class="controls">
						<div><div style="float: left;" divFIndex="0">
								<a class="btn btn-link" id="fileShowa" href="${model.ffileurl}" >${model.ffilename}</a>
										<input id="fileNameInput" type="hidden" name="ffilename" value="${model.ffilename}">
										<input id="fileUrlInput" type="hidden" name="ffileurl" value="${model.ffileurl}">
							</div>
								<a  class="btn btn-link" href="javaScript:void(0)" onclick="showUpload()">上传</a>
							</div>
				    </div>
				  </div>
				  
			    	<div class="control-group">
				    <label class="control-label" for="prXfwj-info_fcontent"><spring:message code="prXfwj-info.prXfwj-info.input.fcontent" text="内容"/></label>
					<div class="controls">
				      	<textarea id="prXfwj-info_fcontent"  name="fcontent"  class="form-control" rows="6"  style="width: 560px" class="text  "  minlength="" maxlength="500">${model.fcontent}</textarea>
				    </div>
				  </div>
				  
				  	<div class="control-group">
				    <label class="control-label" for="prXfwj-info_fmemo"><spring:message code="prXfwj-info.prXfwj-info.input.fmemo" text="备注"/></label>
					<div class="controls">
				      	<textarea id="prXfwj-info_fmemo"  name="fmemo"  class="form-control" rows="6"  style="width: 560px" class="text  "  minlength="" maxlength="500">${model.fmemo}</textarea>
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
	</div>

  </body>

</html>
