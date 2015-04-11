<%@page contentType="text/html;charset=UTF-8"%>
<%@include file="/taglibs.jsp"%>
<%pageContext.setAttribute("currentHeader", "sckf-home");%>
<%pageContext.setAttribute("currentMenu", "sckf-nytz");%>
<!doctype html>
<html lang="zh">

  <head>
    <%@include file="/common/meta.jsp"%>
    <title><spring:message code="jyZhongbTaizhang-info.jyZhongbTaizhang-info.input.title" text="编辑"/></title>
    <%@include file="/common/s.jsp"%>
    <script type="text/javascript">
$(function() {
    $("#jyZhongbTaizhang-infoForm").validate({
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
		  <h4 class="title"><spring:message code="jyZhongbTaizhang-info.jyZhongbTaizhang-info.input.title" text="编辑" /></h4>
		</header>

		<div class="content content-inner">

<form id="jyZhongbTaizhang-infoForm" method="post" action="jyZhongbTaizhang-info-save.do" class="form-horizontal">
  <c:if test="${model != null}">
	  <input id="jyZhongbTaizhang-info_id" type="hidden" name="fid" value="${model.fid}">
  </c:if>
  
  				<div class="control-group">
				    <label class="control-label" for="jyZhongbTaizhang-info_fyear"><spring:message code="jyZhongbTaizhang-info.jyZhongbTaizhang-info.input.fyear" text="年度"/></label>
					<div class="controls">
					  	 <input id="jyZhongbTaizhang-info_fyear" type="text" name="fyear" value="${model.fyear}" size="" class="text required" minlength="" maxlength="">	
				    </div>
				  </div>
			    	<div class="control-group">
				    <label class="control-label" for="jyZhongbTaizhang-info_fwz"><spring:message code="jyZhongbTaizhang-info.jyZhongbTaizhang-info.input.fwz" text="放置位置"/></label>
					<div class="controls">
					  	 <input id="jyZhongbTaizhang-info_fwz" type="text" name="fwz" value="${model.fwz}" size="" class="text required" minlength="" maxlength="">	
				    </div>
				  </div>
			    	<div class="control-group">
				    <label class="control-label" for="jyZhongbTaizhang-info_fzbcount"><spring:message code="jyZhongbTaizhang-info.jyZhongbTaizhang-info.input.fzbcount" text="项目"/></label>
					<div class="controls">
					  	<input id="jyZhongbTaizhang-info_fzbcount" type="text" name="fzbcount" value="${model.fzbcount}" size="" class="number   " minlength="" maxlength="">
				    </div>
				  </div>
			    	<div class="control-group">
				    <label class="control-label" for="jyZhongbTaizhang-info_fzbje"><spring:message code="jyZhongbTaizhang-info.jyZhongbTaizhang-info.input.fzbje" text="档案盒编号"/></label>
					<div class="controls">
					  	 <input id="jyZhongbTaizhang-info_fzbje" type="text" name="fzbje" value="${model.fzbje}" size="" class="text required" minlength="" maxlength="">	
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
