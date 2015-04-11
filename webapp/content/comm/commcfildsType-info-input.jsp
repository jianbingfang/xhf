<%@page contentType="text/html;charset=UTF-8"%>
<%@include file="/taglibs.jsp"%>
<%pageContext.setAttribute("currentHeader", "comm-home");%>
<%pageContext.setAttribute("currentMenu", "user-defined");%>
<!doctype html>
<html lang="zh">

  <head>
    <%@include file="/common/meta.jsp"%>
    <title><spring:message code="commcfildsType-info.commcfildsType-info.input.title" text="编辑"/></title>
    <%@include file="/common/s.jsp"%>
    <script type="text/javascript">

$(function() {
    $("#commcfildsType-infoForm").validate({
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
	  <%@include file="/menu/scope.jsp"%>

	  <!-- start of main -->
      <section id="m-main" class="span10">

      <article class="m-widget">
        <header class="header">
		  <h4 class="title"><spring:message code="commcfildsType-info.commcfildsType-info.input.title" text="编辑" /></h4>
		</header>

		<div class="content content-inner">

<form id="commcfildsType-infoForm" method="post" action="commcfildsType-info-save.do" class="form-horizontal">
  <c:if test="${model != null}">
	  <input id="commcfildsType-info_id" type="hidden" name="fid" value="${model.fid}">
  </c:if>
			    	<div class="control-group">
				    <label class="control-label" for="commcfildsType-info_fcode"><spring:message code="commcfildsType-info.commcfildsType-info.input.fcode" text="代码"/></label>
					<div class="controls">
					  	 <input id="commcfildsType-info_fcode" type="text" name="fcode" value="${model.fcode}" size="" class="text required" minlength="" maxlength="">	
				    </div>
				  </div>
			    	<div class="control-group">
				    <label class="control-label" for="commcfildsType-info_fname"><spring:message code="commcfildsType-info.commcfildsType-info.input.fname" text="名称"/></label>
					<div class="controls">
					  	 <input id="commcfildsType-info_fname" type="text" name="fname" value="${model.fname}" size="" class="text required" minlength="" maxlength="">	
				    </div>
				  </div>
			    	<%-- <div class="control-group">
				    <label class="control-label" for="commcfildsType-info_fpid"><spring:message code="commcfildsType-info.commcfildsType-info.input.fpid" text="上级分类"/></label>
					<div class="controls">
					  	<input id="commcfildsType-info_fpid" type="text" name="fpid" value="${model.fpid}" size="" class="number   " minlength="" maxlength="">
				    </div>
				  </div> --%>
			    	<div class="control-group">
				    <label class="control-label" for="commcfildsType-info_ftname"><spring:message code="commcfildsType-info.commcfildsType-info.input.ftname" text="表名称"/></label>
					<div class="controls">
					  	 <input id="commcfildsType-info_ftname" type="text" name="ftname" value="${model.ftname}" size="" class="text required" minlength="" maxlength="">	
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
