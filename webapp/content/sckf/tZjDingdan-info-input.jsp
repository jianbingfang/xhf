<%@page contentType="text/html;charset=UTF-8"%>
<%@include file="/taglibs.jsp"%>
<%pageContext.setAttribute("currentHeader", "sckf-home");%>
<%pageContext.setAttribute("currentMenu", "tZjDingdan");%>
<!doctype html>
<html lang="zh">

  <head>
    <%@include file="/common/meta.jsp"%>
    <title><spring:message code="tZjDingdan-info.tZjDingdan-info.input.title" text="编辑"/></title>
    <%@include file="/common/s.jsp"%>
    <script type="text/javascript">
$(function() {
    $("#tZjDingdan-infoForm").validate({
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
	  <%@include file="/menu/sckf-workspace.jsp"%>

	  <!-- start of main -->
      <section id="m-main" class="span10">

      <article class="m-widget">
        <header class="header">
		  <h4 class="title"><spring:message code="tZjDingdan-info.tZjDingdan-info.input.title" text="编辑" /></h4>
		</header>

		<div class="content content-inner">

<form id="tZjDingdan-infoForm" method="post" action="tZjDingdan-info-save.do" class="form-horizontal">
  <c:if test="${model != null}">
	  <input id="tZjDingdan-info_id" type="hidden" name="fid" value="${model.fid}">
  </c:if>
	  
						<div class="control-group">
						<div class="span5">
					    <label class="control-label" for="tZjDingdan-info_id"><spring:message code="tZjDingdan-info.tZjDingdan-info.input.id" text="id"/></label>
						<div class="controls">
							  	<input id="tZjDingdan-info_id" type="text" name="id" value="${model.id}" size="" class="number   required" minlength="" maxlength="">
					    </div>
					  </div>
	  
						<div class="span5">
					    <label class="control-label" for="tZjDingdan-info_fddcode"><spring:message code="tZjDingdan-info.tZjDingdan-info.input.fddcode" text="订单编号"/></label>
						<div class="controls">
							  	 <input id="tZjDingdan-info_fddcode" type="text" name="fddcode" value="${model.fddcode}" size="" class="text required" minlength="" maxlength="">	
					    </div>
					    </div>
					    </div>
	  
						<div class="control-group">
						<div class="span5">
					    <label class="control-label" for="tZjDingdan-info_fzjid"><spring:message code="tZjDingdan-info.tZjDingdan-info.input.fzjid" text="证件号"/></label>
						<div class="controls">
							  	<input id="tZjDingdan-info_fzjid" type="text" name="fzjid" value="${model.fzjid}" size="" class="number   " minlength="" maxlength="">
					    </div>
					  </div>
	  
						<div class="span5">
					    <label class="control-label" for="tZjDingdan-info_fryid"><spring:message code="tZjDingdan-info.tZjDingdan-info.input.fryid" text="订单负责人"/></label>
						<div class="controls">
							  	<input id="tZjDingdan-info_fryid" type="text" name="fryid" value="${model.fryid}" size="" class="number   " minlength="" maxlength="">
					    </div>
					    </div>
					    </div>
	  
						<div class="control-group">
						<div class="span5">
					    <label class="control-label" for="tZjDingdan-info_fstartdate"><spring:message code="tZjDingdan-info.tZjDingdan-info.input.fstartdate" text="开始时间"/></label>
						<div class="controls">
						      	 <div class="input-append datepicker date" style="padding-left: 0px;">
							    	<input id="tZjDingdan-info_fstartdate" type="text" name="fstartdate" value="${model.fstartdate}" size="40" class="text "   style="background-color:white;cursor:default; width: 175px;">
							 		 <span class="add-on" style="padding-top: 2px; padding-bottom: 2px;"><i class="icon-calendar"></i></span>
							 	 </div>
					    </div>
					  </div>
	  
						<div class="span5">
					    <label class="control-label" for="tZjDingdan-info_fenddate"><spring:message code="tZjDingdan-info.tZjDingdan-info.input.fenddate" text=""/></label>
						<div class="controls">
						      	 <div class="input-append datepicker date" style="padding-left: 0px;">
							    	<input id="tZjDingdan-info_fenddate" type="text" name="fenddate" value="${model.fenddate}" size="40" class="text "   style="background-color:white;cursor:default; width: 175px;">
							 		 <span class="add-on" style="padding-top: 2px; padding-bottom: 2px;"><i class="icon-calendar"></i></span>
							 	 </div>
					    </div>
					    </div>
					    </div>
	  
						<div class="control-group">
						<div class="span5">
					    <label class="control-label" for="tZjDingdan-info_fstate"><spring:message code="tZjDingdan-info.tZjDingdan-info.input.fstate" text="预定状态"/></label>
						<div class="controls">
							  	 <input id="tZjDingdan-info_fstate" type="text" name="fstate" value="${model.fstate}" size="" class="text " minlength="" maxlength="">	
					    </div>
					  </div>
	  
						<div class="span5">
					    <label class="control-label" for="tZjDingdan-info_fxmid"><spring:message code="tZjDingdan-info.tZjDingdan-info.input.fxmid" text="相关项目"/></label>
						<div class="controls">
							  	<input id="tZjDingdan-info_fxmid" type="text" name="fxmid" value="${model.fxmid}" size="" class="number   " minlength="" maxlength="">
					    </div>
					    </div>
					    </div>
	  
						<div class="control-group">
						<div class="span5">
					    <label class="control-label" for="tZjDingdan-info_fmemo"><spring:message code="tZjDingdan-info.tZjDingdan-info.input.fmemo" text="备注"/></label>
						<div class="controls">
						      	<textarea id="tZjDingdan-info_fmemo"  name="fmemo"  class="form-control" rows="6"  style="width: 560px" class="text  "  minlength="" maxlength="200">${model.fmemo}</textarea>
					    </div>
					  </div>
	  
						<div class="span5">
					    <label class="control-label" for="tZjDingdan-info_fmemo1"><spring:message code="tZjDingdan-info.tZjDingdan-info.input.fmemo1" text="备注1"/></label>
						<div class="controls">
						      	<textarea id="tZjDingdan-info_fmemo1"  name="fmemo1"  class="form-control" rows="6"  style="width: 560px" class="text  "  minlength="" maxlength="200">${model.fmemo1}</textarea>
					    </div>
					    </div>
					    </div>
	  
						<div class="control-group">
						<div class="span5">
					    <label class="control-label" for="tZjDingdan-info_fmemo2"><spring:message code="tZjDingdan-info.tZjDingdan-info.input.fmemo2" text="备注2"/></label>
						<div class="controls">
						      	<textarea id="tZjDingdan-info_fmemo2"  name="fmemo2"  class="form-control" rows="6"  style="width: 560px" class="text  "  minlength="" maxlength="200">${model.fmemo2}</textarea>
					    </div>
					  </div>
	  
						<div class="span5">
					    <label class="control-label" for="tZjDingdan-info_fmemo3"><spring:message code="tZjDingdan-info.tZjDingdan-info.input.fmemo3" text="备注3"/></label>
						<div class="controls">
						      	<textarea id="tZjDingdan-info_fmemo3"  name="fmemo3"  class="form-control" rows="6"  style="width: 560px" class="text  "  minlength="" maxlength="200">${model.fmemo3}</textarea>
					    </div>
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
