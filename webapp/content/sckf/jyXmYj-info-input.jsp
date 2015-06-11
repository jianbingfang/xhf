<%@page contentType="text/html;charset=UTF-8"%>
<%@include file="/taglibs.jsp"%>
<%pageContext.setAttribute("currentHeader", "sckf-home");%>
<%pageContext.setAttribute("currentMenu", "jyXmYj");%>
<!doctype html>
<html lang="zh">

  <head>
    <%@include file="/common/meta.jsp"%>
    <title><spring:message code="jyXmYj-info.jyXmYj-info.input.title" text="编辑"/></title>
    <%@include file="/common/s.jsp"%>
    <script type="text/javascript" src="${ctx}/s/ckeditor/ckeditor.js"></script>
    
    <link type="text/css" rel="stylesheet"
	href="${scopePrefix}/s/xthena/rypicker/rypicker.css">
<script type="text/javascript"
	src="${scopePrefix}/s/xthena/rypicker/rypicker.js"></script>
	
    <script type="text/javascript">
$(function() {
    $("#jyXmYj-infoForm").validate({
        submitHandler: function(form) {
			bootbox.animate(false);
			var box = bootbox.dialog('<div class="progress progress-striped active" style="margin:0px;"><div class="bar" style="width: 100%;"></div></div>');
            form.submit();
        },
        errorClass: 'validate-error'
    });
    
	
	loadEditor();
	
	createryPicker({
		modalId : 'ryPicker',
		url : '${scopePrefix}/hr/commRy-simple-list.do'
	});
})

function loadEditor(){
		editor = CKEDITOR.replace('jyXmYj-info_ftbry');
		editor.config.filebrowserImageUploadUrl = "${scopePrefix}/comm/editor-article-uploadImage.do";
		editor.config.width = 700;
		editor.config.height = 300; 
	}
    </script>
  </head>

  <body>
    <%@include file="/header.jsp"%>

    <div class="row-fluid">
	  <%@include file="/menu/sckf-workspace.jsp"%>

	  <!-- start of main -->
      <section id="m-main" class="span10">

      <article class="m-widget">
        <header class="header">
		  <h4 class="title"><spring:message code="jyXmYj-info.jyXmYj-info.input.title" text="编辑" /></h4>
		</header>

		<div class="content content-inner">

<form id="jyXmYj-infoForm" method="post" action="jyXmYj-info-save.do" class="form-horizontal">
  <c:if test="${model != null}">
	  <input id="jyXmYj-info_id" type="hidden" name="fid" value="${model.fid}">
  </c:if>
  	  <input type="hidden" name="fxmid" value="${xm.fid}">
				   <div class="control-group">
				  <label class="control-label" for="jyXmYj-info_fyijiaostatus"><spring:message code="jyXmYj-info.jyXmYj-info.input.fyijiaostatus" text="项目名称"/></label>
					<div class="controls">
				      	<input  type="text" readonly="readonly" value="${xm.fname}" size=""  >
				    </div>
				  </div>
				  
				   <div class="control-group">
				    <label class="control-label" for="jyXmYj-info_fyijiaostatus"><spring:message code="jyXmYj-info.jyXmYj-info.input.fyijiaostatus" text="业主单位"/></label>
					<div class="controls">
				      		<input  type="text" readonly="readonly" value="${xm.fjsdw}" size=""  >
				    </div>
				  </div>
				  

				   <div class="control-group">
				    <label class="control-label" for="jyXmYj-info_fzj"><spring:message code="jyXmYj-info.jyXmYj-info.input.fzj" text="总监"/></label>
					<div class="controls">
				      		<div class="input-append ryPicker">
									<input id="ryBxRecord-info_fzj" type="hidden"
										value="${xm.fzj}" name="fzj"> <input
										id="ryBxRecord-info_userName_text" type="text"
										value="${ryMap[xm.fzj].fname}" disabled class=" "
										style="width: 100px;" > <span class="add-on"
										style="padding-top: 2px; padding-bottom: 2px;"><i
										class="icon-user"></i></span>
								</div>
				    </div>
				  </div>
				  
				   <div class="control-group">
				    <label class="control-label" for="jyXmYj-info_fyijiaostatus"><spring:message code="jyXmYj-info.jyXmYj-info.input.fyijiaostatus" text="投资额"/></label>
					<div class="controls">
					    	 	<input  type="text" readonly="readonly" value="${xm.ftze}" size=""  >
				    </div>
				  </div>
			       <div class="control-group">
				    <label class="control-label" for="jyXmYj-info_fyijiaostatus"><spring:message code="jyXmYj-info.jyXmYj-info.input.fyijiaostatus" text="规模"/></label>
					<div class="controls">
						<input  type="text" readonly="readonly"  value="${xm.fscale}" size=""  >
				    </div>
				  </div>
			      <div class="control-group">
				    <label class="control-label" for="jyXmYj-info_fyijiaostatus"><spring:message code="jyXmYj-info.jyXmYj-info.input.fyijiaostatus" text="地址"/></label>
					<div class="controls">
						<input  type="text" readonly="readonly" value="${xm.fprovince}${xm.fcity}" size=""  >
				    </div>
				  </div>

		      	<div class="control-group">
				    <label class="control-label" for="jyXmYj-info_fyijiaostatus"><spring:message code="jyXmYj-info.jyXmYj-info.input.fyijiaostatus" text="移交状态"/></label>
					<div class="controls">
				      	 <select class="form-control" id="jyXmYj-info_fyijiaostatus" name="fyijiaostatus" value="${model.fyijiaostatus}" class=" " >
					    	 	<option value="未移交"   >未移交</option>
					    	 	<option value="已移交"  <c:if test="${model.fyijiaostatus}=='已移交'}"> selected="selected"  </c:if>>已移交</option>
					 	</select>
				    </div>
				</div>

			      <div class="control-group">
				    <label class="control-label" for="jyXmYj-info_ffankui"><spring:message code="jyXmYj-info.jyXmYj-info.input.ffankui" text="反馈"/></label>
					<div class="controls">
				      	<textarea id="jyXmYj-info_ffankui"  name="ffankui"  class="form-control" rows="6"  style="width: 560px" class="text  "  minlength="" maxlength="500">${model.ffankui}</textarea>
				    </div>
				  </div>
			      
			      <div class="control-group">
				    <label class="control-label" for="jyXmYj-info_ftbry"><spring:message code="jyXmYj-info.jyXmYj-info.input.ftbry" text="投标人员"/></label>
					<div class="controls">
				      	<textarea id="jyXmYj-info_ftbry"  name="ftbry"  class="form-control" rows="6"  style="width: 560px" class="text  "  minlength="" maxlength="500">${model.ftbry}</textarea>
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
