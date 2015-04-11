<%@page contentType="text/html;charset=UTF-8"%>
<%@include file="/taglibs.jsp"%>
<%pageContext.setAttribute("currentHeader", "xz-home");%>
<%pageContext.setAttribute("currentMenu", "xzxhptj");%>
<!doctype html>
<html lang="zh">

  <head>
    <%@include file="/common/meta.jsp"%>
    <title><spring:message code="xzxhptj-info.xzxhptj-info.input.title" text="编辑"/></title>
    <%@include file="/common/s.jsp"%>
    <script type="text/javascript">
$(function() {
    $("#xzxhptj-infoForm").validate({
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
	  <%@include file="/menu/xz-workspace.jsp"%>

	  <!-- start of main -->
      <section id="m-main" class="span10">

      <article class="m-widget">
        <header class="header">
		  <h4 class="title"><spring:message code="xzxhptj-info.xzxhptj-info.input.title" text="编辑" /></h4>
		</header>

		<div class="content content-inner">

<form id="xzxhptj-infoForm" method="post" action="xzxhptj-info-save.do" class="form-horizontal">
  <c:if test="${model != null}">
	  <input id="xzxhptj-info_id" type="hidden" name="fid" value="${model.fid}">
  </c:if>
			    	<div class="control-group">
				    <label class="control-label" for="xzxhptj-info_fyuefen"><spring:message code="xzxhptj-info.xzxhptj-info.input.fyuefen" text="月份"/></label>
					<div class="controls">
					  	 <input id="xzxhptj-info_fyuefen" type="text" name="fyuefen" value="${model.fyuefen}" size="" class="text required" minlength="" maxlength="">	
				    </div>
				  </div>
			    	<div class="control-group">
				    <label class="control-label" for="xzxhptj-info_fwpname"><spring:message code="xzxhptj-info.xzxhptj-info.input.fwpname" text="物品名称"/></label>
					<div class="controls">
					  	 <input id="xzxhptj-info_fwpname" type="text" name="fwpname" value="${model.fwpname}" size="" class="text required" minlength="" maxlength="">	
				    </div>
				  </div>
			    	<div class="control-group">
				    <label class="control-label" for="xzxhptj-info_fyuankc"><spring:message code="xzxhptj-info.xzxhptj-info.input.fyuankc" text="原库存量"/></label>
					<div class="controls">
					  	<input id="xzxhptj-info_fyuankc" type="text" name="fyuankc" value="${model.fyuankc}" size="" class="number   " minlength="" maxlength="">
				    </div>
				  </div>
			    	<div class="control-group">
				    <label class="control-label" for="xzxhptj-info_fxingsl"><spring:message code="xzxhptj-info.xzxhptj-info.input.fxingsl" text="新购数量"/></label>
					<div class="controls">
					  	<input id="xzxhptj-info_fxingsl" type="text" name="fxingsl" value="${model.fxingsl}" size="" class="number   " minlength="" maxlength="">
				    </div>
				  </div>
			    	<div class="control-group">
				    <label class="control-label" for="xzxhptj-info_fxhsl"><spring:message code="xzxhptj-info.xzxhptj-info.input.fxhsl" text="消耗数量"/></label>
					<div class="controls">
					  	<input id="xzxhptj-info_fxhsl" type="text" name="fxhsl" value="${model.fxhsl}" size="" class="number   " minlength="" maxlength="">
				    </div>
				  </div>
			    	<div class="control-group">
				    <label class="control-label" for="xzxhptj-info_fxkcl"><spring:message code="xzxhptj-info.xzxhptj-info.input.fxkcl" text="现库存量"/></label>
					<div class="controls">
					  	<input id="xzxhptj-info_fxkcl" type="text" name="fxkcl" value="${model.fxkcl}" size="" class="number   " minlength="" maxlength="">
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
