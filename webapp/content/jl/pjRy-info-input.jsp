<%@page contentType="text/html;charset=UTF-8"%>
<%@include file="/taglibs.jsp"%>
<%pageContext.setAttribute("currentHeader", "jl-home");%>
<%pageContext.setAttribute("currentMenu", "jl-ry");%>
<!doctype html>
<html lang="zh">

  <head>
    <%@include file="/common/meta.jsp"%>
    <title><spring:message code="jl-pjRy-info.jl-pjRy-info.input.title" text="编辑"/></title>
    <%@include file="/common/s.jsp"%>
    <link type="text/css" rel="stylesheet"
	href="${scopePrefix}/s/xthena/rypicker/rypicker.css">
<script type="text/javascript"
	src="${scopePrefix}/s/xthena/rypicker/rypicker.js"></script>
    <script type="text/javascript">
$(function() {
    $("#jl-pjRy-infoForm").validate({
        submitHandler: function(form) {
			bootbox.animate(false);
			var box = bootbox.dialog('<div class="progress progress-striped active" style="margin:0px;"><div class="bar" style="width: 100%;"></div></div>');
            form.submit();
        },
        errorClass: 'validate-error'
    });
    
	createryPicker({
		modalId : 'ryPicker',
		url : '${scopePrefix}/hr/commRy-simple-list.do'
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
		  <h4 class="title"><spring:message code="jl-pjRy-info.jl-pjRy-info.input.title" text="编辑" /></h4>
		</header>

		<div class="content content-inner">

<form id="jl-pjRy-infoForm" method="post" action="jl-pjRy-info-save.do" class="form-horizontal">
  <c:if test="${model != null}">
	  <input id="jl-pjRy-info_id" type="hidden" name="fid" value="${model.fid}">
  </c:if>
			    	<div class="control-group">
				    <label class="control-label" for="jl-pjRy-info_fryid"><spring:message code="jl-pjRy-info.jl-pjRy-info.input.fryid" text="人员"/></label>
					<div class="controls">
						<div class="input-append ryPicker">
							<input id="ryBxRecord-info_fryid" type="hidden" name="fryid"
								value="${model.fryid}"> <input
								id="ryBxRecord-info_userName" type="text" value="${model.fry}"
								disabled class=" required" style="width: 175px;" value="">
							<span class="add-on"
								style="padding-top: 2px; padding-bottom: 2px;"><i
								class="icon-user"></i></span>
						</div>
				    </div>
				  </div>
			    	<div class="control-group">
				    <label class="control-label" for="jl-pjRy-info_fstartdate"><spring:message code="jl-pjRy-info.jl-pjRy-info.input.fstartdate" text="进入项目时间"/></label>
					<div class="controls">
				      	 <div class="input-append datepicker date" style="padding-left: 0px;">
					    	<input id="jl-pjRy-info_fstartdate" type="text" name="fstartdate" value="${model.fstartdate}" size="40" class="text "   style="background-color:white;cursor:default; width: 175px;">
					 		 <span class="add-on" style="padding-top: 2px; padding-bottom: 2px;"><i class="icon-calendar"></i></span>
					 	 </div>
				    </div>
				  </div>
			    	<div class="control-group">
				    <label class="control-label" for="jl-pjRy-info_fenddate"><spring:message code="jl-pjRy-info.jl-pjRy-info.input.fenddate" text="离开项目时间"/></label>
					<div class="controls">
				      	 <div class="input-append datepicker date" style="padding-left: 0px;">
					    	<input id="jl-pjRy-info_fenddate" type="text" name="fenddate" value="${model.fenddate}" size="40" class="text "   style="background-color:white;cursor:default; width: 175px;">
					 		 <span class="add-on" style="padding-top: 2px; padding-bottom: 2px;"><i class="icon-calendar"></i></span>
					 	 </div>
				    </div>
				  </div>
			    	<div class="control-group">
				    <label class="control-label" for="jl-pjRy-info_ftel"><spring:message code="jl-pjRy-info.jl-pjRy-info.input.ftel" text="联系方式"/></label>
					<div class="controls">
					  	 <input id="jl-pjRy-info_ftel" type="text" name="ftel" value="${model.ftel}" size="" class="text " minlength="" maxlength="">	
				    </div>
				  </div>
			    	<div class="control-group">
				    <label class="control-label" for="jl-pjRy-info_fstatus"><spring:message code="jl-pjRy-info.jl-pjRy-info.input.fstatus" text="状态"/></label>
					<div class="controls">
					  	 <input id="jl-pjRy-info_fstatus" type="text" name="fstatus" value="${model.fstatus}" size="" class="text " minlength="" maxlength="">	
				    </div>
				  </div>
					 	<div class="control-group">
					    <div class="controls">
					    <%--   <button type="submit" class="btn a-submit"><spring:message code='core.input.save' text='保存'/></button> --%>
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
