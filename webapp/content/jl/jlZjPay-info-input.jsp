<%@page contentType="text/html;charset=UTF-8"%>
<%@include file="/taglibs.jsp"%>
<%pageContext.setAttribute("currentHeader", "jl-home");%>
<%pageContext.setAttribute("currentMenu", "jlZjPay");%>
<!doctype html>
<html lang="zh">

  <head>
    <%@include file="/common/meta.jsp"%>
    <title><spring:message code="jlZjPay-info.jlZjPay-info.input.title" text="编辑"/></title>
    <%@include file="/common/s.jsp"%>
    <script type="text/javascript">
$(function() {
    $("#jlZjPay-infoForm").validate({
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
	  <%@include file="/menu/jl-workspace.jsp"%>

	  <!-- start of main -->
      <section id="m-main" class="span10">

      <article class="m-widget">
        <header class="header">
		  <h4 class="title"><spring:message code="jlZjPay-info.jlZjPay-info.input.title" text="编辑" /></h4>
		</header>

		<div class="content content-inner">

<form id="jlZjPay-infoForm" method="post" action="jlZjPay-info-save.do" class="form-horizontal">
  <c:if test="${model != null}">
	  <input id="jlZjPay-info_id" type="hidden" name="fid" value="${model.fid}">
  </c:if>
			    	<div class="control-group">
				    <label class="control-label" for="jlZjPay-info_fpayno"><spring:message code="jlZjPay-info.jlZjPay-info.input.fpayno" text="序号"/></label>
					<div class="controls">
					  	 <input id="jlZjPay-info_fpayno" type="text" name="fpayno" value="${model.fpayno}" size="" class="text required" minlength="" maxlength="">	
				    </div>
				  </div>
			    	<div class="control-group">
				    <label class="control-label" for="jlZjPay-info_fskdw"><spring:message code="jlZjPay-info.jlZjPay-info.input.fskdw" text="收款单位"/></label>
					<div class="controls">
					  	 <input id="jlZjPay-info_fskdw" type="text" name="fskdw" value="${model.fskdw}" size="" class="text required" minlength="" maxlength="">	
				    </div>
				  </div>
			    	<div class="control-group">
				    <label class="control-label" for="jlZjPay-info_fskmoney"><spring:message code="jlZjPay-info.jlZjPay-info.input.fskmoney" text="收款金额"/></label>
					<div class="controls">
					  	 <input id="jlZjPay-info_fskmoney" type="text" name="fskmoney" value="${model.fskmoney}" size="" class="text required" minlength="" maxlength="">	
				    </div>
				  </div>
			    	<div class="control-group">
				    <label class="control-label" for="jlZjPay-info_fjingshouren"><spring:message code="jlZjPay-info.jlZjPay-info.input.fjingshouren" text="经手人"/></label>
					<div class="controls">
					  	<input id="jlZjPay-info_fjingshouren" type="text" name="fjingshouren" value="${model.fjingshouren}" size="" class="number   " minlength="" maxlength="">
				    </div>
				  </div>
			    	<div class="control-group">
				    <label class="control-label" for="jlZjPay-info_fdate"><spring:message code="jlZjPay-info.jlZjPay-info.input.fdate" text="日期"/></label>
					<div class="controls">
				      	 <div class="input-append datepicker date" style="padding-left: 0px;">
					    	<input id="jlZjPay-info_fdate" type="text" name="fdate" value="${model.fdate}" size="40" class="text "   style="background-color:white;cursor:default; width: 175px;">
					 		 <span class="add-on" style="padding-top: 2px; padding-bottom: 2px;"><i class="icon-calendar"></i></span>
					 	 </div>
				    </div>
				  </div>
			    	<div class="control-group">
				    <label class="control-label" for="jlZjPay-info_fmemo"><spring:message code="jlZjPay-info.jlZjPay-info.input.fmemo" text="备注"/></label>
					<div class="controls">
				      	<textarea id="jlZjPay-info_fmemo"  name="fmemo"  class="form-control" rows="6"  style="width: 560px" class="text  "  minlength="" maxlength="500">${model.fmemo}</textarea>
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
