<%@page contentType="text/html;charset=UTF-8"%>
<%@include file="/taglibs.jsp"%>
<%pageContext.setAttribute("currentHeader", "jl-home");%>
<%pageContext.setAttribute("currentMenu", "dwzz");%>
<!doctype html>
<html lang="zh">

  <head>
    <%@include file="/common/meta.jsp"%>
    <title><spring:message code="dwzz-info.dwzz-info.input.title" text="编辑"/></title>
    <%@include file="/common/s.jsp"%>
    <script type="text/javascript">
$(function() {
    $("#dwzz-infoForm").validate({
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
		  <h4 class="title"><spring:message code="dwzz-info.dwzz-info.input.title" text="编辑" /></h4>
		</header>

		<div class="content content-inner">

<form id="dwzz-infoForm" method="post" action="dwzz-info-save.do" class="form-horizontal">
  <c:if test="${model != null}">
	  <input id="dwzz-info_id" type="hidden" name="fid" value="${model.fid}">
  </c:if>
			    	<div class="control-group">
				    <label class="control-label" for="dwzz-info_fname"><spring:message code="dwzz-info.dwzz-info.input.fname" text="单位名称"/></label>
					<div class="controls">
					  	 <input id="dwzz-info_fname" type="text" name="fname" value="${model.fname}" size="" class="text required" minlength="" maxlength="">	
				    </div>
				  </div>
				  <div class="control-group">
				    <label class="control-label" for="dwzz-info_fzzlevel"><spring:message code="dwzz-info.dwzz-info.input.fzzlevel" text="资质等级"/></label>
					<div class="controls">
					  	 <input id="dwzz-info_fzzlevel" type="text" name="fzzlevel" value="${model.fzzlevel}" size="" class="text required" minlength="" maxlength="">	
				    </div>
				  </div>
				  <div class="control-group">
				    <label class="control-label" for="dwzz-info_fyyzzyxq"><spring:message code="dwzz-info.dwzz-info.input.fyyzzyxq" text="营业执照有效期"/></label>
					<div class="controls">
					  	 <input id="dwzz-info_fyyzzyxq" type="text" name="fyyzzyxq" value="${model.fyyzzyxq}" size="" class="text required" minlength="" maxlength="">	
				    </div>
				  </div> 
				  	<div class="control-group">
				    <label class="control-label" for="dwzz-info_fval"><spring:message code="dwzz-info.dwzz-info.input.fval" text="有无"/></label>
					<div class="controls">
				      	 <select class="form-control" id="dwzz-info_fval" name="fval" value="${model.fval}" class=" " >
					    	 	<option value="有"  <c:if test="${model.fval}=='有'}"> selected="selected"  </c:if>>有</option>
					    	 	<option value="无"  <c:if test="${model.fval}=='无'}"> selected="selected"  </c:if>>无</option>
					 	</select>
				    </div>
				  </div>
			    	<div class="control-group">
				    <label class="control-label" for="dwzz-info_fstatus"><spring:message code="dwzz-info.dwzz-info.input.fstatus" text="审核状态"/></label>
					<div class="controls">
				      	 <select class="form-control" id="dwzz-info_fstatus" name="fstatus" value="${model.fstatus}" class=" " >
					    	 	<option value="通过"  <c:if test="${model.fstatus}=='通过'}"> selected="selected"  </c:if>>通过</option>
					    	 	<option value="不通过"  <c:if test="${model.fstatus}=='不通过'}"> selected="selected"  </c:if>>不通过</option>
					 	</select>
				    </div>
				  </div>
			    	<div class="control-group">
				    <label class="control-label" for="dwzz-info_fmemo"><spring:message code="dwzz-info.dwzz-info.input.fmemo" text="备注"/></label>
					<div class="controls">
					  	 <input id="dwzz-info_fmemo" type="text" name="fmemo" value="${model.fmemo}" size="" class="text " minlength="" maxlength="">	
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
