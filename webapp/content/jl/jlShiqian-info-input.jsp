<%@page contentType="text/html;charset=UTF-8"%>
<%@include file="/taglibs.jsp"%>
<%pageContext.setAttribute("currentHeader", "jl-home");%>
<%pageContext.setAttribute("currentMenu", "jlShiqian");%>
<!doctype html>
<html lang="zh">

  <head>
    <%@include file="/common/meta.jsp"%>
    <title><spring:message code="jlShiqian-info.jlShiqian-info.input.title" text="编辑"/></title>
    <%@include file="/common/s.jsp"%>
    <script type="text/javascript">
$(function() {
    $("#jlShiqian-infoForm").validate({
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
		  <h4 class="title"><spring:message code="jlShiqian-info.jlShiqian-info.input.title" text="编辑" /></h4>
		</header>

		<div class="content content-inner">

<form id="jlShiqian-infoForm" method="post" action="jlShiqian-info-save.do" class="form-horizontal">
  <c:if test="${model != null}">
	  <input id="jlShiqian-info_id" type="hidden" name="fid" value="${model.fid}">
  </c:if>
			    	<div class="control-group">
				    <label class="control-label" for="jlShiqian-info_ftype"><spring:message code="jlShiqian-info.jlShiqian-info.input.ftype" text="类型"/></label>
					<div class="controls">
					  	 <input id="jlShiqian-info_ftype" type="text" name="ftype" value="${model.ftype}" size="" class="text required" minlength="" maxlength="">	
				    </div>
				  </div>
			    	<div class="control-group">
				    <label class="control-label" for="jlShiqian-info_fitem"><spring:message code="jlShiqian-info.jlShiqian-info.input.fitem" text="项目"/></label>
					<div class="controls">
					  	 <input id="jlShiqian-info_fitem" type="text" name="fitem" value="${model.fitem}" size="" class="text required" minlength="" maxlength="">	
				    </div>
				  </div>
			    	<div class="control-group">
				    <label class="control-label" for="jlShiqian-info_fstatus"><spring:message code="jlShiqian-info.jlShiqian-info.input.fstatus" text="状态"/></label>
					<div class="controls">
					  	 <input id="jlShiqian-info_fstatus" type="text" name="fstatus" value="${model.fstatus}" size="" class="text " minlength="" maxlength="">	
				    </div>
				  </div>
			    	<div class="control-group">
				    <label class="control-label" for="jlShiqian-info_fuploaddate"><spring:message code="jlShiqian-info.jlShiqian-info.input.fuploaddate" text="时间"/></label>
					<div class="controls">
				      	 <div class="input-append datepicker date" style="padding-left: 0px;">
					    	<input id="jlShiqian-info_fuploaddate" type="text" name="fuploaddate" value="${model.fuploaddate}" size="40" class="text "   style="background-color:white;cursor:default; width: 175px;">
					 		 <span class="add-on" style="padding-top: 2px; padding-bottom: 2px;"><i class="icon-calendar"></i></span>
					 	 </div>
				    </div>
				  </div>
			    	<div class="control-group">
				    <label class="control-label" for="jlShiqian-info_ffujianids"><spring:message code="jlShiqian-info.jlShiqian-info.input.ffujianids" text="附件ids"/></label>
					<div class="controls">
				      	<textarea id="jlShiqian-info_ffujianids"  name="ffujianids"  class="form-control" rows="6"  style="width: 560px" class="text  "  minlength="" maxlength="500">${model.ffujianids}</textarea>
				    </div>
				  </div>
			    	<div class="control-group">
				    <label class="control-label" for="jlShiqian-info_fxmid"><spring:message code="jlShiqian-info.jlShiqian-info.input.fxmid" text="项目id"/></label>
					<div class="controls">
					  	<input id="jlShiqian-info_fxmid" type="text" name="fxmid" value="${model.fxmid}" size="" class="number   " minlength="" maxlength="">
				    </div>
				  </div>
			    	<div class="control-group">
				    <label class="control-label" for="jlShiqian-info_finfo"><spring:message code="jlShiqian-info.jlShiqian-info.input.finfo" text="文字说明"/></label>
					<div class="controls">
				      	<textarea id="jlShiqian-info_finfo"  name="finfo"  class="form-control" rows="6"  style="width: 560px" class="text  "  minlength="" maxlength="500">${model.finfo}</textarea>
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
