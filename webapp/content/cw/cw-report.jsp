<%@page contentType="text/html;charset=UTF-8"%>
<%@include file="/taglibs.jsp"%>
<%pageContext.setAttribute("currentHeader", "cw-home");%>
<%pageContext.setAttribute("currentMenu", "cw-zbb");%>
<!doctype html>
<html lang="en">

  <head>
    <%@include file="/common/meta.jsp"%>
    <title>流程列表</title>
    <%@include file="/common/s.jsp"%>
  </head>

  <body>
    <%@include file="/header/bpm-workspace.jsp"%>

    <div class="row-fluid">
    <%@include file="/menu/cw-workspace.jsp"%>

    <!-- start of main -->
    <section id="m-main" class="span10" style="float:right">

			<%-- <c:forEach items="${bpmCategories}" var="bpmCategory">
			      <div class="row-fluid">
			      <div class="page-header">
			        <h3>${bpmCategory.name}</h3>
			      </div>
			
			      <c:forEach items="${bpmCategory.bpmProcesses}" var="bpmProcess">
			        <div class="well span2">
			          <h4>${bpmProcess.name}&nbsp;</h4>
			          <p>${bpmProcess.descn}&nbsp;</p>
			          <div class="btn-group">
			            <a class="btn btn-small" href="${scopePrefix}/form/form-viewStartForm.do?bpmProcessId=${bpmProcess.id}"><li class="icon-play"></li>发起</a>
			            <a class="btn btn-small" href="workspace-graphProcessDefinition.do?bpmProcessId=${bpmProcess.id}" target="_blank"><li class="icon-picture"></li>图形</a>
			          </div>
			        </div>
			      </c:forEach>
				  </div>
			
			</c:forEach> --%>
		<form id="cwBzj-infoForm" method="post" action="cwBzj-info-save.do" class="form-horizontal"	>
			<div class="control-group visible" style="margin-bottom: 40px;">
					
				  </div>
			<div class="control-group" style="margin-bottom: 40px;">
				    <label class="control-label" style="font-size: 36px; width: 360px;padding-right: 60px;" for="cwGd-info_fgdid"><spring:message code="cwGd-info.cwGd-info.input.fgdid" text="账户余额"/></label>
					<div class="controls" >
					  	<span style="font-size: 32px;">28000.26</span> &nbsp;&nbsp; <span style="font-size: 20px;">万元</span>
				    </div>
				  </div>
			  	<div class="control-group" style="margin-bottom: 40px;">
				    <label class="control-label" style="font-size: 36px; width: 360px;padding-right: 60px;" for="cwGd-info_fzjdate"><spring:message code="cwGd-info.cwGd-info.input.fzjdate" text="应收账款"/></label>
					<div class="controls">
				      	<a class="btn btn-link" style="font-size: 32px;" href="${scopePrefix}/cw/cwYingShou-info-list.do" >4564.15</a> <span style="font-size: 20px;">万元</span>
				    </div>
				  </div>
			    	<div class="control-group" style="margin-bottom: 40px;">
				    <label class="control-label" style="font-size: 36px; width: 360px;padding-right: 60px;" for="cwGd-info_fbefore"><spring:message code="cwGd-info.cwGd-info.input.fbefore" text="本月已收账款"/></label>
					<div class="controls">
					  	<a class="btn btn-link"  style="font-size: 32px;">1554.2</a> <span style="font-size: 20px;">万元</span>
				    </div>
				  </div>
			    	
			    	<div class="control-group" style="margin-bottom: 40px;">
				    <label class="control-label"  style="font-size: 36px; width: 360px;padding-right: 60px;" for="cwGd-info_fafter"><spring:message code="cwGd-info.cwGd-info.input.fafter" text="应收未收账款"/></label>
					<div class="controls">
					  	<a class="btn btn-link"  style="font-size: 32px;">231.3</a> <span style="font-size: 20px;">万元</span>
				    </div>
				  </div>
				  
				  <div class="control-group" style="margin-bottom: 40px;">
				    <label class="control-label"  style="font-size: 36px; width: 360px;padding-right: 60px;" for="cwGd-info_fafter"><spring:message code="cwGd-info.cwGd-info.input.fafter" text="投标保证金"/></label>
					<div class="controls">
					  	<a class="btn btn-link" href="cwBzj-info-list.do" style="font-size: 32px;">24.4</a> <span style="font-size: 20px;">万元</span>
				    </div>
				  </div>
				  
				  	<div class="control-group" style="margin-bottom: 40px;">
				    <label class="control-label"  style="font-size: 36px; width: 360px;padding-right: 60px;" for="cwGd-info_fafter"><spring:message code="cwGd-info.cwGd-info.input.fafter" text="履约保证金"/></label>
					<div class="controls">
					  	<a class="btn btn-link" href="cwBzj-info-list.do"  style="font-size: 32px;">32.4</a> <span style="font-size: 20px;">万元</span>
				    </div>
				  </div>
		</form>
    </section>
    <!-- end of main -->
    </div>

  </body>

</html>
