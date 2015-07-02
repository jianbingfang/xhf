<%@page contentType="text/html;charset=UTF-8"%>
<%@include file="/taglibs.jsp"%>
<%pageContext.setAttribute("currentHeader", "gcgl-home");%>
<%pageContext.setAttribute("currentMenu", "gcgl-jlb");%>
<!doctype html>
<html lang="zh">

  <head>
    <%@include file="/common/meta.jsp"%>
    <title><spring:message code="pjGuifantuji-info.pjGuifantuji-info.input.title" text="编辑"/></title>
    <%@include file="/common/s.jsp"%>
    <script type="text/javascript">
$(function() {
    $("#pjGuifantuji-infoForm").validate({
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
	<!-- 	<div class="row-fluid">
					<div class="span12">
						<ul class="breadcrumb">
							<li><a href="gcgl-home.do">工程管理</a> <span class="divider">/</span>
							</li>
							<li>监理部系统管理<span class="divider">/</span>
							</li>
							<li class="active">规范图集</li>
						</ul>
					</div>
				</div> -->
      <article class="m-widget">
        <header class="header">
		  <h4 class="title"><spring:message code="pjGuifantuji-info.pjGuifantuji-info.input.title" text="编辑" /></h4>
		</header>

		<div class="content content-inner">
  <%@include file="../comm/comm-upload.jsp"%>
<form id="pjGuifantuji-infoForm" method="post" action="pjGuifantuji-info-save.do" class="form-horizontal">
	  <c:if test="${model != null}">
		  <input id="pjGuifantuji-info_id" type="hidden" name="fid" value="${model.fid}">
	  </c:if>
	 	 <input id="pjGuifantuji-info_ftype" type="hidden" name="ftype" value="${model.ftype}">
			    	<div class="control-group">
				    <label class="control-label" for="pjGuifantuji-info_fname"><spring:message code="pjGuifantuji-info.pjGuifantuji-info.input.fname" text="名称"/></label>
					<div class="controls">
					  	 <input id="pjGuifantuji-info_fname" type="text" name="fname" value="${model.fname}" size="" class="text" minlength="" maxlength="">
				    </div>
				  </div>
			    <%-- 	<div class="control-group">
				    <label class="control-label" for="pjGuifantuji-info_ftype"><spring:message code="pjGuifantuji-info.pjGuifantuji-info.input.ftype" text="类型"/></label>
					<div class="controls">
					  <select class="form-control" id="pjGuifantuji-info_ftype" name="ftype" value="${model.ftype}" class=" " >
					    	 	<option value="规范"  <c:if test="${model.ftype}=='规范'}"> selected="selected"  </c:if>>规范</option>
					    	 	<option value="图集"  <c:if test="${model.ftype}=='图集'}"> selected="selected"  </c:if>>图集</option>
					 	</select>
				    </div>
				  </div> --%>
				  
				  	<div class="control-group">
							<label class="control-label" for="jlShizhong-info_fwarn"><spring:message
									code="jlShizhong-info.jlShizhong-info.input.fwarn" text="文件" /></label>
						<div class="controls">
							<div style="float: left;" divfindex="0">
								<a id="fileShow" class="btn btn-link" href="${model.ffileurl}">${model.ffilename}</a>
										<input id="pjGuifantuji-info_ffilename" type="hidden" name="ffilename" value="">
										<input id="pjGuifantuji-info_ffileurl" type="hidden" name="ffileurl" value="">
							</div>
							<input type="button" class="btn a-link" value="点击上传"
								onclick="showUpload()">
						</div>
					</div>
			<%--     	<div class="control-group">
				    <label class="control-label" for="pjGuifantuji-info_ffilename"><spring:message code="pjGuifantuji-info.pjGuifantuji-info.input.ffilename" text="文件名"/></label>
					<div class="controls">
					  	 <input id="pjGuifantuji-info_ffilename" type="text" name="ffilename" value="${model.ffilename}" size="" class="text required" minlength="" maxlength="">	
				    </div>
				  </div> --%>
			    	<%-- <div class="control-group">
				    <label class="control-label" for="pjGuifantuji-info_ffileurl"><spring:message code="pjGuifantuji-info.pjGuifantuji-info.input.ffileurl" text="文件url"/></label>
					<div class="controls">
				      	<textarea id="pjGuifantuji-info_ffileurl"  name="ffileurl"  class="form-control" rows="6"  style="width: 560px" class="text  "  minlength="" maxlength="512">${model.ffileurl}</textarea>
				    </div>
				  </div> --%>
			    	<div class="control-group">
				    <label class="control-label" for="pjGuifantuji-info_finfo"><spring:message code="pjGuifantuji-info.pjGuifantuji-info.input.finfo" text="备注"/></label>
					<div class="controls">
				      	<textarea id="pjGuifantuji-info_finfo"  name="finfo"  class="form-control" rows="6"  style="width: 560px" class="text  "  minlength="" maxlength="512">${model.finfo}</textarea>
				    </div>
				  </div>
			   <%--  	<div class="control-group">
				    <label class="control-label" for="pjGuifantuji-info_fmemo"><spring:message code="pjGuifantuji-info.pjGuifantuji-info.input.fmemo" text="备注"/></label>
					<div class="controls">
				      	<textarea id="pjGuifantuji-info_fmemo"  name="fmemo"  class="form-control" rows="6"  style="width: 560px" class="text  "  minlength="" maxlength="512">${model.fmemo}</textarea>
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
