<%@page contentType="text/html;charset=UTF-8"%>
<%@include file="/taglibs.jsp"%>
<%pageContext.setAttribute("currentHeader", "gcgl-home");%>
<%pageContext.setAttribute("currentMenu", "pjZerenshu");%>
<!doctype html>
<html lang="zh">

  <head>
    <%@include file="/common/meta.jsp"%>
    <title><spring:message code="pjZerenshu-info.pjZerenshu-info.input.title" text="编辑"/></title>
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
    $("#pjZerenshu-infoForm").validate({
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

    <div class="row-fluid">

	  <!-- start of main -->

      <article class="m-widget">
        <header class="header">
		  <h4 class="title"><spring:message code="pjZerenshu-info.pjZerenshu-info.input.title" text="编辑" /></h4>
		</header>

		<div class="content content-inner">

<form id="pjZerenshu-infoForm" method="post" action="pjZerenshu-info-save.do" class="form-horizontal">
  <c:if test="${model != null}">
	  <input id="pjZerenshu-info_id" type="hidden" name="fid" value="${model.fid}">
  </c:if>
			    	<div class="control-group">
				    <label class="control-label" for="pjZerenshu-info_fxmname"><spring:message code="pjZerenshu-info.pjZerenshu-info.input.fxmname" text="项目名称"/></label>
					<div class="controls">
						<div class="input-append xmPicker">
								<input id="xzChufa-info_fxmid" type="hidden" name="fxmid"
									value="${model.fxmid}"> <input
									id="xmBxRecord-info_xmmc" type="text" value="${xmMap[model.fxmid].fxmname}" disabled
									class=" required" style="width: 175px;" value=""> <span
									class="add-on" style="padding-top: 2px; padding-bottom: 2px;"><i
									class="icon-th-list"></i></span>
							</div>
				    </div>
				  </div>
				  	<div class="control-group">
				    <label class="control-label" for="pjZerenshu-info_fryid"><spring:message code="pjZerenshu-info.pjZerenshu-info.input.fryid" text="签署人"/></label>
					<div class="controls">
						<div class="input-append ryPicker">
									<input id="pjZerenshu-info_fryid" type="hidden" name="fryid"
										value="${model.fryid}"> <input
										id="ryBxRecord-info_userName" type="text" value="${ryMap[model.fryid].fname}"
										disabled class=" required" style="width: 175px;" value="">
									<span class="add-on"
										style="padding-top: 2px; padding-bottom: 2px;"><i
										class="icon-user"></i></span>
								</div>
				    </div>
				  </div>
			    	<div class="control-group">
				    <label class="control-label" for="pjZerenshu-info_fdate"><spring:message code="pjZerenshu-info.pjZerenshu-info.input.fdate" text="签订时间"/></label>
					<div class="controls">
				      	 <div class="input-append datepicker date" style="padding-left: 0px;">
					    	<input id="pjZerenshu-info_fdate" type="text" name="fdate" value="${model.fdate}" size="40" class="text "  style="background-color:white;cursor:default; width: 175px;">
					 		 <span class="add-on" style="padding-top: 2px; padding-bottom: 2px;"><i class="icon-calendar"></i></span>
					 	 </div>
				    </div>
				  </div>
				  <div class="control-group">
				    <label class="control-label" for="pjZerenshu-info_fcontent"><spring:message code="pjZerenshu-info.pjZerenshu-info.input.fcontent" text="签署内容"/></label>
					<div class="controls">
				      	<textarea id="pjZerenshu-info_fcontent"  name="fcontent"  class="form-control" rows="6"  style="width: 560px" class="text  "  minlength="" maxlength="500">${model.fcontent}</textarea>
				    </div>
				  </div>
				  
			    	<div class="control-group">
				    <label class="control-label" for="pjZerenshu-info_fmemo"><spring:message code="pjZerenshu-info.pjZerenshu-info.input.fmemo" text="备注"/></label>
					<div class="controls">
				      	<textarea id="pjZerenshu-info_fmemo"  name="fmemo"  class="form-control" rows="6"  style="width: 560px" class="text  "  minlength="" maxlength="500">${model.fmemo}</textarea>
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
