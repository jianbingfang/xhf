<%@page contentType="text/html;charset=UTF-8"%>
<%@include file="/taglibs.jsp"%>
<%pageContext.setAttribute("currentHeader", "hr-home");%>
<%pageContext.setAttribute("currentMenu", "hrRydb");%>
<!doctype html>
<html lang="zh">

  <head>
    <%@include file="/common/meta.jsp"%>
    <title><spring:message code="hrRydb-info.hrRydb-info.input.title" text="编辑"/></title>
    <%@include file="/common/s.jsp"%>
    
     <link type="text/css" rel="stylesheet"
	href="${scopePrefix}/s/xthena/rypicker/rypicker.css">
<script type="text/javascript"
	src="${scopePrefix}/s/xthena/rypicker/rypicker.js"></script>
	
	
    <script type="text/javascript">
$(function() {
    $("#hrRydb-infoForm").validate({
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
		  <h4 class="title"><spring:message code="hrRydb-info.hrRydb-info.input.title" text="编辑" /></h4>
		</header>

		<div class="content content-inner">

<form id="hrRydb-infoForm" method="post" action="hrRydb-info-save.do" class="form-horizontal">
  <c:if test="${model != null}">
	  <input id="hrRydb-info_id" type="hidden" name="fid" value="${model.fid}">
  </c:if>
			    	<div class="control-group">
				    <label class="control-label" for="hrRydb-info_fryid"><spring:message code="hrRydb-info.hrRydb-info.input.fryid" text="人员"/></label>
					<div class="controls">
						<div class="input-append ryPicker">
							<input id="hrRyyj-info_fryid" type="hidden" name="fryid"  
								value="${model.fryid}" class="text required" > <input
								id="hrShtc-info_userName" type="text" value="${ryMap[model.fryid].fname}" 
								class=" text required" disabled style="width: 175px;" value="">
							<span class="add-on"
								style="padding-top: 2px; padding-bottom: 2px;"><i
								class="icon-user"></i></span>
						</div>
				    </div>
				  </div>
			 <%--    	<div class="control-group">
				    <label class="control-label" for="hrRydb-info_fsrcgw"><spring:message code="hrRydb-info.hrRydb-info.input.fsrcgw" text="原岗位"/></label>
					<div class="controls">
							<select id="hrGwbm-info_fsrcgw" name="fsrcgw" class="form-control required">
							<c:forEach items="${gwInfos}" var="item">
							<option value="${item.fid}"
								${item.fid==model.fsrcgw? 'selected' : ''}>${item.fgwname}</option>
						   </c:forEach>
					   </select>
					  	<input id="hrRydb-info_fsrcgw" type="text" name="fsrcgw" value="${model.fsrcgw}" size="" class="number   " minlength="" maxlength="">
				    </div>
				  </div> --%>
			    	<div class="control-group">
				    <label class="control-label" for="hrRydb-info_fdestgw"><spring:message code="hrRydb-info.hrRydb-info.input.fdestgw" text="拟调岗位"/></label>
					<div class="controls">
						<select id="hrGwbm-info_fdestgw" name="fdestgw" class="form-control required">
							<c:forEach items="${gwInfos}" var="item">
							<option value="${item.fid}"
								${item.fid==model.fdestgw? 'selected' : ''}>${item.fgwname}</option>
						   </c:forEach>
					   </select>
					  	<%-- <input id="hrRydb-info_fdestgw" type="text" name="fdestgw" value="${model.fdestgw}" size="" class="number   " minlength="" maxlength=""> --%>
				    </div>
				  </div>
			    	<div class="control-group">
				    <label class="control-label" for="hrRydb-info_fdate"><spring:message code="hrRydb-info.hrRydb-info.input.fdate" text="调配日期"/></label>
					<div class="controls">
				      	 <div class="input-append datepicker date" style="padding-left: 0px;">
					    	<input id="hrRydb-info_fdate" type="text" name="fdate" value="${model.fdate}" size="40" class="text "   style="background-color:white;cursor:default; width: 175px;">
					 		 <span class="add-on" style="padding-top: 2px; padding-bottom: 2px;"><i class="icon-calendar"></i></span>
					 	 </div>
				    </div>
				  </div>
			    	<div class="control-group">
				    <label class="control-label" for="hrRydb-info_fjiaojie"><spring:message code="hrRydb-info.hrRydb-info.input.fjiaojie" text="工作交接"/></label>
					<div class="controls">
				      	<textarea id="hrRydb-info_fjiaojie"  name="fjiaojie"  class="form-control" rows="6"  style="width: 560px" class="text  "  minlength="" maxlength="500">${model.fjiaojie}</textarea>
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
