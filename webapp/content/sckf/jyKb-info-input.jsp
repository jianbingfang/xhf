<%@page contentType="text/html;charset=UTF-8"%>
<%@include file="/taglibs.jsp"%>
<%pageContext.setAttribute("currentHeader", "sckf-home");%>
<%pageContext.setAttribute("currentMenu", "sckf-xmtb");%>
<!doctype html>
<html lang="zh">

  <head>
    <%@include file="/common/meta.jsp"%>
    <title><spring:message code="jyKb-info.jyKb-info.input.title" text="编辑"/></title>
    <%@include file="/common/s.jsp"%>
    <script type="text/javascript">
$(function() {
    $("#jyKb-infoForm").validate({
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
		  <h4 class="title"><spring:message code="jyKb-info.jyKb-info.input.title" text="编辑" /></h4>
		</header>

		<div class="content content-inner">

<form id="jyKb-infoForm" method="post" action="jyKb-info-save.do" class="form-horizontal">
  <c:if test="${model != null}">
	  <input id="jyKb-info_id" type="hidden" name="fid" value="${model.fid}">
  </c:if>
	  
	  
						<div class="control-group">
						<div class="span5">
					    <label class="control-label" for="jyKb-info_fzbstatus"><spring:message code="jyKb-info.jyKb-info.input.fzbstatus" text="中标状态"/></label>
						<div class="controls">
						      	 <select class="form-control" id="jyKb-info_fzbstatus" name="fzbstatus" value="${model.fzbstatus}" class=" " >
							    	 	<option value="未中标"  <c:if test="${model.fzbstatus}=='未中标'}"> selected="selected"  </c:if>>未中标</option>
							    	 	<option value="已中标"  <c:if test="${model.fzbstatus}=='已中标'}"> selected="selected"  </c:if>>已中标</option>
							 	</select>
					    </div>
					  </div>
	  
						<div class="span5">
					    <label class="control-label" for="jyKb-info_fzbkzj"><spring:message code="jyKb-info.jyKb-info.input.fzbkzj" text="招标控制价"/></label>
						<div class="controls">
							  	<input id="jyKb-info_fzbkzj" type="text" name="fzbkzj" value="${model.fzbkzj}" size="" class="number   " minlength="" maxlength="">
					    </div>
					    </div>
					    </div>
	  
						<div class="control-group">
						<div class="span5">
					    <label class="control-label" for="jyKb-info_fothers"><spring:message code="jyKb-info.jyKb-info.input.fothers" text="各投标单位报价"/></label>
						<div class="controls">
						      	<textarea id="jyKb-info_fothers"  name="fothers"  class="form-control" rows="6"  style="width: 560px" class="text  "  minlength="" maxlength="500">${model.fothers}</textarea>
					    </div>
					  </div>
	  
						<div class="span5">
					    <label class="control-label" for="jyKb-info_fzbdanwei"><spring:message code="jyKb-info.jyKb-info.input.fzbdanwei" text="中标单位"/></label>
						<div class="controls">
							  	 <input id="jyKb-info_fzbdanwei" type="text" name="fzbdanwei" value="${model.fzbdanwei}" size="" class="text required" minlength="" maxlength="">	
					    </div>
					    </div>
					    </div>
	  
						<div class="control-group">
						<div class="span5">
					    <label class="control-label" for="jyKb-info_fzbmoney"><spring:message code="jyKb-info.jyKb-info.input.fzbmoney" text="中标金额"/></label>
						<div class="controls">
							  	<input id="jyKb-info_fzbmoney" type="text" name="fzbmoney" value="${model.fzbmoney}" size="" class="number   " minlength="" maxlength="">
					    </div>
					  </div>
	  
						<div class="span5">
					    <label class="control-label" for="jyKb-info_fwzbsy"><spring:message code="jyKb-info.jyKb-info.input.fwzbsy" text="未中标事由"/></label>
						<div class="controls">
						      	<textarea id="jyKb-info_fwzbsy"  name="fwzbsy"  class="form-control" rows="6"  style="width: 560px" class="text  "  minlength="" maxlength="500">${model.fwzbsy}</textarea>
					    </div>
					    </div>
					    </div>
	  
						<div class="control-group">
						<div class="span5">
					    <label class="control-label" for="jyKb-info_flqdate"><spring:message code="jyKb-info.jyKb-info.input.flqdate" text="中标通知书领取时间"/></label>
						<div class="controls">
						      	 <div class="input-append datepicker date" style="padding-left: 0px;">
							    	<input id="jyKb-info_flqdate" type="text" name="flqdate" value="${model.flqdate}" size="40" class="text "   style="background-color:white;cursor:default; width: 175px;">
							 		 <span class="add-on" style="padding-top: 2px; padding-bottom: 2px;"><i class="icon-calendar"></i></span>
							 	 </div>
					    </div>
					  </div>
	  
						<div class="span5">
					    <label class="control-label" for="jyKb-info_fmemo"><spring:message code="jyKb-info.jyKb-info.input.fmemo" text="备注"/></label>
						<div class="controls">
						      	<textarea id="jyKb-info_fmemo"  name="fmemo"  class="form-control" rows="6"  style="width: 560px" class="text  "  minlength="" maxlength="500">${model.fmemo}</textarea>
					    </div>
					    </div>
					    </div>
	  
						<div class="control-group">
						<div class="span5">
					    <label class="control-label" for="jyKb-info_fmemo1"><spring:message code="jyKb-info.jyKb-info.input.fmemo1" text="备注1"/></label>
						<div class="controls">
							  	 <input id="jyKb-info_fmemo1" type="text" name="fmemo1" value="${model.fmemo1}" size="" class="text " minlength="" maxlength="">	
					    </div>
					  </div>
	  
						<div class="span5">
					    <label class="control-label" for="jyKb-info_fmemo2"><spring:message code="jyKb-info.jyKb-info.input.fmemo2" text="备注2"/></label>
						<div class="controls">
							  	 <input id="jyKb-info_fmemo2" type="text" name="fmemo2" value="${model.fmemo2}" size="" class="text required" minlength="" maxlength="">	
					    </div>
					    </div>
					    </div>
	  
						<div class="control-group">
						<div class="span5">
					    <label class="control-label" for="jyKb-info_fmemo3"><spring:message code="jyKb-info.jyKb-info.input.fmemo3" text="备注3"/></label>
						<div class="controls">
							  	 <input id="jyKb-info_fmemo3" type="text" name="fmemo3" value="${model.fmemo3}" size="" class="text " minlength="" maxlength="">	
					    </div>
					  </div>
	  
						<div class="span5">
					    <label class="control-label" for="jyKb-info_fmemo4"><spring:message code="jyKb-info.jyKb-info.input.fmemo4" text="备注4"/></label>
						<div class="controls">
							  	 <input id="jyKb-info_fmemo4" type="text" name="fmemo4" value="${model.fmemo4}" size="" class="text required" minlength="" maxlength="">	
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
