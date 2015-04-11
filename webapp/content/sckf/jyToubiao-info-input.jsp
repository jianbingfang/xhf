<%@page contentType="text/html;charset=UTF-8"%>
<%@include file="/taglibs.jsp"%>
<%pageContext.setAttribute("currentHeader", "sckf-home");%>
<%pageContext.setAttribute("currentMenu", "sckf-nytz");%>
<!doctype html>
<html lang="zh">

  <head>
    <%@include file="/common/meta.jsp"%>
    <title><spring:message code="jyToubiao-info.jyToubiao-info.input.title" text="编辑"/></title>
    <%@include file="/common/s.jsp"%>
    <script type="text/javascript">
$(function() {
    $("#jyToubiao-infoForm").validate({
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



	//在页面定义怎么使用 缓存数据
	function getFiles() {
		var filesIndex = $('#filesUl').children('li[litype="new"]').length;
		$.each($('.files').children(),
				function(index, node) {
					$('#jyXm-info_ffilename').val($(node).data("fileName")+ "."+ $(node).data("fileType"));
					$('#jyXm-info_ffileurl').val($(node).data("fileUrl"));
		});
		$(".uploadModal").modal('hide');
	}
    </script>
  </head>

  <body>
    <%@include file="/header.jsp"%>

    <div class="row-fluid">
    
  
    
	  <%@include file="/menu/sckf-workspace.jsp"%>

	  <!-- start of main -->
      <section id="m-main" class="span10">
  <%@include file="../comm/comm-upload.jsp"%>
      <article class="m-widget">
        <header class="header">
		  <h4 class="title"><spring:message code="jyToubiao-info.jyToubiao-info.input.title" text="编辑" /></h4>
		</header>

		<div class="content content-inner">

<form id="jyToubiao-infoForm" method="post" action="jyToubiao-info-save.do" class="form-horizontal">
  <c:if test="${model != null}">
	  <input id="jyToubiao-info_id" type="hidden" name="fid" value="${model.fid}">
  </c:if>
			    	<div class="control-group">
				    <label class="control-label" for="jyToubiao-info_fname"><spring:message code="jyToubiao-info.jyToubiao-info.input.fname" text="台账名称"/></label>
					<div class="controls">
					  	 <input id="jyToubiao-info_fname" type="text" name="fname" value="${model.fname}" size="" class="text required" minlength="" maxlength="">	
				    </div>
				  </div>
			    	<div class="control-group">
				    <label class="control-label" for="jyToubiao-info_fweizhi"><spring:message code="jyToubiao-info.jyToubiao-info.input.fweizhi" text="放置位置"/></label>
					<div class="controls">
					  	 <input id="jyToubiao-info_fweizhi" type="text" name="fweizhi" value="${model.fweizhi}" size="" class="text required" minlength="" maxlength="">	
				    </div>
				  </div>
				  	<div class="control-group">
				    <label class="control-label" for="jyToubiao-info_finfo"><spring:message code="jyToubiao-info.jyToubiao-info.input.finfo" text="放置位置"/></label>
					<div class="controls">
					  	 <input id="jyToubiao-info_finfo" type="text" name="finfo" value="${model.finfo}" size="" class="text required" minlength="" maxlength="">	
				    </div>
				  </div>
				  	<div class="control-group">
				    <label class="control-label" for="jyToubiao-info_fweizhi"><spring:message code="jyToubiao-info.jyToubiao-info.input.fweizhi" text="附件"/></label>
					<div class="controls">
							<input id="jyXm-info_ffilename" type="text" name="ffilename"
								value="${model.ffilename}" size="" class="text" 
								minlength="" maxlength="">
								<input id="jyXm-info_ffileurl" type="hidden" name="ffileurl"
								value="${model.ffileurl}" size="" class="text "
								minlength="" maxlength="">
							<a id="jyXm-info_fbmzlDown"  class="btn"  href="javascript:void(0)"
												target="_blank" onclick="showUpload()">上传</a>
							<a id="jyXm-info_fbmzlDown"  class="btn"  href="${model.ffileurl}"
												target="_blank">下载</a>
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
