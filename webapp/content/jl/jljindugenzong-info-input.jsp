<%@page contentType="text/html;charset=UTF-8"%>
<%@include file="/taglibs.jsp"%>
<%pageContext.setAttribute("currentHeader", "jl-home");%>
<%pageContext.setAttribute("currentMenu", "jljindugenzong");%>
<!doctype html>
<html lang="zh">

  <head>
    <%@include file="/common/meta.jsp"%>
    <title><spring:message code="jljindugenzong-info.jljindugenzong-info.input.title" text="编辑"/></title>
    <%@include file="/common/s.jsp"%>
    <script type="text/javascript">
$(function() {
    $("#jljindugenzong-infoForm").validate({
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
		  <h4 class="title"><spring:message code="jljindugenzong-info.jljindugenzong-info.input.title" text="编辑" /></h4>
		</header>

		<div class="content content-inner">

<form id="jljindugenzong-infoForm" method="post" action="jljindugenzong-info-save.do?type=${ftype}" class="form-horizontal">
  <c:if test="${model != null}">
	  <input id="jljindugenzong-info_id" type="hidden" name="fid" value="${model.fid}">
  </c:if>
   <input id="jljindugenzong-info_ftype" type="hidden" name="ftype" value="${ftype}">
			    	<div class="control-group">
				    <label class="control-label" for="jljindugenzong-info_fname"><spring:message code="jljindugenzong-info.jljindugenzong-info.input.fname" text="名称"/></label>
					<div class="controls">
					  	 <input id="jljindugenzong-info_fname" type="text" name="fname" value="${model.fname}" size="" class="text required" minlength="" maxlength="">	
				    </div>
				  </div>
			    	<div class="control-group">
				    <label class="control-label" for="jljindugenzong-info_fstartdate"><spring:message code="jljindugenzong-info.jljindugenzong-info.input.fstartdate" text="计划开始时间"/></label>
					<div class="controls">
				      	 <div class="input-append datepicker date" style="padding-left: 0px;">
					    	<input id="jljindugenzong-info_fstartdate" type="text" name="fstartdate" value="${model.fstartdate}" size="40" class="text "   style="background-color:white;cursor:default; width: 175px;">
					 		 <span class="add-on" style="padding-top: 2px; padding-bottom: 2px;"><i class="icon-calendar"></i></span>
					 	 </div>
				    </div>
				  </div>
			    	<div class="control-group">
				    <label class="control-label" for="jljindugenzong-info_fenddate"><spring:message code="jljindugenzong-info.jljindugenzong-info.input.fenddate" text="计划结束时间"/></label>
					<div class="controls">
				      	 <div class="input-append datepicker date" style="padding-left: 0px;">
					    	<input id="jljindugenzong-info_fenddate" type="text" name="fenddate" value="${model.fenddate}" size="40" class="text "   style="background-color:white;cursor:default; width: 175px;">
					 		 <span class="add-on" style="padding-top: 2px; padding-bottom: 2px;"><i class="icon-calendar"></i></span>
					 	 </div>
				    </div>
				  </div>
				  
					<div class="control-group">
					    <label class="control-label" for="jljindugenzong-info_fanalyze"><spring:message code="jljindugenzong-info.jljindugenzong-info.input.fanalyze" text="进度分析"/></label>
						<div class="controls">
						      	<textarea id="jljindugenzong-info_fanalyze"  name="fanalyze"  class="form-control" rows="8"  style="width: 600px" class="text  "  minlength="" maxlength="5000">${model.fanalyze}</textarea>
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
