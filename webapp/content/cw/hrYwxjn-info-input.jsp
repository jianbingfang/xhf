<%@page contentType="text/html;charset=UTF-8"%>
<%@include file="/taglibs.jsp"%>
<%pageContext.setAttribute("currentHeader", "cw-home");%>
<%pageContext.setAttribute("currentMenu", "cw-zk");%>
<!doctype html>
<html lang="zh">

  <head>
    <%@include file="/common/meta.jsp"%>
    <title><spring:message code="hrYwxjn-info.hrYwxjn-info.input.title" text="编辑"/></title>
    <%@include file="/common/s.jsp"%>
    <script type="text/javascript">
$(function() {
    $("#hrYwxjn-infoForm").validate({
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
	  <%@include file="/menu/cw-workspace.jsp"%>

	  <!-- start of main -->
      <section id="m-main" class="span10">

      <article class="m-widget">
        <header class="header">
		  <h4 class="title"><spring:message code="hrYwxjn-info.hrYwxjn-info.input.title" text="编辑" /></h4>
		</header>

		<div class="content content-inner">

<form id="hrYwxjn-infoForm" method="post" action="hrYwxjn-info-save.do" class="form-horizontal">
  <c:if test="${model != null}">
	  <input id="hrYwxjn-info_id" type="hidden" name="fid" value="${model.fid}">
  </c:if>
			    	<div class="control-group">
				    <label class="control-label" for="hrYwxjn-info_fname"><spring:message code="hrYwxjn-info.hrYwxjn-info.input.fname" text="项目名称"/></label>
					<div class="controls">
				      	<input id="hrYwxjn-info_fname"  name="fname" value="${model.fname}" class="form-control" style="width: 560px" class="text  "  ></textarea>
				    </div>
				  </div>
			    	<div class="control-group">
				    <label class="control-label" for="hrYwxjn-info_ffuzeren"><spring:message code="hrYwxjn-info.hrYwxjn-info.input.ffuzeren" text="负责人"/></label>
					<div class="controls">
					  	 <input id="hrYwxjn-info_ffuzeren" type="text" name="ffuzeren" value="${model.ffuzeren}" size="" class="text required" minlength="" maxlength="">	
				    </div>
				  </div>
			    	<div class="control-group">
				    <label class="control-label" for="hrYwxjn-info_frenshu"><spring:message code="hrYwxjn-info.hrYwxjn-info.input.frenshu" text="人数"/></label>
					<div class="controls">
					  	<input id="hrYwxjn-info_frenshu" type="text" name="frenshu" value="${model.frenshu}" size="" class="number   " minlength="" maxlength="">
				    </div>
				  </div>
			    	<div class="control-group">
				    <label class="control-label" for="hrYwxjn-info_fxmry"><spring:message code="hrYwxjn-info.hrYwxjn-info.input.fxmry" text="项目人员"/></label>
					<div class="controls">
				      	<textarea id="hrYwxjn-info_fxmry"  name="fxmry"  class="form-control" rows="6"  style="width: 560px" class="text  "  minlength="" maxlength="500">${model.fxmry}</textarea>
				    </div>
				  </div>
			    	<div class="control-group">
				    <label class="control-label" for="hrYwxjn-info_fstartdate"><spring:message code="hrYwxjn-info.hrYwxjn-info.input.fstartdate" text="开始时间"/></label>
					<div class="controls">
				      	 <div class="input-append datepicker date" style="padding-left: 0px;">
					    	<input id="hrYwxjn-info_fstartdate" type="text" name="fstartdate" value="${model.fstartdate}" size="40" class="text "   style="background-color:white;cursor:default; width: 175px;">
					 		 <span class="add-on" style="padding-top: 2px; padding-bottom: 2px;"><i class="icon-calendar"></i></span>
					 	 </div>
				    </div>
				  </div>
			    	<div class="control-group">
				    <label class="control-label" for="hrYwxjn-info_fenddate"><spring:message code="hrYwxjn-info.hrYwxjn-info.input.fenddate" text="截止时间"/></label>
					<div class="controls">
				      	 <div class="input-append datepicker date" style="padding-left: 0px;">
					    	<input id="hrYwxjn-info_fenddate" type="text" name="fenddate" value="${model.fenddate}" size="40" class="text "   style="background-color:white;cursor:default; width: 175px;">
					 		 <span class="add-on" style="padding-top: 2px; padding-bottom: 2px;"><i class="icon-calendar"></i></span>
					 	 </div>
				    </div>
				  </div>
			    	<div class="control-group">
				    <label class="control-label" for="hrYwxjn-info_fjnjine"><spring:message code="hrYwxjn-info.hrYwxjn-info.input.fjnjine" text="缴纳金额"/></label>
					<div class="controls">
					  	 <input id="hrYwxjn-info_fjnjine" type="text" name="fjnjine" value="${model.fjnjine}" size="" class="text required" minlength="" maxlength="">	
				    </div>
				  </div>
			    	<div class="control-group">
				    <label class="control-label" for="hrYwxjn-info_fmemo"><spring:message code="hrYwxjn-info.hrYwxjn-info.input.fmemo" text="备注"/></label>
					<div class="controls">
				      	<textarea id="hrYwxjn-info_fmemo"  name="fmemo"  class="form-control" rows="6"  style="width: 560px" class="text  "  minlength="" maxlength="500">${model.fmemo}</textarea>
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
