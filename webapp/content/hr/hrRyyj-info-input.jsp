<%@page contentType="text/html;charset=UTF-8"%>
<%@include file="/taglibs.jsp"%>
<%pageContext.setAttribute("currentHeader", "hr-home");%>
<%pageContext.setAttribute("currentMenu", "commRy");%>
<!doctype html>
<html lang="zh">

  <head>
    <%@include file="/common/meta.jsp"%>
    <title><spring:message code="hrRyyj-info.hrRyyj-info.input.title" text="编辑"/></title>
    <%@include file="/common/s.jsp"%>
    
    <link type="text/css" rel="stylesheet"
	href="${scopePrefix}/s/xthena/rypicker/rypicker.css">
<script type="text/javascript"
	src="${scopePrefix}/s/xthena/rypicker/rypicker.js"></script>
	
    <script type="text/javascript">
$(function() {
    $("#hrRyyj-infoForm").validate({
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

function loadZj(){
	alert($('#hrRyyj-info_fryid').val());
}


function reload(){
	window.location.href="hrRyyj-info-input.do?ryid="+$('#hrRyyj-info_fryid').val();
}
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
		  <h4 class="title"><spring:message code="hrRyyj-info.hrRyyj-info.input.title" text="编辑" /></h4>
		</header>

		<div class="content content-inner">

<form id="hrRyyj-infoForm" method="post" action="hrRyyj-info-save.do" class="form-horizontal">
			<c:if test="${model != null}">
			 <input id="hrRyyj-info_id" type="hidden" name="fid" value="${model.fid}">
			</c:if>
  
  				<div class="control-group">
				    <label class="control-label" for="hrRyyj-info_fryid"><spring:message code="hrRyyj-info.hrRyyj-info.input.fryid" text="人员"/></label>
					<div class="controls">
						<div class="input-append ryPicker">
							<input id="hrRyyj-info_fryid" type="hidden" name="fryid"  
								value="${model.fryid}" class="text required" onchange="reload()" > <input
								id="hrShtc-info_userName" type="text" value="${ryMap[model.fryid].fname}" 
								class=" text required" disabled style="width: 175px;" value="">
							<span class="add-on"
								style="padding-top: 2px; padding-bottom: 2px;"><i
								class="icon-user"></i></span>
						</div>
				    </div>
				  </div>
				  
				  <div class="control-group">
				    <label class="control-label" for="hrRyyj-info_fgzjingli"><spring:message code="hrRyyj-info.hrRyyj-info.input.fgzjingli" text="注册证书"/></label>
					<div class="controls" id="zczsDiv">
						  <table id="hrRyyj-infoGrid" class="m-table table-hover table-bordered" style="width:600px;">
						    <thead>
						      <tr>
						        	<th  name="fryid">名称</th>
						        	<th  name="fgzjingli">专业</th>
						        	<th  name="fgzyeji">注册证号</th>
						      </tr>
						    </thead>
						
						    <tbody>
						      <c:forEach items="${zjList}" var="item">
						      <tr>
						      	 	 <td>${item.fname}</td>
						      	 	 <td>${item.fzhuanye}</td>
						      	 	 <td>${item.fzhengjianno}</td>
						      </tr>
						      </c:forEach>
						    </tbody>
						  </table>
				    </div>
				  </div>
				  
			    	<div class="control-group">
				    <label class="control-label" for="hrRyyj-info_fgzjingli"><spring:message code="hrRyyj-info.hrRyyj-info.input.fgzjingli" text="工作经历"/></label>
					<div class="controls">
				      	<textarea id="hrRyyj-info_fgzjingli"  name="fgzjingli"  class="form-control" rows="6"  style="width: 560px" class="text  "  minlength="" maxlength="2000">${model.fgzjingli}</textarea>
				    </div>
				  </div>
			    	<div class="control-group">
				    <label class="control-label" for="hrRyyj-info_fgzyeji"><spring:message code="hrRyyj-info.hrRyyj-info.input.fgzyeji" text="工作业绩"/></label>
					<div class="controls">
				      	<textarea id="hrRyyj-info_fgzyeji"  name="fgzyeji"  class="form-control" rows="6"  style="width: 560px" class="text  "  minlength="" maxlength="2000">
				      			<c:if test="${model.fgzyeji == null}">
									${htInfo}
								</c:if>
								<c:if test="${model.fgzyeji != null}">
									${model.fgzyeji}
								</c:if>
				      	</textarea>
				    </div>
				  </div>
			    	<div class="control-group">
				    <label class="control-label" for="hrRyyj-info_fjiangfa"><spring:message code="hrRyyj-info.hrRyyj-info.input.fjiangfa" text="奖罚情况"/></label>
					<div class="controls">
				      	<textarea id="hrRyyj-info_fjiangfa"  name="fjiangfa"  class="form-control" rows="6"  style="width: 560px" class="text "   minlength="" maxlength="2000"><c:if test="${model.fjiangfa == null}">${xzRyzs}</c:if>
								<c:if test="${model.fjiangfa != null}">
									${model.fjiangfa}
								</c:if>
				      	</textarea>
				    </div>
				  </div>
			    
			    <%-- 	<div class="control-group">
				    <label class="control-label" for="hrRyyj-info_fmemo"><spring:message code="hrRyyj-info.hrRyyj-info.input.fmemo" text="备注"/></label>
					<div class="controls">
				      	<textarea id="hrRyyj-info_fmemo"  name="fmemo"  class="form-control" rows="6"  style="width: 560px" class="text  "  minlength="" maxlength="500">${model.fmemo}</textarea>
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
