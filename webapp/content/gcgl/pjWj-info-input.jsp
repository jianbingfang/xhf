<%@page contentType="text/html;charset=UTF-8"%>
<%@include file="/taglibs.jsp"%>
<%pageContext.setAttribute("currentHeader", "gcgl-home");%>
<%pageContext.setAttribute("currentMenu", "gcgl-ny");%>
<!doctype html>
<html lang="zh">

  <head>
    <%@include file="/common/meta.jsp"%>
    <title><spring:message code="pjWj-info.pjWj-info.input.title" text="编辑"/></title>
    <%@include file="/common/s.jsp"%>
    <script type="text/javascript">
$(function() {
    $("#pjWj-infoForm").validate({
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
    <%@include file="/header.jsp"%>

    <div class="row-fluid">
	  <%@include file="/menu/gcgl-workspace.jsp"%>
		<%@include file="../comm/comm-upload.jsp"%>
	  <!-- start of main -->
      <section id="m-main" class="span10">
		<div class="row-fluid">
					<div class="span12">
						<ul class="breadcrumb">
							<li><a href="gcgl-home.do">工程管理</a> <span class="divider">/</span>
							</li>
							<li>内业管理<span class="divider">/</span>
							</li>
							<li class="active">上级文件</li>
						</ul>
					</div>
				</div>
      <article class="m-widget">
        <header class="header">
		  <h4 class="title"><spring:message code="pjWj-info.pjWj-info.input.title" text="编辑" /></h4>
		</header>

		<div class="content content-inner">

<form id="pjWj-infoForm" method="post" action="pjWj-info-save.do" class="form-horizontal">
  <c:if test="${model != null}">
	  <input id="pjWj-info_id" type="hidden" name="fid" value="${model.fid}">
  </c:if>
			    	<div class="control-group">
				    <label class="control-label" for="pjWj-info_fwenjianno"><spring:message code="pjWj-info.pjWj-info.input.fwenjianno" text="序号"/></label>
					<div class="controls">
					  	 <input id="pjWj-info_fwenjianno" type="text" name="fwenjianno" value="${model.fwenjianno}" size="" class="text required" minlength="" maxlength="">	
				    </div>
				  </div>
			    	<div class="control-group">
				    <label class="control-label" for="pjWj-info_fzhuti"><spring:message code="pjWj-info.pjWj-info.input.fzhuti" text="主题"/></label>
					<div class="controls">
					  	 <input id="pjWj-info_fzhuti" type="text" name="fzhuti" value="${model.fzhuti}" size="" class="text required" minlength="" maxlength="">	
				    </div>
				  </div>
			    	<div class="control-group">
				    <label class="control-label" for="pjWj-info_ffabudate"><spring:message code="pjWj-info.pjWj-info.input.ffabudate" text="发布时间"/></label>
					<div class="controls">
				      	 <div class="input-append datepicker date" style="padding-left: 0px;">
					    	<input id="pjWj-info_ffabudate" type="text" name="ffabudate" value="${model.ffabudate}" size="40" class="text "   style="background-color:white;cursor:default; width: 175px;">
					 		 <span class="add-on" style="padding-top: 2px; padding-bottom: 2px;"><i class="icon-calendar"></i></span>
					 	 </div>
				    </div>
				  </div>
			    <%-- 	<div class="control-group">
				    <label class="control-label" for="pjWj-info_fshengxiaodate"><spring:message code="pjWj-info.pjWj-info.input.fshengxiaodate" text="生效时间"/></label>
					<div class="controls">
				      	 <div class="input-append datepicker date" style="padding-left: 0px;">
					    	<input id="pjWj-info_fshengxiaodate" type="text" name="fshengxiaodate" value="${model.fshengxiaodate}" size="40" class="text "   style="background-color:white;cursor:default; width: 175px;">
					 		 <span class="add-on" style="padding-top: 2px; padding-bottom: 2px;"><i class="icon-calendar"></i></span>
					 	 </div>
				    </div>
				  </div> --%>
				  
				<%--   	<div class="control-group">
				    <label class="control-label" for="pjWj-info_fdanwei"><spring:message code="pjWj-info.pjWj-info.input.fdanwei" text="单位"/></label>
					<div class="controls">
					  	 <input id="pjWj-info_fdanwei" type="text" name="fdanwei" value="${model.fdanwei}" size="" class="text required" minlength="" maxlength="">	
				    </div>
				  </div>
				   --%>
				    	<div class="control-group">
				    <label class="control-label" for="pjWj-info_fwebrul"><spring:message code="pjWj-info.pjWj-info.input.fwebrul" text="网页链接"/></label>
					<div class="controls">
				      	<input id="pjWj-info_fwebrul"  name="fwebrul"  class="form-control" rows="6"  style="width: 560px" class="text  "  minlength="" maxlength="500" value="${model.fwebrul}">
				    </div>
				  </div>
				  
			    	<div class="control-group">
				    <label class="control-label" for="pjWj-info_fcontent"><spring:message code="pjWj-info.pjWj-info.input.fcontent" text="文件"/></label>
					<div class="controls">
						<div><div style="float: left;" divFIndex="0">
								<a class="btn btn-link" id="fileShowa" href="${model.ffileurl}" >${model.ffilename}</a>
										<input id="fileNameInput" type="hidden" name="ffilename" value="${model.ffilename}">
										<input id="fileUrlInput" type="hidden" name="ffileurl" value="${model.ffileurl}">
							</div>
								<a  class="btn btn-link" href="javaScript:void(0)" onclick="showUpload()">上传</a>
							</div>
				      <%-- 	<textarea id="pjWj-info_fcontent"  name="fcontent"  class="form-control" rows="6"  style="width: 560px" class="text  "  minlength="" maxlength="4,000">${model.fcontent}</textarea> --%>
				    </div>
				  </div>
				  
				  	<div class="control-group">
				    <label class="control-label" for="pjWj-info_fmemo"><spring:message code="pjWj-info.pjWj-info.input.fmemo" text="备注"/></label>
					<div class="controls">
				      	<textarea id="pjWj-info_fmemo"  name="fmemo"  class="form-control" rows="6"  style="width: 560px" class="text  "  minlength="" maxlength="4,000">${model.fmemo}</textarea>
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
