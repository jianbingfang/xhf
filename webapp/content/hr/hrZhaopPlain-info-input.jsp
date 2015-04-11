<%@page contentType="text/html;charset=UTF-8"%>
<%@include file="/taglibs.jsp"%>
<%pageContext.setAttribute("currentHeader", "hr-home");%>
<%pageContext.setAttribute("currentMenu", "hrGwbm");%>
<!doctype html>
<html lang="zh">

  <head>
    <%@include file="/common/meta.jsp"%>
    <title><spring:message code="hrZhaopPlain-info.hrZhaopPlain-info.input.title" text="编辑"/></title>
    <%@include file="/common/s.jsp"%>
    <script type="text/javascript">
$(function() {
    $("#hrZhaopPlain-infoForm").validate({
        submitHandler: function(form) {
			bootbox.animate(false);
			var box = bootbox.dialog('<div class="progress progress-striped active" style="margin:0px;"><div class="bar" style="width: 100%;"></div></div>');
            form.submit();
        },
        errorClass: 'validate-error'
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
		  <h4 class="title"><spring:message code="hrZhaopPlain-info.hrZhaopPlain-info.input.title" text="编辑" /></h4>
		</header>

		<div class="content content-inner">

<form id="hrZhaopPlain-infoForm" method="post" action="hrZhaopPlain-info-save.do" class="form-horizontal">
  <c:if test="${model != null}">
	  <input id="hrZhaopPlain-info_id" type="hidden" name="fid" value="${model.fid}">
  </c:if>
			    	<div class="control-group">
				    <label class="control-label" for="hrZhaopPlain-info_fdept"><spring:message code="hrZhaopPlain-info.hrZhaopPlain-info.input.fdept" text="部门"/></label>
					<div class="controls">
						<select id="hrGwbm-info_fdept" name="fdept" class="form-control required">
							<c:forEach items="${deptList}" var="item">
							<option value="${item.id}"
								${item.id==model.fdept? 'selected' : ''}>${item.name}</option>
						   </c:forEach>
					   </select>
					  <%-- 	<input id="hrZhaopPlain-info_fdept" type="text" name="fdept" value="${model.fdept}" size="" class="number   " minlength="" maxlength=""> --%>
						  	
				    </div>
				  </div>
			    	<div class="control-group">
				    <label class="control-label" for="hrZhaopPlain-info_fgw"><spring:message code="hrZhaopPlain-info.hrZhaopPlain-info.input.fgw" text="岗位"/></label>
					<div class="controls">
						<select id="hrGwbm-info_fgw" name="fgw" class="form-control required">
							<c:forEach items="${gwInfos}" var="item">
							<option value="${item.fid}"
								${item.fid==model.fgw? 'selected' : ''}>${item.fgwname}</option>
						   </c:forEach>
					   </select>
					  	<%--  <input id="hrZhaopPlain-info_fgw" type="text" name="fgw" value="${model.fgw}" size="" class="text required" minlength="" maxlength=""> --%>	
				    </div>
				  </div>
			    	<div class="control-group">
				    <label class="control-label" for="hrZhaopPlain-info_fzhiwu"><spring:message code="hrZhaopPlain-info.hrZhaopPlain-info.input.fzhiwu" text="职务"/></label>
					<div class="controls">
					  	 <input id="hrZhaopPlain-info_fzhiwu" type="text" name="fzhiwu" value="${model.fzhiwu}" size="" class="text required" minlength="" maxlength="">	
				    </div>
				  </div>
			    	<div class="control-group">
				    <label class="control-label" for="hrZhaopPlain-info_fcurnum"><spring:message code="hrZhaopPlain-info.hrZhaopPlain-info.input.fcurnum" text="当前员工数量"/></label>
					<div class="controls">
					  	<input id="hrZhaopPlain-info_fcurnum" type="text" name="fcurnum" value="${model.fcurnum}" size="" class="number   " minlength="" maxlength="">
				    </div>
				  </div>
			    	<div class="control-group">
				    <label class="control-label" for="hrZhaopPlain-info_fplainnum"><spring:message code="hrZhaopPlain-info.hrZhaopPlain-info.input.fplainnum" text="拟招人数"/></label>
					<div class="controls">
					  	<input id="hrZhaopPlain-info_fplainnum" type="text" name="fplainnum" value="${model.fplainnum}" size="" class="number   " minlength="" maxlength="">
				    </div>
				  </div>
			    <%-- 	<div class="control-group">
				    <label class="control-label" for="hrZhaopPlain-info_frytiaozheng"><spring:message code="hrZhaopPlain-info.hrZhaopPlain-info.input.frytiaozheng" text="人员内部调整"/></label>
					<div class="controls">
					  	 <input id="hrZhaopPlain-info_frytiaozheng" type="text" name="frytiaozheng" value="${model.frytiaozheng}" size="" class="text required" minlength="" maxlength="">	
				    </div>
				  </div> --%>
			    	<div class="control-group">
				    <label class="control-label" for="hrZhaopPlain-info_fgwzhize"><spring:message code="hrZhaopPlain-info.hrZhaopPlain-info.input.fgwzhize" text="岗位职责"/></label>
					<div class="controls">
				      	<textarea id="hrZhaopPlain-info_fgwzhize"  name="fgwzhize"  class="form-control" rows="6"  style="width: 560px" class="text  "  minlength="" maxlength="500">${model.fgwzhize}</textarea>
				    </div>
				  </div>
			    	<div class="control-group">
				    <label class="control-label" for="hrZhaopPlain-info_fgwyaoqiu"><spring:message code="hrZhaopPlain-info.hrZhaopPlain-info.input.fgwyaoqiu" text="岗位要求"/></label>
					<div class="controls">
				      	<textarea id="hrZhaopPlain-info_fgwyaoqiu"  name="fgwyaoqiu"  class="form-control" rows="6"  style="width: 560px" class="text  "  minlength="" maxlength="500">${model.fgwyaoqiu}</textarea>
				    </div>
				  </div>
			    	<div class="control-group">
				    <label class="control-label" for="hrZhaopPlain-info_fshenpistatus"><spring:message code="hrZhaopPlain-info.hrZhaopPlain-info.input.fshenpistatus" text="领导审批"/></label>
					<div class="controls">
					  	 <input id="hrZhaopPlain-info_fshenpistatus" type="text" name="fshenpistatus" value="${model.fshenpistatus}" size="" class="text " minlength="" maxlength="">	
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
