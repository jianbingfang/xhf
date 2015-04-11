<%@page contentType="text/html;charset=UTF-8"%>
<%@include file="/taglibs.jsp"%>
<%pageContext.setAttribute("currentHeader", "gcgl-home");%>
<%pageContext.setAttribute("currentMenu", "gcgl-xmgl");%>

<!doctype html>
<html lang="zh">

  <head>
    <%@include file="/common/meta.jsp"%>
    <title><spring:message code="pjJindian-info.pjJindian-info.input.title" text="编辑"/></title>
    <%@include file="/common/s.jsp"%>
    <link type="text/css" rel="stylesheet"
	href="${scopePrefix}/s/xthena/xmpicker/xmpicker.css">
<script type="text/javascript"
	src="${scopePrefix}/s/xthena/xmpicker/xmpicker.js"></script>
    <script type="text/javascript">
$(function() {
    $("#pjJindian-infoForm").validate({
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
})
    </script>
  </head>

  <body>
     
    <%@include file="/header.jsp"%>
    <div class="row-fluid">
	   <%@include file="/menu/gcgl-workspace.jsp"%>
	  <!-- start of main -->
      		<section id="m-main" class="span10">
<!--  <div class="container-fluid">
				<div class="row-fluid">
					<div class="span12">
						<ul class="breadcrumb">
							<li><a href="gcgl-home.do">工程管理</a> <span class="divider">/</span>
							</li>
							<li>项目管理<span class="divider">/</span>
							</li>
							<li class="active">项目进点</li>
						</ul>
					</div>
				</div>
			</div> -->
      <article class="m-widget">
        <header class="header">
		  <h4 class="title"><spring:message code="pjJindian-info.pjJindian-info.input.title" text="编辑" /></h4>
		</header>

		<div class="content content-inner">

<form id="pjJindian-infoForm" method="post" action="pjJindian-info-save.do?tab=${tab}" class="form-horizontal">
  <c:if test="${model != null}">
	  <input id="pjJindian-info_id" type="hidden" name="fid" value="${model.fid}">
  </c:if>
    	<div class="control-group">
	    <label class="control-label" for="pjJindian-info_fxmid"><spring:message code="pjJindian-info.pjJindian-info.input.fxmid" text="项目"/></label>
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
	    <label class="control-label" for="pjJindian-info_fdate"><spring:message code="pjJindian-info.pjJindian-info.input.fdate" text="进场时间"/></label>
		<div class="controls">
	      	 <div class="input-append datepicker date" style="padding-left: 0px;">
		    	<input id="pjJindian-info_fdate" type="text" name="fdate" value="${model.fdate}" size="40" class="text "   style="background-color:white;cursor:default; width: 175px;">
		 		 <span class="add-on" style="padding-top: 2px; padding-bottom: 2px;"><i class="icon-calendar"></i></span>
		 	 </div>
	    </div>
	  </div>
    	<div class="control-group">
	    <label class="control-label" for="pjJindian-info_fmemo"><spring:message code="pjJindian-info.pjJindian-info.input.fmemo" text="备注"/></label>
		<div class="controls">
	      	<textarea id="pjJindian-info_fmemo"  name="fmemo"  class="form-control" rows="6"  style="width: 560px" class="text  "  minlength="" maxlength="500">${model.fmemo}</textarea>
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
