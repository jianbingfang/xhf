<%@page contentType="text/html;charset=UTF-8"%>
<%@include file="/taglibs.jsp"%>
<%pageContext.setAttribute("currentHeader", "sckf-home");%>
<%pageContext.setAttribute("currentMenu", "commDw");%>
<!doctype html>
<html lang="zh">

  <head>
    <%@include file="/common/meta.jsp"%>
    <title><spring:message code="commDw-info.commDw-info.input.title" text="编辑"/></title>
    <%@include file="/common/s.jsp"%>
    <script type="text/javascript">
$(function() {
    $("#commDw-infoForm").validate({
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
	  <%@include file="/menu/sckf-workspace.jsp"%>

	  <!-- start of main -->
      <section id="m-main" class="span10">

      <article class="m-widget">
        <header class="header">
		  <h4 class="title"><spring:message code="commDw-info.commDw-info.input.title" text="编辑" /></h4>
		</header>

		<div class="content content-inner">

<form id="commDw-infoForm" method="post" action="commDw-info-save.do" class="form-horizontal">
	  <c:if test="${model != null}">
		  <input id="commDw-info_id" type="hidden" name="fid" value="${model.fid}">
	  </c:if>
			    	<div class="control-group">
				    <label class="control-label" for="commDw-info_fname"><spring:message code="commDw-info.commDw-info.input.fname" text="单位名称"/></label>
					<div class="controls">
					  	 <input id="commDw-info_fname" type="text" name="fname" value="${model.fname}" size="" class="text required" minlength="" maxlength="">	
				    </div>
				  </div>
			    	<div class="control-group">
				    <label class="control-label" for="commDw-info_fcode"><spring:message code="commDw-info.commDw-info.input.fcode" text="代码"/></label>
					<div class="controls">
					  	 <input id="commDw-info_fcode" type="text" name="fcode" value="${model.fcode}" size="" class="text required" minlength="" maxlength="">	
				    </div>
				  </div>
			    	<div class="control-group">
				    <label class="control-label" for="commDw-info_fconcact"><spring:message code="commDw-info.commDw-info.input.fconcact" text="联系人"/></label>
					<div class="controls">
					  	 <input id="commDw-info_fconcact" type="text" name="fconcact" value="${model.fconcact}" size="" class="text required" minlength="" maxlength="">	
				    </div>
				  </div>
			    	<div class="control-group">
				    <label class="control-label" for="commDw-info_ftel"><spring:message code="commDw-info.commDw-info.input.ftel" text="电话"/></label>
					<div class="controls">
					  	 <input id="commDw-info_ftel" type="text" name="ftel" value="${model.ftel}" size="" class="text required" minlength="" maxlength="">	
				    </div>
				  </div>
			    	<div class="control-group">
				    <label class="control-label" for="commDw-info_flegal"><spring:message code="commDw-info.commDw-info.input.flegal" text="法人"/></label>
					<div class="controls">
					  	 <input id="commDw-info_flegal" type="text" name="flegal" value="${model.flegal}" size="" class="text required" minlength="" maxlength="">	
				    </div>
				  </div>
			    	<div class="control-group">
				    <label class="control-label" for="commDw-info_fmemo"><spring:message code="commDw-info.commDw-info.input.fmemo" text="备注"/></label>
					<div class="controls">
					  	 <input id="commDw-info_fmemo" type="text" name="fmemo" value="${model.fmemo}" size="" class="text required" minlength="" maxlength="">	
				    </div>
				  </div>
			    	<div class="control-group">
				    <label class="control-label" for="commDw-info_ftype"><spring:message code="commDw-info.commDw-info.input.ftype" text="类型"/></label>
					<div class="controls">
					  	<input id="commDw-info_ftype" type="text" name="ftype" value="${model.ftype}" size="" class="number   " minlength="" maxlength="">
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
