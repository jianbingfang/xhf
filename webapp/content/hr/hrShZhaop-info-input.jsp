<%@page contentType="text/html;charset=UTF-8"%>
<%@include file="/taglibs.jsp"%>
<%pageContext.setAttribute("currentHeader", "hr-home");%>
<%pageContext.setAttribute("currentMenu", "hrGwbm");%>
<!doctype html>
<html lang="zh">

  <head>
    <%@include file="/common/meta.jsp"%>
    <title><spring:message code="hrShZhaop-info.hrShZhaop-info.input.title" text="编辑"/></title>
    <%@include file="/common/s.jsp"%>
    <script type="text/javascript">
$(function() {
    $("#hrShZhaop-infoForm").validate({
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

    <div class="row-fluid">

	  <!-- start of main -->

      <article class="m-widget">
        <header class="header">
		  <h4 class="title"><spring:message code="hrShZhaop-info.hrShZhaop-info.input.title" text="编辑" /></h4>
		</header>

		<div class="content content-inner">

<form id="hrShZhaop-infoForm" method="post" action="hrShZhaop-info-save.do" class="form-horizontal">
  <c:if test="${model != null}">
	  <input id="hrShZhaop-info_id" type="hidden" name="fid" value="${model.fid}">
  </c:if>
			    	<div class="control-group">
				    <label class="control-label" for="hrShZhaop-info_ffbtype"><spring:message code="hrShZhaop-info.hrShZhaop-info.input.ffbtype" text="发布方式"/></label>
					<div class="controls">
					  	 <input id="hrShZhaop-info_ffbtype" type="text" name="ffbtype" value="${model.ffbtype}" size="" class="text required" minlength="" maxlength="">	
				    </div>
				  </div>
			    	<div class="control-group">
				    <label class="control-label" for="hrShZhaop-info_fgwname"><spring:message code="hrShZhaop-info.hrShZhaop-info.input.fgwname" text="岗位名称"/></label>
					<div class="controls">
						<%-- 	<select id="hrGwbm-info_fgw" name="fgw" class="form-control required">
							<c:forEach items="${gwInfos}" var="item">
							<option value="${item.fid}"
								${item.fid==model.fgw? 'selected' : ''}>${item.fgwname}</option>
						   </c:forEach>
					   </select>
					    --%>
					  	 <input id="hrShZhaop-info_fgwname" type="text" name="fgwname" value="${model.fgwname}" size="" class="text required" minlength="" maxlength="">	
				    </div>
				  </div>
			    	<div class="control-group">
				    <label class="control-label" for="hrShZhaop-info_fzhiwu"><spring:message code="hrShZhaop-info.hrShZhaop-info.input.fzhiwu" text="职务"/></label>
					<div class="controls">
					  	 <input id="hrShZhaop-info_fzhiwu" type="text" name="fzhiwu" value="${model.fzhiwu}" size="" class="text required" minlength="" maxlength="">	
				    </div>
				  </div>
			    	<div class="control-group">
				    <label class="control-label" for="hrShZhaop-info_fzhaopinnum"><spring:message code="hrShZhaop-info.hrShZhaop-info.input.fzhaopinnum" text="招聘人数"/></label>
					<div class="controls">
					  	<input id="hrShZhaop-info_fzhaopinnum" type="text" name="fzhaopinnum" value="${model.fzhaopinnum}" size="" class="number   " minlength="" maxlength="">
				    </div>
				  </div>
			    	<div class="control-group">
				    <label class="control-label" for="hrShZhaop-info_fgwzhize"><spring:message code="hrShZhaop-info.hrShZhaop-info.input.fgwzhize" text="岗位职责"/></label>
					<div class="controls">
				      	<textarea id="hrShZhaop-info_fgwzhize"  name="fgwzhize"  class="form-control" rows="6"  style="width: 560px" class="text  "  minlength="" maxlength="500">${model.fgwzhize}</textarea>
				    </div>
				  </div>
			    	<div class="control-group">
				    <label class="control-label" for="hrShZhaop-info_fgwyaoqiu"><spring:message code="hrShZhaop-info.hrShZhaop-info.input.fgwyaoqiu" text="岗位要求"/></label>
					<div class="controls">
				      	<textarea id="hrShZhaop-info_fgwyaoqiu"  name="fgwyaoqiu"  class="form-control" rows="6"  style="width: 560px" class="text  "  minlength="" maxlength="500">${model.fgwyaoqiu}</textarea>
				    </div>
				  </div>
			    	<div class="control-group">
				    <label class="control-label" for="hrShZhaop-info_fgzaddr"><spring:message code="hrShZhaop-info.hrShZhaop-info.input.fgzaddr" text="工作地点"/></label>
					<div class="controls">
					  	 <input id="hrShZhaop-info_fgzaddr" type="text" name="fgzaddr" value="${model.fgzaddr}" size="" class="text required" minlength="" maxlength="">	
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
