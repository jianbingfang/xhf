<%@page contentType="text/html;charset=UTF-8"%>
<%@include file="/taglibs.jsp"%>
<%pageContext.setAttribute("currentHeader", "common-home");%>
<%pageContext.setAttribute("currentMenu", "remind");%>
<!doctype html>
<html lang="zh">

  <head>
    <%@include file="/common/meta.jsp"%>
    <title><spring:message code="commRemindLog-info.commRemindLog-info.input.title" text="编辑"/></title>
    <%@include file="/common/s.jsp"%>
    <script type="text/javascript">
$(function() {
    $("#commRemindLog-infoForm").validate({
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
	  <%@include file="/menu/scope.jsp"%>

	  <!-- start of main -->
      <section id="m-main" class="span10">

      <article class="m-widget">
        <header class="header">
		  <h4 class="title"><spring:message code="commRemindLog-info.commRemindLog-info.input.title" text="编辑" /></h4>
		</header>

		<div class="content content-inner">

<form id="commRemindLog-infoForm" method="post" action="commRemindLog-info-save.do" class="form-horizontal">
  <c:if test="${model != null}">
	  <input id="commRemindLog-info_id" type="hidden" name="fid" value="${model.fid}">
  </c:if>
			    	<div class="control-group">
				    <label class="control-label" for="commRemindLog-info_fname"><spring:message code="commRemindLog-info.commRemindLog-info.input.fname" text="提醒名称"/></label>
					<div class="controls">
					  	 <input id="commRemindLog-info_fname" type="text" name="fname" value="${model.fname}" size="" class="text required" minlength="" maxlength="">	
				    </div>
				  </div>
			    	<div class="control-group">
				    <label class="control-label" for="commRemindLog-info_fremindry"><spring:message code="commRemindLog-info.commRemindLog-info.input.fremindry" text="提醒人"/></label>
					<div class="controls">
					  	<input id="commRemindLog-info_fremindry" type="text" name="fremindry" value="${model.fremindry}" size="" class="number   " minlength="" maxlength="">
				    </div>
				  </div>
			    	<div class="control-group">
				    <label class="control-label" for="commRemindLog-info_fremindtime"><spring:message code="commRemindLog-info.commRemindLog-info.input.fremindtime" text="提醒时间"/></label>
					<div class="controls">
				      	 <div class="input-append datetimepicker date" style="padding-left: 0px;">
					    	<input id="commRemindLog-info_fremindtime" type="text" name="fremindtime" value="${model.fremindtime}" size="40" class="text "   style="background-color:white;cursor:default; width: 175px;">
					 		 <span class="add-on" style="padding-top: 2px; padding-bottom: 2px;"><i class="icon-calendar"></i></span>
					 	 </div>
				    </div>
				  </div>
			    	<div class="control-group">
				    <label class="control-label" for="commRemindLog-info_fstatus"><spring:message code="commRemindLog-info.commRemindLog-info.input.fstatus" text="状态"/></label>
					<div class="controls">
					  	 <input id="commRemindLog-info_fstatus" type="text" name="fstatus" value="${model.fstatus}" size="" class="text required" minlength="" maxlength="">	
				    </div>
				  </div>
			    	<div class="control-group">
				    <label class="control-label" for="commRemindLog-info_fnexttime"><spring:message code="commRemindLog-info.commRemindLog-info.input.fnexttime" text="下次提醒时间"/></label>
					<div class="controls">
				      	 <div class="input-append datetimepicker date" style="padding-left: 0px;">
					    	<input id="commRemindLog-info_fnexttime" type="text" name="fnexttime" value="${model.fnexttime}" size="40" class="text "   style="background-color:white;cursor:default; width: 175px;">
					 		 <span class="add-on" style="padding-top: 2px; padding-bottom: 2px;"><i class="icon-calendar"></i></span>
					 	 </div>
				    </div>
				  </div>
			    	<div class="control-group">
				    <label class="control-label" for="commRemindLog-info_fremindcontent"><spring:message code="commRemindLog-info.commRemindLog-info.input.fremindcontent" text="提醒内容"/></label>
					<div class="controls">
				      	<textarea id="commRemindLog-info_fremindcontent"  name="fremindcontent"  class="form-control" rows="6"  style="width: 560px" class="text  "  minlength="" maxlength="500">${model.fremindcontent}</textarea>
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
