<%@page contentType="text/html;charset=UTF-8"%>
<%@include file="/taglibs.jsp"%>
<%pageContext.setAttribute("currentHeader", "sckf-home");%>
<%pageContext.setAttribute("currentMenu", "sckf-xmtb");%>
<!doctype html>
<html lang="zh">

  <head>
    <%@include file="/common/meta.jsp"%>
    <title><spring:message code="jyZb-info.jyZb-info.input.title" text="编辑"/></title>
    <%@include file="/common/s.jsp"%>
    <script type="text/javascript">
$(function() {
    $("#jyZb-infoForm").validate({
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
		  <h4 class="title"><spring:message code="jyZb-info.jyZb-info.input.title" text="编辑" /></h4>
		</header>

		<div class="content content-inner">

<form id="jyZb-infoForm" method="post" action="jyZb-info-save.do" class="form-horizontal">
  <c:if test="${model != null}">
	  <input id="jyZb-info_id" type="hidden" name="fid" value="${model.fid}">
  </c:if>
	  
	  
						<div class="control-group">
						<div class="span5">
					    <label class="control-label" for="jyZb-info_fzbwjbh"><spring:message code="jyZb-info.jyZb-info.input.fzbwjbh" text="招标文件编号"/></label>
						<div class="controls">
							  	 <input id="jyZb-info_fzbwjbh" type="text" name="fzbwjbh" value="${model.fzbwjbh}" size="" class="text " minlength="" maxlength="">	
					    </div>
					  </div>
	  
						<div class="span5">
					    <label class="control-label" for="jyZb-info_fkbdate"><spring:message code="jyZb-info.jyZb-info.input.fkbdate" text="开标时间"/></label>
						<div class="controls">
						      	 <div class="input-append datetimepicker date" style="padding-left: 0px;">
							    	<input id="jyZb-info_fkbdate" type="text" name="fkbdate" value="${model.fkbdate}" size="40" class="text "   style="background-color:white;cursor:default; width: 175px;">
							 		 <span class="add-on" style="padding-top: 2px; padding-bottom: 2px;"><i class="icon-calendar"></i></span>
							 	 </div>
					    </div>
					    </div>
					    </div>
	  
						<div class="control-group">
						<div class="span5">
					    <label class="control-label" for="jyZb-info_fsfkbtx"><spring:message code="jyZb-info.jyZb-info.input.fsfkbtx" text="开标时间提醒"/></label>
						<div class="controls">
						      	 <select class="form-control" id="jyZb-info_fsfkbtx" name="fsfkbtx" value="${model.fsfkbtx}" class=" " >
							    	 	<option value="是"  <c:if test="${model.fsfkbtx}=='是'}"> selected="selected"  </c:if>>是</option>
							    	 	<option value="否"  <c:if test="${model.fsfkbtx}=='否'}"> selected="selected"  </c:if>>否</option>
							 	</select>
					    </div>
					  </div>
	  
						<div class="span5">
					    <label class="control-label" for="jyZb-info_fzzsj"><spring:message code="jyZb-info.jyZb-info.input.fzzsj" text="截止时间"/></label>
						<div class="controls">
						      	 <div class="input-append datetimepicker date" style="padding-left: 0px;">
							    	<input id="jyZb-info_fzzsj" type="text" name="fzzsj" value="${model.fzzsj}" size="40" class="text "   style="background-color:white;cursor:default; width: 175px;">
							 		 <span class="add-on" style="padding-top: 2px; padding-bottom: 2px;"><i class="icon-calendar"></i></span>
							 	 </div>
					    </div>
					    </div>
					    </div>
	  
						<div class="control-group">
						<div class="span5">
					    <label class="control-label" for="jyZb-info_fzzsjtx"><spring:message code="jyZb-info.jyZb-info.input.fzzsjtx" text="截止时间提醒"/></label>
						<div class="controls">
						      	 <select class="form-control" id="jyZb-info_fzzsjtx" name="fzzsjtx" value="${model.fzzsjtx}" class=" " >
							    	 	<option value="是"  <c:if test="${model.fzzsjtx}=='是'}"> selected="selected"  </c:if>>是</option>
							    	 	<option value="否"  <c:if test="${model.fzzsjtx}=='否'}"> selected="selected"  </c:if>>否</option>
							 	</select>
					    </div>
					  </div>
	  
						<div class="span5">
					    <label class="control-label" for="jyZb-info_fbzjje"><spring:message code="jyZb-info.jyZb-info.input.fbzjje" text="保证金金额"/></label>
						<div class="controls">
							  	<input id="jyZb-info_fbzjje" type="text" name="fbzjje" value="${model.fbzjje}" size="" class="number   " minlength="" maxlength="">
					    </div>
					    </div>
					    </div>
	  
						<div class="control-group">
						<div class="span5">
					    <label class="control-label" for="jyZb-info_fenddate"><spring:message code="jyZb-info.jyZb-info.input.fenddate" text="保证金交纳截止时间"/></label>
						<div class="controls">
						      	 <div class="input-append datepicker date" style="padding-left: 0px;">
							    	<input id="jyZb-info_fenddate" type="text" name="fenddate" value="${model.fenddate}" size="40" class="text "   style="background-color:white;cursor:default; width: 175px;">
							 		 <span class="add-on" style="padding-top: 2px; padding-bottom: 2px;"><i class="icon-calendar"></i></span>
							 	 </div>
					    </div>
					  </div>
	  
						<div class="span5">
					    <label class="control-label" for="jyZb-info_fzbds"><spring:message code="jyZb-info.jyZb-info.input.fzbds" text="总标段数"/></label>
						<div class="controls">
							  	<input id="jyZb-info_fzbds" type="text" name="fzbds" value="${model.fzbds}" size="" class="number   " minlength="" maxlength="">
					    </div>
					    </div>
					    </div>
	  
						<div class="control-group">
						<div class="span5">
					    <label class="control-label" for="jyZb-info_fstbd"><spring:message code="jyZb-info.jyZb-info.input.fstbd" text="所投标段"/></label>
						<div class="controls">
							  	<input id="jyZb-info_fstbd" type="text" name="fstbd" value="${model.fstbd}" size="" class="number   " minlength="" maxlength="">
					    </div>
					  </div>
	  
						<div class="span5">
					    <label class="control-label" for="jyZb-info_fzjdc"><spring:message code="jyZb-info.jyZb-info.input.fzjdc" text="总监到场"/></label>
						<div class="controls">
							  	<input id="jyZb-info_fzjdc" type="text" name="fzjdc" value="${model.fzjdc}" size="" class="number   " minlength="" maxlength="">
					    </div>
					    </div>
					    </div>
	  
						<div class="control-group">
						<div class="span5">
					    <label class="control-label" for="jyZb-info_ffrdc"><spring:message code="jyZb-info.jyZb-info.input.ffrdc" text="法人到场"/></label>
						<div class="controls">
							  	<input id="jyZb-info_ffrdc" type="text" name="ffrdc" value="${model.ffrdc}" size="" class="number   " minlength="" maxlength="">
					    </div>
					  </div>
	  
						<div class="span5">
					    <label class="control-label" for="jyZb-info_fbmid"><spring:message code="jyZb-info.jyZb-info.input.fbmid" text="报名信息id"/></label>
						<div class="controls">
							  	<input id="jyZb-info_fbmid" type="text" name="fbmid" value="${model.fbmid}" size="" class="number   " minlength="" maxlength="">
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
