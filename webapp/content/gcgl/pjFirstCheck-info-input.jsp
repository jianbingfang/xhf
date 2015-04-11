<%@page contentType="text/html;charset=UTF-8"%>
<%@include file="/taglibs.jsp"%>
<%pageContext.setAttribute("currentHeader", "gcgl-home");%>
<%pageContext.setAttribute("currentMenu", "gcgl-xmgl");%>
<!doctype html>
<html lang="zh">

  <head>
    <%@include file="/common/meta.jsp"%>
    <title><spring:message code="pjFirstCheck-info.pjFirstCheck-info.input.title" text="编辑"/></title>
    <%@include file="/common/s.jsp"%>
            <link type="text/css" rel="stylesheet"
	href="${scopePrefix}/s/xthena/xmpicker/xmpicker.css">
<script type="text/javascript"
	src="${scopePrefix}/s/xthena/xmpicker/xmpicker.js"></script>
	
    	<link type="text/css" rel="stylesheet"
	href="${scopePrefix}/s/xthena/rypicker/rypicker.css">
<script type="text/javascript"
	src="${scopePrefix}/s/xthena/rypicker/rypicker.js"></script>
	
    <script type="text/javascript">
$(function() {
    $("#pjFirstCheck-infoForm").validate({
        submitHandler: function(form) {
			bootbox.animate(false);
			var box = bootbox.dialog('<div class="progress progress-striped active" style="margin:0px;"><div class="bar" style="width: 100%;"></div></div>');
            form.submit();
        },
        errorClass: 'validate-error'
    });
    
    createxmPicker({
		modalId : 'xmPicker',
		url : '${scopePrefix}/gcgl/pjXm-simple-list.do'
	});
    
	createryPicker({
		modalId : 'ryPicker',
		url : '${scopePrefix}/hr/commRy-simple-list.do'
	});
})
    </script>
  </head>

  <body>
    <%@include file="/header.jsp"%>

    <div class="row-fluid">
	  <%@include file="/menu/gcgl-workspace.jsp"%>

	  <!-- start of main -->
      <section id="m-main" class="span10">

      <article class="m-widget">
        <header class="header">
		  <h4 class="title"><spring:message code="pjFirstCheck-info.pjFirstCheck-info.input.title" text="编辑" /></h4>
		</header>

		<div class="content content-inner">

