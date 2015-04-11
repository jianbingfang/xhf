<%@page contentType="text/html;charset=UTF-8"%>
<%@include file="/taglibs.jsp"%>
<%pageContext.setAttribute("currentHeader", "jl-home");%>
<%pageContext.setAttribute("currentMenu", "jl-xcgl");%>
<!doctype html>
<html lang="zh">

  <head>
    <%@include file="/common/meta.jsp"%>
    <title><spring:message code="jlSght-info.jlSght-info.input.title" text="编辑"/></title>
    <%@include file="/common/s.jsp"%>
    <script type="text/javascript">
$(function() {
    $("#jlSght-infoForm").validate({
        submitHandler: function(form) {
			bootbox.animate(false);
			var box = bootbox.dialog('<div class="progress progress-striped active" style="margin:0px;"><div class="bar" style="width: 100%;"></div></div>');
            form.submit();
        },
        errorClass: 'validate-error'
    });
    
    showJiechu();
})

function showJiechu(){
	if($('#jlSght-info_fstatus').val()=='正常' ){
		$('[jiechu]').hide();
	}else{
		$('[jiechu]').show();
	}
}

    </script>
  </head>

  <body>
    <%@include file="/header.jsp"%>

    <div class="row-fluid">
	  <%@include file="/menu/jl-workspace.jsp"%>

	  <!-- start of main -->
      <section id="m-main" class="span10">

      <article class="m-widget">
        <header class="header">
		  <h4 class="title"><spring:message code="jlSght-info.jlSght-info.input.title" text="编辑" /></h4>
		</header>

		<div class="content content-inner">

