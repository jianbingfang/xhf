<%@page contentType="text/html;charset=UTF-8"%>
<%@include file="/taglibs.jsp"%>
<%pageContext.setAttribute("currentHeader", "hr-home");%>
<%pageContext.setAttribute("currentMenu", "hrJiaqi");%>
<!doctype html>
<html lang="zh">

  <head>
    <%@include file="/common/meta.jsp"%>
    <title><spring:message code="hrJiaqi-info.hrJiaqi-info.input.title" text="编辑"/></title>
    <%@include file="/common/s.jsp"%>
    
        <link type="text/css" rel="stylesheet"
	href="${scopePrefix}/s/xthena/rypicker/rypicker.css">
<script type="text/javascript"
	src="${scopePrefix}/s/xthena/rypicker/rypicker.js"></script>
	
    <script type="text/javascript">
$(function() {
    $("#hrJiaqi-infoForm").validate({
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
		  <h4 class="title"><spring:message code="hrJiaqi-info.hrJiaqi-info.input.title" text="编辑" /></h4>
		</header>

		<div class="content content-inner">

<form id="hrJiaqi-infoForm" method="post" action="hrJiaqi-info-save.do" class="form-horizontal">
  <c:if test="${model != null}">
	  <input id="hrJiaqi-info_id" type="hidden" name="fid" value="${model.fid}">
  </c:if>
			    	<div class="control-group">
				    <label class="control-label" for="hrJiaqi-info_fryid"><spring:message code="hrJiaqi-info.hrJiaqi-info.input.fryid" text="人员"/></label>
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
				    <label class="control-label" for="hrJiaqi-info_fdept"><spring:message code="hrJiaqi-info.hrJiaqi-info.input.fdept" text="部门"/></label>
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
				    <label class="control-label" for="hrJiaqi-info_ftype"><spring:message code="hrJiaqi-info.hrJiaqi-info.input.ftype" text="类型"/></label>
					<div class="controls">
				      	 <select class="form-control" id="hrJiaqi-info_ftype" name="ftype" value="${model.ftype}" class=" " >
					    	 	<option value="婚假"  <c:if test="${model.ftype}=='婚假'}"> selected="selected"  </c:if>>婚假</option>
					    	 	<option value="丧假"  <c:if test="${model.ftype}=='丧假'}"> selected="selected"  </c:if>>丧假</option>
					    	 	<option value="产假"  <c:if test="${model.ftype}=='产假'}"> selected="selected"  </c:if>>产假</option>
					    	 	<option value="其他"  <c:if test="${model.ftype}=='其他'}"> selected="selected"  </c:if>>其他</option>
					 	</select>
				    </div>
				  </div>
			    	<div class="control-group">
				    <label class="control-label" for="hrJiaqi-info_fresult"><spring:message code="hrJiaqi-info.hrJiaqi-info.input.fresult" text="原因"/></label>
					<div class="controls">
				      	<textarea id="hrJiaqi-info_fresult"  name="fresult"  class="form-control" rows="6"  style="width: 560px" class="text  "  minlength="" maxlength="500">${model.fresult}</textarea>
				    </div>
				  </div>
			    	<div class="control-group">
				    <label class="control-label" for="hrJiaqi-info_fstartdate"><spring:message code="hrJiaqi-info.hrJiaqi-info.input.fstartdate" text="开始时间"/></label>
					<div class="controls">
				      	 <div class="input-append datepicker date" style="padding-left: 0px;">
					    	<input id="hrJiaqi-info_fstartdate" type="text" name="fstartdate" value="${model.fstartdate}" size="40" class="text "   style="background-color:white;cursor:default; width: 175px;">
					 		 <span class="add-on" style="padding-top: 2px; padding-bottom: 2px;"><i class="icon-calendar"></i></span>
					 	 </div>
				    </div>
				  </div>
			    	<div class="control-group">
				    <label class="control-label" for="hrJiaqi-info_fenddate"><spring:message code="hrJiaqi-info.hrJiaqi-info.input.fenddate" text="截止时间"/></label>
					<div class="controls">
				      	 <div class="input-append datepicker date" style="padding-left: 0px;">
					    	<input id="hrJiaqi-info_fenddate" type="text" name="fenddate" value="${model.fenddate}" size="40" class="text "   style="background-color:white;cursor:default; width: 175px;">
					 		 <span class="add-on" style="padding-top: 2px; padding-bottom: 2px;"><i class="icon-calendar"></i></span>
					 	 </div>
				    </div>
				  </div>
			    	<div class="control-group">
				    <label class="control-label" for="hrJiaqi-info_fstatus"><spring:message code="hrJiaqi-info.hrJiaqi-info.input.fstatus" text="状态"/></label>
					<div class="controls">
					  	 <input id="hrJiaqi-info_fstatus" type="text" name="fstatus" value="${model.fstatus}" size="" class="text " minlength="" maxlength="">	
				    </div>
				  </div>
			    	<div class="control-group">
				    <label class="control-label" for="hrJiaqi-info_fmemo"><spring:message code="hrJiaqi-info.hrJiaqi-info.input.fmemo" text="备注"/></label>
					<div class="controls">
				      	<textarea id="hrJiaqi-info_fmemo"  name="fmemo"  class="form-control" rows="6"  style="width: 560px" class="text  "  minlength="" maxlength="500">${model.fmemo}</textarea>
				    </div>
				  </div>
			    	<div class="control-group">
				    <label class="control-label" for="hrJiaqi-info_fgz"><spring:message code="hrJiaqi-info.hrJiaqi-info.input.fgz" text="工资"/></label>
					<div class="controls">
				      	<textarea id="hrJiaqi-info_fgz"  name="fgz"  class="form-control" rows="6"  style="width: 560px" class="text  "  minlength="" maxlength="255">${model.fgz}</textarea>
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
