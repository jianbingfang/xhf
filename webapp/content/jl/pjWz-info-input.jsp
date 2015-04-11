<%@page contentType="text/html;charset=UTF-8"%>
<%@include file="/taglibs.jsp"%>
<%pageContext.setAttribute("currentHeader", "jl-home");%>
<%pageContext.setAttribute("currentMenu", "jl-wz");%>
<%pageContext.setAttribute("wzKind", request.getParameter("wzKind"));%>
<!doctype html>
<html lang="zh">

  <head>
    <%@include file="/common/meta.jsp"%>
    <title><spring:message code="jl-pjWz-info.jl-pjWz-info.input.title" text="编辑"/></title>
    <%@include file="/common/s.jsp"%>
      <link type="text/css" rel="stylesheet"
		href="${scopePrefix}/s/xthena/wzpicker/wzpicker.css">
	<script type="text/javascript"
		src="${scopePrefix}/s/xthena/wzpicker/wzpicker.js"></script>
    <script type="text/javascript">
$(function() {
    $("#jl-pjWz-infoForm").validate({
        submitHandler: function(form) {
			bootbox.animate(false);
			var box = bootbox.dialog('<div class="progress progress-striped active" style="margin:0px;"><div class="bar" style="width: 100%;"></div></div>');
            form.submit();
        },
        errorClass: 'validate-error'
    });
    
    createwzPicker({
		modalId : 'wzPicker',
		url : '${scopePrefix}/xz/wz-simple-list.do'
	});
})
    </script>
  </head>

  <body>
    <%@include file="/header.jsp"%>

    <div class="row-fluid">
	  <%@include file="/menu/jl-workspace.jsp"%>

	  <!-- start of main -->
      <section id="m-main" class="span10">

      <article class="m-widget">
        <header class="header">
		  <h4 class="title"><spring:message code="jl-pjWz-info.jl-pjWz-info.input.title" text="编辑" /></h4>
		</header>

		<div class="content content-inner">

<form id="jl-pjWz-infoForm" method="post" action="jl-pjWz-info-ask.do" class="form-horizontal">
		  <c:if test="${model != null}">
			  <input id="jl-pjWz-info_id" type="hidden" name="fid" value="${model.fid}">
		  </c:if>
		   <input id="jl-pjWz-info_fisassets" type="hidden" name="fisassets" value="${wzKind=='1'?'是':'否'}">
			      <div class="control-group">
				    <label class="control-label" for="jl-pjWz-info_fwzname"><spring:message code="jl-pjWz-info.jl-pjWz-info.input.fwzname" text="物资名称"/></label>
					<div class="controls">
						<div class="input-append wzPicker">
							<input id="jl-pjWz-info_fwzname" type="hidden" name="fwzid"
								value="${model.fwzid}"> <input
								id="ryBxRecord-info_fwzname" type="text" value="${wzMap[model.fwzid].fname}"
								disabled class="required" style="width: 175px;" value="">
							<span class="add-on"
								style="padding-top: 2px; padding-bottom: 2px;"><i
								class="icon-list"></i></span>
						</div>
				    </div>
				  </div>
			    <div class="control-group">
				    <label class="control-label" for="jl-pjWz-info_fnum"><spring:message code="jl-pjWz-info.jl-pjWz-info.input.fnum" text="数量"/></label>
					<div class="controls">
					  	<input id="jl-pjWz-info_fnum" type="text" name="fnum" value="${model.fnum}" size=""  class="number   " minlength="" maxlength="">
				    </div>
				  </div>
			    	<%-- <div class="control-group">
				    <label class="control-label" for="jl-pjWz-info_fwzcode"><spring:message code="jl-pjWz-info.jl-pjWz-info.input.fwzcode" text="编号"/></label>
					<div class="controls">
					  	 <input id="jl-pjWz-info_fwzcode" type="text" name="fwzcode" value="${model.fwzcode}" size="" class="text required" minlength="" maxlength="">	
				    </div>
				  </div> --%>
			    <%-- 	<div class="control-group">
				    <label class="control-label" for="jl-pjWz-info_fwztype"><spring:message code="jl-pjWz-info.jl-pjWz-info.input.fwztype" text="物品类型"/></label>
					<div class="controls">
					  	 <input id="jl-pjWz-info_fwztype" type="text" name="fwztype" value="${model.fwztype}"  size="" class="text required" minlength="" maxlength="">	
				    </div>
				  </div> --%>
			    	<%-- <div class="control-group">
				    <label class="control-label" for="jl-pjWz-info_fisassets"><spring:message code="jl-pjWz-info.jl-pjWz-info.input.fisassets" text="是否为固定资产"/></label>
					<div class="controls">
					  	 <input id="jl-pjWz-info_fisassets" type="text" name="fisassets" value="${model.fisassets}" size="" class="text required" minlength="" maxlength="">	
				    </div>
				  </div>
				   --%>
				  <%--   <div class="control-group">
				    <label class="control-label" for="jl-pjWz-info_fstartdate"><spring:message code="jl-pjWz-info.jl-pjWz-info.input.fstartdate" text="归还时间"/></label>
					<div class="controls">
					    	<input id="jl-pjWz-info_fstartdate" type="text" name="fstartdate" value="${model.fstartdate}"  size="40" class="text " >
					 	 </div>
				    </div>
			    
				  <div class="control-group">
				    <label class="control-label" for="jl-pjWz-info_flyry"><spring:message code="jl-pjWz-info.jl-pjWz-info.input.flyry" text="领用人"/></label>
					<div class="controls">
					    	<input id="jl-pjWz-info_flyry" type="text" name="flyry" value="${model.flyry}"  size="40" class="text " >
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
