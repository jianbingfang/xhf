<%@page contentType="text/html;charset=UTF-8"%>
<%@include file="/taglibs.jsp"%>
<%pageContext.setAttribute("currentHeader", "gcgl-home");%>
<%pageContext.setAttribute("currentMenu", "pjXmz");%>
<!doctype html>
<html lang="zh">

  <head>
    <%@include file="/common/meta.jsp"%>
    <title><spring:message code="pjXmz-info.pjXmz-info.input.title" text="编辑"/></title>
    <%@include file="/common/s.jsp"%>
    <script type="text/javascript">
$(function() {
    $("#pjXmz-infoForm").validate({
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

      <article class="m-widget">
        <header class="header">
		  <h4 class="title"><spring:message code="pjXmz-info.pjXmz-info.input.title" text="编辑" /></h4>
		</header>

		<div class="content content-inner">

<form id="pjXmz-infoForm" method="post" action="pjXmz-info-save.do" class="form-horizontal">
  <c:if test="${model != null}">
	  <input id="pjXmz-info_id" type="hidden" name="fid" value="${model.fid}">
  </c:if>
			    	<div class="control-group">
				    <label class="control-label" for="pjXmz-info_fxmzno"><spring:message code="pjXmz-info.pjXmz-info.input.fxmzno" text="序号"/></label>
					<div class="controls">
					  	 <input id="pjXmz-info_fxmzno" type="text" name="fxmzno" value="${model.fxmzno}" size="" class="text required" minlength="" maxlength="">	
				    </div>
				  </div>
			    	<div class="control-group">
				    <label class="control-label" for="pjXmz-info_fxmid"><spring:message code="pjXmz-info.pjXmz-info.input.fxmid" text="项目名称"/></label>
					<div class="controls">
					  	<input id="pjXmz-info_fxmid" type="text" name="fxmid" value="${model.fxmid}" size="" class="number   " minlength="" maxlength="">
				    </div>
				  </div>
			    	<div class="control-group">
				    <label class="control-label" for="pjXmz-info_fyijiaorenid"><spring:message code="pjXmz-info.pjXmz-info.input.fyijiaorenid" text="移交人id"/></label>
					<div class="controls">
					  	<input id="pjXmz-info_fyijiaorenid" type="text" name="fyijiaorenid" value="${model.fyijiaorenid}" size="" class="number   " minlength="" maxlength="">
				    </div>
				  </div>
			    	<div class="control-group">
				    <label class="control-label" for="pjXmz-info_fjieshourenid"><spring:message code="pjXmz-info.pjXmz-info.input.fjieshourenid" text="接收人id"/></label>
					<div class="controls">
					  	<input id="pjXmz-info_fjieshourenid" type="text" name="fjieshourenid" value="${model.fjieshourenid}" size="" class="number   " minlength="" maxlength="">
				    </div>
				  </div>
			    	<div class="control-group">
				    <label class="control-label" for="pjXmz-info_fyijiaodate"><spring:message code="pjXmz-info.pjXmz-info.input.fyijiaodate" text="日期"/></label>
					<div class="controls">
				      	 <div class="input-append datepicker date" style="padding-left: 0px;">
					    	<input id="pjXmz-info_fyijiaodate" type="text" name="fyijiaodate" value="${model.fyijiaodate}" size="40" class="text "   style="background-color:white;cursor:default; width: 175px;">
					 		 <span class="add-on" style="padding-top: 2px; padding-bottom: 2px;"><i class="icon-calendar"></i></span>
					 	 </div>
				    </div>
				  </div>
			    	<div class="control-group">
				    <label class="control-label" for="pjXmz-info_fmemo"><spring:message code="pjXmz-info.pjXmz-info.input.fmemo" text="备注"/></label>
					<div class="controls">
				      	<textarea id="pjXmz-info_fmemo"  name="fmemo"  class="form-control" rows="6"  style="width: 560px" class="text  "  minlength="" maxlength="500">${model.fmemo}</textarea>
				    </div>
				  </div>
			    	<div class="control-group">
				    <label class="control-label" for="pjXmz-info_fyijiaoren"><spring:message code="pjXmz-info.pjXmz-info.input.fyijiaoren" text="移交人"/></label>
					<div class="controls">
					  	 <input id="pjXmz-info_fyijiaoren" type="text" name="fyijiaoren" value="${model.fyijiaoren}" size="" class="text required" minlength="" maxlength="">	
				    </div>
				  </div>
			    	<div class="control-group">
				    <label class="control-label" for="pjXmz-info_fjieshouren"><spring:message code="pjXmz-info.pjXmz-info.input.fjieshouren" text="接收人"/></label>
					<div class="controls">
					  	 <input id="pjXmz-info_fjieshouren" type="text" name="fjieshouren" value="${model.fjieshouren}" size="" class="text required" minlength="" maxlength="">	
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
