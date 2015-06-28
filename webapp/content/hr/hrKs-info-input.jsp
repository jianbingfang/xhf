<%@page contentType="text/html;charset=UTF-8"%>
<%@include file="/taglibs.jsp"%>
<%pageContext.setAttribute("currentHeader", "hr-home");%>
<%pageContext.setAttribute("currentMenu", "hrPx");%>
<!doctype html>
<html lang="zh">

  <head>
    <%@include file="/common/meta.jsp"%>
    <title><spring:message code="hrKs-info.hrKs-info.input.title" text="编辑"/></title>
    <%@include file="/common/s.jsp"%>
    <script type="text/javascript">
$(function() {
    $("#hrKs-infoForm").validate({
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
	  <%@include file="/menu/hr-workspace.jsp"%>

	  <!-- start of main -->
      <section id="m-main" class="span10">

      <article class="m-widget">
        <header class="header">
		  <h4 class="title"><spring:message code="hrKs-info.hrKs-info.input.title" text="编辑"/></h4>
		</header>

		<div class="content content-inner">

<form id="hrKs-infoForm" method="post" action="hrKs-info-save.do" class="form-horizontal">
  <c:if test="${model != null}">
	  <input id="hrKs-info_id" type="hidden" name="fid" value="${model.fid}">
  </c:if>
    	<div class="control-group">
	    <label class="control-label" for="hrKs-info_fkstype"><spring:message code="hrKs-info.hrKs-info.input.fkstype" text="考试类别"/></label>
		<div class="controls">
		  <input id="hrKs-info_fkstype" type="text" name="fkstype" value="${model.fkstype}" size="" class="text " minlength="" maxlength="">
	    </div>
	  </div>
    	<div class="control-group">
	    <label class="control-label" for="hrKs-info_fbmdate"><spring:message code="hrKs-info.hrKs-info.input.fbmdate" text="报名时间"/></label>
		<div class="controls">
	    	<div class="input-append datepicker date" style="padding-left: 0px;">
		    	<input id="hrKs-info_fbmdate" type="text" name="fbmdate" value="${model.fbmdate}" size="40" class="text "   style="background-color:white;cursor:default; width: 175px;">
		 		 <span class="add-on" style="padding-top: 2px; padding-bottom: 2px;"><i class="icon-calendar"></i></span>
		  </div>	
	    </div>
	  </div>
    	<div class="control-group">
	    <label class="control-label" for="hrKs-info_fjfdate"><spring:message code="hrKs-info.hrKs-info.input.fjfdate" text="缴费时间"/></label>
		<div class="controls">
			<div class="input-append datepicker date" style="padding-left: 0px;">
		    	<input id="hrKs-info_fjfdate" type="text" name="fjfdate" value="${model.fjfdate}" size="40" class="text "   style="background-color:white;cursor:default; width: 175px;">
		 		 <span class="add-on" style="padding-top: 2px; padding-bottom: 2px;"><i class="icon-calendar"></i></span>
		  </div>	
	    </div>
	  </div>
    	<div class="control-group">
	    <label class="control-label" for="hrKs-info_fjfmoney"><spring:message
				code="hrKs-info.hrKs-info.input.fjfmoney" text="缴费金额(元)"/></label>
		<div class="controls">
		  <input id="hrKs-info_fjfmoney" type="number" name="fjfmoney" value="${model.fjfmoney}" size=""
				 class="number " minlength="" maxlength="">
	    </div>
	  </div>
    	<div class="control-group">
	    <label class="control-label" for="hrKs-info_fzkzdate"><spring:message code="hrKs-info.hrKs-info.input.fzkzdate" text="准考证领取时间"/></label>
		<div class="controls">
	  	 <div class="input-append datepicker date" style="padding-left: 0px;">
		    	<input id="hrKs-info_fzkzdate" type="text" name="fzkzdate" value="${model.fzkzdate}" size="40" class="text "   style="background-color:white;cursor:default; width: 175px;">
		 		 <span class="add-on" style="padding-top: 2px; padding-bottom: 2px;"><i class="icon-calendar"></i></span>
		  </div>
	    </div>
	  </div>
    	<div class="control-group">
	    <label class="control-label" for="hrKs-info_fksdate"><spring:message code="hrKs-info.hrKs-info.input.fksdate" text="考试时间"/></label>
		<div class="controls">
		 <div class="input-append datepicker date" style="padding-left: 0px;">
		    	<input id="hrKs-info_fksdate" type="text" name="fksdate" value="${model.fksdate}" size="40" class="text "   style="background-color:white;cursor:default; width: 175px;">
		 		 <span class="add-on" style="padding-top: 2px; padding-bottom: 2px;"><i class="icon-calendar"></i></span>
		  </div>
	    </div>
	  </div>
    	<div class="control-group">
	    <label class="control-label" for="hrKs-info_fzl"><spring:message code="hrKs-info.hrKs-info.input.fzl" text="考试相关资料"/></label>
		<div class="controls">
		  <input id="hrKs-info_fzl" type="text" name="fzl" value="${model.fzl}" size="" class="text " minlength="" maxlength="">
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
