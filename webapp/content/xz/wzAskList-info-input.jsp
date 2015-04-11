<%@page contentType="text/html;charset=UTF-8"%>
<%@include file="/taglibs.jsp"%>
<%pageContext.setAttribute("currentHeader", "xz-home");%>
<%pageContext.setAttribute("currentMenu", "xz-wz");%>
<!doctype html>
<html lang="zh">

  <head>
    <%@include file="/common/meta.jsp"%>
    <title><spring:message code="wzAskList-info.wzAskList-info.input.title" text=”物品台账“ /></title>
    <%@include file="/common/s.jsp"%>
    <script type="text/javascript">
$(function() {
    $("#wzAskList-infoForm").validate({
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
	  <%@include file="/menu/xz-workspace.jsp"%>

	  <!-- start of main -->
      <section id="m-main" class="span10">
      <article class="m-widget">
        <header class="header">
		  <h4 class="title"><spring:message code="wzAskList-info.wzAskList-info.input.title" text="编辑" /></h4>
		</header>

		<div class="content content-inner">

<form id="wzAskList-infoForm" method="post" action="wzAskList-info-save.do" class="form-horizontal">
  <c:if test="${model != null}">
	  <input id="wzAskList-info_id" type="hidden" name="fid" value="${model.fid}">
  </c:if>
			    	<div class="control-group">
				    <label class="control-label" for="wzAskList-info_faskid"><spring:message code="wzAskList-info.wzAskList-info.input.faskid" text="申请单编号"/></label>
					<div class="controls">
					  	<input id="wzAskList-info_faskid" type="text" name="faskid" value="${model.faskid}" size="" class="number   " minlength="" maxlength="">
				    </div>
				  </div>
			    	<div class="control-group">
				    <label class="control-label" for="wzAskList-info_fwzname"><spring:message code="wzAskList-info.wzAskList-info.input.fwzname" text="物资名称"/></label>
					<div class="controls">
					  	 <input id="wzAskList-info_fwzname" type="text" name="fwzname" value="${model.fwzname}" size="" class="text required" minlength="" maxlength="">	
				    </div>
				  </div>
			    	<div class="control-group">
				    <label class="control-label" for="wzAskList-info_fnum"><spring:message code="wzAskList-info.wzAskList-info.input.fnum" text="数量"/></label>
					<div class="controls">
					  	<input id="wzAskList-info_fnum" type="text" name="fnum" value="${model.fnum}" size="" class="number   " minlength="" maxlength="">
				    </div>
				  </div>
			    	<div class="control-group">
				    <label class="control-label" for="wzAskList-info_fmemo"><spring:message code="wzAskList-info.wzAskList-info.input.fmemo" text="备注"/></label>
					<div class="controls">
				      	<textarea id="wzAskList-info_fmemo"  name="fmemo"  class="form-control" rows="6"  style="width: 560px" class="text  "  minlength="" maxlength="500">${model.fmemo}</textarea>
				    </div>
				  </div>
			    	<div class="control-group">
				    <label class="control-label" for="wzAskList-info_fwzcode"><spring:message code="wzAskList-info.wzAskList-info.input.fwzcode" text="物资代码"/></label>
					<div class="controls">
					  	 <input id="wzAskList-info_fwzcode" type="text" name="fwzcode" value="${model.fwzcode}" size="" class="text required" minlength="" maxlength="">	
				    </div>
				  </div>
			    	<div class="control-group">
				    <label class="control-label" for="wzAskList-info_fwzid"><spring:message code="wzAskList-info.wzAskList-info.input.fwzid" text="物资id"/></label>
					<div class="controls">
					  	<input id="wzAskList-info_fwzid" type="text" name="fwzid" value="${model.fwzid}" size="" class="number   " minlength="" maxlength="">
				    </div>
				  </div>
			    	<div class="control-group">
				    <label class="control-label" for="wzAskList-info_fmemo1"><spring:message code="wzAskList-info.wzAskList-info.input.fmemo1" text="备注1"/></label>
					<div class="controls">
				      	<textarea id="wzAskList-info_fmemo1"  name="fmemo1"  class="form-control" rows="6"  style="width: 560px" class="text  "  minlength="" maxlength="500">${model.fmemo1}</textarea>
				    </div>
				  </div>
			    	<div class="control-group">
				    <label class="control-label" for="wzAskList-info_fmemo2"><spring:message code="wzAskList-info.wzAskList-info.input.fmemo2" text="备注2"/></label>
					<div class="controls">
				      	<textarea id="wzAskList-info_fmemo2"  name="fmemo2"  class="form-control" rows="6"  style="width: 560px" class="text  "  minlength="" maxlength="500">${model.fmemo2}</textarea>
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
