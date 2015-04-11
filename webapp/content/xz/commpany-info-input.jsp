<%@page contentType="text/html;charset=UTF-8"%>
<%@include file="/taglibs.jsp"%>
<%pageContext.setAttribute("currentHeader", "xz-home");%>
<%pageContext.setAttribute("currentMenu", "xz-fgs");%>
<!doctype html>
<html lang="zh">

  <head>
    <%@include file="/common/meta.jsp"%>
    <title><spring:message code="commpany-info.commpany-info.input.title" text="编辑"/></title>
    <%@include file="/common/s.jsp"%>
    
    <link type="text/css" rel="stylesheet"
	href="${scopePrefix}/s/xthena/rypicker/rypicker.css">
<script type="text/javascript"
	src="${scopePrefix}/s/xthena/rypicker/rypicker.js"></script>
	
    <script type="text/javascript">
$(function() {
    $("#commpany-infoForm").validate({
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
	  <%@include file="/menu/xz-workspace.jsp"%>

	  <!-- start of main -->
      <section id="m-main" class="span10">

      <article class="m-widget">
        <header class="header">
		  <h4 class="title"><spring:message code="commpany-info.commpany-info.input.title" text="编辑" /></h4>
		</header>

		<div class="content content-inner">

<form id="commpany-infoForm" method="post" action="commpany-info-save.do" class="form-horizontal">
  <c:if test="${model != null}">
	  <input id="commpany-info_id" type="hidden" name="fid" value="${model.fid}">
  </c:if>
	  
	  
						<div class="control-group">
						<div class="span5">
					    <label class="control-label" for="commpany-info_fname"><spring:message code="commpany-info.commpany-info.input.fname" text="分公司/注册名称"/></label>
						<div class="controls">
						      	<textarea id="commpany-info_fname"  name="fname"  class="form-control" rows="3"  class="text  "  minlength="" maxlength="512">${model.fname}</textarea>
					    </div>
					  </div>
	  
						<div class="span5">
					    <label class="control-label" for="commpany-info_faddress"><spring:message code="commpany-info.commpany-info.input.faddress" text="分公司地址"/></label>
						<div class="controls">
						      	<textarea id="commpany-info_faddress"  name="faddress"  class="form-control" rows="3"  class="text  "  minlength="" maxlength="512">${model.faddress}</textarea>
					    </div>
					    </div>
					    </div>
	  
						<div class="control-group">
						<div class="span5">
					    <label class="control-label" for="commpany-info_ffuzeren"><spring:message code="commpany-info.commpany-info.input.ffuzeren" text="负责人"/></label>
						<div class="controls">
							  	<div class="input-append ryPicker">
									<input id="commpany-info_ffuzeren" type="hidden" name="ffuzeren"
										value="${model.ffuzeren}"> <input
										id="ryBxRecord-info_ffuzeren" type="text" value="${ryMap[model.ffuzeren].fname}"
										disabled class=" " style="width: 175px;" value="">
									<span class="add-on"
										style="padding-top: 2px; padding-bottom: 2px;"><i
										class="icon-user"></i></span>
								</div>
					    </div>
					  </div>
	  
						<div class="span5">
					    <label class="control-label" for="commpany-info_ftel"><spring:message code="commpany-info.commpany-info.input.ftel" text="联系电话"/></label>
						<div class="controls">
							  	 <input id="commpany-info_ftel" type="text" name="ftel" value="${model.ftel}" size="" class="text " minlength="" maxlength="">	
					    </div>
					    </div>
					    </div>
	  
						<div class="control-group">
						<div class="span5">
					    <label class="control-label" for="commpany-info_fjsfzr"><spring:message code="commpany-info.commpany-info.input.fjsfzr" text="技术负责人"/></label>
						<div class="controls">
							  	<div class="input-append ryPicker">
									<input id="commpany-info_fjsfzr" type="hidden" name="fjsfzr"
										value="${model.fjsfzr}"> <input
										id="ryBxRecord-info_userName" type="text" value="${ryMap[model.fjsfzr].fname}"
										disabled class=" " style="width: 175px;" value="">
									<span class="add-on"
										style="padding-top: 2px; padding-bottom: 2px;"><i
										class="icon-user"></i></span>
								</div>
					    </div>
					  </div>
	  
						<div class="span5">
					    <label class="control-label" for="commpany-info_fbadate"><spring:message code="commpany-info.commpany-info.input.fbadate" text="备案或注册日期"/></label>
						<div class="controls">
						      	 <div class="input-append datepicker date" style="padding-left: 0px;">
							    	<input id="commpany-info_fbadate" type="text" name="fbadate" value="${model.fbadate}" size="40" class="text "   style="background-color:white;cursor:default; width: 175px;">
							 		 <span class="add-on" style="padding-top: 2px; padding-bottom: 2px;"><i class="icon-calendar"></i></span>
							 	 </div>
					    </div>
					    </div>
					    </div>
	  
						<div class="control-group">
						<div class="span5">
					    <label class="control-label" for="commpany-info_fnpry"><spring:message code="commpany-info.commpany-info.input.fnpry" text="拟派人员"/></label>
						<div class="controls">
						      	<textarea id="commpany-info_fnpry"  name="fnpry"  class="form-control" rows="5"   class="text  "  minlength="" maxlength="200">${model.fnpry}</textarea>
					    </div>
					  </div>
	  
						<div class="span5">
					    <label class="control-label" for="commpany-info_fyxdate"><spring:message code="commpany-info.commpany-info.input.fyxdate" text="有效期"/></label>
						<div class="controls">
						      	 <div class="input-append datepicker date" style="padding-left: 0px;">
							    	<input id="commpany-info_fyxdate" type="text" name="fyxdate" value="${model.fyxdate}" size="40" class="text "   style="background-color:white;cursor:default; width: 175px;">
							 		 <span class="add-on" style="padding-top: 2px; padding-bottom: 2px;"><i class="icon-calendar"></i></span>
							 	 </div>
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
