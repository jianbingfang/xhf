<%@page contentType="text/html;charset=UTF-8"%>
<%@include file="/taglibs.jsp"%>
<%pageContext.setAttribute("currentHeader", "gcgl-home");%>
<%pageContext.setAttribute("currentMenu", "gcgl-xmgl");%>
<!doctype html>
<html lang="zh">

  <head>
    <%@include file="/common/meta.jsp"%>
    <title><spring:message code="pjpeixun-info.pjpeixun-info.input.title" text="编辑"/></title>
    <%@include file="/common/s.jsp"%>
        	<link type="text/css" rel="stylesheet"
	href="${scopePrefix}/s/xthena/rypicker/rypicker.css">
<script type="text/javascript"
	src="${scopePrefix}/s/xthena/rypicker/rypicker.js"></script>
    <script type="text/javascript">
$(function() {

	$("#pjpeixun-infoForm").validate({
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
	  <%@include file="/menu/gcgl-workspace.jsp"%>

	  <!-- start of main -->
      <section id="m-main" class="span10">
<!-- 	<div class="container-fluid">
				<div class="row-fluid">
					<div class="span12">
						<ul class="breadcrumb">
							<li><a href="gcgl-home.do">工程管理</a> <span class="divider">/</span>
							</li>
							<li>项目管理<span class="divider">/</span>
							</li>
							<li class="active">培训</li>
						</ul>
					</div>
				</div>
			</div> -->
      <article class="m-widget">
        <header class="header">
		  <h4 class="title"><spring:message code="pjpeixun-info.pjpeixun-info.input.title" text="编辑" /></h4>
		</header>

		<div class="content content-inner">

<form id="pjpeixun-infoForm" method="post" action="pjpeixun-info-save.do" class="form-horizontal">
  <c:if test="${model != null}">
	  <input id="pjpeixun-info_id" type="hidden" name="fid" value="${model.fid}">
  </c:if>
						<div class="control-group">
						<div class="span5">
					    <label class="control-label" for="pjpeixun-info_fpxzt"><spring:message code="pjpeixun-info.pjpeixun-info.input.fpxzt" text="培训主题"/></label>
						<div class="controls">
							  	 <input id="pjpeixun-info_fpxzt" type="text" name="fpxzt" value="${model.fpxzt}" size="" class="text " minlength="" maxlength="">	
					    </div>
					  </div>
	  
						<div class="span5">
					    <label class="control-label" for="pjpeixun-info_fpxdate"><spring:message code="pjpeixun-info.pjpeixun-info.input.fpxdate" text="培训时间"/></label>
						<div class="controls">
						      	 <div class="input-append datepicker date" style="padding-left: 0px;">
							    	<input id="pjpeixun-info_fpxdate" type="text" name="fpxdate" value="${model.fpxdate}" size="40" class="text "   style="background-color:white;cursor:default; width: 175px;">
							 		 <span class="add-on" style="padding-top: 2px; padding-bottom: 2px;"><i class="icon-calendar"></i></span>
							 	 </div>
					    </div>
					    </div>
					    </div>
	  
						<div class="control-group">
						<div class="span5">
					    <label class="control-label" for="pjpeixun-info_fpxaddr"><spring:message code="pjpeixun-info.pjpeixun-info.input.fpxaddr" text="培训地点"/></label>
						<div class="controls">
							  	 <input id="pjpeixun-info_fpxaddr" type="text" name="fpxaddr" value="${model.fpxaddr}" size="" class="text " minlength="" maxlength="">	
					    </div>
					  </div>
	  
						<div class="span5">
					    <label class="control-label" for="pjpeixun-info_fzhuchiren"><spring:message code="pjpeixun-info.pjpeixun-info.input.fzhuchiren" text="主持人"/></label>
						<div class="controls">
									<input
										id="ryBxRecord-info_userName" type="text" name="fzhuchiren" value="${model.fzhuchiren}"
										 class="" style="width: 175px;" >
					    </div>
					    </div>
					    </div>
	  
						<div class="control-group">
						<div class="span5">
					    <label class="control-label" for="pjpeixun-info_fpxtype"><spring:message code="pjpeixun-info.pjpeixun-info.input.fpxtype" text="培训类别"/></label>
						<div class="controls">
						      	 <select class="form-control" id="pjpeixun-info_fpxtype" name="fpxtype" value="${model.fpxtype}" class=" " >
							    	 	<option value="岗前培训"  <c:if test="${model.fpxtype}=='岗前培训'}"> selected="selected"  </c:if>>岗前培训</option>
							    	 	<option value="监理业务培训"  <c:if test="${model.fpxtype}=='监理业务培训'}"> selected="selected"  </c:if>>监理业务培训</option>
							    	 	<option value="四新技术培训"  <c:if test="${model.fpxtype}=='四新技术培训'}"> selected="selected"  </c:if>>四新技术培训</option>
							    	 	<option value="现场培训学习"  <c:if test="${model.fpxtype}=='现场培训学习'}"> selected="selected"  </c:if>>现场培训学习</option>
							 	</select>
					    </div>
					  </div>
	  
						<div class="span5">
					    <label class="control-label" for="pjpeixun-info_fpxmethod"><spring:message code="pjpeixun-info.pjpeixun-info.input.fpxmethod" text="方式"/></label>
						<div class="controls">
						      	 	 <select class="form-control" id="pjpeixun-info_fpxmethod" name="fpxmethod" value="${model.fpxmethod}" class=" " >
							    	 	<option value="视频"  <c:if test="${model.fpxmethod}=='视频'}"> selected="selected"  </c:if>>视频</option>
							    	 	<option value="讲座"  <c:if test="${model.fpxmethod}=='讲座'}"> selected="selected"  </c:if>>讲座</option>
							    	 	<option value="讨论"  <c:if test="${model.fpxmethod}=='讨论'}"> selected="selected"  </c:if>>讨论</option>
							    	 	<option value="正式"  <c:if test="${model.fpxmethod}=='正式'}"> selected="selected"  </c:if>>正式</option>
							    	 	<option value="其他"  <c:if test="${model.fpxmethod}=='其他'}"> selected="selected"  </c:if>>其他</option>
							 	</select>
					    </div>
					    </div>
					    </div>
	  
					<%-- 	<div class="control-group">
						<div class="span5">
					    <label class="control-label" for="pjpeixun-info_frs"><spring:message code="pjpeixun-info.pjpeixun-info.input.frs" text="参加人数"/></label>
						<div class="controls">
							  	<input id="pjpeixun-info_frs" type="text" name="frs" value="${model.frs}" size="" class="number   " minlength="" maxlength="">
					    </div>
					  </div> --%>
	  
						<div class="control-group">
					    <label class="control-label" for="pjpeixun-info_frylist"><spring:message code="pjpeixun-info.pjpeixun-info.input.frylist" text="参加人员列表"/></label>
						<div class="controls">
						      	<textarea id="pjpeixun-info_frylist"  name="frylist"  class="form-control" rows="6"  style="width: 560px" class="text  "  minlength="" maxlength="500">${model.frylist}</textarea>
					    </div>
					    </div>
	  
						<div class="control-group">
					    <label class="control-label" for="pjpeixun-info_fcontent"><spring:message code="pjpeixun-info.pjpeixun-info.input.fcontent" text="培训内容"/></label>
						<div class="controls">
						
							<textarea id="pjpeixun-info_fcontent"  name="fcontent"  class="form-control" rows="6"  style="width: 560px" class="text  "  minlength="" maxlength="500">${model.fcontent}</textarea>
					    </div>
					  </div>
	  
						<%-- <div class="span5">
					    <label class="control-label" for="pjpeixun-info_fziliaourl"><spring:message code="pjpeixun-info.pjpeixun-info.input.fziliaourl" text="培训资料url"/></label>
						<div class="controls">
						      	<textarea id="pjpeixun-info_fziliaourl"  name="fziliaourl"  class="form-control" rows="6"  style="width: 560px" class="text  "  minlength="" maxlength="500">${model.fziliaourl}</textarea>
					    </div>
					    </div>
					    </div>
	 
						<div class="control-group">
						<div class="span5">
					    <label class="control-label" for="pjpeixun-info_fpxno"><spring:message code="pjpeixun-info.pjpeixun-info.input.fpxno" text="序号"/></label>
						<div class="controls">
							  	 <input id="pjpeixun-info_fpxno" type="text" name="fpxno" value="${model.fpxno}" size="" class="text " minlength="" maxlength="">	
					    </div>
					  </div>
		  			--%>
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
