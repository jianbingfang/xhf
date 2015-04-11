<%@page contentType="text/html;charset=UTF-8"%>
<%@include file="/taglibs.jsp"%>
<%pageContext.setAttribute("currentHeader", "cw-home");%>
<%pageContext.setAttribute("currentMenu", "cw-hs");%>
<!doctype html>
<html lang="zh">

  <head>
    <%@include file="/common/meta.jsp"%>
    <title><spring:message code="cwXmhslist-info.cwXmhslist-info.input.title" text="编辑"/></title>
    <%@include file="/common/s.jsp"%>
    <script type="text/javascript">
$(function() {
    $("#cwXmhslist-infoForm").validate({
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
		  <h4 class="title"><spring:message code="cwXmhslist-info.cwXmhslist-info.input.title" text="编辑" /></h4>
		</header>

		<div class="content content-inner">

<form id="cwXmhslist-infoForm" method="post" action="cwXmhslist-info-save.do" class="form-horizontal">
  <c:if test="${model != null}">
	  <input id="cwXmhslist-info_id" type="hidden" name="fid" value="${model.fid}">
  </c:if>
			    	<div class="control-group">
				    <label class="control-label" for="cwXmhslist-info_fquarter"><spring:message code="cwXmhslist-info.cwXmhslist-info.input.fquarter" text="季度"/></label>
					<div class="controls">
					  	 <input id="cwXmhslist-info_fquarter" type="text" name="fquarter" value="${model.fquarter}" size="" class="text required" minlength="" maxlength="">	
				    </div>
				  </div>
			    	<div class="control-group">
				    <label class="control-label" for="cwXmhslist-info_fstartdate"><spring:message code="cwXmhslist-info.cwXmhslist-info.input.fstartdate" text="开始时间"/></label>
					<div class="controls">
				      	 <div class="input-append datepicker date" style="padding-left: 0px;">
					    	<input id="cwXmhslist-info_fstartdate" type="text" name="fstartdate" value="${model.fstartdate}" size="40" class="text "   style="background-color:white;cursor:default; width: 175px;">
					 		 <span class="add-on" style="padding-top: 2px; padding-bottom: 2px;"><i class="icon-calendar"></i></span>
					 	 </div>
				    </div>
				  </div>
			    	<div class="control-group">
				    <label class="control-label" for="cwXmhslist-info_fenddate"><spring:message code="cwXmhslist-info.cwXmhslist-info.input.fenddate" text="结束时间"/></label>
					<div class="controls">
				      	 <div class="input-append datepicker date" style="padding-left: 0px;">
					    	<input id="cwXmhslist-info_fenddate" type="text" name="fenddate" value="${model.fenddate}" size="40" class="text "   style="background-color:white;cursor:default; width: 175px;">
					 		 <span class="add-on" style="padding-top: 2px; padding-bottom: 2px;"><i class="icon-calendar"></i></span>
					 	 </div>
				    </div>
				  </div>
				    	<div class="control-group">
				    <label class="control-label" for="cwXmhslist-info_fjsstate"><spring:message code="cwHtfxlist-info.cwHtfxlist-info.input.fjsstate" text="结算状态"/></label>
					<div class="controls">
					  	 	<select id="cwHtfxlist-info_fjsstate" name="fjsstate" size="" class="text " >
										     <option value="未结算" <c:if test="${model.fjsstate=='未结算' }">selected="selected"</c:if> >未结算</option>
										 	 <option value="已结算" <c:if test="${model.fjsstate=='已结算' }">selected="selected"</c:if> >已结算</option>
										 	 <option value="" >全部</option>
										</select>
				    </div>
				  </div>
			    	<div class="control-group">
				    <label class="control-label" for="cwXmhslist-info_fsx"><spring:message code="cwXmhslist-info.cwHtfxlist-info.input.fsx" text="属性"/></label>
					<div class="controls">
					  	 <input id="cwXmhslist-info_fsx" type="text" name="fsx" value="${model.fsx}" size="" class="text " minlength="" maxlength="">	
				    </div>
				  </div>
			    	<div class="control-group">
				    <label class="control-label" for="cwXmhslist-info_fmemo1"><spring:message code="cwXmhslist-info.cwXmhslist-info.input.fmemo1" text="备注"/></label>
					<div class="controls">
					  	 <input id="cwXmhslist-info_fmemo1" type="text" name="fmemo1" value="${model.fmemo1}" size="" class="text " minlength="" maxlength="">	
				    </div>
				  </div>
					 	<div class="control-group">
					    <div class="controls">
					      <button type="submit" class="btn a-submit"><spring:message code='core.input.save' text='保存并生成报表'/></button>
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
