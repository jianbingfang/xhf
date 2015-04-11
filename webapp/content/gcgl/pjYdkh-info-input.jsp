<%@page contentType="text/html;charset=UTF-8"%>
<%@include file="/taglibs.jsp"%>
<%pageContext.setAttribute("currentHeader", "gcgl-home");%>
<%pageContext.setAttribute("currentMenu", "gcgl-xmry");%>
<!doctype html>
<html lang="zh">

  <head>
    <%@include file="/common/meta.jsp"%>
    <title><spring:message code="pjYdkh-info.pjYdkh-info.input.title" text="编辑"/></title>
    <%@include file="/common/s.jsp"%>
    <script type="text/javascript">
$(function() {
    $("#pjYdkh-infoForm").validate({
        submitHandler: function(form) {
			bootbox.animate(false);
			var box = bootbox.dialog('<div class="progress progress-striped active" style="margin:0px;"><div class="bar" style="width: 100%;"></div></div>');
            form.submit();
        },
        errorClass: 'validate-error'
    });
})
    </script>
  </head>

  <body>
    <%@include file="/header.jsp"%>

    <div class="row-fluid">
	  <%@include file="/menu/gcgl-workspace.jsp"%>

	  <!-- start of main -->
      <section id="m-main" class="span10">
      <div class="row-fluid">
					<div class="span12">
						<ul class="breadcrumb">
							<li><a href="gcgl-home.do">工程管理</a> <span class="divider">/</span>
							</li>
							<li>项目人员管理<span class="divider">/</span>
							</li>
							<li class="active">项目人员月度考核</li>
						</ul>
					</div>
				</div>

      <article class="m-widget">
        <header class="header">
		  <h4 class="title"><spring:message code="pjYdkh-info.pjYdkh-info.input.title" text="编辑" /></h4>
		</header>

		<div class="content content-inner">

<form id="pjYdkh-infoForm" method="post" action="pjYdkh-info-save.do" class="form-horizontal">
  <c:if test="${model != null}">
	  <input id="pjYdkh-info_id" type="hidden" name="fid" value="${model.fid}">
  </c:if>
			    	<div class="control-group">
				    <label class="control-label" for="pjYdkh-info_fkhno"><spring:message code="pjYdkh-info.pjYdkh-info.input.fkhno" text="序号"/></label>
					<div class="controls">
					  	 <input id="pjYdkh-info_fkhno" type="text" name="fkhno" value="${model.fkhno}" size="" class="text required" minlength="" maxlength="">	
				    </div>
				  </div>
			    	<div class="control-group">
				    <label class="control-label" for="pjYdkh-info_fyearmonth"><spring:message code="pjYdkh-info.pjYdkh-info.input.fyearmonth" text="年月"/></label>
					<div class="controls">
					  	 <input id="pjYdkh-info_fyearmonth" type="text" name="fyearmonth" value="${model.fyearmonth}" size="" class="text required" minlength="" maxlength="">	
				    </div>
				  </div>
			    	<div class="control-group">
				    <label class="control-label" for="pjYdkh-info_fuploaddate"><spring:message code="pjYdkh-info.pjYdkh-info.input.fuploaddate" text="上传时间"/></label>
					<div class="controls">
				      	 <div class="input-append datepicker date" style="padding-left: 0px;">
					    	<input id="pjYdkh-info_fuploaddate" type="text" name="fuploaddate" value="${model.fuploaddate}" size="40" class="text "   style="background-color:white;cursor:default; width: 175px;">
					 		 <span class="add-on" style="padding-top: 2px; padding-bottom: 2px;"><i class="icon-calendar"></i></span>
					 	 </div>
				    </div>
				  </div>
			    	<div class="control-group">
				    <label class="control-label" for="pjYdkh-info_fryid"><spring:message code="pjYdkh-info.pjYdkh-info.input.fryid" text="上传人id"/></label>
					<div class="controls">
					  	<input id="pjYdkh-info_fryid" type="text" name="fryid" value="${model.fryid}" size="" class="number   " minlength="" maxlength="">
				    </div>
				  </div>
			    	<div class="control-group">
				    <label class="control-label" for="pjYdkh-info_ffilename"><spring:message code="pjYdkh-info.pjYdkh-info.input.ffilename" text="附件名称"/></label>
					<div class="controls">
					  	 <input id="pjYdkh-info_ffilename" type="text" name="ffilename" value="${model.ffilename}" size="" class="text required" minlength="" maxlength="">	
				    </div>
				  </div>
			    	<div class="control-group">
				    <label class="control-label" for="pjYdkh-info_ffileurl"><spring:message code="pjYdkh-info.pjYdkh-info.input.ffileurl" text="附件url"/></label>
					<div class="controls">
				      	<textarea id="pjYdkh-info_ffileurl"  name="ffileurl"  class="form-control" rows="6"  style="width: 560px" class="text  "  minlength="" maxlength="500">${model.ffileurl}</textarea>
				    </div>
				  </div>
			    	<div class="control-group">
				    <label class="control-label" for="pjYdkh-info_fry"><spring:message code="pjYdkh-info.pjYdkh-info.input.fry" text="上传人"/></label>
					<div class="controls">
					  	 <input id="pjYdkh-info_fry" type="text" name="fry" value="${model.fry}" size="" class="text required" minlength="" maxlength="">	
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
