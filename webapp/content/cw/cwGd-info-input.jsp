<%@page contentType="text/html;charset=UTF-8"%>
<%@include file="/taglibs.jsp"%>
<%pageContext.setAttribute("currentHeader", "cw-home");%>
<%pageContext.setAttribute("currentMenu", "cwGd");%>
<!doctype html>
<html lang="zh">

  <head>
    <%@include file="/common/meta.jsp"%>
    <title><spring:message code="cwGd-info.cwGd-info.input.title" text="编辑"/></title>
    <%@include file="/common/s.jsp"%>
    <script type="text/javascript">
$(function() {
    $("#cwGd-infoForm").validate({
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
	  <%@include file="/menu/cw-workspace.jsp"%>

	  <!-- start of main -->
      <section id="m-main" class="span10">

      <article class="m-widget">
        <header class="header">
		  <h4 class="title"><spring:message code="cwGd-info.cwGd-info.input.title" text="编辑" /></h4>
		</header>

		<div class="content content-inner">

<form id="cwGd-infoForm" method="post" action="cwGd-info-save.do" class="form-horizontal">
  <c:if test="${model != null}">
	  <input id="cwGd-info_id" type="hidden" name="fid" value="${model.fid}">
  </c:if>
	  
	  
						<div class="control-group">
						<div class="span5">
					    <label class="control-label" for="cwGd-info_fwzcode"><spring:message code="cwGd-info.cwGd-info.input.fwzcode" text="编号"/></label>
						<div class="controls">
							  	 <input id="cwGd-info_fwzcode" type="text" name="fwzcode" value="${model.fwzcode}" size="" class="text " readonly>	
					    </div>
					  </div>
	  
						<div class="span5">
					    <label class="control-label" for="cwGd-info_fwzname"><spring:message code="cwGd-info.cwGd-info.input.fwzname" text="名称"/></label>
						<div class="controls">
							  	 <input id="cwGd-info_fwzname" type="text" name="fwzname" value="${model.fwzname}" size="" class="text required" readonly>	
					    </div>
					    </div>
					    </div>
	  
						<div class="control-group">
						<div class="span5">
					    <label class="control-label" for="cwGd-info_fwztype"><spring:message code="cwGd-info.cwGd-info.input.fwztype" text="类别"/></label>
						<div class="controls">
							  	 <input id="cwGd-info_fwztype" type="text" name="fwztype" value="${model.fwztype}" size="" class="text " readonly>	
					    </div>
					  </div>
	  
						<div class="span5">
					    <label class="control-label" for="cwGd-info_fzjdate"><spring:message code="cwGd-info.cwGd-info.input.fzjdate" text="折旧时间"/></label>
						<div class="controls">
						      	 <div class="input-append datepicker date" style="padding-left: 0px;">
							    	<input id="cwGd-info_fzjdate" type="text" name="fzjdate" value="${model.fzjdate}" size="40" class="text "   style="background-color:white;cursor:default; width: 175px;">
							 		 <span class="add-on" style="padding-top: 2px; padding-bottom: 2px;"><i class="icon-calendar"></i></span>
							 	 </div>
					    </div>
					    </div>
					    </div>
	  
						<div class="control-group">
						<div class="span5">
					    <label class="control-label" for="cwGd-info_fzjjine"><spring:message code="cwGd-info.cwGd-info.input.fzjjine" text="折旧前"/></label>
						<div class="controls">
							  	 <input id="cwGd-info_fzjjine" type="text" name="fzjjine" value="${model.fzjjine}" size="" class="text " readonly>	
					    </div>
					  </div>
	  
						<div class="span5">
					    <label class="control-label" for="cwGd-info_fxmid"><spring:message code="cwGd-info.cwGd-info.input.fxmid" text="项目名称"/></label>
						<div class="controls">
							  	<input id="cwGd-info_fxmid" type="text" name="fxmid" value="${model.fxmid}" size="" class="number   " readonly>
					    </div>
					    </div>
					    </div>
	  
					 	<div class="control-group">
					    <div class="controls">
					      <%-- <button type="submit" class="btn a-submit"><spring:message code='core.input.save' text='保存'/></button> --%>
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
