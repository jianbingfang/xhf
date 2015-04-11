<%@page contentType="text/html;charset=UTF-8"%>
<%@include file="/taglibs.jsp"%>
<%pageContext.setAttribute("currentHeader", "jl-home");%>
<%pageContext.setAttribute("currentMenu", "jl-wz");%>
<!doctype html>
<html lang="zh">

  <head>
    <%@include file="/common/meta.jsp"%>
    <title><spring:message code="jl-pjXmz-info.jl-pjXmz-info.input.title" text="编辑"/></title>
    <%@include file="/common/s.jsp"%>
    <link type="text/css" rel="stylesheet" href="${scopePrefix}/s/xthena/rypicker/rypicker.css">
    <script type="text/javascript" src="${scopePrefix}/s/xthena/rypicker/rypicker.js"></script>
    <script type="text/javascript">
$(function() {
    $("#jl-pjXmz-infoForm").validate({
        submitHandler: function(form) {
			bootbox.animate(false);
			var box = bootbox.dialog('<div class="progress progress-striped active" style="margin:0px;"><div class="bar" style="width: 100%;"></div></div>');
            form.submit();
        },
        errorClass: 'validate-error'
    });
    createryPicker({
		modalId: 'ryPicker',
		url: '${scopePrefix}/hr/commRy-simple-list.do'
	});
})
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
		  <h4 class="title"><spring:message code="jl-pjXmz-info.jl-pjXmz-info.input.title" text="编辑" /></h4>
		</header>

		<div class="content content-inner">

<form id="jl-pjXmz-infoForm" method="post" action="jl-pjXmz-info-save.do" class="form-horizontal">
  <c:if test="${model != null}">
	  <input id="jl-pjXmz-info_id" type="hidden" name="fid" value="${model.fid}">
  </c:if>
			    	<div class="control-group">
				    <label class="control-label" for="jl-pjXmz-info_fxmzno"><spring:message code="jl-pjXmz-info.jl-pjXmz-info.input.fxmzno" text="序号"/></label>
					<div class="controls">
					  	 <input id="jl-pjXmz-info_fxmzno" type="text" name="fxmzno" value="${model.fxmzno}" size="" class="text " minlength="" maxlength="">	
				    </div>
				  </div>
				  
			   <%--  	<div class="control-group">
				    <label class="control-label" for="jl-pjXmz-info_fxmid"><spring:message code="jl-pjXmz-info.jl-pjXmz-info.input.fxmid" text="项目名称"/></label>
					<div class="controls">
					  	<input id="jl-pjXmz-info_fxmid" type="text" name="fxmid" value="${model.fxmid}" size="" class="number   " minlength="" maxlength="">
				    </div>
				  </div> --%>
				  
				<%-- <div class="control-group">
				    <label class="control-label" for="jl-pjXmz-info_fxmid"><spring:message code="jl-pjXmz-info.jl-pjXmz-info.input.fxmzname" text="项目章名称"/></label>
					<div class="controls">
					  	<input id="jl-pjXmz-info_fxmzname" type="text" name="fxmzname" value="${model.fxmzname}" size="" class="number   " minlength="" maxlength="">
				    </div>
				  </div> --%>
				  
				  
				  	<div class="control-group">
					    <label class="control-label" for="pjXmz-info_fstatus"><spring:message code="pjXmz-info.pjXmz-info.input.fstatus" text="状态"/></label>
						<div class="controls">
						       <select class="form-control" id="pjXmz-info_fstatus" name="fstatus" value="${model.fstatus}" class=" " >
							    	 	<option value="正常"  <c:if test="${model.fstatus}=='正常'}"> selected="selected"  </c:if>>正常</option>
							    	 	<option value="外借"  <c:if test="${model.fstatus}=='外借'}"> selected="selected"  </c:if>>外借</option>
							    	 	<option value="损坏"  <c:if test="${model.fstatus}=='损坏'}"> selected="selected"  </c:if>>损坏</option>
							    	 	<option value="报废"  <c:if test="${model.fstatus}=='报废'}"> selected="selected"  </c:if>>报废</option>
							   </select>
					    </div>
					</div>
			    	
			    
			    	<div class="control-group">
				    <label class="control-label" for="jl-pjXmz-info_fjieshourenid"><spring:message code="jl-pjXmz-info.jl-pjXmz-info.input.fjieshourenid" text="领用人"/></label>
					<div class="controls">
					
						<div class="input-append ryPicker">
						 <input id="ryBxRecord-info_fryid" type="hidden" name="fjieshourenid" value="${model.fjieshourenid}">
						  <input id="ryBxRecord-info_fjieshouren" type="text"  value="${model.fjieshouren}" disabled="disabled" style="width: 175px;" value="">
						  <span class="add-on" style="padding-top: 2px; padding-bottom: 2px;"><i class="icon-user"></i></span>
					    </div>
				    </div>
				  </div>
				  
				  
			    	<div class="control-group">
					    <label class="control-label" for="pjXmz-info_fyijiaodate"><spring:message code="pjXmz-info.pjXmz-info.input.fyijiaodate" text="领用日期"/></label>
						<div class="controls">
					      	 <div class="input-append datepicker date" style="padding-left: 0px;">
						    	<input id="pjXmz-info_fyijiaodate" type="text" name="fyijiaodate" value="${model.fyijiaodate}" size="40" class="text "   style="background-color:white;cursor:default; width: 175px;">
						 		 <span class="add-on" style="padding-top: 2px; padding-bottom: 2px;"><i class="icon-calendar"></i></span>
						 	 </div>
					    </div>
					  </div>
	  
				  
				  	<div class="control-group">
				    <label class="control-label" for="jl-pjXmz-info_fyijiaorenid"><spring:message code="jl-pjXmz-info.jl-pjXmz-info.input.fyijiaorenid" text="归还人"/></label>
					<div class="controls">
					
						<div class="input-append ryPicker">
						 <input id="ryBxRecord-info_fryid" type="hidden" name="fyijiaorenid" value="${model.fyijiaorenid}">
						  <input id="ryBxRecord-info_fyijiaoren" type="text"  value="${model.fyijiaoren}" disabled="disabled" style="width: 175px;" value="">
						  <span class="add-on" style="padding-top: 2px; padding-bottom: 2px;"><i class="icon-user"></i></span>
					    </div>
					    
				    </div>
				  </div>
				  
			    	<div class="control-group">
					    <label class="control-label" for="pjXmz-info_fguihuadate"><spring:message code="pjXmz-info.pjXmz-info.input.fguihuadate" text="归还日期"/></label>
						<div class="controls">
						      	 <div class="input-append datepicker date" style="padding-left: 0px;">
							    	<input id="pjXmz-info_fguihuadate" type="text" name="fguihuadate" value="${model.fguihuadate}" size="40" class="text "   style="background-color:white;cursor:default; width: 175px;">
							 		 <span class="add-on" style="padding-top: 2px; padding-bottom: 2px;"><i class="icon-calendar"></i></span>
							 	 </div>
					    </div>
					 </div>   
			    	<div class="control-group">
				    <label class="control-label" for="jl-pjXmz-info_fmemo"><spring:message code="jl-pjXmz-info.jl-pjXmz-info.input.fmemo" text="备注"/></label>
					<div class="controls">
				      	<textarea id="jl-pjXmz-info_fmemo"  name="fmemo"  class="form-control" rows="6"  style="width: 560px" class="text  "  minlength="" maxlength="500">${model.fmemo}</textarea>
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
