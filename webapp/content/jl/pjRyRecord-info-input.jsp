<%@page contentType="text/html;charset=UTF-8"%>
<%@include file="/taglibs.jsp"%>
<%pageContext.setAttribute("currentHeader", "jl-home");%>
<%pageContext.setAttribute("currentMenu", "jl-ry");%>
<!doctype html>
<html lang="zh">

  <head>
    <%@include file="/common/meta.jsp"%>
    <title><spring:message code="jl-pjRyRecord-info.jl-pjRyRecord-info.input.title" text="编辑"/></title>
    <%@include file="/common/s.jsp"%>
    <script type="text/javascript">
$(function() {
    $("#jl-pjRyRecord-infoForm").validate({
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
		  <h4 class="title"><spring:message code="jl-pjRyRecord-info.jl-pjRyRecord-info.input.title" text="编辑" /></h4>
		</header>

		<div class="content content-inner">

<form id="jl-pjRyRecord-infoForm" method="post" action="jl-pjRyRecord-info-save.do" class="form-horizontal">
				<c:if test="${model != null}">
				 <input id="jl-pjRyRecord-info_id" type="hidden" name="fid" value="${model.fid}">
				</c:if>
			    	<div class="control-group">
				    <label class="control-label" for="jl-pjRyRecord-info_fdbdate"><spring:message code="jl-pjRyRecord-info.jl-pjRyRecord-info.input.fdbdate" text="日期"/></label>
					<div class="controls">
				      	 <div class="input-append datepicker date" style="padding-left: 0px;">
					    	<input id="jl-pjRyRecord-info_fdbdate" type="text" name="fdbdate" value="${model.fdbdate}" size="40" class="text "   style="background-color:white;cursor:default; width: 175px;">
					 		 <span class="add-on" style="padding-top: 2px; padding-bottom: 2px;"><i class="icon-calendar"></i></span>
					 	 </div>
				    </div>
				  </div>
			    	<div class="control-group">
				    <label class="control-label" for="jl-pjRyRecord-info_fdcxm"><spring:message code="jl-pjRyRecord-info.jl-pjRyRecord-info.input.fdcxm" text="调出项目"/></label>
					<div class="controls">
					  	<input id="jl-pjRyRecord-info_fdcxm" type="text" name="fdcxm" value="${model.fdcxm}" size="" class="number   " minlength="" maxlength="">
				    </div>
				  </div>
			    	<div class="control-group">
				    <label class="control-label" for="jl-pjRyRecord-info_fdrxm"><spring:message code="jl-pjRyRecord-info.jl-pjRyRecord-info.input.fdrxm" text="调入项目"/></label>
					<div class="controls">
					  	<input id="jl-pjRyRecord-info_fdrxm" type="text" name="fdrxm" value="${model.fdrxm}" size="" class="number   " minlength="" maxlength="">
				    </div>
				  </div>
			    	<div class="control-group">
				    <label class="control-label" for="jl-pjRyRecord-info_fjingbanrenid"><spring:message code="jl-pjRyRecord-info.jl-pjRyRecord-info.input.fjingbanrenid" text="经办人id"/></label>
					<div class="controls">
					  	<input id="jl-pjRyRecord-info_fjingbanrenid" type="text" name="fjingbanrenid" value="${model.fjingbanrenid}" size="" class="number   " minlength="" maxlength="">
				    </div>
				  </div>
			    	<div class="control-group">
				    <label class="control-label" for="jl-pjRyRecord-info_fryid"><spring:message code="jl-pjRyRecord-info.jl-pjRyRecord-info.input.fryid" text="人员id"/></label>
					<div class="controls">
					  	<input id="jl-pjRyRecord-info_fryid" type="text" name="fryid" value="${model.fryid}" size="" class="number   " minlength="" maxlength="">
				    </div>
				  </div>
			    	<div class="control-group">
				    <label class="control-label" for="jl-pjRyRecord-info_fjingbanren"><spring:message code="jl-pjRyRecord-info.jl-pjRyRecord-info.input.fjingbanren" text="经办人"/></label>
					<div class="controls">
					  	 <input id="jl-pjRyRecord-info_fjingbanren" type="text" name="fjingbanren" value="${model.fjingbanren}" size="" class="text required" minlength="" maxlength="">	
				    </div>
				  </div>
			    	<div class="control-group">
				    <label class="control-label" for="jl-pjRyRecord-info_fry"><spring:message code="jl-pjRyRecord-info.jl-pjRyRecord-info.input.fry" text="人员"/></label>
					<div class="controls">
					  	 <input id="jl-pjRyRecord-info_fry" type="text" name="fry" value="${model.fry}" size="" class="text " minlength="" maxlength="">	
				    </div>
				  </div>
					 	<div class="control-group">
					    <div class="controls">
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
