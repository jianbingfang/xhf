<%@page contentType="text/html;charset=UTF-8"%>
<%@include file="/taglibs.jsp"%>
<%pageContext.setAttribute("currentHeader", "gh-home");%>
<%pageContext.setAttribute("currentMenu", "gh-zf");%>
<!doctype html>
<html lang="zh">

  <head>
    <%@include file="/common/meta.jsp"%>
    <title><spring:message code="ziFei-info.ziFei-info.input.title" text="编辑"/></title>
    <%@include file="/common/s.jsp"%>
    <script type="text/javascript">
$(function() {
    $("#ziFei-infoForm").validate({
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
	  <%@include file="/menu/gh-workspace.jsp"%>

	  <!-- start of main -->
      <section id="m-main" class="span10">

      <article class="m-widget">
        <header class="header">
		  <h4 class="title"><spring:message code="ziFei-info.ziFei-info.input.title" text="编辑" /></h4>
		</header>

		<div class="content content-inner">

<form id="ziFei-infoForm" method="post" action="ziFei-info-save.do?ftype=1" class="form-horizontal">
  <c:if test="${model != null}">
	  <input id="ziFei-info_id" type="hidden" name="fid" value="${model.fid}">
  </c:if>
	  
	  
						<div class="control-group">
						<div class="span5">
					    <label class="control-label" for="ziFei-info_fno"><spring:message code="ziFei-info.ziFei-info.input.fno" text="序号"/></label>
						<div class="controls">
							  	 <input id="ziFei-info_fno" type="text" name="fno" value="${model.fno}" size="" class="text " minlength="" maxlength="">	
					    </div>
					  </div>
	  
						<div class="span5">
					    <label class="control-label" for="ziFei-info_fname"><spring:message code="ziFei-info.ziFei-info.input.fname" text="事由"/></label>
						<div class="controls">
							  	 <input id="ziFei-info_fname" type="text" name="fname" value="${model.fname}" size="" class="text " minlength="" maxlength="">	
					    </div>
					    </div>
					    </div>
	  
						<div class="control-group">
						<div class="span5">
					    <label class="control-label" for="ziFei-info_fdate"><spring:message code="ziFei-info.ziFei-info.input.fdate" text="时间"/></label>
						<div class="controls">
						      	 <div class="input-append datepicker date" style="padding-left: 0px;">
							    	<input id="ziFei-info_fdate" type="text" name="fdate" value="${model.fdate}" size="40" class="text "   style="background-color:white;cursor:default; width: 175px;">
							 		 <span class="add-on" style="padding-top: 2px; padding-bottom: 2px;"><i class="icon-calendar"></i></span>
							 	 </div>
					    </div>
					  </div>
	  
						<div class="span5">
					    <label class="control-label" for="ziFei-info_fprice"><spring:message code="ziFei-info.ziFei-info.input.fprice" text="金额"/></label>
						<div class="controls">
							  	 <input id="ziFei-info_fprice" type="text" name="fprice" value="${model.fprice}" size="" class="text " minlength="" maxlength="">	
					    </div>
					    </div>
					    </div>
	  
						<div class="control-group">
						<div class="span5">
					    <label class="control-label" for="ziFei-info_fjsren"><spring:message code="ziFei-info.ziFei-info.input.fjsren" text="经手人"/></label>
						<div class="controls">
							  	<input id="ziFei-info_fjsren" type="text" name="fjsren" value="${model.fjsren}" size="" class="text   " minlength="" maxlength="">
					    </div>
					  </div>
	  
						<%-- <div class="span5">
					    <label class="control-label" for="ziFei-info_fjqren"><spring:message code="ziFei-info.ziFei-info.input.fjqren" text="捐款人"/></label>
						<div class="controls">
							  	<input id="ziFei-info_fjqren" type="text" name="fjqren" value="${model.fjqren}" size="" class="text   " minlength="" maxlength="">
					    </div>
					    </div> --%>
					    </div>
	  
						<div class="control-group">
						<div class="span5">
					    <label class="control-label" for="ziFei-info_fmemo"><spring:message code="ziFei-info.ziFei-info.input.fmemo" text="备注"/></label>
						<div class="controls">
						      	<textarea id="ziFei-info_fmemo"  name="fmemo"  class="form-control" rows="6"  style="width: 560px" class="text  "  minlength="" maxlength="400">${model.fmemo}</textarea>
					    </div>
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
