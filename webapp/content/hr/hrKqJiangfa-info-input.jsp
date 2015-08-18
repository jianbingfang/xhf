<%@page contentType="text/html;charset=UTF-8"%>
<%@include file="/taglibs.jsp"%>
<%pageContext.setAttribute("currentHeader", "hr-home");%>
<%pageContext.setAttribute("currentMenu", "hrKq");%>
<!doctype html>
<html lang="zh">

  <head>
    <%@include file="/common/meta.jsp"%>
    <title><spring:message code="hrKqJiangfa-info.hrKqJiangfa-info.input.title" text="编辑"/></title>
    <%@include file="/common/s.jsp"%>
    
     <link type="text/css" rel="stylesheet"
	href="${scopePrefix}/s/xthena/rypicker/rypicker.css">
<script type="text/javascript"
	src="${scopePrefix}/s/xthena/rypicker/rypicker.js"></script>
	
    <script type="text/javascript">
$(function() {
    $("#hrKqJiangfa-infoForm").validate({
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
    <%@include file="/header.jsp"%>

    <div class="row-fluid">
	  <%@include file="/menu/hr-workspace.jsp"%>

	  <!-- start of main -->
      <section id="m-main" class="span10">

      <article class="m-widget">
        <header class="header">
		  <h4 class="title"><spring:message code="hrKqJiangfa-info.hrKqJiangfa-info.input.title" text="编辑" /></h4>
		</header>

		<div class="content content-inner">

<form id="hrKqJiangfa-infoForm" method="post" action="hrKqJiangfa-info-save.do" class="form-horizontal">
  <c:if test="${model != null}">
	  <input id="hrKqJiangfa-info_id" type="hidden" name="fid" value="${model.fid}">
  </c:if>
			    	<div class="control-group">
				    <label class="control-label" for="hrKqJiangfa-info_fryid"><spring:message code="hrKqJiangfa-info.hrKqJiangfa-info.input.fryid" text="人员"/></label>
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
				    <label class="control-label" for="hrKqJiangfa-info_fzhiwu"><spring:message code="hrKqJiangfa-info.hrKqJiangfa-info.input.fzhiwu" text="职务"/></label>
					<div class="controls">
					  	 <input id="hrKqJiangfa-info_fzhiwu" type="text" name="fzhiwu" value="${model.fzhiwu}" size="" class="text required" minlength="" maxlength="">	
				    </div>
				  </div>
			    	<div class="control-group">
				    <label class="control-label" for="hrKqJiangfa-info_fyearmonth"><spring:message code="hrKqJiangfa-info.hrKqJiangfa-info.input.fyearmonth" text="年月"/></label>
					<div class="controls">
					  	 <input id="hrKqJiangfa-info_fyearmonth" type="text" name="fyearmonth" value="${model.fyearmonth}" size="" class="text required" minlength="" maxlength="">	
				    </div>
				  </div>
			    	<div class="control-group">
				    <label class="control-label" for="hrKqJiangfa-info_ftype"><spring:message code="hrKqJiangfa-info.hrKqJiangfa-info.input.ftype" text="类型"/></label>
					<div class="controls">
				      	 <select class="form-control" id="hrKqJiangfa-info_ftype" name="ftype" value="${model.ftype}" class=" " >
					    	 	<option value="迟到"  <c:if test="${model.ftype=='迟到'}"> selected="selected"
								</c:if>>迟到</option>
					    	 	<option value="早退"  <c:if test="${model.ftype=='早退'}"> selected="selected"  </c:if>>早退</option>
					    	 	<option value="旷工"  <c:if test="${model.ftype=='旷工'}"> selected="selected"  </c:if>>旷工</option>
					    	 	<option value="请假"  <c:if test="${model.ftype=='请假'}"> selected="selected"  </c:if>>请假</option>
					    	 	<option value="出差"  <c:if test="${model.ftype=='出差'}"> selected="selected"  </c:if>>出差</option>
					    	 	<option value="全勤"  <c:if test="${model.ftype=='全勤'}"> selected="selected"  </c:if>>全勤</option>
					 	</select>
				    </div>
				  </div>
				  
				  <div class="control-group">
				    <label class="control-label" for="hrKqJiangfa-info_fdate"><spring:message code="hrKqJiangfa-info.hrKqJiangfa-info.input.fvalue" text="日期"/></label>
					<div class="controls">
						 <div class="input-append datepicker date" style="padding-left: 0px;">
					    	<input id="hrGongchu-info_fdate" type="text" name="fdate" value="${model.fdate}" size="40" class="text "   style="background-color:white;cursor:default; width: 175px;">
					 		 <span class="add-on" style="padding-top: 2px; padding-bottom: 2px;"><i class="icon-calendar"></i></span>
					 	 </div>
				    </div>
				  </div>
			    	<div class="control-group">
				    <label class="control-label" for="hrKqJiangfa-info_fvalue"><spring:message code="hrKqJiangfa-info.hrKqJiangfa-info.input.fvalue" text="分钟"/></label>
					<div class="controls">
					  	<input id="hrKqJiangfa-info_fvalue" type="text" name="fvalue" value="${model.fvalue}" size="" class="number   " minlength="" maxlength="">
				    </div>
				  </div>
			    	<div class="control-group">
				    <label class="control-label" for="hrKqJiangfa-info_fmoney"><spring:message
							code="hrKqJiangfa-info.hrKqJiangfa-info.input.fmoney" text="扣款(元)"/></label>
					<div class="controls">
					  	<input id="hrKqJiangfa-info_fmoney" type="text" name="fmoney" value="${model.fmoney}" size="" class="number   " minlength="" maxlength="">
				    </div>
				  </div>
			    	<div class="control-group">
				    <label class="control-label" for="hrKqJiangfa-info_fquanqin"><spring:message
							code="hrKqJiangfa-info.hrKqJiangfa-info.input.fquanqin" text="全勤奖励(元)"/></label>
					<div class="controls">
					  	<input id="hrKqJiangfa-info_fquanqin" type="text" name="fquanqin" value="${model.fquanqin}" size="" class="number   " minlength="" maxlength="">
				    </div>
				  </div>
			    	<div class="control-group">
				    <label class="control-label" for="hrKqJiangfa-info_fmemo"><spring:message code="hrKqJiangfa-info.hrKqJiangfa-info.input.fmemo" text="备注"/></label>
					<div class="controls">
				      	<textarea id="hrKqJiangfa-info_fmemo"  name="fmemo"  class="form-control" rows="6"  style="width: 560px" class="text  "  minlength="" maxlength="500">${model.fmemo}</textarea>
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
