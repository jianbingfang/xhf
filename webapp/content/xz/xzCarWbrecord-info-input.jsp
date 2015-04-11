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
    <title><spring:message code="xzCarWbrecord-info.xzCarWbrecord-info.input.title" text="维保记录 - 车辆管理 - 行政管理"/></title>
    <%@include file="/common/s.jsp"%>
    <script type="text/javascript">
$(function() {
    $("#xzCarWbrecord-infoForm").validate({
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
		  <h4 class="title"><spring:message code="xzCarWbrecord-info.xzCarWbrecord-info.input.title" text="编辑" /></h4>
		</header>

		<div class="content content-inner">

<form id="xzCarWbrecord-infoForm" method="post" action="xzCarWbrecord-info-save.do" class="form-horizontal">
  <c:if test="${model != null}">
	  <input id="xzCarWbrecord-info_id" type="hidden" name="fid" value="${model.fid}">
  </c:if>
			    	<div class="control-group">
				    	<div class="span5">
					    <label class="control-label" for="xzCarBxRecord-info_fcarid"><spring:message code="xzCarBxRecord-info.xzCarBxRecord-info.input.fcarid" text="车牌号"/></label>
						<div class="controls">
							<div class="input-append carPicker">
							<input id="xzCarBxRecord-info_fcarid" type="hidden" name="fcarid" value="${model.fcarid}">
							  <input id="fcarno" type="text"  value="${fcarno}" style="width: 175px;" value="">
							  <span class="add-on" style="padding-top: 2px; padding-bottom: 2px;"><i class="icon-list"></i></span>
						    </div>
					    </div>
					  </div>
	  
						<div class="span5">
					    <label class="control-label" for="xzCarWbrecord-info_fwbdate"><spring:message code="xzCarWbrecord-info.xzCarWbrecord-info.input.fwbdate" text="维保时间"/></label>
						<div class="controls">
						      	 <div class="input-append datepicker date" style="padding-left: 0px;">
							    	<input id="xzCarWbrecord-info_fwbdate" type="text" name="fwbdate" value="${model.fwbdate}" size="40" class="text "   style="background-color:white;cursor:default; width: 175px;">
							 		 <span class="add-on" style="padding-top: 2px; padding-bottom: 2px;"><i class="icon-calendar"></i></span>
							 	 </div>
					    </div>
					    </div>
					    </div>
	  
						<div class="control-group">
						<div class="span5">
					    <label class="control-label" for="xzCarWbrecord-info_fwbadrress"><spring:message code="xzCarWbrecord-info.xzCarWbrecord-info.input.fwbadrress" text="维保地点"/></label>
						<div class="controls">
							  	 <input id="xzCarWbrecord-info_fwbadrress" type="text" name="fwbadrress" value="${model.fwbadrress}" size="" class="text " minlength="" maxlength="">	
					    </div>
					  </div>
	  
						<div class="span5">
					    <label class="control-label" for="xzCarWbrecord-info_fwbmoney"><spring:message code="xzCarWbrecord-info.xzCarWbrecord-info.input.fwbmoney" text="维保消费金额"/></label>
						<div class="controls">
							  	 <input id="xzCarWbrecord-info_fwbmoney" type="text" name="fwbmoney" value="${model.fwbmoney}" size="" class="text required" minlength="" maxlength="">	
					    </div>
					    </div>
					    </div>
	  
						<div class="control-group">
						<div class="span5">
					    <label class="control-label" for="xzCarWbrecord-info_fwblist"><spring:message code="xzCarWbrecord-info.xzCarWbrecord-info.input.fwblist" text="维保项目"/></label>
						<div class="controls">
							  	 <input id="xzCarWbrecord-info_fwblist" type="text" name="fwblist" value="${model.fwblist}" size="" class="text " minlength="" maxlength="">	
					    </div>
					  </div>
	  
						<div class="span5">
						
						<%-- <label class="control-label" for="hrLdht-info_fryid"><spring:message code="hrLdht-info.hrLdht-info.input.fryid" text="报销人"/></label>
						<div class="controls">
							<div class="input-append ryPicker">
							 <input id="ryBxRecord-info_fbxryid" type="hidden"  name="fbxryid" value="${model.fbxryid}"  class=" required"  style="width: 175px;" > 
							  <input id="ryBxRecord-info_fbxry" type="text"  name="fbxry" value="${model.fbxry}"  class=" required"  style="width: 175px;" > 
							  <span class="add-on" style="padding-top: 2px; padding-bottom: 2px;"><i class="icon-user"></i></span>
						    </div>
					    </div>
					    </div>
					    </div>
	  
						<div class="control-group">
					    <label class="control-label" for="xzCarWbrecord-info_fbxdate"><spring:message code="xzCarWbrecord-info.xzCarWbrecord-info.input.fbxdate" text="报销时间"/></label>
						<div class="controls">
						      	 <div class="input-append datepicker date" style="padding-left: 0px;">
							    	<input id="xzCarWbrecord-info_fbxdate" type="text" name="fbxdate" value="${model.fbxdate}" size="40" class="text "   style="background-color:white;cursor:default; width: 175px;">
							 		 <span class="add-on" style="padding-top: 2px; padding-bottom: 2px;"><i class="icon-calendar"></i></span>
							 	 </div>
					    </div>
					  </div> --%>
	  
	  					<div class="control-group">
						<div class="span5">
					    <label class="control-label" for="xzCarWbrecord-info_fmemo"><spring:message code="xzCarWbrecord-info.xzCarWbrecord-info.input.fmemo" text="备注"/></label>
						<div class="controls">
						      	<textarea id="xzCarWbrecord-info_fmemo"  name="fmemo"  class="form-control" rows="6"  style="width: 560px" class="text  "  minlength="" maxlength="500">${model.fmemo}</textarea>
					    </div>
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
