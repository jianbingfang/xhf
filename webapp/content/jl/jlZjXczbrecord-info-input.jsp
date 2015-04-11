<%@page contentType="text/html;charset=UTF-8"%>
<%@include file="/taglibs.jsp"%>
<%pageContext.setAttribute("currentHeader", "jl-home");%>
<%pageContext.setAttribute("currentMenu", "jlZjXczbrecord");%>
<!doctype html>
<html lang="zh">

  <head>
    <%@include file="/common/meta.jsp"%>
    <title><spring:message code="jlZjXczbrecord-info.jlZjXczbrecord-info.input.title" text="编辑"/></title>
    <%@include file="/common/s.jsp"%>
    <script type="text/javascript">
$(function() {
    $("#jlZjXczbrecord-infoForm").validate({
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
		  <h4 class="title"><spring:message code="jlZjXczbrecord-info.jlZjXczbrecord-info.input.title" text="编辑" /></h4>
		</header>

		<div class="content content-inner">

<form id="jlZjXczbrecord-infoForm" method="post" action="jlZjXczbrecord-info-save.do" class="form-horizontal">
  <c:if test="${model != null}">
	  <input id="jlZjXczbrecord-info_id" type="hidden" name="fid" value="${model.fid}">
  </c:if>
			    	<div class="control-group">
				    <label class="control-label" for="jlZjXczbrecord-info_fyanshoubz"><spring:message code="jlZjXczbrecord-info.jlZjXczbrecord-info.input.fyanshoubz" text="验收标准"/></label>
					<div class="controls">
				      	<textarea id="jlZjXczbrecord-info_fyanshoubz"  name="fyanshoubz"  class="form-control" rows="6"  style="width: 560px" class="text  "  minlength="" maxlength="4096">${model.fyanshoubz}</textarea>
				    </div>
				  </div>
			    	<div class="control-group">
				    <label class="control-label" for="jlZjXczbrecord-info_fyanshouresult"><spring:message code="jlZjXczbrecord-info.jlZjXczbrecord-info.input.fyanshouresult" text="结果"/></label>
					<div class="controls">
				      	<textarea id="jlZjXczbrecord-info_fyanshouresult"  name="fyanshouresult"  class="form-control" rows="6"  style="width: 560px" class="text  "  minlength="" maxlength="512">${model.fyanshouresult}</textarea>
				    </div>
				  </div>
			    	<div class="control-group">
				    <label class="control-label" for="jlZjXczbrecord-info_fdate"><spring:message code="jlZjXczbrecord-info.jlZjXczbrecord-info.input.fdate" text="日期"/></label>
					<div class="controls">
				      	 <div class="input-append datepicker date" style="padding-left: 0px;">
					    	<input id="jlZjXczbrecord-info_fdate" type="text" name="fdate" value="${model.fdate}" size="40" class="text "   style="background-color:white;cursor:default; width: 175px;">
					 		 <span class="add-on" style="padding-top: 2px; padding-bottom: 2px;"><i class="icon-calendar"></i></span>
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