<form id="pjFirstCheck-infoForm" method="post" action="pjFirstCheck-info-save.do" class="form-horizontal">
  <c:if test="${model != null}">
	  <input id="pjFirstCheck-info_id" type="hidden" name="fid" value="${model.fid}">
  </c:if>
			    <%-- 	<div class="control-group">
				    <label class="control-label" for="pjFirstCheck-info_fcheckno"><spring:message code="pjFirstCheck-info.pjFirstCheck-info.input.fcheckno" text="编号"/></label>
					<div class="controls">
					  	 <input id="pjFirstCheck-info_fcheckno" type="text" name="fcheckno" value="${model.fcheckno}" size="" class="text required" minlength="" maxlength="">	
				    </div>
				  </div> --%>
			    	<div class="control-group">
				    <label class="control-label" for="pjFirstCheck-info_fxmid"><spring:message code="pjFirstCheck-info.pjFirstCheck-info.input.fxmid" text="项目"/></label>
					<div class="controls">
						
						<div class="input-append xmPicker">
								<input id="pjFirstCheck-info_fxmid" type="hidden" name="fxmid"
									value="${model.fxmid}"> <input
									id="xmBxRecord-info_xmmc" type="text" value="${xmMap[model.fxmid].fxmname}" disabled
									class=" required" style="width: 175px;" value=""> <span
									class="add-on" style="padding-top: 2px; padding-bottom: 2px;"><i
									class="icon-th-list"></i></span>
							</div>
							
				    </div>
				  </div>
			    	<div class="control-group">
				    <label class="control-label" for="pjFirstCheck-info_fcheckerid"><spring:message code="pjFirstCheck-info.pjFirstCheck-info.input.fcheckerid" text="检查人"/></label>
					<div class="controls">
							<div class="input-append ryPicker">
								<input id="pjFirstCheck-info_fcheckerid" type="hidden" name="fcheckerid"
									value="${model.fcheckerid}"> <input
									id="ryBxRecord-info_userName" type="text" value="${ryMap[model.fcheckerid].fname}"
									disabled class=" required" style="width: 175px;" value="">
							<span class="add-on"
								style="padding-top: 2px; padding-bottom: 2px;"><i
								class="icon-user"></i></span>
						</div>
							
				    </div>
				  </div>
			    	<div class="control-group">
				    <label class="control-label" for="pjFirstCheck-info_fdate"><spring:message code="pjFirstCheck-info.pjFirstCheck-info.input.fdate" text="检查日期"/></label>
					<div class="controls">
				      	 <div class="input-append datepicker date" style="padding-left: 0px;">
					    	<input id="pjFirstCheck-info_fdate" type="text" name="fdate" value="${model.fdate}" size="40" class="text "   style="background-color:white;cursor:default; width: 175px;">
					 		 <span class="add-on" style="padding-top: 2px; padding-bottom: 2px;"><i class="icon-calendar"></i></span>
					 	 </div>
				    </div>
				  </div>
			    	<div class="control-group">
				    <label class="control-label" for="pjFirstCheck-info_fgoal"><spring:message code="pjFirstCheck-info.pjFirstCheck-info.input.fgoal" text="得分"/></label>
					<div class="controls">
					  	 <input id="pjFirstCheck-info_fgoal" type="text" name="fgoal" value="${model.fgoal}" size="" class="text " minlength="" maxlength="">	
				    </div>
				  </div>
			    	<div class="control-group">
				    <label class="control-label" for="pjFirstCheck-info_fproblem"><spring:message code="pjFirstCheck-info.pjFirstCheck-info.input.fproblem" text="存在问题"/></label>
					<div class="controls">
				      	<textarea id="pjFirstCheck-info_fproblem"  name="fproblem"  class="form-control" rows="6"  style="width: 560px" class="text  "  minlength="" maxlength="500">${model.fproblem}</textarea>
				    </div>
				  </div>
			    	<div class="control-group">
				    <label class="control-label" for="pjFirstCheck-info_ffuchadate"><spring:message code="pjFirstCheck-info.pjFirstCheck-info.input.ffuchadate" text="复查时间"/></label>
					<div class="controls">
				      	 <div class="input-append datepicker date" style="padding-left: 0px;">
					    	<input id="pjFirstCheck-info_ffuchadate" type="text" name="ffuchadate" value="${model.ffuchadate}" size="40" class="text "   style="background-color:white;cursor:default; width: 175px;">
					 		 <span class="add-on" style="padding-top: 2px; padding-bottom: 2px;"><i class="icon-calendar"></i></span>
					 	 </div>
				    </div>
				  </div>
			    	<div class="control-group">
				    <label class="control-label" for="pjFirstCheck-info_fcucharenid"><spring:message code="pjFirstCheck-info.pjFirstCheck-info.input.fcucharenid" text="复查人"/></label>
					<div class="controls">
							<div class="input-append ryPicker">
								<input id="pjFirstCheck-info_fcucharenid" type="hidden" name="fcucharenid"
									value="${model.fcucharenid}"> <input
									id="ryBxRecord-info_userName" type="text" value="${ryMap[model.fcucharenid].fname}"
									disabled class=" required" style="width: 175px;" value="">
							<span class="add-on"
								style="padding-top: 2px; padding-bottom: 2px;"><i
								class="icon-user"></i></span>
						</div>
				    </div>
				  </div>
			    	<div class="control-group">
				    <label class="control-label" for="pjFirstCheck-info_ffucharesult"><spring:message code="pjFirstCheck-info.pjFirstCheck-info.input.ffucharesult" text="复查结果"/></label>
					<div class="controls">
				      	<textarea id="pjFirstCheck-info_ffucharesult"  name="ffucharesult"  class="form-control" rows="6"  style="width: 560px" class="text  "  minlength="" maxlength="500">${model.ffucharesult}</textarea>
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
