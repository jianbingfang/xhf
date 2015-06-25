<%@page contentType="text/html;charset=UTF-8"%>
<%@include file="/taglibs.jsp"%>
<%pageContext.setAttribute("currentHeader", "xz-home");%>
<%pageContext.setAttribute("currentMenu", "xz-zj");%>
<!doctype html>
<html lang="zh">

  <head>
    <%@include file="/common/meta.jsp"%>
    <title><spring:message code="xzDsj-info.xzDsj-info.input.title" text="编辑"/></title>
    <%@include file="/common/s.jsp"%>
    <script type="text/javascript">
$(function() {
    $("#xzDsj-infoForm").validate({
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
		  <h4 class="title"><spring:message code="xzDsj-info.xzDsj-info.input.title" text="编辑" /></h4>
		</header>

		<div class="content content-inner">

<form id="xzDsj-infoForm" method="post" action="xzDsj-info-save.do" class="form-horizontal">
  <c:if test="${model != null}">
	  <input id="xzDsj-info_id" type="hidden" name="fid" value="${model.fid}">
  </c:if>
			    	<div class="control-group">
				    <label class="control-label" for="xzDsj-info_fshijian"><spring:message code="xzDsj-info.xzDsj-info.input.fshijian" text="事件"/></label>
					<div class="controls">
					  	 <input id="xzDsj-info_fshijian" type="text" name="fshijian" value="${model.fshijian}" size="" class="text required" minlength="" maxlength="">	
				    </div>
				  </div>
			    	<div class="control-group">
				    <label class="control-label" for="xzDsj-info_fdate"><spring:message code="xzDsj-info.xzDsj-info.input.fdate" text="日期"/></label>
					<div class="controls">
				      	 <div class="input-append datepicker date" style="padding-left: 0px;">
					    	<input id="xzDsj-info_fdate" type="text" name="fdate" value="${model.fdate}" size="40" class="text "   style="background-color:white;cursor:default; width: 175px;">
					 		 <span class="add-on" style="padding-top: 2px; padding-bottom: 2px;"><i class="icon-calendar"></i></span>
					 	 </div>
				    </div>
				  </div>
			    	<div class="control-group">
				    <label class="control-label" for="xzDsj-info_fcontent"><spring:message code="xzDsj-info.xzDsj-info.input.fcontent" text="内容"/></label>
					<div class="controls">
				      	<textarea id="xzDsj-info_fcontent"  name="fcontent"  class="form-control" rows="6"  style="width: 560px" class="text  "  minlength="" maxlength="">${model.fcontent}</textarea>
				    </div>
				  </div>
			    	<%-- <div class="control-group">
				    <label class="control-label" for="xzDsj-info_fmemo"><spring:message code="xzDsj-info.xzDsj-info.input.fmemo" text="备注"/></label>
					<div class="controls">
				      	<textarea id="xzDsj-info_fmemo"  name="fmemo"  class="form-control" rows="6"  style="width: 560px" class="text  "  minlength="" maxlength="200">${model.fmemo}</textarea>
				    </div>
				  </div> --%>
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
