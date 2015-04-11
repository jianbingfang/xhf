<%@page contentType="text/html;charset=UTF-8"%>
<%@include file="/taglibs.jsp"%>
<%pageContext.setAttribute("currentHeader", "jl-home");%>
<%pageContext.setAttribute("currentMenu", "jl-ry");%>
<!doctype html>
<html lang="zh">

  <head>
    <%@include file="/common/meta.jsp"%>
    <title><spring:message code="jlRysq-info.jlRysq-info.input.title" text="编辑"/></title>
    <%@include file="/common/s.jsp"%>
    <script type="text/javascript">
$(function() {
    $("#jlRysq-infoForm").validate({
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
		  <h4 class="title"><spring:message code="jlRysq-info.jlRysq-info.input.title" text="编辑" /></h4>
		</header>

		<div class="content content-inner">

<form id="jlRysq-infoForm" method="post" action="jlRysq-info-save.do" class="form-horizontal">
  <c:if test="${model != null}">
	  <input id="jlRysq-info_id" type="hidden" name="fid" value="${model.fid}">
  </c:if>
	  
	  
						<div class="control-group">
						<div class="span5">
					    <label class="control-label" for="jlRysq-info_fgangw"><spring:message code="jlRysq-info.jlRysq-info.input.fgangw" text="岗位"/></label>
						<div class="controls">
							  	<input id="jlRysq-info_fgangw" type="text" name="fgangw" value="${model.fgangw}" size="" class="required" minlength="" maxlength="">
					    </div>
					    </div>
					    
					    
					    <div class="span5">
					    <label class="control-label" for="jlRysq-info_frenshu"><spring:message code="jlRysq-info.jlRysq-info.input.frenshu" text="人数"/></label>
						<div class="controls">
							  	<input id="jlRysq-info_frenshu" type="text" name="frenshu" value="${model.frenshu}" size="" class="required" minlength="" maxlength="">
					    </div>
					  </div>
					  
					    </div>
	  
						<div class="control-group">
					    <label class="control-label" for="jlRysq-info_fshenqingdate"><spring:message code="jlRysq-info.jlRysq-info.input.fshenqingdate" text="申请日期"/></label>
						<div class="controls">
						      	 <div class="input-append datepicker date" style="padding-left: 0px;">
							    	<input id="jlRysq-info_fshenqingdate" type="text" name="fshenqingdate" value="${model.fshenqingdate}" size="40" class="text "   style="background-color:white;cursor:default; width: 175px;">
							 		 <span class="add-on" style="padding-top: 2px; padding-bottom: 2px;"><i class="icon-calendar"></i></span>
							 	 </div>
					    </div>
					    </div>
					    
					    
					    <div class="control-group">
	  
					    <label class="control-label" for="jlRysq-info_fyuanyin"><spring:message code="jlRysq-info.jlRysq-info.input.fyuanyin" text="申请原因"/></label>
						<div class="controls">
						      	<textarea id="jlRysq-info_fyuanyin"  name="fyuanyin"  class="form-control" rows="6"  style="width: 560px" class="text  "  minlength="" maxlength="512">${model.fyuanyin}</textarea>
					    </div>
					    </div>
					    
					    <div class="control-group">
						<div class="span5">
					    <label class="control-label" for="jlRysq-info_fshenpidate"><spring:message code="jlRysq-info.jlRysq-info.input.fshenpidate" text="审批日期"/></label>
						<div class="controls">
						      	 <div class="input-append datepicker date" style="padding-left: 0px;">
							    	<input id="jlRysq-info_fshenpidate" type="text" name="fshenpidate" value="${model.fshenpidate}" size="40" class="text "   style="background-color:white;cursor:default; width: 175px;">
							 		 <span class="add-on" style="padding-top: 2px; padding-bottom: 2px;"><i class="icon-calendar"></i></span>
							 	 </div>
					    </div>
					  </div>
						<div class="span5">
					    <label class="control-label" for="jlRysq-info_fstatus"><spring:message code="jlRysq-info.jlRysq-info.input.fstatus" text="状态"/></label>
						<div class="controls">
						      	 <select class="form-control" id="jlRysq-info_fstatus" name="fstatus" value="${model.fstatus}" class=" " >
							    	 	<option value="未审批"  <c:if test="${model.fstatus}=='未审批'}"> selected="selected"  </c:if>>未审批</option>
							    	 	<option value="通过"  <c:if test="${model.fstatus}=='通过'}"> selected="selected"  </c:if>>通过</option>
							    	 	<option value="未通过"  <c:if test="${model.fstatus}=='未通过'}"> selected="selected"  </c:if>>未通过</option>
							 	</select>
					    </div>
					  </div>
					  </div>
						
					 	<div class="control-group">
						<div class="span5">
					    <label class="control-label" for="jlRysq-info_fshenpiinfo"><spring:message code="jlRysq-info.jlRysq-info.input.fshenpiinfo" text="审批意见"/></label>
						<div class="controls">
						      	<textarea id="jlRysq-info_fshenpiinfo"  name="fshenpiinfo"  class="form-control" rows="6"  style="width: 560px" class="text  "  minlength="" maxlength="512">${model.fshenpiinfo}</textarea>
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
