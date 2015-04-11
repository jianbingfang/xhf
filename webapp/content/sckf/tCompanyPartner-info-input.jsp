<%@page contentType="text/html;charset=UTF-8"%>
<%@include file="/taglibs.jsp"%>
<%pageContext.setAttribute("currentHeader", "sckf-home");%>
<%pageContext.setAttribute("currentMenu", "tCompanyPartner");%>
<!doctype html>
<html lang="zh">

  <head>
    <%@include file="/common/meta.jsp"%>
    <title><spring:message code="tCompanyPartner-info.tCompanyPartner-info.input.title" text="编辑"/></title>
    <%@include file="/common/s.jsp"%>
    <script type="text/javascript">
$(function() {
    $("#tCompanyPartner-infoForm").validate({
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
		  <h4 class="title"><spring:message code="tCompanyPartner-info.tCompanyPartner-info.input.title" text="编辑" /></h4>
		</header>

		<div class="content content-inner">

<form id="tCompanyPartner-infoForm" method="post" action="tCompanyPartner-info-save.do" class="form-horizontal">
  <c:if test="${model != null}">
	  <input id="tCompanyPartner-info_id" type="hidden" name="fid" value="${model.fid}">
  </c:if>
			    	<div class="control-group">
				    <label class="control-label" for="tCompanyPartner-info_fname"><spring:message code="tCompanyPartner-info.tCompanyPartner-info.input.fname" text="公司名称"/></label>
					<div class="controls">
					  	 <input id="tCompanyPartner-info_fname" type="text" name="fname" value="${model.fname}" size="" class="text required" minlength="" maxlength="">	
				    </div>
				  </div>
			    	<div class="control-group">
				    <label class="control-label" for="tCompanyPartner-info_faddress"><spring:message code="tCompanyPartner-info.tCompanyPartner-info.input.faddress" text="公司地址"/></label>
					<div class="controls">
				      	<textarea id="tCompanyPartner-info_faddress"  name="faddress"  class="form-control" rows="6"  style="width: 560px" class="text  "  minlength="" maxlength="200">${model.faddress}</textarea>
				    </div>
				  </div>
			    	<div class="control-group">
				    <label class="control-label" for="tCompanyPartner-info_fcity"><spring:message code="tCompanyPartner-info.tCompanyPartner-info.input.fcity" text="所在城市"/></label>
					<div class="controls">
					  	 <input id="tCompanyPartner-info_fcity" type="text" name="fcity" value="${model.fcity}" size="" class="text required" minlength="" maxlength="">	
				    </div>
				  </div>
			    	<div class="control-group">
				    <label class="control-label" for="tCompanyPartner-info_flinkman"><spring:message code="tCompanyPartner-info.tCompanyPartner-info.input.flinkman" text="联系人"/></label>
					<div class="controls">
					  	 <input id="tCompanyPartner-info_flinkman" type="text" name="flinkman" value="${model.flinkman}" size="" class="text required" minlength="" maxlength="">	
				    </div>
				  </div>
			    	<div class="control-group">
				    <label class="control-label" for="tCompanyPartner-info_fphone"><spring:message code="tCompanyPartner-info.tCompanyPartner-info.input.fphone" text="联系电话"/></label>
					<div class="controls">
					  	 <input id="tCompanyPartner-info_fphone" type="text" name="fphone" value="${model.fphone}" size="" class="text required" minlength="" maxlength="">	
				    </div>
				  </div>
			    	<div class="control-group">
				    <label class="control-label" for="tCompanyPartner-info_fkhh"><spring:message code="tCompanyPartner-info.tCompanyPartner-info.input.fkhh" text="开户行"/></label>
					<div class="controls">
					  	 <input id="tCompanyPartner-info_fkhh" type="text" name="fkhh" value="${model.fkhh}" size="" class="text required" minlength="" maxlength="">	
				    </div>
				  </div>
			    	<div class="control-group">
				    <label class="control-label" for="tCompanyPartner-info_fyhzh"><spring:message code="tCompanyPartner-info.tCompanyPartner-info.input.fyhzh" text="银行账号"/></label>
					<div class="controls">
					  	 <input id="tCompanyPartner-info_fyhzh" type="text" name="fyhzh" value="${model.fyhzh}" size="" class="text required" minlength="" maxlength="">	
				    </div>
				  </div>
			    	<div class="control-group">
				    <label class="control-label" for="tCompanyPartner-info_fmemo"><spring:message code="tCompanyPartner-info.tCompanyPartner-info.input.fmemo" text="备注"/></label>
					<div class="controls">
				      	<textarea id="tCompanyPartner-info_fmemo"  name="fmemo"  class="form-control" rows="6"  style="width: 560px" class="text  "  minlength="" maxlength="200">${model.fmemo}</textarea>
				    </div>
				  </div>
			    	<div class="control-group">
				    <label class="control-label" for="tCompanyPartner-info_fmemo1"><spring:message code="tCompanyPartner-info.tCompanyPartner-info.input.fmemo1" text="备注1"/></label>
					<div class="controls">
				      	<textarea id="tCompanyPartner-info_fmemo1"  name="fmemo1"  class="form-control" rows="6"  style="width: 560px" class="text  "  minlength="" maxlength="200">${model.fmemo1}</textarea>
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
