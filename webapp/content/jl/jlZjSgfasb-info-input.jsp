<%@page contentType="text/html;charset=UTF-8"%>
<%@include file="/taglibs.jsp"%>
<%pageContext.setAttribute("currentHeader", "jl-home");%>
<%pageContext.setAttribute("currentMenu", "jlZjSgfasb");%>
<!doctype html>
<html lang="zh">

  <head>
    <%@include file="/common/meta.jsp"%>
    <title><spring:message code="jlZjSgfasb-info.jlZjSgfasb-info.input.title" text="编辑"/></title>
    <%@include file="/common/s.jsp"%>
    <script type="text/javascript">
$(function() {
    $("#jlZjSgfasb-infoForm").validate({
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
		  <h4 class="title"><spring:message code="jlZjSgfasb-info.jlZjSgfasb-info.input.title" text="编辑" /></h4>
		</header>

		<div class="content content-inner">

<form id="jlZjSgfasb-infoForm" method="post" action="jlZjSgfasb-info-save.do" class="form-horizontal">
  <c:if test="${model != null}">
	  <input id="jlZjSgfasb-info_id" type="hidden" name="fid" value="${model.fid}">
  </c:if>
			    	<div class="control-group">
				    <label class="control-label" for="jlZjSgfasb-info_ffaname"><spring:message code="jlZjSgfasb-info.jlZjSgfasb-info.input.ffaname" text="方案名称"/></label>
					<div class="controls">
					  	 <input id="jlZjSgfasb-info_ffaname" type="text" name="ffaname" value="${model.ffaname}" size="" class="text required" minlength="" maxlength="">	
				    </div>
				  </div>
			    	<div class="control-group">
				    <label class="control-label" for="jlZjSgfasb-info_fxmid"><spring:message code="jlZjSgfasb-info.jlZjSgfasb-info.input.fxmid" text="项目id"/></label>
					<div class="controls">
					  	<input id="jlZjSgfasb-info_fxmid" type="text" name="fxmid" value="${model.fxmid}" size="" class="number   " minlength="" maxlength="">
				    </div>
				  </div>
			    	<div class="control-group">
				    <label class="control-label" for="jlZjSgfasb-info_fsubdate"><spring:message code="jlZjSgfasb-info.jlZjSgfasb-info.input.fsubdate" text="上报日期"/></label>
					<div class="controls">
				      	 <div class="input-append datepicker date" style="padding-left: 0px;">
					    	<input id="jlZjSgfasb-info_fsubdate" type="text" name="fsubdate" value="${model.fsubdate}" size="40" class="text "   style="background-color:white;cursor:default; width: 175px;">
					 		 <span class="add-on" style="padding-top: 2px; padding-bottom: 2px;"><i class="icon-calendar"></i></span>
					 	 </div>
				    </div>
				  </div>
			    	<div class="control-group">
				    <label class="control-label" for="jlZjSgfasb-info_fspdate"><spring:message code="jlZjSgfasb-info.jlZjSgfasb-info.input.fspdate" text="审批日期"/></label>
					<div class="controls">
				      	 <div class="input-append datepicker date" style="padding-left: 0px;">
					    	<input id="jlZjSgfasb-info_fspdate" type="text" name="fspdate" value="${model.fspdate}" size="40" class="text "   style="background-color:white;cursor:default; width: 175px;">
					 		 <span class="add-on" style="padding-top: 2px; padding-bottom: 2px;"><i class="icon-calendar"></i></span>
					 	 </div>
				    </div>
				  </div>
			    	<div class="control-group">
				    <label class="control-label" for="jlZjSgfasb-info_fsubdw"><spring:message code="jlZjSgfasb-info.jlZjSgfasb-info.input.fsubdw" text="上报单位"/></label>
					<div class="controls">
					  	 <input id="jlZjSgfasb-info_fsubdw" type="text" name="fsubdw" value="${model.fsubdw}" size="" class="text required" minlength="" maxlength="">	
				    </div>
				  </div>
			    	<div class="control-group">
				    <label class="control-label" for="jlZjSgfasb-info_ffjid"><spring:message code="jlZjSgfasb-info.jlZjSgfasb-info.input.ffjid" text="附件id"/></label>
					<div class="controls">
					  	<input id="jlZjSgfasb-info_ffjid" type="text" name="ffjid" value="${model.ffjid}" size="" class="number   " minlength="" maxlength="">
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
