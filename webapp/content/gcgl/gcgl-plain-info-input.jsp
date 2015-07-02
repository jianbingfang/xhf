<%@page contentType="text/html;charset=UTF-8"%>
<%@include file="/taglibs.jsp"%>
<%pageContext.setAttribute("currentHeader", "gcgl-home");%>
<%pageContext.setAttribute("currentMenu", "gcgl-plain");%>
<!doctype html>
<html lang="en">

  <head>
    <%@include file="/common/meta.jsp"%>
    <title><spring:message code="plain-info.plain-info.input.title" text="编辑"/></title>
    <%@include file="/common/s.jsp"%>
    <script type="text/javascript">
$(function() {
    $("#plain-infoForm").validate({
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
	<div class="container-fluid">
      <article class="m-widget">
        <header class="header">
		  <h4 class="title"><spring:message code="plain-info.plain-info.input. title" text="编辑"/></h4>
		</header>

		<div class="content content-inner">
			<form id="plain-infoForm" method="post" action="gcgl-plain-info-save.do" class="form-horizontal">
			  <c:if test="${model != null}">
			  <input id="plain-info_fid" type="hidden" name="fid" value="${model.fid}">
			  </c:if>
			    <input id="plain-info_fmodulecode" type="hidden" name="fmodulecode" value="gcgl">
			     <input id="plain-info_ftype" type="hidden" name="ftype" value="1">
			  <div class="control-group">
			    <label class="control-label" for="plain-info_ftitle"><spring:message code="plain-info.plain-info.input.ftitle" text="标题"/></label>
				<div class="controls">
				  <input id="plain-info_ftitle" type="text" name="ftitle" value="${model.ftitle}" size="40" class="text required" minlength="1" maxlength="20">
			    </div>
			  </div>
			  <div class="control-group">
			    <label class="control-label" for="plain-info_fmonth"><spring:message code="plain-info.plain-info.input.ftitle" text="月份"/></label>
				<div class="controls">
				  	<input id="plain-info_fmonth" type="text" name="fmonth" value="${model.fmonth}" size="40" class="text required" minlength="1" maxlength="20">
			    </div>
			  </div>
			  <div class="control-group">
			    <label class="control-label" for="plain-info_fdetail">计划内容</label>
				<div class="controls">
					<textarea id="plain-info_fdetail"  name="fdetail"  class="form-control" rows="6">${model.fdetail}</textarea>
			    </div>
			  </div>
			  <div class="control-group">
							<label class="control-label" for="plain-info_fstatus">状态</label>
							<div class="controls">
								<input id="plain-info_fstatus"  readonly="readonly" name="fstatus" value="${model.fstatus}"
									class="form-control" type="text">
							</div>
						</div>
						<div class="control-group">
							<label class="control-label" for="plain-info_fcomment">批示</label>
							<div class="controls">
								<textarea id="plain-info_fcomment" readonly="readonly" name="fcomment"
									class="form-control" rows="6">${model.fcomment}</textarea>
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
