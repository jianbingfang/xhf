<%@page contentType="text/html;charset=UTF-8"%>
<%@include file="/taglibs.jsp"%>
<%pageContext.setAttribute("currentHeader", "dzb-home");%>
<%pageContext.setAttribute("currentMenu", "dzb-dy");%>
<!doctype html>
<html lang="zh">

  <head>
    <%@include file="/common/meta.jsp"%>
    <title><spring:message code="dy-info.dy-info.input.title" text="编辑"/></title>
    <%@include file="/common/s.jsp"%>
    <script type="text/javascript">
$(function() {
    $("#dy-infoForm").validate({
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
	  <%@include file="/menu/dzb-workspace.jsp"%>

	  <!-- start of main -->
      <section id="m-main" class="span10">

      <article class="m-widget">
        <header class="header">
		  <h4 class="title"><spring:message code="dy-info.dy-info.input.title" text="编辑" /></h4>
		</header>

		<div class="content content-inner">

<form id="dy-infoForm" method="post" action="dy-info-save.do?ftype=${param.ftype }" class="form-horizontal">
  <c:if test="${model != null}">
	  <input id="dy-info_id" type="hidden" name="fid" value="${model.fid}">
  </c:if>
	  
	  
						<div class="control-group">
						<div class="span5">
					    <label class="control-label" for="dy-info_fno"><spring:message code="dy-info.dy-info.input.fno" text="编号"/></label>
						<div class="controls">
							  	 <input id="dy-info_fno" type="text" name="fno" value="${model.fno}" size="" class="text " minlength="" maxlength="">	
					    </div>
					  </div>
	  
						<div class="span5">
					    <label class="control-label" for="dy-info_fname"><spring:message code="dy-info.dy-info.input.fname" text="姓名"/></label>
						<div class="controls">
							  	 <input id="dy-info_fname" type="text" name="fname" value="${model.fname}" size="" class="text " minlength="" maxlength="">	
					    </div>
					    </div>
					    </div>
	  
						<div class="control-group">
						<div class="span5">
					    <label class="control-label" for="dy-info_fsex"><spring:message code="dy-info.dy-info.input.fsex" text="性别"/></label>
						<div class="controls">
						      	 <select class="form-control" id="dy-info_fsex" name="fsex" value="${model.fsex}" class=" " >
							    	 	<option value="男"  <c:if test="${model.fsex=='男'}"> selected="selected"  </c:if>>男</option>
							    	 	<option value="女"  <c:if test="${model.fsex=='女'}"> selected="selected"  </c:if>>女</option>
							 	</select>
					    </div>
					  </div>
	  
					    
						<div class="span5">
					    <label class="control-label" for="dy-info_fcity"><spring:message code="dy-info.dy-info.input.fcity" text="籍贯"/></label>
						<div class="controls">
							  	 <input id="dy-info_fcity" type="text" name="fcity" value="${model.fcity}" size="" class="text " minlength="" maxlength="">	
					    </div>
					  </div>
	  </div>
	  
						<div class="control-group">
						<div class="span5">
					    <label class="control-label" for="dy-info_fminzu"><spring:message code="dy-info.dy-info.input.fminzu" text="民族"/></label>
						<div class="controls">
							  	 <input id="dy-info_fminzu" type="text" name="fminzu" value="${model.fminzu}" size="" class="text " minlength="" maxlength="">	
					    </div>
					    </div>
					
						<div class="span5">
					    <label class="control-label" for="dy-info_fbirthday"><spring:message code="dy-info.dy-info.input.fbirthday" text="出生日期"/></label>
						<div class="controls">
						      	 <div class="input-append datepicker date" style="padding-left: 0px;">
							    	<input id="dy-info_fbirthday" type="text" name="fbirthday" value="${model.fbirthday}" size="40" class="text "   style="background-color:white;cursor:default; width: 175px;">
							 		 <span class="add-on" style="padding-top: 2px; padding-bottom: 2px;"><i class="icon-calendar"></i></span>
							 	 </div>
					    </div>
					  </div>
	      </div>
	  
						<div class="control-group">
						<div class="span5">
					    <label class="control-label" for="dy-info_fcjgzdate"><spring:message code="dy-info.dy-info.input.fcjgzdate" text="参加工作时间"/></label>
						<div class="controls">
						      	 <div class="input-append datepicker date" style="padding-left: 0px;">
							    	<input id="dy-info_fcjgzdate" type="text" name="fcjgzdate" value="${model.fcjgzdate}" size="40" class="text "   style="background-color:white;cursor:default; width: 175px;">
							 		 <span class="add-on" style="padding-top: 2px; padding-bottom: 2px;"><i class="icon-calendar"></i></span>
							 	 </div>
					    </div>
					    </div>
					  
						<div class="span5">
					    <label class="control-label" for="dy-info_frddate"><spring:message code="dy-info.dy-info.input.frddate" text="入党时间"/></label>
						<div class="controls">
						      	 <div class="input-append datepicker date" style="padding-left: 0px;">
							    	<input id="dy-info_frddate" type="text" name="frddate" value="${model.frddate}" size="40" class="text "   style="background-color:white;cursor:default; width: 175px;">
							 		 <span class="add-on" style="padding-top: 2px; padding-bottom: 2px;"><i class="icon-calendar"></i></span>
							 	 </div>
					    </div>
					  </div>
	    </div>
	  
						<div class="control-group">
						<div class="span5">
					    <label class="control-label" for="dy-info_fsfzh"><spring:message code="dy-info.dy-info.input.fsfzh" text="身份证号"/></label>
						<div class="controls">
							  	 <input id="dy-info_fsfzh" type="text" name="fsfzh" value="${model.fsfzh}" size="" class="text " minlength="" maxlength="">	
					    </div>
					    </div>
						<div class="span5">
					    <label class="control-label" for="dy-info_fwhcd"><spring:message code="dy-info.dy-info.input.fwhcd" text="文化程度"/></label>
						<div class="controls">
							  	 <input id="dy-info_fwhcd" type="text" name="fwhcd" value="${model.fwhcd}" size="" class="text " minlength="" maxlength="">	
					    </div>
					  </div>
	    </div>
	  
						<div class="control-group">
						<div class="span5">
					    <label class="control-label" for="dy-info_faddress"><spring:message code="dy-info.dy-info.input.faddress" text="家庭住址"/></label>
						<div class="controls">
							  	 <input id="dy-info_faddress" type="text" name="faddress" value="${model.faddress}" size="" class="text " minlength="" maxlength="">	
					    </div>
					    </div>
					    
						<div class="span5">
					    <label class="control-label" for="dy-info_flxdh"><spring:message code="dy-info.dy-info.input.flxdh" text="联系电话"/></label>
						<div class="controls">
							  	 <input id="dy-info_flxdh" type="text" name="flxdh" value="${model.flxdh}" size="" class="text " minlength="" maxlength="">	
					    </div>
					  </div>
					    </div>
	  
						<div class="control-group">
						<div class="span5">
					    <label class="control-label" for="dy-info_fmemo"><spring:message code="dy-info.dy-info.input.fmemo" text="备注"/></label>
						<div class="controls">
						      	<textarea id="dy-info_fmemo"  name="fmemo"  class="form-control" rows="6"  style="width: 560px" class="text  "  minlength="" maxlength="400">${model.fmemo}</textarea>
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
