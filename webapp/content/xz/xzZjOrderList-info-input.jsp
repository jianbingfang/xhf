<%@page contentType="text/html;charset=UTF-8"%>
<%@include file="/taglibs.jsp"%>
<%pageContext.setAttribute("currentHeader", "xz-home");%>
<%pageContext.setAttribute("currentMenu", "xzZjOrderList");%>
<!doctype html>
<html lang="zh">

  <head>
    <%@include file="/common/meta.jsp"%>
    <title><spring:message code="xzZjOrderList-info.xzZjOrderList-info.input.title" text="编辑"/></title>
    <%@include file="/common/s.jsp"%>
    <script type="text/javascript">
$(function() {
    $("#xzZjOrderList-infoForm").validate({
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
		  <h4 class="title"><spring:message code="xzZjOrderList-info.xzZjOrderList-info.input.title" text="编辑" /></h4>
		</header>

		<div class="content content-inner">

<form id="xzZjOrderList-infoForm" method="post" action="xzZjOrderList-info-save.do" class="form-horizontal">
  <c:if test="${model != null}">
	  <input id="xzZjOrderList-info_id" type="hidden" name="fid" value="${model.fid}">
  </c:if>
			    	<div class="control-group">
				    <label class="control-label" for="xzZjOrderList-info_fzjid"><spring:message code="xzZjOrderList-info.xzZjOrderList-info.input.fzjid" text="证件id"/></label>
					<div class="controls">
					  	<input id="xzZjOrderList-info_fzjid" type="text" name="fzjid" value="${model.fzjid}" size="" class="number   " minlength="" maxlength="">
				    </div>
				  </div>
			    	<div class="control-group">
				    <label class="control-label" for="xzZjOrderList-info_forderid"><spring:message code="xzZjOrderList-info.xzZjOrderList-info.input.forderid" text="订单id"/></label>
					<div class="controls">
					  	<input id="xzZjOrderList-info_forderid" type="text" name="forderid" value="${model.forderid}" size="" class="number   " minlength="" maxlength="">
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
