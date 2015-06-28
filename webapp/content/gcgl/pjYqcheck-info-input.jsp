<%@page contentType="text/html;charset=UTF-8"%>
<%@include file="/taglibs.jsp"%>
<%pageContext.setAttribute("currentHeader", "gcgl-home");%>
<%pageContext.setAttribute("currentMenu", "gcgl-yq");%>
<!doctype html>
<html lang="zh">

  <head>
    <%@include file="/common/meta.jsp"%>
    <title><spring:message code="pjYqcheck-info.pjYqcheck-info.input.title" text="编辑"/></title>
    <%@include file="/common/s.jsp"%>
    <script type="text/javascript">
$(function() {
    $("#pjYqcheck-infoForm").validate({
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
	  <%@include file="/menu/gcgl-workspace.jsp"%>

	  <!-- start of main -->
      <section id="m-main" class="span10">
		<div class="row-fluid">
					<div class="span12">
						<ul class="breadcrumb">
							<li><a href="gcgl-home.do">工程管理</a> <span class="divider">/</span>
							</li>
							<li>仪器管理<span class="divider">/</span>
							</li>
							<li class="active">仪器年检</li>
						</ul>
					</div>
				</div>
      <article class="m-widget">
        <header class="header">
		  <h4 class="title"><spring:message code="pjYqcheck-info.pjYqcheck-info.input.title" text="编辑" /></h4>
		</header>

		<div class="content content-inner">

<form id="pjYqcheck-infoForm" method="post" action="pjYqcheck-info-save.do" class="form-horizontal">
  <c:if test="${model != null}">
	  <input id="pjYqcheck-info_id" type="hidden" name="fid" value="${model.fid}">
  </c:if>
			    	<div class="control-group">
				    <label class="control-label" for="pjYqcheck-info_fyiqicode"><spring:message code="pjYqcheck-info.pjYqcheck-info.input.fyiqicode" text="仪器编码"/></label>
					<div class="controls">
					  	 <input id="pjYqcheck-info_fyiqicode" type="text" name="fyiqicode" value="${model.fyiqicode}" size="" class="text" minlength="" maxlength="">
				    </div>
				  </div>
			    	<div class="control-group">
				    <label class="control-label" for="pjYqcheck-info_fcheckdate"><spring:message code="pjYqcheck-info.pjYqcheck-info.input.fcheckdate" text="本次年检时间"/></label>
					<div class="controls">
				      	 <div class="input-append datepicker date" style="padding-left: 0px;">
					    	<input id="pjYqcheck-info_fcheckdate" type="text" name="fcheckdate" value="${model.fcheckdate}" size="40" class="text "   style="background-color:white;cursor:default; width: 175px;">
					 		 <span class="add-on" style="padding-top: 2px; padding-bottom: 2px;"><i class="icon-calendar"></i></span>
					 	 </div>
				    </div>
				  </div>
			    	<div class="control-group">
				    <label class="control-label" for="pjYqcheck-info_fcheckresult"><spring:message code="pjYqcheck-info.pjYqcheck-info.input.fcheckresult" text="年检结果"/></label>
					<div class="controls">
				      	<textarea id="pjYqcheck-info_fcheckresult"  name="fcheckresult"  class="form-control" rows="6"  style="width: 560px" class="text  "  minlength="" maxlength="500">${model.fcheckresult}</textarea>
				    </div>
				  </div>
			    	<div class="control-group">
				    <label class="control-label" for="pjYqcheck-info_fjingshouren"><spring:message code="pjYqcheck-info.pjYqcheck-info.input.fjingshouren" text="经手人"/></label>
					<div class="controls">
					  	 <input id="pjYqcheck-info_fjingshouren" type="text" name="fjingshouren" value="${model.fjingshouren}" size="" class="text" minlength="" maxlength="">
				    </div>
				  </div>
			    	<div class="control-group">
				    <label class="control-label" for="pjYqcheck-info_fjingshourenid"><spring:message code="pjYqcheck-info.pjYqcheck-info.input.fjingshourenid" text="经手人id"/></label>
					<div class="controls">
					  	<input id="pjYqcheck-info_fjingshourenid" type="text" name="fjingshourenid" value="${model.fjingshourenid}" size="" class="number   " minlength="" maxlength="">
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
