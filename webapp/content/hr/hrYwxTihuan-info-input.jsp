<%@page contentType="text/html;charset=UTF-8"%>
<%@include file="/taglibs.jsp"%>
<%pageContext.setAttribute("currentHeader", "hr-home");%>
<%pageContext.setAttribute("currentMenu", "commRy");%>
<!doctype html>
<html lang="zh">

  <head>
    <%@include file="/common/meta.jsp"%>
    <title><spring:message code="hrYwxTihuan-info.hrYwxTihuan-info.input.title" text="编辑"/></title>
    <%@include file="/common/s.jsp"%>
    <link type="text/css" rel="stylesheet"
	href="${scopePrefix}/s/xthena/rypicker/rypicker.css">
<script type="text/javascript"
	src="${scopePrefix}/s/xthena/rypicker/rypicker.js"></script>
    <script type="text/javascript">
$(function() {
    $("#hrYwxTihuan-infoForm").validate({
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
	  <%@include file="/menu/hr-workspace.jsp"%>

	  <!-- start of main -->
      <section id="m-main" class="span10">

      <article class="m-widget">
        <header class="header">
		  <h4 class="title"><spring:message code="hrYwxTihuan-info.hrYwxTihuan-info.input.title" text="编辑" /></h4>
		</header>

		<div class="content content-inner">

<form id="hrYwxTihuan-infoForm" method="post" action="hrYwxTihuan-info-save.do" class="form-horizontal">
  <c:if test="${model != null}">
	  <input id="hrYwxTihuan-info_id" type="hidden" name="fid" value="${model.fid}">
  </c:if>
			    	<div class="control-group">
				    <label class="control-label" for="hrYwxTihuan-info_fryid"><spring:message code="hrYwxTihuan-info.hrYwxTihuan-info.input.fryid" text="人员"/></label>
					<div class="controls">
						<div class="input-append ryPicker">
									<input id="hrShtc-info_fryid" type="hidden" name="fryid"
										value="${model.fryid}" class="text required" > <input
										id="hrShtc-info_userName" type="text" value="${ryMap[model.fryid].fname}"
										class=" text required" disabled style="width: 175px;" value="">
									<span class="add-on"
										style="padding-top: 2px; padding-bottom: 2px;"><i
										class="icon-user"></i></span>
								</div>
				    </div>
				  </div>
			    	<div class="control-group">
				    <label class="control-label" for="hrYwxTihuan-info_fnewryid"><spring:message code="hrYwxTihuan-info.hrYwxTihuan-info.input.fnewryid" text="替换人员id"/></label>
					<div class="controls">
							<div class="input-append ryPicker">
									<input id="hrShtc-info_fnewryid" type="hidden" name="fnewryid"
										value="${model.fnewryid}" class="text required" > <input
										id="hrShtc-info_fnewryid" type="text" value="${ryMap[model.fnewryid].fname}"
										class=" text required" disabled style="width: 175px;" value="">
									<span class="add-on"
										style="padding-top: 2px; padding-bottom: 2px;"><i
										class="icon-user"></i></span>
								</div>
				    </div>
				  </div>
			    	<div class="control-group">
				    <label class="control-label" for="hrYwxTihuan-info_frdate"><spring:message code="hrYwxTihuan-info.hrYwxTihuan-info.input.frdate" text="替换时间"/></label>
					<div class="controls">
				      	 <div class="input-append datepicker date" style="padding-left: 0px;">
					    	<input id="hrYwxTihuan-info_frdate" type="text" name="frdate" value="${model.frdate}" size="40" class="text "   style="background-color:white;cursor:default; width: 175px;">
					 		 <span class="add-on" style="padding-top: 2px; padding-bottom: 2px;"><i class="icon-calendar"></i></span>
					 	 </div>
				    </div>
				  </div>
			    	<div class="control-group">
				    <label class="control-label" for="hrYwxTihuan-info_fmemo"><spring:message code="hrYwxTihuan-info.hrYwxTihuan-info.input.fmemo" text="备注"/></label>
					<div class="controls">
				      	<textarea id="hrYwxTihuan-info_fmemo"  name="fmemo"  class="form-control" rows="6"  style="width: 560px" class="text  "  minlength="" maxlength="500">${model.fmemo}</textarea>
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
