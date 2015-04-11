<%@page contentType="text/html;charset=UTF-8"%>
<%@include file="/taglibs.jsp"%>
<%pageContext.setAttribute("currentHeader", "hr-home");%>
<%pageContext.setAttribute("currentMenu", "hrGwbm");%>
<!doctype html>
<html lang="zh">

  <head>
    <%@include file="/common/meta.jsp"%>
    <title><spring:message code="hrypRecord-info.hrypRecord-info.input.title" text="编辑"/></title>
    <%@include file="/common/s.jsp"%>
    
      <link type="text/css" rel="stylesheet"
	href="${scopePrefix}/s/xthena/rypicker/rypicker.css">
<script type="text/javascript"
	src="${scopePrefix}/s/xthena/rypicker/rypicker.js"></script>
	
	
    <script type="text/javascript">
$(function() {
    $("#hrypRecord-infoForm").validate({
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
	  <%@include file="/menu/hr-workspace.jsp"%>
	  <!-- start of main -->
      <section id="m-main" class="span10">
      <article class="m-widget">
        <header class="header">
		  <h4 class="title"><spring:message code="hrypRecord-info.hrypRecord-info.input.title" text="编辑" /></h4>
		</header>

		<div class="content content-inner">

<form id="hrypRecord-infoForm" method="post" action="hrypRecord-info-save.do" class="form-horizontal">
  <c:if test="${model != null}">
	  <input id="hrypRecord-info_id" type="hidden" name="fid" value="${model.fid}">
  </c:if>
	  
	  
						<div class="control-group">
						<div class="span5">
					    <label class="control-label" for="hrypRecord-info_fidno"><spring:message code="hrypRecord-info.hrypRecord-info.input.fidno" text="身份证号"/></label>
						<div class="controls">
							  	 <input id="hrypRecord-info_fidno" type="text" name="fidno" value="${model.fidno}" size="" class="text " minlength="" maxlength="">	
					    </div>
					  </div>
	  
						<div class="span5">
					    <label class="control-label" for="hrypRecord-info_fname"><spring:message code="hrypRecord-info.hrypRecord-info.input.fname" text="姓名"/></label>
						<div class="controls">
							  	 <input id="hrypRecord-info_fname" type="text" name="fname" value="${model.fname}" size="" class="text " minlength="" maxlength="">	
					    </div>
					    </div>
					    </div>
	  
						<div class="control-group">
						<div class="span5">
					    <label class="control-label" for="hrypRecord-info_fsex"><spring:message code="hrypRecord-info.hrypRecord-info.input.fsex" text="性别"/></label>
						<div class="controls">
							<select class="form-control" id="commRy-info_fsex"
								name="fsex" value="${model.fsex}" class=" required">
								<option value="0"
									<c:if test="${model.fsex=='0'}"> selected="selected"  </c:if>>女</option>
								<option value="1"
									<c:if  test="${model.fsex=='1'}"> selected="selected"  </c:if>>男</option>
							</select>
					    </div>
					  </div>
	  
						<div class="span5">
					    <label class="control-label" for="hrypRecord-info_fbirdate"><spring:message code="hrypRecord-info.hrypRecord-info.input.fbirdate" text="出生日期"/></label>
						<div class="controls">
						      	 <div class="input-append datepicker date" style="padding-left: 0px;">
							    	<input id="hrypRecord-info_fbirdate" type="text" name="fbirdate" value="${model.fbirdate}" size="40" class="text "   style="background-color:white;cursor:default; width: 175px;">
							 		 <span class="add-on" style="padding-top: 2px; padding-bottom: 2px;"><i class="icon-calendar"></i></span>
							 	 </div>
					    </div>
					    </div>
					    </div>
	  
						<div class="control-group">
						<div class="span5">
					    <label class="control-label" for="hrypRecord-info_fminzu"><spring:message code="hrypRecord-info.hrypRecord-info.input.fminzu" text="民族"/></label>
						<div class="controls">
							  	 <input id="hrypRecord-info_fminzu" type="text" name="fminzu" value="${model.fminzu}" size="" class="text " minlength="" maxlength="">	
					    </div>
					  </div>
	  
						<div class="span5">
					    <label class="control-label" for="hrypRecord-info_faddr"><spring:message code="hrypRecord-info.hrypRecord-info.input.faddr" text="家庭住址"/></label>
						<div class="controls">
							  	 <input id="hrypRecord-info_faddr" type="text" name="faddr" value="${model.faddr}" size="" class="text " minlength="" maxlength="">	
					    </div>
					    </div>
					    </div>
	  
						<div class="control-group">
						<div class="span5">
					    <label class="control-label" for="hrypRecord-info_femail"><spring:message code="hrypRecord-info.hrypRecord-info.input.femail" text="邮箱"/></label>
						<div class="controls">
							  	 <input id="hrypRecord-info_femail" type="text" name="femail" value="${model.femail}" size="" class="text " minlength="" maxlength="">	
					    </div>
					  </div>
	  
						<div class="span5">
					    <label class="control-label" for="hrypRecord-info_fbydate"><spring:message code="hrypRecord-info.hrypRecord-info.input.fbydate" text="毕业时间"/></label>
						<div class="controls">
						      	 <div class="input-append datepicker date" style="padding-left: 0px;">
							    	<input id="hrypRecord-info_fbydate" type="text" name="fbydate" value="${model.fbydate}" size="40" class="text "   style="background-color:white;cursor:default; width: 175px;">
							 		 <span class="add-on" style="padding-top: 2px; padding-bottom: 2px;"><i class="icon-calendar"></i></span>
							 	 </div>
					    </div>
					    </div>
					    </div>
	  
						<div class="control-group">
						<div class="span5">
					    <label class="control-label" for="hrypRecord-info_fbyxuexiao"><spring:message code="hrypRecord-info.hrypRecord-info.input.fbyxuexiao" text="毕业学校"/></label>
						<div class="controls">
							  	 <input id="hrypRecord-info_fbyxuexiao" type="text" name="fbyxuexiao" value="${model.fbyxuexiao}" size="" class="text " minlength="" maxlength="">	
					    </div>
					  </div>
	  
						<div class="span5">
					    <label class="control-label" for="hrypRecord-info_fbyzhuanye"><spring:message code="hrypRecord-info.hrypRecord-info.input.fbyzhuanye" text="毕业专业"/></label>
						<div class="controls">
							  	 <input id="hrypRecord-info_fbyzhuanye" type="text" name="fbyzhuanye" value="${model.fbyzhuanye}" size="" class="text " minlength="" maxlength="">	
					    </div>
					    </div>
					    </div>
	  
						<div class="control-group">
						<div class="span5">
					    <label class="control-label" for="hrypRecord-info_fxueli"><spring:message code="hrypRecord-info.hrypRecord-info.input.fxueli" text="学历"/></label>
						<div class="controls">
							  	 <input id="hrypRecord-info_fxueli" type="text" name="fxueli" value="${model.fxueli}" size="" class="text " minlength="" maxlength="">	
					    </div>
					  </div>
	  
						<div class="span5">
					    <label class="control-label" for="hrypRecord-info_fxueli2"><spring:message code="hrypRecord-info.hrypRecord-info.input.fxueli2" text="第二学历"/></label>
						<div class="controls">
							  	 <input id="hrypRecord-info_fxueli2" type="text" name="fxueli2" value="${model.fxueli2}" size="" class="text " minlength="" maxlength="">	
					    </div>
					    </div>
					    </div>
	  
						<div class="control-group">
						<div class="span5">
					    <label class="control-label" for="hrypRecord-info_fgw"><spring:message code="hrypRecord-info.hrypRecord-info.input.fgw" text="岗位"/></label>
						<div class="controls">
							  	<input id="hrypRecord-info_fgw" type="text" name="fgw" value="${model.fgw}" size="" class="number" minlength="" maxlength="">
					    </div>
					  </div>
	  
						<div class="span5">
					    <label class="control-label" for="hrypRecord-info_fdate"><spring:message code="hrypRecord-info.hrypRecord-info.input.fdate" text="应聘时间"/></label>
						<div class="controls">
						      	 <div class="input-append datepicker date" style="padding-left: 0px;">
							    	<input id="hrypRecord-info_fdate" type="text" name="fdate" value="${model.fdate}" size="40" class="text "   style="background-color:white;cursor:default; width: 175px;">
							 		 <span class="add-on" style="padding-top: 2px; padding-bottom: 2px;"><i class="icon-calendar"></i></span>
							 	 </div>
					    </div>
					    </div>
					    </div>
	  
						<div class="control-group">
				
					  
					  <div class="span5">
					    <label class="control-label" for="hrypRecord-info_fgzqiw"><spring:message code="hrypRecord-info.hrypRecord-info.input.fgzqiw" text="期望薪资"/></label>
						<div class="controls">
							  	 <input id="hrypRecord-info_fgzqiw" type="text" name="fgzqiw" value="${model.fgzqiw}" size="" class="text " minlength="" maxlength="">	
					    </div>
					  </div>
	  
	  
						<div class="span5">
					    <label class="control-label" for="hrypRecord-info_fworkaddr"><spring:message code="hrypRecord-info.hrypRecord-info.input.fworkaddr" text="期望工作地点"/></label>
						<div class="controls">
							  	 <input id="hrypRecord-info_fworkaddr" type="text" name="fworkaddr" value="${model.fworkaddr}" size="" class="text " minlength="" maxlength="">	
					    </div>
					    </div>
					    </div>
	  
						<div class="control-group">
						
						<div class="span5">
					    <label class="control-label" for="hrypRecord-info_ftel"><spring:message code="hrypRecord-info.hrypRecord-info.input.ftel" text="联系方式"/></label>
						<div class="controls">
							  	 <input id="hrypRecord-info_ftel" type="text" name="ftel" value="${model.ftel}" size="" class="text " minlength="" maxlength="">	
					    </div>
					    </div>
					    	<div class="span5">
					    <label class="control-label" for="hrypRecord-info_fcontact"><spring:message code="hrypRecord-info.hrypRecord-info.input.fcontact" text="联系人"/></label>
						<div class="controls">
							  	 <input id="hrypRecord-info_fcontact" type="text" name="fcontact" value="${model.fcontact}" size="" class="text " minlength="" maxlength="">	
					    </div>
					  </div>
	  
					    </div>
	  
						<div class="control-group">
					
						<div class="span5">
					    <label class="control-label" for="hrypRecord-info_fcontactr"><spring:message code="hrypRecord-info.hrypRecord-info.input.fcontactr" text="关系"/></label>
						<div class="controls">
							  	 <input id="hrypRecord-info_fcontactr" type="text" name="fcontactr" value="${model.fcontactr}" size="" class="text " minlength="" maxlength="">	
					    </div>
					    </div>
					    
					    <div class="span5">
					    <label class="control-label" for="hrypRecord-info_fcontacttel"><spring:message code="hrypRecord-info.hrypRecord-info.input.fcontacttel" text="联系人联系方式"/></label>
						<div class="controls">
							  	 <input id="hrypRecord-info_fcontacttel" type="text" name="fcontacttel" value="${model.fcontacttel}" size="" class="text " minlength="" maxlength="">	
					    </div>
					  </div>
					  
					    </div>
	  
						<div class="control-group">
						    <label class="control-label" for="hrypRecord-info_finfo"><spring:message code="hrypRecord-info.hrypRecord-info.input.finfo" text="简介"/></label>
							<div class="controls">
							      	<textarea id="hrypRecord-info_finfo"  name="finfo"  class="form-control" rows="6"  style="width: 560px" class="text  "  minlength="" maxlength="2,000">${model.finfo}</textarea>
						    </div>
					   </div>
					  
					   <div class="control-group">
					    <label class="control-label" for="hrypRecord-info_fmemo"><spring:message code="hrypRecord-info.hrypRecord-info.input.fmemo" text="备注"/></label>
						<div class="controls">
						      	<textarea id="hrypRecord-info_fmemo"  name="fmemo"  class="form-control" rows="6"  style="width: 560px" class="text  "  minlength="" maxlength="500">${model.fmemo}</textarea>
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
