<%@page contentType="text/html;charset=UTF-8"%>
<%@include file="/taglibs.jsp"%>
<%pageContext.setAttribute("currentHeader", "xz-home");%>
<%pageContext.setAttribute("currentMenu", "xz-wz");%>
<!doctype html>
<html lang="zh">

  <head>
    <%@include file="/common/meta.jsp"%>
    <title><spring:message code="wzIoList-info.wzIoList-info.input.title" text="编辑"/></title>
    <%@include file="/common/s.jsp"%>
    <script type="text/javascript">
$(function() {
    $("#wzIoList-infoForm").validate({
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
		  <h4 class="title"><spring:message code="wzIoList-info.wzIoList-info.input.title" text="编辑" /></h4>
		</header>

		<div class="content content-inner">

<form id="wzIoList-infoForm" method="post" action="wzIoList-info-save.do" class="form-horizontal">
  <c:if test="${model != null}">
	  <input id="wzIoList-info_id" type="hidden" name="fid" value="${model.fid}">
  </c:if>
			    	<div class="control-group">
				    <label class="control-label" for="wzIoList-info_fwzid"><spring:message code="wzIoList-info.wzIoList-info.input.fwzid" text="物资id"/></label>
					<div class="controls">
					  	<input id="wzIoList-info_fwzid" type="text" name="fwzid" value="${model.fwzid}" size="" class="number   " minlength="" maxlength="">
				    </div>
				  </div>
			    	<div class="control-group">
				    <label class="control-label" for="wzIoList-info_fnum"><spring:message code="wzIoList-info.wzIoList-info.input.fnum" text="数量"/></label>
					<div class="controls">
					  	<input id="wzIoList-info_fnum" type="text" name="fnum" value="${model.fnum}" size="" class="number   " minlength="" maxlength="">
				    </div>
				  </div>
			    	<div class="control-group">
				    <label class="control-label" for="wzIoList-info_fmoney"><spring:message code="wzIoList-info.wzIoList-info.input.fmoney" text="金额"/></label>
					<div class="controls">
					  	<input id="wzIoList-info_fmoney" type="text" name="fmoney" value="${model.fmoney}" size="" class="number   " minlength="" maxlength="">
				    </div>
				  </div>
			    	<div class="control-group">
				    <label class="control-label" for="wzIoList-info_fname"><spring:message code="wzIoList-info.wzIoList-info.input.fname" text="物资名称"/></label>
					<div class="controls">
					  	 <input id="wzIoList-info_fname" type="text" name="fname" value="${model.fname}" size="" class="text required" minlength="" maxlength="">	
				    </div>
				  </div>
			    	<div class="control-group">
				    <label class="control-label" for="wzIoList-info_fcode"><spring:message code="wzIoList-info.wzIoList-info.input.fcode" text="物资编号"/></label>
					<div class="controls">
					  	 <input id="wzIoList-info_fcode" type="text" name="fcode" value="${model.fcode}" size="" class="text required" minlength="" maxlength="">	
				    </div>
				  </div>
			    	<div class="control-group">
				    <label class="control-label" for="wzIoList-info_funit"><spring:message code="wzIoList-info.wzIoList-info.input.funit" text="计量单位"/></label>
					<div class="controls">
					  	 <input id="wzIoList-info_funit" type="text" name="funit" value="${model.funit}" size="" class="text required" minlength="" maxlength="">	
				    </div>
				  </div>
			    	<div class="control-group">
				    <label class="control-label" for="wzIoList-info_fwzcode"><spring:message code="wzIoList-info.wzIoList-info.input.fwzcode" text="物资代码"/></label>
					<div class="controls">
					  	 <input id="wzIoList-info_fwzcode" type="text" name="fwzcode" value="${model.fwzcode}" size="" class="text required" minlength="" maxlength="">	
				    </div>
				  </div>
			    	<div class="control-group">
				    <label class="control-label" for="wzIoList-info_fioid"><spring:message code="wzIoList-info.wzIoList-info.input.fioid" text="出入库id"/></label>
					<div class="controls">
					  	<input id="wzIoList-info_fioid" type="text" name="fioid" value="${model.fioid}" size="" class="number   " minlength="" maxlength="">
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
