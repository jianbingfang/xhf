<%@page contentType="text/html;charset=UTF-8"%>
<%@include file="/taglibs.jsp"%>
<%pageContext.setAttribute("currentHeader", "xz-home");%>
<%pageContext.setAttribute("currentMenu", "xzGdzctj");%>
<!doctype html>
<html lang="zh">

  <head>
    <%@include file="/common/meta.jsp"%>
    <title><spring:message code="xzGdzctj-info.xzGdzctj-info.input.title" text="编辑"/></title>
    <%@include file="/common/s.jsp"%>
    <link type="text/css" rel="stylesheet"
	href="${scopePrefix}/s/xthena/rypicker/rypicker.css">
<script type="text/javascript"
	src="${scopePrefix}/s/xthena/rypicker/rypicker.js"></script>
	  <link type="text/css" rel="stylesheet"
	href="${scopePrefix}/s/xthena/xmpicker/xmpicker.css">
<script type="text/javascript"
	src="${scopePrefix}/s/xthena/xmpicker/xmpicker.js"></script>
	
    <script type="text/javascript">
$(function() {
    $("#xzGdzctj-infoForm").validate({
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
    createxmPicker({
		modalId : 'xmPicker',
		url : '${scopePrefix}/gcgl/pjXm-simple-list.do'
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
		  <h4 class="title"><spring:message code="xzGdzctj-info.xzGdzctj-info.input.title" text="编辑" /></h4>
		</header>

		<div class="content content-inner">

<form id="xzGdzctj-infoForm" method="post" action="xzGdzctj-info-save.do" class="form-horizontal">
  <c:if test="${model != null}">
	  <input id="xzGdzctj-info_id" type="hidden" name="fid" value="${model.fid}">
  </c:if>
	  
	  
						<div class="control-group">
						<div class="span5">
					    <label class="control-label" for="xzGdzctj-info_fyuefen"><spring:message code="xzGdzctj-info.xzGdzctj-info.input.fyuefen" text="月份"/></label>
						<div class="controls">
							  	 <input id="xzGdzctj-info_fyuefen" type="text" name="fyuefen" value="${model.fyuefen}" size="" class="text " minlength="" maxlength="">	
					    </div>
					  </div>
	  
						<div class="span5">
					    <label class="control-label" for="xzGdzctj-info_fwpname"><spring:message code="xzGdzctj-info.xzGdzctj-info.input.fwpname" text="物品名称"/></label>
						<div class="controls">
							  	 <input id="xzGdzctj-info_fwpname" type="text" name="fwpname" value="${model.fwpname}" size="" class="text required" minlength="" maxlength="">	
					    </div>
					    </div>
					    </div>
	  
						<div class="control-group">
						<div class="span5">
					    <label class="control-label" for="xzGdzctj-info_fmlx"><spring:message code="xzGdzctj-info.xzGdzctj-info.input.fmlx" text="购买类型/型号"/></label>
						<div class="controls">
							  	 <input id="xzGdzctj-info_fmlx" type="text" name="fmlx" value="${model.fmlx}" size="" class="text " minlength="" maxlength="">	
					    </div>
					  </div>
	  
						<div class="span5">
					    <label class="control-label" for="xzGdzctj-info_fycfd"><spring:message code="xzGdzctj-info.xzGdzctj-info.input.fycfd" text="原存放地"/></label>
						<div class="controls">
							  	 <input id="xzGdzctj-info_fycfd" type="text" name="fycfd" value="${model.fycfd}" size="" class="text required" minlength="" maxlength="">	
					    </div>
					    </div>
					    </div>
	  
						<div class="control-group">
						<div class="span5">
					    <label class="control-label" for="xzGdzctj-info_flqbm"><spring:message code="xzGdzctj-info.xzGdzctj-info.input.flqbm" text="领取部门"/></label>
						<div class="controls">
							  	 <input id="xzGdzctj-info_flqbm" type="text" name="flqbm" value="${model.flqbm}" size="" class="text " minlength="" maxlength="">	
					    </div>
					  </div>
	  
						<div class="span5">
					    <label class="control-label" for="xzGdzctj-info_fxmb"><spring:message code="xzGdzctj-info.xzGdzctj-info.input.fxmb" text="项目部"/></label>
						<div class="controls">
							  	<div class="input-append xmPicker">
								<input id="xzGdzctj-info_fxmb" type="hidden" name="fxmb"
									value="${model.fxmb}"> <input
									id="xzGdzctj-info_fxmbname" type="text" value="${xmMap[model.fxmb].fxmname}" disabled
									class=" required" style="width: 175px;" value=""> <span
									class="add-on" style="padding-top: 2px; padding-bottom: 2px;"><i
									class="icon-th-list"></i></span>
							</div>
					    </div>
					    </div>
					    </div>
	  
						<div class="control-group">
						<div class="span5">
					    <label class="control-label" for="xzGdzctj-info_fdate"><spring:message code="xzGdzctj-info.xzGdzctj-info.input.fdate" text="日期"/></label>
						<div class="controls">
						      	 <div class="input-append datepicker date" style="padding-left: 0px;">
							    	<input id="xzGdzctj-info_fdate" type="text" name="fdate" value="${model.fdate}" size="40" class="text "   style="background-color:white;cursor:default; width: 175px;">
							 		 <span class="add-on" style="padding-top: 2px; padding-bottom: 2px;"><i class="icon-calendar"></i></span>
							 	 </div>
					    </div>
					  </div>
	  
						<div class="span5">
					    <label class="control-label" for="xzGdzctj-info_fdj"><spring:message code="xzGdzctj-info.xzGdzctj-info.input.fdj" text="单价"/></label>
						<div class="controls">
							  	 <input id="xzGdzctj-info_fdj" type="text" name="fdj" value="${model.fdj}" size="" class="text required" minlength="" maxlength="">	
					    </div>
					    </div>
					    </div>
	  
						<div class="control-group">
						<div class="span5">
					    <label class="control-label" for="xzGdzctj-info_fsl"><spring:message code="xzGdzctj-info.xzGdzctj-info.input.fsl" text="数量"/></label>
						<div class="controls">
							  	<input id="xzGdzctj-info_fsl" type="text" name="fsl" value="${model.fsl}" size="" class="number   " minlength="" maxlength="">
					    </div>
					  </div>
	  
						<div class="span5">
					    <label class="control-label" for="xzGdzctj-info_fzrr"><spring:message code="xzGdzctj-info.xzGdzctj-info.input.fzrr" text="责任人"/></label>
						<div class="controls">
							  	<div class="input-append ryPicker">
									<input id="xzGdzctj-info_fzrr" type="hidden" name="fzrr"
										value="${model.fzrr}"> <input
										id="ryBxRecord-info_userName" type="text" value="${ryMap[model.fzrr].fname}"
										disabled class=" required" style="width: 175px;" value="">
									<span class="add-on"
										style="padding-top: 2px; padding-bottom: 2px;"><i
										class="icon-user"></i></span>
								</div>
							  	
					    </div>
					    </div>
					    </div>
	  
			<%-- 			<div class="control-group">
						<div class="span5">
					    <label class="control-label" for="xzGdzctj-info_fmemo"><spring:message code="xzGdzctj-info.xzGdzctj-info.input.fmemo" text="备注"/></label>
						<div class="controls">
							  	 <input id="xzGdzctj-info_fmemo" type="text" name="fmemo" value="${model.fmemo}" size="" class="text " minlength="" maxlength="">	
					    </div>
					  </div> --%>
		
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
