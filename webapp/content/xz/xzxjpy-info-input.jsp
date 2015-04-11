<%@page contentType="text/html;charset=UTF-8"%>
<%@include file="/taglibs.jsp"%>
<%pageContext.setAttribute("currentHeader", "xz-home");%>
<%pageContext.setAttribute("currentMenu", "xz-py");%>
<!doctype html>
<html lang="zh">

  <head>
    <%@include file="/common/meta.jsp"%>
    <title><spring:message code="xzxjpy-info.xzxjpy-info.input.title" text="编辑"/></title>
    <%@include file="/common/s.jsp"%>
    <script type="text/javascript">
$(function() {
    $("#xzxjpy-infoForm").validate({
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
		  <h4 class="title"><spring:message code="xzxjpy-info.xzxjpy-info.input.title" text="编辑" /></h4>
		</header>

		<div class="content content-inner">

<form id="xzxjpy-infoForm" method="post" action="xzxjpy-info-save.do" class="form-horizontal">
  <c:if test="${model != null}">
	  <input id="xzxjpy-info_id" type="hidden" name="fid" value="${model.fid}">
  </c:if>
	  
	  
						<div class="control-group">
						<div class="span5">
					    <label class="control-label" for="xzxjpy-info_fwjno"><spring:message code="xzxjpy-info.xzxjpy-info.input.fwjno" text="文件号"/></label>
						<div class="controls">
						      	<textarea id="xzxjpy-info_fwjno"  name="fwjno"  class="form-control" rows="3"  class="text  "  minlength="" maxlength="200">${model.fwjno}</textarea>
					    </div>
					  </div>
	  
						<div class="span5">
					    <label class="control-label" for="xzxjpy-info_ftitle"><spring:message code="xzxjpy-info.xzxjpy-info.input.ftitle" text="标题"/></label>
						<div class="controls">
						      	<textarea id="xzxjpy-info_ftitle"  name="ftitle"  class="form-control" rows="3"  class="text  "  minlength="" maxlength="512">${model.ftitle}</textarea>
					    </div>
					    </div>
					    </div>
	  
						<div class="control-group">
						<div class="span5">
					    <label class="control-label" for="xzxjpy-info_fzj"><spring:message code="xzxjpy-info.xzxjpy-info.input.fzj" text="优秀总监"/></label>
						<div class="controls">
						      	<textarea id="xzxjpy-info_fzj"  name="fzj"  class="form-control" rows="3"  class="text  "  minlength="" maxlength="198">${model.fzj}</textarea>
					    </div>
					  </div>
	  
						<div class="span5">
					    <label class="control-label" for="xzxjpy-info_fjlgcs"><spring:message code="xzxjpy-info.xzxjpy-info.input.fjlgcs" text="优秀监理工程师"/></label>
						<div class="controls">
						      	<textarea id="xzxjpy-info_fjlgcs"  name="fjlgcs"  class="form-control" rows="3"  class="text  "  minlength="" maxlength="198">${model.fjlgcs}</textarea>
					    </div>
					    </div>
					    </div>
	  
						<div class="control-group">
						<div class="span5">
					    <label class="control-label" for="xzxjpy-info_fdate"><spring:message code="xzxjpy-info.xzxjpy-info.input.fdate" text="评先时间"/></label>
						<div class="controls">
						      	 <div class="input-append datepicker date" style="padding-left: 0px;">
							    	<input id="xzxjpy-info_fdate" type="text" name="fdate" value="${model.fdate}" size="40" class="text "   style="background-color:white;cursor:default; width: 175px;">
							 		 <span class="add-on" style="padding-top: 2px; padding-bottom: 2px;"><i class="icon-calendar"></i></span>
							 	 </div>
					    </div>
					  </div>
	  
						<div class="span5">
					    <label class="control-label" for="xzxjpy-info_ffwdw"><spring:message code="xzxjpy-info.xzxjpy-info.input.ffwdw" text="发文单位"/></label>
						<div class="controls">
							  	 <input id="xzxjpy-info_ffwdw" type="text" name="ffwdw" value="${model.ffwdw}" size="" class="text required" minlength="" maxlength="">	
					    </div>
					    </div>
					    </div>
	  
						<div class="control-group">
						<div class="span5">
					    <label class="control-label" for="xzxjpy-info_fjiangjin"><spring:message code="xzxjpy-info.xzxjpy-info.input.fjiangjin" text="奖金"/></label>
						<div class="controls">
							  	 <input id="xzxjpy-info_fjiangjin" type="text" name="fjiangjin" value="${model.fjiangjin}" size="" class="text " minlength="" maxlength="">	
					    </div>
					  </div>
	  
					<%-- 	<div class="span5">
					    <label class="control-label" for="xzxjpy-info_fljry"><spring:message code="xzxjpy-info.xzxjpy-info.input.fljry" text="领奖人员"/></label>
						<div class="controls">
							  	 <input id="xzxjpy-info_fljry" type="text" name="fljry" value="${model.fljry}" size="" class="text required" minlength="" maxlength="">	
					    </div>
					    </div>
					    </div>
	  
						<div class="control-group">
						<div class="span5">
					    <label class="control-label" for="xzxjpy-info_fjnfy"><spring:message code="xzxjpy-info.xzxjpy-info.input.fjnfy" text="交纳费用"/></label>
						<div class="controls">
							  	 <input id="xzxjpy-info_fjnfy" type="text" name="fjnfy" value="${model.fjnfy}" size="" class="text " minlength="" maxlength="">	
					    </div>
					  </div> --%>
	  
						<div class="span5">
					    <label class="control-label" for="xzxjpy-info_fmemo"><spring:message code="xzxjpy-info.xzxjpy-info.input.fmemo" text="备注"/></label>
						<div class="controls">
						      	<textarea id="xzxjpy-info_fmemo"  name="fmemo"  class="form-control" rows="3"  class="text  "  minlength="" maxlength="200">${model.fmemo}</textarea>
					    </div>
					    </div>
					    </div>
	  
						<div class="control-group">
						<div class="span5">
					    <label class="control-label" for="xzxjpy-info_ffzwz"><spring:message code="xzxjpy-info.xzxjpy-info.input.ffzwz" text="放置位置"/></label>
						<div class="controls">
							  	 <input id="xzxjpy-info_ffzwz" type="text" name="ffzwz" value="${model.ffzwz}" size="" class="text " minlength="" maxlength="">	
					    </div>
					  </div>
					  
					  
					  	<div class="span5">
					    <label class="control-label" for="xzxjpy-info_fzkstate"><spring:message code="xzxjpy-info.xzxjpy-info.input.fzkstate" text="在库状态"/></label>
						<div class="controls">
							<select class="form-control" id="xzxjpy-info_fzkstate" name="fzkstate" >
					    	 	<option value="在库"  <c:if test="${model.fzkstate=='在库'}"> selected="selected"  </c:if>>在库</option>
					    	 	<option value="未在库"  <c:if test="${model.fzkstate=='未在库'}"> selected="selected"  </c:if>>未在库</option>
					 		</select>
					    </div>
					    </div>
	  
						<div class="span5 hidden">
					    <label class="control-label" for="xzxjpy-info_ftype"><spring:message code="xzxjpy-info.xzxjpy-info.input.ftype" text="类型（内部，外部）"/></label>
						<div class="controls">
							  	 <input id="xzxjpy-info_ftype" type="text" name="ftype"  value="内" size="" class="text required" minlength="" maxlength="">	
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
