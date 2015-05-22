<%@page contentType="text/html;charset=UTF-8"%>
<%@include file="/taglibs.jsp"%>
<%pageContext.setAttribute("currentHeader", "sckf-home");%>
<%pageContext.setAttribute("currentMenu", "jyXmFb");%>

<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<!doctype html>
<html lang="zh">

  <head>
    <%@include file="/common/meta.jsp"%>
    <title><spring:message code="jyXmFb-info.jyXmYj-info.input.title" text="编辑"/></title>
	  <%@include file="/common/s.jsp"%>
    <script type="text/javascript" src="${ctx}/s/ckeditor/ckeditor.js"></script>
    
    <link type="text/css" rel="stylesheet"
	href="${scopePrefix}/s/xthena/rypicker/rypicker.css">
<script type="text/javascript"
	src="${scopePrefix}/s/xthena/rypicker/rypicker.js"></script>
	
    <script type="text/javascript">
$(function() {
    $("#jyXmFb-infoForm").validate({
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
		editor = CKEDITOR.replace('jyXmFb-info_ftbry');
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
		  <h4 class="title"><spring:message code="jyXmFb-info.jyXmFb-info.input.title" text="编辑" /></h4>
		</header>

		<div class="content content-inner">

<form id="jyXmFb-infoForm" method="post" action="jyXmFb-info-save.do" class="form-horizontal">
  <c:if test="${model != null}">
	  <input id="jyXmFb-info_id" type="hidden" name="fid" value="${model.fid}">
  </c:if>
				<input type="hidden"  >

						<div class="control-group">
							<label class="control-label" for="jyXmFb-info_fyijiaostatus"><spring:message code="jyXmFb-info.jyXmFb-info.input.fyijiaostatus" text="项目名称"/></label>
							<div class="controls">
								<input  name="xiangmuName" type="text" readonly="readonly" value="${model.xiangmuName}" size=""  >
							</div>
						</div>


						<div class="control-group">
							<label class="control-label" for="jyXm-info_fkaibiaoData"><spring:message
								code="jyXm-info.jyXm-info.input.fkaibiaoData" text="开标时间" /></label>
								<div class="controls">
									<div class="input-append datetimepicker date"
				 					style="padding-left: 0px;">
									<input id="jyXm-info_fkaibiaoData" type="text"  readonly="readonly"  name="kaibiaoData" value="<fmt:formatDate value='${model.kaibiaoData}' type='date' pattern="yyyy-MM-dd HH:mm:ss"/>" size="40" class="text "
					  	 style="background-color:white;cursor:default; width: 100px;">
													<span class="add-on"
														  style="padding-top: 2px; padding-bottom: 2px;"><i
															class="icon-calendar time"></i></span>
								</div>
								</div>
						</div>





					<div class="control-group">
						<label class="control-label" for="jyXmFb-info_ffuzeren"><spring:message code="jyXmYj-info.jyXmYj-info.input.ffuzeren" text="主办人"/></label>
						<div class="controls">
							<input  name="host" type="text" readonly="readonly" value="${model.host}" size=""  >
						</div>
					</div>


			      <div class="control-group">
				    <label class="control-label" for="jyXmFb-info_ffbreason"><spring:message code="jyXmFb-info.jyXmYj-info.input.ffreason" text="废标原因"/></label>
					<div class="controls">
				      	<textarea id="jyXmFb-info_ffbreason"  name="feibiaoReason"  class="form-control" rows="6"  style="width: 560px" class="text  "  minlength="" maxlength="500">${model.feibiaoReason}</textarea>
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
