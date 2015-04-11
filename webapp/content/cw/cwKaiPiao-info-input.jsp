<%@page contentType="text/html;charset=UTF-8"%>
<%@include file="/taglibs.jsp"%>
<%pageContext.setAttribute("currentHeader", "cw-home");%>
<%pageContext.setAttribute("currentMenu", "cw-zk");%>
<!doctype html>
<html lang="zh">

  <head>
    <%@include file="/common/meta.jsp"%>
    <title><spring:message code="cwYingshou-info.cwYingshou-info.input.title" text="编辑"/></title>
    <%@include file="/common/s.jsp"%>
      <link type="text/css" rel="stylesheet"
	href="${scopePrefix}/s/xthena/xmpicker/xmpicker.css">
<script type="text/javascript"
	src="${scopePrefix}/s/xthena/xmpicker/xmpicker.js"></script>
    <link type="text/css" rel="stylesheet"
	href="${scopePrefix}/s/xthena/rypicker/rypicker.css">
<script type="text/javascript"
	src="${scopePrefix}/s/xthena/rypicker/rypicker.js"></script>
		   <link type="text/css" rel="stylesheet"
	href="${scopePrefix}/s/xthena/htpicker/htpicker.css">
<script type="text/javascript"
	src="${scopePrefix}/s/xthena/htpicker/htpicker.js"></script>
    <script type="text/javascript">
$(function() {
    $("#cwKaiPiao-infoForm").validate({
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
    createxmPicker({
		modalId : 'xmPicker',
		url : '${scopePrefix}/gcgl/pjXm-simple-list.do'
	});
    createhtPicker({
		modalId : 'htPicker',
		url : '${scopePrefix}/sckf/ht-simple-list.do'
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
		  <h4 class="title"><spring:message code="cwKaiPiao-info.cwKaiPiao-info.input.title" text="编辑" /></h4>
		</header>

		<div class="content content-inner">

<form id="cwKaiPiao-infoForm" method="post" action="cwKaiPiao-info-save.do" class="form-horizontal">
  <c:if test="${model != null}">
	  <input id="cwKaiPiao-info_id" type="hidden" name="fid" value="${model.fid}">
  </c:if>
	  
	  <div class="control-group">
							<label class="control-label" for="cwYingShou-info_fhtid"><spring:message
									code="cwYingShou-info.cwYingShou-info.input.fhtid" text="项目" /></label>
							<div class="controls">
								<div class="input-append htPicker">
									<input id="cwYingShou-info_fhtid" type="hidden" name="fxmid"
										value="${model.fxmid}"> <input
										id="cwYingShou-info_htmc" type="text"
										value="${htMap[model.fxmid].fhtname}" disabled
										class=" required" style="width: 400px;" value=""> <span
										class="add-on" style="padding-top: 2px; padding-bottom: 2px;"><i
										class="icon-th-list"></i></span>
								</div>
							</div>
						</div>
						<div class="control-group">
							<div class="span5">
								<label class="control-label" for="cwYingShou-info_finviocecode"><spring:message
										code="cwYingShou-info.cwYingShou-info.input.finviocecode"
										text="发票号" /></label>
								<div class="controls">
									<input id="cwYingShou-info_finviocecode" name="finviocecode"
										type="text" class="text" value="${model.finviocecode}"
										style="width: 400px;">
								</div>
							</div>
						</div>
						<div class="control-group">
							<div class="span5">
								<label class="control-label" for="cwYingShou-info_freceiptcode"><spring:message
										code="cwYingShou-info.cwYingShou-info.input.freceiptcode"
										text="收据号" /></label>
								<div class="controls">
									<input id="cwYingShou-info_freceiptcode" name="freceiptcode"
										type="text" class="text" value="${model.freceiptcode}"
										style="width: 400px;">
								</div>
							</div>
							</div>
						<div class="control-group">
	  
						<div class="span5">
					    <label class="control-label" for="cwKaiPiao-info_fdzdate"><spring:message code="cwKaiPiao-info.cwKaiPiao-info.input.fdzdate" text="时间"/></label>
						<div class="controls">
						      	 <div class="input-append datepicker date" style="padding-left: 0px;">
							    	<input id="cwKaiPiao-info_fdzdate" type="text" name="fdzdate" value="${model.fdzdate}" size="40" class="text required"   style="background-color:white;cursor:default; width: 175px;">
							 		 <span class="add-on" style="padding-top: 2px; padding-bottom: 2px;"><i class="icon-calendar"></i></span>
							 	 </div>
					    </div>
					    </div>
	  
						<div class="span5">
					    <label class="control-label" for="cwKaiPiao-info_fdebit"><spring:message code="cwKaiPiao-info.cwKaiPiao-info.input.fdebit" text="借方金额"/></label>
						<div class="controls">
							  	<input id="cwKaiPiao-info_fdebit" type="number " name="fdebit" value="${model.fdebit==null?0:model.fdebit}" size="" class="number   required" minlength="" maxlength="">
					    </div>
					    </div>
					    </div>
	  
						<div class="control-group">
	  
						<div class="span5">
					    <label class="control-label" for="cwKaiPiao-info_fopratorname"><spring:message code="cwKaiPiao-info.cwKaiPiao-info.input.fopratorname" text="经办人"/></label>
						<div class="controls">
							<input
								id="cwKaiPiao-info_userName" type="text"  name="fopratorname" value="${model.fopratorname==null?user:model.fopratorname}"
								 class=" " style="width: 175px;" value="">
					    </div>
					    </div>
					<%--</div>
						<div class="control-group">
	  
						<div class="span5">
					    <label class="control-label" for="cwKaiPiao-info_fhjjdfx"><spring:message code="cwKaiPiao-info.cwKaiPiao-info.input.fhjjdfx" text="合计借贷方向"/></label>
						<div class="controls">
							  	 <input id="cwKaiPiao-info_fhjjdfx" type="text" name="fhjjdfx" value="${model.fhjjdfx}" size="" class="text required" minlength="" maxlength="">	
					    </div>
					    </div>
					    </div>
	  
						<div class="control-group">
						<div class="span5">
					    <label class="control-label" for="cwKaiPiao-info_fhjje"><spring:message code="cwKaiPiao-info.cwKaiPiao-info.input.fhjje" text="合计金额"/></label>
						<div class="controls">
							  	 <input id="cwKaiPiao-info_fhjje" type="text" name="fhjje" value="${model.fhjje}" size="" class="text " minlength="" maxlength="">	
					    </div>
					  </div> --%>
	  
						<div class="span5">
					    <label class="control-label" for="cwKaiPiao-info_fmemo"><spring:message code="cwKaiPiao-info.cwKaiPiao-info.input.fmemo" text="备注"/></label>
						<div class="controls">
							  	 <input id="cwKaiPiao-info_fmemo" type="text" name="fmemo" value="${model.fmemo}" size="" class="text " minlength="" maxlength="">	
					    </div>
					    </div>
					    </div>
	  
					
					 	<div class="control-group">
					    <div class="controls">
					      <button type="submit" class="btn a-submit"><spring:message code='core.input.KaiPiaosave' text='保存'/></button>
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
