<%@page contentType="text/html;charset=UTF-8"%>
<%@include file="/taglibs.jsp"%>
<%pageContext.setAttribute("currentHeader", "hr-home");%>
<%pageContext.setAttribute("currentMenu", "hrGongchu");%>
<!doctype html>
<html lang="zh">

  <head>
    <%@include file="/common/meta.jsp"%>
    <title><spring:message code="hrGongchu-info.hrGongchu-info.input.title" text="编辑"/></title>
    <%@include file="/common/s.jsp"%>
    
    
        <link type="text/css" rel="stylesheet"
	href="${scopePrefix}/s/xthena/rypicker/rypicker.css">
<script type="text/javascript"
	src="${scopePrefix}/s/xthena/rypicker/rypicker.js"></script>
	
    <script type="text/javascript">
$(function() {
    $("#hrGongchu-infoForm").validate({
        submitHandler: function(form) {
			bootbox.animate(false);
			var box = bootbox.dialog('<div class="progress progress-striped active" style="margin:0px;"><div class="bar" style="width: 100%;"></div></div>');
            form.submit();
        },
        errorClass: 'validate-error'
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
		  <h4 class="title"><spring:message code="hrGongchu-info.hrGongchu-info.input.title" text="编辑" /></h4>
		</header>

		<div class="content content-inner">

<form id="hrGongchu-infoForm" method="post" action="hrGongchu-info-save.do" class="form-horizontal">
  <c:if test="${model != null}">
	  <input id="hrGongchu-info_id" type="hidden" name="fid" value="${model.fid}">
  </c:if>
			    	<div class="control-group">
				    <label class="control-label" for="hrGongchu-info_fryid"><spring:message code="hrGongchu-info.hrGongchu-info.input.fryid" text="人员"/></label>
					<div class="controls">
					  	<div class="input-append ryPicker">
							<input id="hrRyyj-info_fryid" type="hidden" name="fryid"  
								value="${model.fryid}" class="text " > <input
								id="hrShtc-info_userName" type="text" value="${ryMap[model.fryid].fname}" 
								class=" text " disabled style="width: 175px;" value="">
							<span class="add-on"
								style="padding-top: 2px; padding-bottom: 2px;"><i
								class="icon-user"></i></span>
						</div>
				    </div>
				  </div>
			    	<div class="control-group">
				    <label class="control-label" for="hrGongchu-info_fdept"><spring:message code="hrGongchu-info.hrGongchu-info.input.fdept" text="部门"/></label>
					<div class="controls">
						<select id="hrGwbm-info_fdept" name="fdept" class="form-control ">
							<c:forEach items="${deptList}" var="item">
							<option value="${item.id}"
								${item.id==model.fdept? 'selected' : ''}>${item.name}</option>
						   </c:forEach>
					   </select>
				    </div>
				  </div>
			    	<div class="control-group">
				    <label class="control-label" for="hrGongchu-info_fresult"><spring:message code="hrGongchu-info.hrGongchu-info.input.fresult" text="原因"/></label>
					<div class="controls">
				      	<textarea id="hrGongchu-info_fresult"  name="fresult"  class="form-control" rows="6"  style="width: 560px" class="text  "  minlength="" maxlength="500">${model.fresult}</textarea>
				    </div>
				  </div>
			    	<div class="control-group">
				    <label class="control-label" for="hrGongchu-info_fstartdate"><spring:message code="hrGongchu-info.hrGongchu-info.input.fstartdate" text="开始时间"/></label>
					<div class="controls">
				      	 <div class="input-append datepicker date" style="padding-left: 0px;">
					    	<input id="hrGongchu-info_fstartdate" type="text" name="fstartdate" value="${model.fstartdate}" size="40" class="text "   style="background-color:white;cursor:default; width: 175px;">
					 		 <span class="add-on" style="padding-top: 2px; padding-bottom: 2px;"><i class="icon-calendar"></i></span>
					 	 </div>
				    </div>
				  </div>
			    	<div class="control-group">
				    <label class="control-label" for="hrGongchu-info_fenddate"><spring:message code="hrGongchu-info.hrGongchu-info.input.fenddate" text="截止时间"/></label>
					<div class="controls">
				      	 <div class="input-append datepicker date" style="padding-left: 0px;">
					    	<input id="hrGongchu-info_fenddate" type="text" name="fenddate" value="${model.fenddate}" size="40" class="text "   style="background-color:white;cursor:default; width: 175px;">
					 		 <span class="add-on" style="padding-top: 2px; padding-bottom: 2px;"><i class="icon-calendar"></i></span>
					 	 </div>
				    </div>
				  </div>
			    	<div class="control-group">
				    <label class="control-label" for="hrGongchu-info_fstatus"><spring:message code="hrGongchu-info.hrGongchu-info.input.fstatus" text="状态"/></label>
					<div class="controls">
					  	 <input id="hrGongchu-info_fstatus" type="text" name="fstatus" value="${model.fstatus}" size="" class="text " minlength="" maxlength="">	
				    </div>
				  </div>
			    	<div class="control-group">
				    <label class="control-label" for="hrGongchu-info_fmemo"><spring:message code="hrGongchu-info.hrGongchu-info.input.fmemo" text="备注"/></label>
					<div class="controls">
				      	<textarea id="hrGongchu-info_fmemo"  name="fmemo"  class="form-control" rows="6"  style="width: 560px" class="text  "  minlength="" maxlength="500">${model.fmemo}</textarea>
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
