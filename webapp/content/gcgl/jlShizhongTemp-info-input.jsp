<%@page contentType="text/html;charset=UTF-8"%>
<%@include file="/taglibs.jsp"%>
<%pageContext.setAttribute("currentHeader", "gcgl-home");%>
<%pageContext.setAttribute("currentMenu", "jlShizhongTemp");%>
<!doctype html>
<html lang="zh">

  <head>
    <%@include file="/common/meta.jsp"%>
    <title><spring:message code="jlShizhongTemp-info.jlShizhongTemp-info.input.title" text="编辑"/></title>
    <%@include file="/common/s.jsp"%>
    <script type="text/javascript">
$(function() {
    $("#jlShizhongTemp-infoForm").validate({
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
		  <h4 class="title"><spring:message code="jlShizhongTemp-info.jlShizhongTemp-info.input.title" text="编辑" /></h4>
		</header>

		<div class="content content-inner">

<form id="jlShizhongTemp-infoForm" method="post" action="jlShizhongTemp-info-save.do" class="form-horizontal">
  <c:if test="${model != null}">
	  <input id="jlShizhongTemp-info_id" type="hidden" name="fid" value="${model.fid}">
  </c:if>
   <input id="jlShizhongTemp-info_ftype" type="hidden" name="ftype" value="${ftype}" >
			    	<div class="control-group">
				    <label class="control-label" for="jlShizhongTemp-info_fname"><spring:message code="jlShizhongTemp-info.jlShizhongTemp-info.input.fname" text="名称"/></label>
					<div class="controls">
					  	 <input id="jlShizhongTemp-info_fname" type="text" name="fname" value="${model.fname}" size="" class="text required" minlength="" maxlength="">	
				    </div>
				  </div>
			    	<div class="control-group">
				    <label class="control-label" for="jlShizhongTemp-info_forder"><spring:message code="jlShizhongTemp-info.jlShizhongTemp-info.input.forder" text="排序"/></label>
					<div class="controls">
					  	 <input id="jlShizhongTemp-info_forder" type="text" name="forder" value="${model.forder}" size="" class="text required" minlength="" maxlength="">	
				    </div>
				  </div>
			    <%-- 	<div class="control-group">
				    <label class="control-label" for="jlShizhongTemp-info_ftype"><spring:message code="jlShizhongTemp-info.jlShizhongTemp-info.input.ftype" text="类型"/></label>
					<div class="controls">
					  	 <input id="jlShizhongTemp-info_ftype" type="text" name="ftype" value="${model.ftype}" size="" class="text required" minlength="" maxlength="">	
				    </div>
				  </div> --%>
			    	<div class="control-group">
				    <label class="control-label" for="jlShizhongTemp-info_fdoctemp"><spring:message code="jlShizhongTemp-info.jlShizhongTemp-info.input.fdoctemp" text="模板"/></label>
					<div class="controls">
					  	 <input id="jlShizhongTemp-info_fdoctemp" type="text" name="fdoctemp" value="${model.fdoctemp}" size="" class="text required" minlength="" maxlength="">	
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
