<%@page contentType="text/html;charset=UTF-8"%>
<%@include file="/taglibs.jsp"%>
<%pageContext.setAttribute("currentHeader", "jl-home");%>
<%pageContext.setAttribute("currentMenu", "jljdSreport");%>
<!doctype html>
<html lang="zh">

  <head>
    <%@include file="/common/meta.jsp"%>
    <title><spring:message code="jljdSreport-info.jljdSreport-info.input.title" text="编辑"/></title>
    <%@include file="/common/s.jsp"%>
    <script type="text/javascript">
$(function() {
    $("#jljdSreport-infoForm").validate({
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

    <div class="row-fluid">

	  <!-- start of main -->

      <article class="m-widget">
        <header class="header">
		  <h4 class="title"><spring:message code="jljdSreport-info.jljdSreport-info.input.title" text="编辑" /></h4>
		</header>

		<div class="content content-inner">

<form id="jljdSreport-infoForm" method="post" action="jljdSreport-info-save.do" class="form-horizontal">
  <c:if test="${model != null}">
	  <input id="jljdSreport-info_id" type="hidden" name="fid" value="${model.fid}">
  </c:if>
	  
	  
						<div class="control-group">
						<div class="span5">
					    <label class="control-label" for="jljdSreport-info_fno"><spring:message code="jljdSreport-info.jljdSreport-info.input.fno" text="编号"/></label>
						<div class="controls">
							  	 <input id="jljdSreport-info_fno" type="text" name="fno" value="${model.fno}" size="" class="text " minlength="" maxlength="">	
					    </div>
					  </div>
	  
						<div class="span5">
					    <label class="control-label" for="jljdSreport-info_fwarn"><spring:message code="jljdSreport-info.jljdSreport-info.input.fwarn" text="提醒"/></label>
						<div class="controls">
						      	 	 <select class="form-control" id="jljdSreport-info_fwarn" name="fwarn" value="${model.fwarn}" class=" " >
							    	 	<option value="正常"  <c:if test="${model.fwarn}=='正常'}"> selected="selected"  </c:if>>正常</option>
							    	 	<option value="重要"  <c:if test="${model.fwarn}=='重要'}"> selected="selected"  </c:if>>重要</option>
							 	</select>
					    </div>
					    </div>
					    </div>
	  
						<div class="control-group">
						<div class="span5">
					    <label class="control-label" for="jljdSreport-info_fwarninfo"><spring:message code="jljdSreport-info.jljdSreport-info.input.fwarninfo" text="提醒内容"/></label>
						<div class="controls">
						      	<input id="jljdSreport-info_fwarninfo"  name="fwarninfo" value="${model.fwarninfo}"  class="form-control" class="text  "  minlength="" maxlength="500">
					    </div>
					  </div>
	  
						<div class="span5">
					    <label class="control-label" for="jljdSreport-info_fuploaddate"><spring:message code="jljdSreport-info.jljdSreport-info.input.fuploaddate" text="上传时间"/></label>
						<div class="controls">
						      	 <div class="input-append datepicker date" style="padding-left: 0px;">
							    	<input id="jljdSreport-info_fuploaddate" type="text" name="fuploaddate" value="${model.fuploaddate}" size="40" class="text "   style="background-color:white;cursor:default; width: 175px;">
							 		 <span class="add-on" style="padding-top: 2px; padding-bottom: 2px;"><i class="icon-calendar"></i></span>
							 	 </div>
					    </div>
					    </div>
					    </div>
	  
						<div class="control-group">
						<div class="span5">
					    <label class="control-label" for="jljdSreport-info_fuploadname"><spring:message code="jljdSreport-info.jljdSreport-info.input.fuploadname" text="上传人"/></label>
						<div class="controls">
							  	<input id="jljdSreport-info_fuploadname" type="text" name="fuploadname" value="${model.fuploadname}" size="" class="number   " minlength="" maxlength="">
					    </div>
					  </div>
	  
						<div class="span5">
					    <label class="control-label" for="jljdSreport-info_fujianid"><spring:message code="jljdSreport-info.jljdSreport-info.input.fujianid" text="附件id"/></label>
						<div class="controls">
							  	<input id="jljdSreport-info_fujianid" type="text" name="fujianid" value="${model.fujianid}" size="" class="number   " minlength="" maxlength="">
					    </div>
					    </div>
					    </div>
	  
						<div class="control-group">
						<div class="span5">
					    <label class="control-label" for="jljdSreport-info_fmemo"><spring:message code="jljdSreport-info.jljdSreport-info.input.fmemo" text="备注"/></label>
						<div class="controls">
							  	 <input id="jljdSreport-info_fmemo" type="text" name="fmemo" value="${model.fmemo}" size="" class="text " minlength="" maxlength="">	
					    </div>
					  </div>
	  
						<div class="span5">
					    <label class="control-label" for="jljdSreport-info_fmemo1"><spring:message code="jljdSreport-info.jljdSreport-info.input.fmemo1" text="备注1"/></label>
						<div class="controls">
							  	 <input id="jljdSreport-info_fmemo1" type="text" name="fmemo1" value="${model.fmemo1}" size="" class="text " minlength="" maxlength="">	
					    </div>
					    </div>
					    </div>
	  
						<div class="control-group">
						<div class="span5">
					    <label class="control-label" for="jljdSreport-info_fmemo2"><spring:message code="jljdSreport-info.jljdSreport-info.input.fmemo2" text="备注2"/></label>
						<div class="controls">
							  	 <input id="jljdSreport-info_fmemo2" type="text" name="fmemo2" value="${model.fmemo2}" size="" class="text " minlength="" maxlength="">	
					    </div>
					  </div>
	  
						<div class="span5">
					    <label class="control-label" for="jljdSreport-info_fmemo3"><spring:message code="jljdSreport-info.jljdSreport-info.input.fmemo3" text="备注3"/></label>
						<div class="controls">
							  	 <input id="jljdSreport-info_fmemo3" type="text" name="fmemo3" value="${model.fmemo3}" size="" class="text " minlength="" maxlength="">	
					    </div>
					    </div>
					    </div>
	  
						<div class="control-group">
						<div class="span5">
					    <label class="control-label" for="jljdSreport-info_fmemo4"><spring:message code="jljdSreport-info.jljdSreport-info.input.fmemo4" text="备注4"/></label>
						<div class="controls">
							  	 <input id="jljdSreport-info_fmemo4" type="text" name="fmemo4" value="${model.fmemo4}" size="" class="text " minlength="" maxlength="">	
					    </div>
					  </div>
	  
						<div class="span5">
					    <label class="control-label" for="jljdSreport-info_fxmid"><spring:message code="jljdSreport-info.jljdSreport-info.input.fxmid" text="项目id"/></label>
						<div class="controls">
							  	<input id="jljdSreport-info_fxmid" type="text" name="fxmid" value="${model.fxmid}" size="" class="number   " minlength="" maxlength="">
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

	  <!-- end of main -->
	</div>

  </body>

</html>
