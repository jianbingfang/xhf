<%@page contentType="text/html;charset=UTF-8"%>
<%@include file="/taglibs.jsp"%>
<%pageContext.setAttribute("currentHeader", "sckf-home");%>
<%pageContext.setAttribute("currentMenu", "sckf-xmtb");%>
<!doctype html>
<html lang="zh">

  <head>
    <%@include file="/common/meta.jsp"%>
    <title><spring:message code="jyBmRecord-info.jyBmRecord-info.input.title" text="编辑"/></title>
    <%@include file="/common/s.jsp"%>
    <script type="text/javascript">
$(function() {
    $("#jyBmRecord-infoForm").validate({
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
		  <h4 class="title"><spring:message code="jyBmRecord-info.jyBmRecord-info.input.title" text="编辑" /></h4>
		</header>

		<div class="content content-inner">

<form id="jyBmRecord-infoForm" method="post" action="jyBmRecord-info-save.do" class="form-horizontal">
  <c:if test="${model != null}">
	  <input id="jyBmRecord-info_id" type="hidden" name="fid" value="${model.fid}">
  </c:if>
	  
	  
						<div class="control-group">
						<div class="span5">
					    <label class="control-label" for="jyBmRecord-info_fweituoren"><spring:message code="jyBmRecord-info.jyBmRecord-info.input.fweituoren" text="委托人"/></label>
						<div class="controls">
							  	<input id="jyBmRecord-info_fweituoren" type="text" name="fweituoren" value="${model.fweituoren}" size="" class="number   " minlength="" maxlength="">
					    </div>
					  </div>
	  
						<div class="span5">
					    <label class="control-label" for="jyBmRecord-info_fzhubanren"><spring:message code="jyBmRecord-info.jyBmRecord-info.input.fzhubanren" text="主办人"/></label>
						<div class="controls">
							  	<input id="jyBmRecord-info_fzhubanren" type="text" name="fzhubanren" value="${model.fzhubanren}" size="" class="number   " minlength="" maxlength="">
					    </div>
					    </div>
					    </div>
	  
						<div class="control-group">
						<div class="span5">
					    <label class="control-label" for="jyBmRecord-info_fbaomingren"><spring:message code="jyBmRecord-info.jyBmRecord-info.input.fbaomingren" text="报名总监"/></label>
						<div class="controls">
							  	<input id="jyBmRecord-info_fbaomingren" type="text" name="fbaomingren" value="${model.fbaomingren}" size="" class="number   " minlength="" maxlength="">
					    </div>
					  </div>
	  
						<div class="span5">
					    <label class="control-label" for="jyBmRecord-info_fisbeian"><spring:message code="jyBmRecord-info.jyBmRecord-info.input.fisbeian" text="是否需要备案"/></label>
						<div class="controls">
						      	 	 <select class="form-control" id="jyBmRecord-info_fisbeian" name="fisbeian" value="${model.fisbeian}" class=" " >
							    	 	<option value="是"  <c:if test="${model.fisbeian}=='是'}"> selected="selected"  </c:if>>是</option>
							    	 	<option value="否"  <c:if test="${model.fisbeian}=='否'}"> selected="selected"  </c:if>>否</option>
							 	</select>
					    </div>
					    </div>
					    </div>
	  
						<div class="control-group">
						<div class="span5">
					    <label class="control-label" for="jyBmRecord-info_fbeiandate"><spring:message code="jyBmRecord-info.jyBmRecord-info.input.fbeiandate" text="备案时间"/></label>
						<div class="controls">
						      	 <div class="input-append datepicker date" style="padding-left: 0px;">
							    	<input id="jyBmRecord-info_fbeiandate" type="text" name="fbeiandate" value="${model.fbeiandate}" size="40" class="text "   style="background-color:white;cursor:default; width: 175px;">
							 		 <span class="add-on" style="padding-top: 2px; padding-bottom: 2px;"><i class="icon-calendar"></i></span>
							 	 </div>
					    </div>
					  </div>
	  
						<div class="span5">
					    <label class="control-label" for="jyBmRecord-info_fbeianstatus"><spring:message code="jyBmRecord-info.jyBmRecord-info.input.fbeianstatus" text="备案状态"/></label>
						<div class="controls">
						      	 	 <select class="form-control" id="jyBmRecord-info_fbeianstatus" name="fbeianstatus" value="${model.fbeianstatus}" class=" " >
							    	 	<option value="未备案"  <c:if test="${model.fbeianstatus}=='未备案'}"> selected="selected"  </c:if>>未备案</option>
							    	 	<option value="已备案"  <c:if test="${model.fbeianstatus}=='已备案'}"> selected="selected"  </c:if>>已备案</option>
							 	</select>
					    </div>
					    </div>
					    </div>
	  
						<div class="control-group">
						<div class="span5">
					    <label class="control-label" for="jyBmRecord-info_fbeianname"><spring:message code="jyBmRecord-info.jyBmRecord-info.input.fbeianname" text="备案表名称"/></label>
						<div class="controls">
							  	 <input id="jyBmRecord-info_fbeianname" type="text" name="fbeianname" value="${model.fbeianname}" size="" class="text " minlength="" maxlength="">	
					    </div>
					  </div>
	  
						<div class="span5">
					    <label class="control-label" for="jyBmRecord-info_fbeianurl"><spring:message code="jyBmRecord-info.jyBmRecord-info.input.fbeianurl" text="备案表url"/></label>
						<div class="controls">
							  	 <input id="jyBmRecord-info_fbeianurl" type="text" name="fbeianurl" value="${model.fbeianurl}" size="" class="text required" minlength="" maxlength="">	
					    </div>
					    </div>
					    </div>
	  
						<div class="control-group">
						<div class="span5">
					    <label class="control-label" for="jyBmRecord-info_fiszigeyushen"><spring:message code="jyBmRecord-info.jyBmRecord-info.input.fiszigeyushen" text="是否需要资格预审"/></label>
						<div class="controls">
						      	 <select class="form-control" id="jyBmRecord-info_fiszigeyushen" name="fiszigeyushen" value="${model.fiszigeyushen}" class=" " >
							    	 	<option value="是"  <c:if test="${model.fiszigeyushen}=='是'}"> selected="selected"  </c:if>>是</option>
							    	 	<option value="否"  <c:if test="${model.fiszigeyushen}=='否'}"> selected="selected"  </c:if>>否</option>
							 	</select>
					    </div>
					  </div>
	  
						<div class="span5">
					    <label class="control-label" for="jyBmRecord-info_fyushendate"><spring:message code="jyBmRecord-info.jyBmRecord-info.input.fyushendate" text="资格预审时间"/></label>
						<div class="controls">
						      	 <div class="input-append datepicker date" style="padding-left: 0px;">
							    	<input id="jyBmRecord-info_fyushendate" type="text" name="fyushendate" value="${model.fyushendate}" size="40" class="text "   style="background-color:white;cursor:default; width: 175px;">
							 		 <span class="add-on" style="padding-top: 2px; padding-bottom: 2px;"><i class="icon-calendar"></i></span>
							 	 </div>
					    </div>
					    </div>
					    </div>
	  
						<div class="control-group">
						<div class="span5">
					    <label class="control-label" for="jyBmRecord-info_fyushenstatus"><spring:message code="jyBmRecord-info.jyBmRecord-info.input.fyushenstatus" text="资格预审状态"/></label>
						<div class="controls">
						      	 <select class="form-control" id="jyBmRecord-info_fyushenstatus" name="fyushenstatus" value="${model.fyushenstatus}" class=" " >
							    	 	<option value="未预审"  <c:if test="${model.fyushenstatus}=='未预审'}"> selected="selected"  </c:if>>未预审</option>
							    	 	<option value="已预审"  <c:if test="${model.fyushenstatus}=='已预审'}"> selected="selected"  </c:if>>已预审</option>
							 	</select>
					    </div>
					  </div>
	  
						<div class="span5">
					    <label class="control-label" for="jyBmRecord-info_fiszhaobiaowenj"><spring:message code="jyBmRecord-info.jyBmRecord-info.input.fiszhaobiaowenj" text="是否购买招标文件"/></label>
						<div class="controls">
						      	 	 <select class="form-control" id="jyBmRecord-info_fiszhaobiaowenj" name="fiszhaobiaowenj" value="${model.fiszhaobiaowenj}" class=" " >
							    	 	<option value="是"  <c:if test="${model.fiszhaobiaowenj}=='是'}"> selected="selected"  </c:if>>是</option>
							    	 	<option value="否"  <c:if test="${model.fiszhaobiaowenj}=='否'}"> selected="selected"  </c:if>>否</option>
							 	</select>
					    </div>
					    </div>
					    </div>
	  
						<div class="control-group">
						<div class="span5">
					    <label class="control-label" for="jyBmRecord-info_fzhaobiaowenjiandate"><spring:message code="jyBmRecord-info.jyBmRecord-info.input.fzhaobiaowenjiandate" text="招标文件购买时间"/></label>
						<div class="controls">
						      	 <div class="input-append datepicker date" style="padding-left: 0px;">
							    	<input id="jyBmRecord-info_fzhaobiaowenjiandate" type="text" name="fzhaobiaowenjiandate" value="${model.fzhaobiaowenjiandate}" size="40" class="text "   style="background-color:white;cursor:default; width: 175px;">
							 		 <span class="add-on" style="padding-top: 2px; padding-bottom: 2px;"><i class="icon-calendar"></i></span>
							 	 </div>
					    </div>
					  </div>
	  
						<div class="span5">
					    <label class="control-label" for="jyBmRecord-info_fzlname"><spring:message code="jyBmRecord-info.jyBmRecord-info.input.fzlname" text="报名资料名称"/></label>
						<div class="controls">
							  	 <input id="jyBmRecord-info_fzlname" type="text" name="fzlname" value="${model.fzlname}" size="" class="text required" minlength="" maxlength="">	
					    </div>
					    </div>
					    </div>
	  
						<div class="control-group">
						<div class="span5">
					    <label class="control-label" for="jyBmRecord-info_fzlurl"><spring:message code="jyBmRecord-info.jyBmRecord-info.input.fzlurl" text="报名资料url"/></label>
						<div class="controls">
							  	 <input id="jyBmRecord-info_fzlurl" type="text" name="fzlurl" value="${model.fzlurl}" size="" class="text " minlength="" maxlength="">	
					    </div>
					  </div>
					    </div>
	  
						<div class="control-group">
						<div class="span5">
					    <label class="control-label" for="jyBmRecord-info_fbmid"><spring:message code="jyBmRecord-info.jyBmRecord-info.input.fbmid" text="信息登记项目"/></label>
						<div class="controls">
							  	<input id="jyBmRecord-info_fbmid" type="text" name="fbmid" value="${model.fbmid}" size="" class="number   " minlength="" maxlength="">
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
