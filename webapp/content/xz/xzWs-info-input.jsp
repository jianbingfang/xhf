<%@page contentType="text/html;charset=UTF-8"%>
<%@include file="/taglibs.jsp"%>
<%pageContext.setAttribute("currentHeader", "xz-home");%>
<%pageContext.setAttribute("currentMenu", "xz-ws");%>
<!doctype html>
<html lang="zh">

  <head>
    <%@include file="/common/meta.jsp"%>
    <title><spring:message code="xzWs-info.xzWs-info.input.title" text="编辑"/></title>
    <%@include file="/common/s.jsp"%>
    <script type="text/javascript" src="${ctx}/s/ckeditor/ckeditor.js"></script>
    <script type="text/javascript">
$(function() {
    $("#xzWs-infoForm").validate({
        submitHandler: function(form) {
			bootbox.animate(false);
			var box = bootbox.dialog('<div class="progress progress-striped active" style="margin:0px;"><div class="bar" style="width: 100%;"></div></div>');
            form.submit();
        },
        errorClass: 'validate-error'
    });
    var editor = CKEDITOR.replace('plain-info_fmemo1');
	// editorObj.config.filebrowserImageUploadUrl = dir + "core/connector/" + ckfinder.ConnectorLanguage + "/connector." + ckfinder.ConnectorLanguage + "?command=QuickUpload&type=" + ( imageType || 'Images' ) ;
	editor.config.filebrowserImageUploadUrl = "${scopePrefix}/comm/editor-article-uploadImage.do";

})
    </script>
  </head>
  <body>
    <%@include file="/header.jsp"%>

    <div class="row-fluid">
	  <%@include file="/menu/xz-workspace.jsp"%>

	  <!-- start of main -->
      <section id="m-main" class="span10">

      <article class="m-widget">
        <header class="header">
		  <h4 class="title"><spring:message code="xzWs-info.xzWs-info.input.title" text="编辑" /></h4>
		</header>

		<div class="content content-inner">

<form id="xzWs-infoForm" method="post" action="xzWs-info-save.do" class="form-horizontal">
  <c:if test="${model != null}">
	  <input id="xzWs-info_id" type="hidden" name="fid" value="${model.fid}">
  </c:if>
			    	<div class="control-group">
				    <label class="control-label" for="xzWs-info_fdate"><spring:message code="xzWs-info.xzWs-info.input.fdate" text="检查日期"/></label>
					<div class="controls">
				      	 <div class="input-append datepicker date" style="padding-left: 0px;">
					    	<input id="xzWs-info_fdate" type="text" name="fdate" value="${model.fdate}" size="40" class="text "   style="background-color:white;cursor:default; width: 175px;">
					 		 <span class="add-on" style="padding-top: 2px; padding-bottom: 2px;"><i class="icon-calendar"></i></span>
					 	 </div>
				    </div>
				  </div>
			    	<div class="control-group">
				    <label class="control-label" for="xzWs-info_fjczcy"><spring:message code="xzWs-info.xzWs-info.input.fjczcy" text="检查组成员"/></label>
					<div class="controls">
					  	 <input id="xzWs-info_fjczcy" type="text" name="fjczcy" value="${model.fjczcy}" size="" class="text " minlength="" maxlength="">	
				    </div>
				  </div>
			    	<div class="control-group">
				    <label class="control-label" for="xzWs-info_fbjbm"><spring:message code="xzWs-info.xzWs-info.input.fbjbm" text="被检部门"/></label>
					<div class="controls">
					  	 <input id="xzWs-info_fbjbm" type="text" name="fbjbm" value="${model.fbjbm}" size="" class="text " minlength="" maxlength="">	
				    </div>
				  </div>
			    	<div class="control-group">
				    <label class="control-label" for="xzWs-info_flfqk"><spring:message code="xzWs-info.xzWs-info.input.flfqk" text="得分情况"/></label>
					<div class="controls">
					  	 <input id="xzWs-info_flfqk" type="text" name="flfqk" value="${model.flfqk}" size="" class="text " minlength="" maxlength="">	
				    </div>
				  </div>
			    	<div class="control-group">
				    <label class="control-label" for="xzWs-info_fpjjg"><spring:message code="xzWs-info.xzWs-info.input.fpjjg" text="评比结果"/></label>
					<div class="controls">
					  	 <textarea id="xzWs-info_fpjjg"  name="fpjjg"  row="3 " class="text "  maxlength="4000">${model.fpjjg}</textarea>	
				    </div>
				  </div>
			    	<div class="control-group hidden">
				    <label class="control-label" for="xzWs-info_ftype"><spring:message code="xzWs-info.xzWs-info.input.ftype" text="检查类型"/></label>
					<div class="controls">
					  	 <input id="xzWs-info_ftype" type="text" name="ftype" value="${ftype}" size="" class="text required" minlength="" maxlength="">	
				    </div>
				  </div>
			 <%--    	<div class="control-group">
				    <label class="control-label" for="xzWs-info_fmemo"><spring:message code="xzWs-info.xzWs-info.input.fmemo" text="备注"/></label>
					<div class="controls">
					  	 <input id="xzWs-info_fmemo" type="text" name="fmemo" value="${model.fmemo}" size="" class="text required" minlength="" maxlength="">	
				    </div>
				  </div>
			    	<div class="control-group">
				    <label class="control-label" for="xzWs-info_fmemo1"><spring:message code="xzWs-info.xzWs-info.input.fmemo1" text="备注1"/></label>
					<div class="controls">
					  	 <input id="xzWs-info_fmemo1" type="text" name="fmemo1" value="${model.fmemo1}" size="" class="text required" minlength="" maxlength="">	
				    </div>
				  </div>
			    	<div class="control-group">
				    <label class="control-label" for="xzWs-info_fmemo2"><spring:message code="xzWs-info.xzWs-info.input.fmemo2" text="备注2"/></label>
					<div class="controls">
					  	 <input id="xzWs-info_fmemo2" type="text" name="fmemo2" value="${model.fmemo2}" size="" class="text required" minlength="" maxlength="">	
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
