<%@page contentType="text/html;charset=UTF-8"%>
<%@include file="/taglibs.jsp"%>
<%pageContext.setAttribute("currentHeader", "gcgl-home");%>
<%pageContext.setAttribute("currentMenu", "gcgl-xmgl");%>
<!doctype html>
<html lang="zh">

  <head>
    <%@include file="/common/meta.jsp"%>
    <title><spring:message code="pjkh-info.pjkh-info.input.title" text="编辑"/></title>
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
    $("#pjkh-infoForm").validate({
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
	<!-- <div class="container-fluid">
				<div class="row-fluid">
					<div class="span12">
						<ul class="breadcrumb">
							<li><a href="gcgl-home.do">工程管理</a> <span class="divider">/</span>
							</li>
							<li>项目管理<span class="divider">/</span>
							</li>
							<li class="active">绩效考核</li>
						</ul>
					</div>
				</div>
			</div> -->
      <article class="m-widget">
        <header class="header">
		  <h4 class="title"><spring:message code="pjkh-info.pjkh-info.input.title" text="编辑" /></h4>
		</header>

		<div class="content content-inner">

<form id="pjkh-infoForm" method="post" action="pjkh-info-save.do" class="form-horizontal">
  <c:if test="${model != null}">
	  <input id="pjkh-info_id" type="hidden" name="fid" value="${model.fid}">
  </c:if>
			    	<div class="control-group">
				    <label class="control-label" for="pjkh-info_fkhname"><spring:message code="pjkh-info.pjkh-info.input.fkhname" text="考核项目"/></label>
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
				    <label class="control-label" for="pjkh-info_fkhfuzeren"><spring:message code="pjkh-info.pjkh-info.input.fkhfuzeren" text="项目负责人"/></label>
					<div class="controls">
					
						<div class="input-append ryPicker">
									<input id="ryBxRecord-info_fryid" type="hidden" name="fkhfuzerenid"
										value="${model.fkhfuzerenid}"> <input
										id="ryBxRecord-info_userName" type="text" value="${ryMap[model.fkhfuzerenid].fname}"
										disabled class=" required" style="width: 175px;" value="">
									<span class="add-on"
										style="padding-top: 2px; padding-bottom: 2px;"><i
										class="icon-user"></i></span>
								</div>
				    </div>
				  </div>
			    	<div class="control-group">
				    <label class="control-label" for="pjkh-info_fkhdate"><spring:message code="pjkh-info.pjkh-info.input.fkhdate" text="考核时间"/></label>
					<div class="controls">
				      	 <div class="input-append datepicker date" style="padding-left: 0px;">
					    	<input id="pjkh-info_fkhdate" type="text" name="fkhdate" value="${model.fkhdate}" size="40" class="text "   style="background-color:white;cursor:default; width: 175px;">
					 		 <span class="add-on" style="padding-top: 2px; padding-bottom: 2px;"><i class="icon-calendar"></i></span>
					 	 </div>
				    </div>
				  </div>
			    	<div class="control-group">
				    <label class="control-label" for="pjkh-info_fkhry"><spring:message code="pjkh-info.pjkh-info.input.fkhry" text="考核人员"/></label>
					<div class="controls">
						<textarea id="pjkh-info_fkhry" type="text" name="fkhry" rows="6"  style="width: 560px" size="" class="text" minlength="" maxlength="">${model.fkhry}</textarea>
				    </div>
				  </div>
			    	<div class="control-group">
				    <label class="control-label" for="pjkh-info_fkhscore"><spring:message code="pjkh-info.pjkh-info.input.fkhscore" text="考核得分"/></label>
					<div class="controls">
					  	 <input id="pjkh-info_fkhscore" type="text" name="fkhscore" value="${model.fkhscore}" size="" class="text" minlength="" maxlength="">
				    </div>
				  </div>
				  
				  <div class="control-group">
				    <label class="control-label" for="pjkh-info_fmemo"><spring:message code="pjkh-info.pjkh-info.input.fmemo" text="备注"/></label>
					<div class="controls">
						<textarea id="pjkh-info_fmemo" type="text" name="fmemo" rows="6"  style="width: 560px" size="" class="text " minlength="" maxlength="">${model.fmemo}</textarea>
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
