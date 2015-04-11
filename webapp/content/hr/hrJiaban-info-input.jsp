<%@page contentType="text/html;charset=UTF-8"%>
<%@include file="/taglibs.jsp"%>
<%pageContext.setAttribute("currentHeader", "hr-home");%>
<%pageContext.setAttribute("currentMenu", "hrJiaban");%>
<!doctype html>
<html lang="zh">

  <head>
    <%@include file="/common/meta.jsp"%>
    <title><spring:message code="hrJiaban-info.hrJiaban-info.input.title" text="编辑"/></title>
    <%@include file="/common/s.jsp"%>
       
        <link type="text/css" rel="stylesheet"
	href="${scopePrefix}/s/xthena/rypicker/rypicker.css">
<script type="text/javascript"
	src="${scopePrefix}/s/xthena/rypicker/rypicker.js"></script>
	
    <script type="text/javascript">
$(function() {
    $("#hrJiaban-infoForm").validate({
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
		  <h4 class="title"><spring:message code="hrJiaban-info.hrJiaban-info.input.title" text="编辑" /></h4>
		</header>

		<div class="content content-inner">

<form id="hrJiaban-infoForm" method="post" action="hrJiaban-info-save.do" class="form-horizontal">
  <c:if test="${model != null}">
	  <input id="hrJiaban-info_id" type="hidden" name="fid" value="${model.fid}">
  </c:if>
			    	<div class="control-group">
				    <label class="control-label" for="hrJiaban-info_fryid"><spring:message code="hrJiaban-info.hrJiaban-info.input.fryid" text="人员"/></label>
					<div class="controls">
					  	<div class="input-append ryPicker">
							<input id="hrRyyj-info_fryid" type="hidden" name="fryid"  
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
				    <label class="control-label" for="hrJiaban-info_fdept"><spring:message code="hrJiaban-info.hrJiaban-info.input.fdept" text="部门"/></label>
					<div class="controls">
					  	<select id="hrGwbm-info_fdept" name="fdept" class="form-control required">
							<c:forEach items="${deptList}" var="item">
							<option value="${item.id}"
								${item.id==model.fdept? 'selected' : ''}>${item.name}</option>
						   </c:forEach>
					   </select>
				    </div>
				  </div>
			    	<div class="control-group">
				    <label class="control-label" for="hrJiaban-info_fstatus"><spring:message code="hrJiaban-info.hrJiaban-info.input.fstatus" text="状态"/></label>
					<div class="controls">
					  	 <input id="hrJiaban-info_fstatus" type="text" name="fstatus" value="${model.fstatus}" size="" class="text required" minlength="" maxlength="">	
				    </div>
				  </div>
			    	<div class="control-group">
				    <label class="control-label" for="hrJiaban-info_fstartdate"><spring:message code="hrJiaban-info.hrJiaban-info.input.fstartdate" text="开始时间"/></label>
					<div class="controls">
				      	 <div class="input-append datetimepicker date" style="padding-left: 0px;">
					    	<input id="hrJiaban-info_fstartdate" type="text" name="fstartdate" value="${model.fstartdate}" size="40" class="text "   style="background-color:white;cursor:default; width: 175px;">
					 		 <span class="add-on" style="padding-top: 2px; padding-bottom: 2px;"><i class="icon-calendar"></i></span>
					 	 </div>
				    </div>
				  </div>
			    	<div class="control-group">
				    <label class="control-label" for="hrJiaban-info_fmemo"><spring:message code="hrJiaban-info.hrJiaban-info.input.fmemo" text="备注"/></label>
					<div class="controls">
				      	<textarea id="hrJiaban-info_fmemo"  name="fmemo"  class="form-control" rows="6"  style="width: 560px" class="text  "  minlength="" maxlength="500">${model.fmemo}</textarea>
				    </div>
				  </div>
			    	<div class="control-group">
				    <label class="control-label" for="hrJiaban-info_fhours"><spring:message code="hrJiaban-info.hrJiaban-info.input.fhours" text="小时数"/></label>
					<div class="controls">
					  	<input id="hrJiaban-info_fhours" type="text" name="fhours" value="${model.fhours}" size="" class="number   " minlength="" maxlength="">
				    </div>
				  </div>
			    	<div class="control-group">
				    <label class="control-label" for="hrJiaban-info_fjiabancontent"><spring:message code="hrJiaban-info.hrJiaban-info.input.fjiabancontent" text="加班工作内容"/></label>
					<div class="controls">
				      	<textarea id="hrJiaban-info_fjiabancontent"  name="fjiabancontent"  class="form-control" rows="6"  style="width: 560px" class="text  "  minlength="" maxlength="500">${model.fjiabancontent}</textarea>
				    </div>
				  </div>
			    	<div class="control-group">
				    <label class="control-label" for="hrJiaban-info_fresult"><spring:message code="hrJiaban-info.hrJiaban-info.input.fresult" text="加班完成情况"/></label>
					<div class="controls">
				      	<textarea id="hrJiaban-info_fresult"  name="fresult"  class="form-control" rows="6"  style="width: 560px" class="text  "  minlength="" maxlength="500">${model.fresult}</textarea>
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
