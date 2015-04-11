<%@page contentType="text/html;charset=UTF-8"%>
<%@include file="/taglibs.jsp"%>
<%pageContext.setAttribute("currentHeader", "xz-home");%>
<%pageContext.setAttribute("currentMenu", "xz-cl");%>
<!doctype html>
<html lang="zh">

  <head>
    <%@include file="/common/meta.jsp"%>
    <link type="text/css" rel="stylesheet" href="${scopePrefix}/s/xthena/rypicker/rypicker.css">
    <script type="text/javascript" src="${scopePrefix}/s/xthena/rypicker/rypicker.js"></script>
    <link type="text/css" rel="stylesheet" href="${scopePrefix}/s/xthena/carpicker/carpicker.css">
    <script type="text/javascript" src="${scopePrefix}/s/xthena/carpicker/carpicker.js"></script>
    <title><spring:message code="xzCarSc-info.xzCarSc-info.input.title" text="审车登记 - 车辆管理 - 行政管理"/></title>
    <%@include file="/common/s.jsp"%>
    <script type="text/javascript">
$(function() {
    $("#xzCarSc-infoForm").validate({
        submitHandler: function(form) {
			bootbox.animate(false);
			var box = bootbox.dialog('<div class="progress progress-striped active" style="margin:0px;"><div class="bar" style="width: 100%;"></div></div>');
            form.submit();
        },
        errorClass: 'validate-error'
    });
    
    createcarPicker({
		modalId: 'carPicker',
		url: '${scopePrefix}/xz/xzCar-simple-list.do'
	});
    createryPicker({
		modalId: 'ryPicker',
		url: '${scopePrefix}/hr/commRy-simple-list.do'
	});
})
    </script>
  </head>

  <body>
    <%@include file="/header.jsp"%>

    <div class="row-fluid">
	  <%@include file="/menu/xz-workspace.jsp"%>

	  <!-- start of main -->
      <section id="m-main" class="span10">
      <article class="m-widget">
        <header class="header">
		  <h4 class="title"><spring:message code="xzCarSc-info.xzCarSc-info.input.title" text="编辑" /></h4>
		</header>

		<div class="content content-inner">

<form id="xzCarSc-infoForm" method="post" action="xzCarSc-info-save.do" class="form-horizontal">
  <c:if test="${model != null}">
	  <input id="xzCarSc-info_id" type="hidden" name="fid" value="${model.fid}">
  </c:if>
			    	<div class="control-group">
				    <label class="control-label" for="xzCarBxRecord-info_fcarid"><spring:message code="xzCarBxRecord-info.xzCarBxRecord-info.input.fcarid" text="车牌号"/></label>
					<div class="controls">
						<div class="input-append carPicker">
						<input id="xzCarBxRecord-info_fcarid" type="hidden" name="fcarid" value="${model.fcarid}">
						  <input id="fcarno" type="text"  value="${fcarno}" style="width: 175px;" value="">
						  <span class="add-on" style="padding-top: 2px; padding-bottom: 2px;"><i class="icon-list"></i></span>
					    </div>
				    </div>
				  </div>
			    	<div class="control-group">
				    <label class="control-label" for="xzCarSc-info_fscdate"><spring:message code="xzCarSc-info.xzCarSc-info.input.fscdate" text="本次审车时间"/></label>
					<div class="controls">
				      	 <div class="input-append datepicker date" style="padding-left: 0px;">
					    	<input id="xzCarSc-info_fscdate" type="text" name="fscdate" value="${model.fscdate}" size="40" class="text "   style="background-color:white;cursor:default; width: 175px;">
					 		 <span class="add-on" style="padding-top: 2px; padding-bottom: 2px;"><i class="icon-calendar"></i></span>
					 	 </div>
				    </div>
				  </div>
			    	<div class="control-group">
				    <label class="control-label" for="xzCarSc-info_fnextdate"><spring:message code="xzCarSc-info.xzCarSc-info.input.fnextdate" text="下次审车时间"/></label>
					<div class="controls">
				      	 <div class="input-append datepicker date" style="padding-left: 0px;">
					    	<input id="xzCarSc-info_fnextdate" type="text" name="fnextdate" value="${model.fnextdate}" size="40" class="text "   style="background-color:white;cursor:default; width: 175px;">
					 		 <span class="add-on" style="padding-top: 2px; padding-bottom: 2px;"><i class="icon-calendar"></i></span>
					 	 </div>
				    </div>
				  </div>
			    	<div class="control-group">
			    		<label class="control-label" for="hrLdht-info_fryid"><spring:message code="hrLdht-info.hrLdht-info.input.fryid" text="负责人"/></label>
					<div class="controls">
						<div class="input-append ryPicker">
						 <input id="ryBxRecord-info_fryid" type="hidden" name="fryid" value="${model.fryid}"  class=" required"  style="width: 175px;" > 
						  <input id="ryBxRecord-info_userName" type="text"  name="fry" value="${model.fry}"  class=" required"  style="width: 175px;" > 
						  <span class="add-on" style="padding-top: 2px; padding-bottom: 2px;"><i class="icon-user"></i></span>
					    </div>
				    </div>
				  </div>
			    	<div class="control-group">
				    <label class="control-label" for="xzCarSc-info_fscmoney"><spring:message code="xzCarSc-info.xzCarSc-info.input.fscmoney" text="审车费用"/></label>
					<div class="controls">
					  	<input id="xzCarSc-info_fscmoney" type="text" name="fscmoney" value="${model.fscmoney}" size="" class="number   " minlength="" maxlength="">
				    </div>
				  </div>
			    
				    	<div class="control-group">
				    <label class="control-label" for="xzCarSc-info_fmemo"><spring:message code="xzCarSc-info.xzCarSc-info.input.fmemo" text="备注"/></label>
					<div class="controls">
				      	<textarea id="xzCarSc-info_fmemo"  name="fmemo"  class="form-control" rows="6"  style="width: 560px" class="text  "  minlength="" maxlength="1000">${model.fmemo}</textarea>
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