<form id="jlSght-infoForm" method="post" action="jlSght-info-save.do" class="form-horizontal">
  <c:if test="${model != null}">
	  <input id="jlSght-info_id" type="hidden" name="fid" value="${model.fid}">
  </c:if>
						<div class="control-group">
	  
							<div class="span5">
						    <label class="control-label" for="jlSght-info_fname"><spring:message code="jlSght-info.jlSght-info.input.fname" text="合同名称"/></label>
							<div class="controls">
								  	 <input id="jlSght-info_fname" type="text" name="fname" value="${model.fname}" size="" class="text required" minlength="" maxlength="">	
						    </div>
						    </div>
						    
						    <div class="span5">
						    <label class="control-label" for="jlSght-info_fqiandingdate"><spring:message code="jlSght-info.jlSght-info.input.fqiandingdate" text="签订日期"/></label>
							<div class="controls">
							      	 <div class="input-append datepicker date" style="padding-left: 0px;">
								    	<input id="jlSght-info_fqiandingdate" type="text" name="fqiandingdate" value="${model.fqiandingdate}" size="40" class="text "   style="background-color:white;cursor:default; width: 175px;">
								 		 <span class="add-on" style="padding-top: 2px; padding-bottom: 2px;"><i class="icon-calendar"></i></span>
								 	 </div>
						    </div>
						    </div>
					    </div>
	  
						<div class="control-group">
						<div class="span5">
					    <label class="control-label" for="jlSght-info_fjiafang"><spring:message code="jlSght-info.jlSght-info.input.fjiafang" text="甲方"/></label>
						<div class="controls">
							  	 <input id="jlSght-info_fjiafang" type="text" name="fjiafang" value="${model.fjiafang}" size="" class="text " minlength="" maxlength="">	
					    </div>
					  </div>
	  
						<div class="span5">
					    <label class="control-label" for="jlSght-info_fyifang"><spring:message code="jlSght-info.jlSght-info.input.fyifang" text="乙方"/></label>
						<div class="controls">
							  	 <input id="jlSght-info_fyifang" type="text" name="fyifang" value="${model.fyifang}" size="" class="text " minlength="" maxlength="">	
					    </div>
					    </div>
					    </div>
	  
	  
				<%-- 		<div class="span5">
					    <label class="control-label" for="jlSght-info_fmemo"><spring:message code="jlSght-info.jlSght-info.input.fmemo" text="备注"/></label>
						<div class="controls">
						      	<textarea id="jlSght-info_fmemo"  name="fmemo"  class="form-control" rows="6"  style="width: 560px" class="text  "  minlength="" maxlength="4000">${model.fmemo}</textarea>
					    </div>
					    </div>
					    </div> --%>
	  
						<div class="control-group">
						<div class="span5">
					    <label class="control-label" for="jlSght-info_fisyanqi"><spring:message code="jlSght-info.jlSght-info.input.fisyanqi" text="是否延期"/></label>
						<div class="controls">
						      	 <select class="form-control" id="jlSght-info_fisyanqi" name="fisyanqi" value="${model.fisyanqi}" class=" " >
							    	 	<option value="否"  <c:if test="${model.fisyanqi=='否'}"> selected="selected"  </c:if>>否</option>
							    	 	<option value="是"  <c:if test="${model.fisyanqi=='是'}"> selected="selected"  </c:if>>是</option>
							 	</select>
					    </div>
					  </div>
	  
						<div class="span5">
					    <label class="control-label" for="jlSght-info_fisyanwu"><spring:message code="jlSght-info.jlSght-info.input.fisyanwu" text="是否延误"/></label>
						<div class="controls">
						      	 	 <select class="form-control" id="jlSght-info_fisyanwu" name="fisyanwu" value="${model.fisyanwu}" class=" " >
							    	 	<option value="否"  <c:if test="${model.fisyanwu=='否'}"> selected="selected"  </c:if>>否</option>
							    	 	<option value="是"  <c:if test="${model.fisyanwu=='是'}"> selected="selected"  </c:if>>是</option>
							 	</select>
					    </div>
					    </div>
					    </div>
	  
						<div class="control-group">
						<div class="span5">
					    <label class="control-label" for="jlSght-info_fyanqiinfo"><spring:message code="jlSght-info.jlSght-info.input.fyanqiinfo" text="延期说明"/></label>
						<div class="controls">
						      	<textarea id="jlSght-info_fyanqiinfo"  name="fyanqiinfo"  class="form-control" rows="6" class="text  "  minlength="" maxlength="4000">${model.fyanqiinfo}</textarea>
					    </div>
					  </div>
	  
						<div class="span5">
					    <label class="control-label" for="jlSght-info_fyanwuinfo"><spring:message code="jlSght-info.jlSght-info.input.fyanwuinfo" text="延误说明"/></label>
						<div class="controls">
						      	<textarea id="jlSght-info_fyanwuinfo"  name="fyanwuinfo"  class="form-control" rows="6"  class="text  "  minlength="" maxlength="4000">${model.fyanwuinfo}</textarea>
					    </div>
					    </div>
					    </div>
	  
						<div class="control-group">
						<div class="span5">
					    <label class="control-label" for="jlSght-info_fstatus"><spring:message code="jlSght-info.jlSght-info.input.fstatus" text="状态"/></label>
						<div class="controls">
						      	 <select class="form-control" id="jlSght-info_fstatus" name="fstatus" value="${model.fstatus}" class=" " onchange="showJiechu()">
							    	 	<option value="正常"  <c:if test="${model.fstatus=='正常'}"> selected="selected"  </c:if>>正常</option>
							    	 	<option value="解除"  <c:if test="${model.fstatus=='解除'}"> selected="selected"  </c:if>>解除</option>
							 	</select>
					    </div>
					  </div>
	  
						<div jiechu="" class="span5">
					    <label class="control-label" for="jlSght-info_fjiechudate"><spring:message code="jlSght-info.jlSght-info.input.fjiechudate" text="解除时间"/></label>
						<div class="controls">
						      	 <div class="input-append datepicker date" style="padding-left: 0px;">
							    	<input id="jlSght-info_fjiechudate" type="text" name="fjiechudate" value="${model.fjiechudate}" size="40" class="text "   style="background-color:white;cursor:default; width: 175px;">
							 		 <span class="add-on" style="padding-top: 2px; padding-bottom: 2px;"><i class="icon-calendar"></i></span>
							 	 </div>
					    </div>
					    </div>
					    </div>
	  
						<div  class="control-group">
						<div jiechu="" class="span5">
					    <label class="control-label" for="jlSght-info_fjiechuyuanyin"><spring:message code="jlSght-info.jlSght-info.input.fjiechuyuanyin" text="解除原因"/></label>
						<div class="controls">
						      	<textarea id="jlSght-info_fjiechuyuanyin"  name="fjiechuyuanyin"  class="form-control" rows="6"  style="width: 560px" class="text  "  minlength="" maxlength="4000">${model.fjiechuyuanyin}</textarea>
					    </div>
					  </div>
					    </div>
	  
						<%-- <div class="control-group">
						<div class="span5">
					    <label class="control-label" for="jlSght-info_fmemo1"><spring:message code="jlSght-info.jlSght-info.input.fmemo1" text="备注1"/></label>
						<div class="controls">
							  	 <input id="jlSght-info_fmemo1" type="text" name="fmemo1" value="${model.fmemo1}" size="" class="text " minlength="" maxlength="">	
					    </div>
					  </div>
	  
						<div class="span5">
					    <label class="control-label" for="jlSght-info_fmemo2"><spring:message code="jlSght-info.jlSght-info.input.fmemo2" text="备注2"/></label>
						<div class="controls">
							  	 <input id="jlSght-info_fmemo2" type="text" name="fmemo2" value="${model.fmemo2}" size="" class="text" minlength="" maxlength="">	
					    </div>
					    </div>
					    </div>
		 --%>
					 <div  class="control-group">
		 				<div class="span5">
					    <label class="control-label" for="jlSght-info_fzyjcsm"><spring:message code="jlSght-info.jlSght-info.input.fzyjcsm" text="争议解除说明"/></label>
						<div class="controls">
						      	<textarea id="jlSght-info_fzyjcsm"  name="fzyjcsm"  class="form-control" rows="6"  style="width: 560px" class="text"   maxlength="4000">${model.fzyjcsm}</textarea>
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
