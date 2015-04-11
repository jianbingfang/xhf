<%@page contentType="text/html;charset=UTF-8"%>
<%@include file="/taglibs.jsp"%>
<%pageContext.setAttribute("currentHeader", "sysconf-home");%>
<%pageContext.setAttribute("currentMenu", "auth");%>
<!doctype html>
<html lang="zh">

  <head>
    <%@include file="/common/meta.jsp"%>
    <title><spring:message code="commMenu-info.commMenu-info.input.title" text="编辑"/></title>
    <%@include file="/common/s.jsp"%>
    <script type="text/javascript">
$(function() {
    $("#commMenu-infoForm").validate({
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
	  <%@include file="/menu/auth.jsp"%>

	  <!-- start of main -->
      <section id="m-main" class="span10">

      <article class="m-widget">
        <header class="header">
		  <h4 class="title"><spring:message code="commMenu-info.commMenu-info.input.title" text="编辑" /></h4>
		</header>

		<div class="content content-inner">

<form id="commMenu-infoForm" method="post" action="commMenu-info-save.do" class="form-horizontal">
  <c:if test="${model != null}">
	  <input id="commMenu-info_id" type="hidden" name="fid" value="${model.fid}">
  </c:if>
			    	<div class="control-group">
				    <label class="control-label" for="commMenu-info_fname"><spring:message code="commMenu-info.commMenu-info.input.fname" text="菜单名称"/></label>
					<div class="controls">
					  	 <input id="commMenu-info_fname" type="text" name="fname" value="${model.fname}" size="" class="text required" minlength="" maxlength="">	
				    </div>
				  </div>
			    	<div class="control-group">
				    <label class="control-label" for="commMenu-info_furl"><spring:message code="commMenu-info.commMenu-info.input.furl" text="菜单url"/></label>
					<div class="controls">
				      	<textarea id="commMenu-info_furl"  name="furl"  class="form-control" rows="6"  style="width: 560px" class="text  "  minlength="" maxlength="512">${model.furl}</textarea>
				    </div>
				  </div>
				  
				  <div class="control-group">
				    <label class="control-label" for="commMenu-info_fmenucode"><spring:message code="commMenu-info.commMenu-info.input.fmenucode" text="菜单代码"/></label>
					<div class="controls">
				      	<textarea id="commMenu-info_fmenucode"  name="fmenucode"  class="form-control" rows="6"  style="width: 560px" class="text  "  minlength="" maxlength="512">${model.fmenucode}</textarea>
				    </div>
				  </div>
			    	<div class="control-group">
				    <label class="control-label" for="commMenu-info_fpid"><spring:message code="commMenu-info.commMenu-info.input.fpid" text="父级菜单"/></label>
					<div class="controls">
					  	<input id="commMenu-info_fpid" type="text" name="fpid" value="${model.fpid}" size="" class="number   " minlength="" maxlength="">
				    </div>
				  </div> 
			    	<div class="control-group">
				    <label class="control-label" for="commMenu-info_fmemo"><spring:message code="commMenu-info.commMenu-info.input.fmemo" text="备注"/></label>
					<div class="controls">
					  	 <input id="commMenu-info_fmemo" type="text" name="fmemo" value="${model.fmemo}" size="" class="text " minlength="" maxlength="">	
				    </div>
				  </div>
			    	<div class="control-group">
				    <label class="control-label" for="commMenu-info_forder"><spring:message code="commMenu-info.commMenu-info.input.forder" text="排序"/></label>
					<div class="controls">
					  	 <input id="commMenu-info_forder" type="text" name="forder" value="${model.forder}" size="" class="text " minlength="" maxlength="">	
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
